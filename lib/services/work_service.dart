import 'package:dio/dio.dart';

import 'package:nuwai/models/work_model.dart';

class WorkServices {
  String baseUrl = 'https://nulungguwai.com/api';

  final Dio dio = Dio();

  // TODO: Post the id of jobs with users id
  Future<WorkModel> submitJobs(
      {required int? idJob, required String? userToken}) async {
    String url = '$baseUrl/lamaran';

    Map<String, dynamic> data = {
      'id_users': userToken,
      'id_pekerjaan': idJob,
    };

    Map<String, dynamic> header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': userToken,
    };

    Response response = await dio.post(
      url,
      data: data,
      options: Options(
        headers: header,
      ),
    );
    print(response.data);

    if (response.data == 200) {
      Map<String, dynamic> data = response.data['data'];
      WorkModel workModel = WorkModel.fromJson(data);

      return workModel;
    } else {
      throw Exception('Gagal Submit Pekerjaan');
    }
  }
}
