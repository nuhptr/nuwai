import 'package:dio/dio.dart';

import 'package:nuwai/models/work_model.dart';

class WorkServices {
  String baseUrl = 'https://nulungguwai.com/api';

  final Dio dio = Dio();

  // TODO: Post the id of jobs with users id
  Future<WorkModel> submitJobs({
    required String? idJob,
    required String? userToken,
    int? idUser,
    String? isApply = 'True',
  }) async {
    Map<String, dynamic> header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': userToken,
    };

    Response response = await dio.post(
      '$baseUrl/lamaran',
      data: {
        'id_users': idUser,
        'id_pekerjaan': idJob,
        'is_apply': isApply,
      },
      options: Options(
        headers: header,
      ),
    );
    print(response.data);

    if (response.data == 200) {
      var data = response.data['data'];
      WorkModel workModel = WorkModel.fromJson(data);

      return workModel;
    } else {
      throw Exception('Gagal Submit Pekerjaan');
    }
  }
}
