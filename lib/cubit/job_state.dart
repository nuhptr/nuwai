part of 'job_cubit.dart';

abstract class JobState extends Equatable {
  const JobState();

  @override
  List<Object> get props => [];
}

class JobInitial extends JobState {}

class JobLoading extends JobState {}

class JobSuccess extends JobState {
  JobSuccess(this.jobModel);

  final List<JobModel> jobModel;

  @override
  List<Object> get props => [jobModel];
}

class JobFailed extends JobState {
  JobFailed(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
