part of 'search_job_cubit.dart';

abstract class SearchJobState extends Equatable {
  SearchJobState();

  @override
  List<Object> get props => [];
}

class SearchJobInitial extends SearchJobState {}

class SearchJobLoading extends SearchJobState {}

class SearchJobSuccess extends SearchJobState {
  SearchJobSuccess(this.jobModel);

  final List<JobModel> jobModel;

  @override
  List<Object> get props => [jobModel];
}

class SearchJobFailed extends SearchJobState {
  SearchJobFailed(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
