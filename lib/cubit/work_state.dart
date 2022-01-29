part of 'work_cubit.dart';

abstract class WorkState extends Equatable {
  const WorkState();

  @override
  List<Object> get props => [];
}

class WorkInitial extends WorkState {}

class WorkLoading extends WorkState {}

class WorkSuccess extends WorkState {
  WorkSuccess(this.workModel);

  final WorkModel workModel;

  @override
  List<Object> get props => [workModel];
}

class WorkFailed extends WorkState {
  WorkFailed(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
