part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserSuccess extends UserState {
  UserSuccess(this.user);

  final UserModel user;

  @override
  List<Object> get props => [user];
}

class UserLogout extends UserState {
  UserLogout(this.user);

  final UserModel user;

  @override
  List<Object> get props => [user];
}

class UserFailed extends UserState {
  UserFailed(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
