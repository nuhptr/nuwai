import 'package:dio/dio.dart';
import 'package:nuwai/models/job_model.dart';

class JobService {
  String? baseUrl = 'https://nulungguwai.com/api';
  final Dio dio = Dio();

  Future<List<JobModel>> getModel({String? kategori}) async {
    String url = '$baseUrl/jobs?kategori=$kategori';

    Response response = await dio.get(
      'url',
      options: Options(headers: {'Content-Type': 'aplication/json'}),
    );
    print(response.data);

    if (response.statusCode == 200) {
      List data = response.data['data']['data'];
      List<JobModel> job = [];

      for (var item in data) {
        job.add(JobModel.fromJson(item));
      }

      return job;
    } else {
      throw Exception('Gagal get kategori pekerjaan');
    }
  }
}
