import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:nuwai/models/user_model.dart';
import 'package:nuwai/services/user_service.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  // sign up
  void signUp({
    required String? name,
    required String? email,
    required String? password,
  }) async {
    try {
      emit(UserLoading());
      UserModel user = await UserService().register(
        email: email,
        password: password,
        name: name,
      );

      emit(UserSuccess(user));
    } catch (e) {
      emit(UserFailed(e.toString()));
    }
  }

  // login
  void login({required String? email, required String? password}) async {
    try {
      emit(UserLoading());
      UserModel user = await UserService().login(
        email: email,
        password: password,
      );
      emit(UserSuccess(user));
    } catch (e) {
      emit(UserFailed(e.toString()));
    }
  }

  // logout
  void logout({required String? token}) async {
    try {
      emit(UserLoading());
      await UserService().logout(userToken: token);
      emit(UserInitial());
    } catch (e) {
      emit(UserFailed(e.toString()));
    }
  }

  // update
  void update({
    required String? alamat,
    required String? photoProfile,
    required String? cvPath,
    required String? token,
  }) async {
    try {
      emit(UserLoading());
      // UserModel user = await UserService().update(
      //   alamat: alamat,
      //   token: token,
      //   cvPath: cvPath,
      //   photoProfile: photoProfile,
      // );
      // emit(UserSuccess(user));
    } catch (e) {
      emit(UserFailed(e.toString()));
    }
  }
}
