import 'package:dio/dio.dart';
import 'package:nuwai/models/job_model.dart';

class JobService {
  String? baseUrl = 'https://nulungguwai.com/api';
  final Dio dio = Dio();

  // TODO: get job by kategori
  Future<List<JobModel>> getJobKategori({String? kategori}) async {
    String url = '$baseUrl/jobs?kategori=$kategori';

    Map<String, dynamic> header = {
      'Content-Type': 'aplication/json',
    };

    Response response = await dio.get(
      url,
      options: Options(
        headers: header,
      ),
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

  // TODO: get jobs by name of jobs
  Future<List<JobModel>> getNameJob({String? jobName}) async {
    String url = '$baseUrl/jobs?nama_pekerjaan=$jobName';

    Map<String, dynamic> header = {
      'Content-Type': 'application/json',
    };

    Response response = await dio.get(
      url,
      options: Options(
        headers: header,
      ),
    );
    print(response.data);

    if (response.statusCode == 200) {
      List data = response.data['data']['data'];
      List<JobModel> jobs = [];

      for (var item in data) {
        jobs.add(JobModel.fromJson(item));
      }

      return jobs;
    } else {
      throw Exception('Gagal mengambil data nama pekerjaan');
    }
  }
}
