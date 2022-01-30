import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:nuwai/models/job_model.dart';
import 'package:nuwai/services/job_service.dart';

part 'job_individual_state.dart';

class JobIndividualCubit extends Cubit<JobIndividualState> {
  JobIndividualCubit() : super(JobIndividualInitial());

  // get job by category (Perorangan)
  void getJobByCategory({
    String? kategori = 'Perorangan',
  }) async {
    try {
      emit(JobIndividualLoading());
      List<JobModel> jobModel = await JobService().getJobKategori(
        kategori: kategori,
      );
      emit(JobIndividualSuccess(jobModel));
    } catch (e) {
      emit(
        JobIndividualFailed(e.toString()),
      );
    }
  }
}
