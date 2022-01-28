import 'package:dio/dio.dart';

import 'package:nuwai/models/user_model.dart';

class UserService {
  String baseUrl = 'https://nulungguwai.com/api';

  final Dio dio = Dio();

  // register
  Future<UserModel> register({
    required String? email,
    required String? password,
    required String? name,
  }) async {
    try {
      Response response = await dio.post(
        '$baseUrl/register',
        data: {
          'name': name,
          'password': password,
          'email': email,
        },
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      print('user: ${response.data} ${response.statusCode}');
      if (response.statusCode == 200) {
        var data = response.data['data'];
        UserModel user = UserModel.fromJson(data['user']);
        user.token = 'Bearer ' + data['access_token'];

        return user;
      } else {
        throw Exception('Gagal Register');
      }
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }

  // logout
  Future<void> logout({required String? token}) async {
    Response response = await dio.get(
      '$baseUrl/logout',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': token ?? '',
        },
      ),
    );

    print(response.data);
  }

  // login
  Future<UserModel> login({
    required String? email,
    required String? password,
  }) async {
    var response = await dio.post(
      '$baseUrl/login',
      data: {
        'email': email,
        'password': password,
      },
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
    print(response.data);

    if (response.statusCode == 200) {
      var data = response.data['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];

      return user;
    } else {
      throw Exception('User Gagal Login');
    }
  }

  // update
  Future<UserModel> update({
    required String? alamat,
    required String? token,
    required String? cvPath,
    required String? photoProfile,
  }) async {
    try {
      var url = '$baseUrl/user';

      var formData = FormData.fromMap({
        'alamat': alamat,
        'file': await MultipartFile.fromFile(
          photoProfile ?? '',
          filename: photoProfile,
        ),
        'cv': await MultipartFile.fromFile(
          cvPath ?? '',
          filename: cvPath,
        ),
      });

      var response = dio
          .post(
        url,
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': token,
          },
        ),
      )
          .then(
        (response) {
          if (response.statusCode == 200) {
            print(response.data);
            var data = response.data['data'];
            UserModel user = UserModel.fromJson(data['user']);

            return user;
          } else {
            throw Exception('Gagal update data');
          }
        },
      );

      return response;
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }
}
