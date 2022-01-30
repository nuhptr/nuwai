part of 'job_perusahaan_cubit.dart';

abstract class JobPerusahaanState extends Equatable {
  JobPerusahaanState();

  @override
  List<Object> get props => [];
}

class JobPerusahaanInitial extends JobPerusahaanState {}

class JobPerusahaanLoading extends JobPerusahaanState {}

class JobPerusahaanSuccess extends JobPerusahaanState {
  JobPerusahaanSuccess(this.jobModel);

  final List<JobModel> jobModel;

  @override
  List<Object> get props => [jobModel];
}

class JobPerusahaanFailed extends JobPerusahaanState {
  JobPerusahaanFailed(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
