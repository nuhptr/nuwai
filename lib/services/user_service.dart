import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

import 'package:nuwai/models/user_model.dart';

class UserService {
  String baseUrl = 'https://nulungguwai.com/api';

  final Dio dio = Dio();

  //TODO: register
  Future<UserModel> register({
    required String? email,
    required String? password,
    required String? name,
  }) async {
    try {
      Map<String, dynamic> header = {'Content-Type': 'application/json'};

      Response response = await dio.post(
        '$baseUrl/register',
        data: {
          'name': name,
          'password': password,
          'email': email,
        },
        options: Options(
          headers: header,
        ),
      );

      print('user: ${response.data} ${response.statusCode}');
      if (response.statusCode == 200) {
        var data = response.data['data'];
        UserModel user = UserModel.fromJson(data);

        return user;
      } else {
        throw Exception('Gagal Register');
      }
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }

  //TODO: logout
  Future<void> logout({required String? userToken}) async {
    Map<String, dynamic> header = {
      'Content-Type': 'application/json',
      'Authorization': userToken ?? '',
    };

    Response response = await dio.get(
      '$baseUrl/logout',
      options: Options(
        headers: header,
      ),
    );

    print(response.data);
  }

  //TODO login
  Future<UserModel> login({
    required String? email,
    required String? password,
  }) async {
    Map<String, dynamic> header = {
      'Content-Type': 'application/json',
    };

    Response response = await dio.post(
      '$baseUrl/login',
      data: {
        'email': email,
        'password': password,
      },
      options: Options(
        headers: header,
      ),
    );
    print(response.data);

    if (response.statusCode == 200) {
      var data = response.data['data'];
      UserModel user = UserModel.fromJson(data);

      return user;
    } else {
      throw Exception('User Gagal Login');
    }
  }

  //TODO: update (belum done)
  Future<UserModel> update({
    required String? alamat,
    required String? token,
    required String? fileCv,
    required String? fileImage,
  }) async {
    var url = '$baseUrl/user';
    var headers = {
      'Content-Type': 'multipart/form-data',
      'Authorization': token!,
    };

    String? filename = fileImage?.split('/').last;
    String? cvFile = fileCv?.split('/').last;

    FormData formData = FormData.fromMap({
      'alamat': alamat,
      'file': await MultipartFile.fromFile(
        fileImage ?? '',
        filename: filename,
        contentType: MediaType('image', 'jpg/png'),
      ),
      'cv': await MultipartFile.fromFile(
        cvFile ?? '',
        filename: filename,
        contentType: MediaType('image', 'jpg/png'),
      ),
    });

    Response response = await dio.post(
      url,
      data: formData,
      options: Options(headers: headers),
    );
    print(response.data);

    if (response.statusCode == 200) {
      var data = response.data['data'];
      UserModel userModel = UserModel.fromJson(data);

      return userModel;
    } else {
      throw Exception('Gagal Update');
    }
  }
}
