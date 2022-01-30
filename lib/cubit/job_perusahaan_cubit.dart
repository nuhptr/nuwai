import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:nuwai/models/job_model.dart';
import 'package:nuwai/services/job_service.dart';

part 'job_perusahaan_state.dart';

class JobPerusahaanCubit extends Cubit<JobPerusahaanState> {
  JobPerusahaanCubit() : super(JobPerusahaanInitial());

  // get job by category (Perusahaan)
  void getJobByCategory({
    String? kategori = 'Perusahaan',
  }) async {
    try {
      emit(JobPerusahaanLoading());
      List<JobModel> jobModel = await JobService().getJobKategori(
        kategori: kategori,
      );
      emit(JobPerusahaanSuccess(jobModel));
    } catch (e) {
      emit(
        JobPerusahaanFailed(e.toString()),
      );
    }
  }
}
