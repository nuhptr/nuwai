import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nuwai/models/job_model.dart';
import 'package:nuwai/services/job_service.dart';

part 'search_job_state.dart';

class SearchJobCubit extends Cubit<SearchJobState> {
  SearchJobCubit() : super(SearchJobInitial());

  // get job by name
  void getJobByName({required String? nameJob}) async {
    try {
      emit(SearchJobLoading());
      List<JobModel> jobModel = await JobService().getNameJob(jobName: nameJob);
      emit(SearchJobSuccess(jobModel));
    } catch (e) {
      emit(
        SearchJobFailed(e.toString()),
      );
    }
  }
}
