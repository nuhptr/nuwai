part of 'job_individual_cubit.dart';

abstract class JobIndividualState extends Equatable {
  JobIndividualState();

  @override
  List<Object> get props => [];
}

class JobIndividualInitial extends JobIndividualState {}

class JobIndividualLoading extends JobIndividualState {}

class JobIndividualSuccess extends JobIndividualState {
  JobIndividualSuccess(this.jobModel);

  final List<JobModel> jobModel;

  @override
  List<Object> get props => [jobModel];
}

class JobIndividualFailed extends JobIndividualState {
  JobIndividualFailed(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
