import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nuwai/models/job_model.dart';
import 'package:nuwai/services/job_service.dart';

part 'job_state.dart';

class JobCubit extends Cubit<JobState> {
  JobCubit() : super(JobInitial());

  // get job by category
  void getJobByCategory({required String? kategori}) async {
    try {
      emit(JobLoading());
      List<JobModel> jobModel = await JobService().getJobKategori(
        kategori: kategori,
      );
      emit(JobSuccess(jobModel));
    } catch (e) {
      emit(
        JobFailed(e.toString()),
      );
    }
  }

  // get job by name
  void getJobByName({required String? nameJob}) async {
    try {
      emit(JobLoading());
      List<JobModel> jobModel = await JobService().getNameJob(jobName: nameJob);
      emit(JobSuccess(jobModel));
    } catch (e) {
      emit(JobFailed(e.toString()));
    }
  }
}
