import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nuwai/models/work_model.dart';
import 'package:nuwai/services/work_service.dart';

part 'work_state.dart';

class WorkCubit extends Cubit<WorkState> {
  WorkCubit() : super(WorkInitial());

  // apply job
  void applyWork({
    required String? userToken,
    required String? idJob,
    int? idUser,
    String? isApply,
  }) async {
    try {
      emit(WorkLoading());

      WorkModel workModel = await WorkServices().submitJobs(
        idJob: idJob,
        idUser: idUser,
        userToken: userToken,
        isApply: isApply,
      );
      print(workModel);

      emit(WorkSuccess(workModel));
    } catch (e) {
      emit(
        WorkFailed(e.toString()),
      );
    }
  }
}
