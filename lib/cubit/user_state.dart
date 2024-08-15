import 'package:task_ninja_flutter/models/user_model.dart';

class UserState {}

final class UserInitial extends UserState {}

final class SignInLoading extends UserState {}

final class SignInSuccess extends UserState {}

final class SignInFaliure extends UserState {
  final String errMessage ;

  SignInFaliure({required this.errMessage});
}


final class SignUpLoading extends UserState {}

final class SignUpSuccess extends UserState {}

final class SignUpFaliure extends UserState {
  final String errMessage ;

  SignUpFaliure({required this.errMessage});
}


final class GetUserDataLoading extends UserState {}

final class GetUserDataSuccess extends UserState {

  final UserModel user ;

  GetUserDataSuccess({required this.user});

}

final class GetUserDataFaliure extends UserState {
  final String errMessage ;

  GetUserDataFaliure({required this.errMessage});}

  final class DeleteUserLoading extends UserState {}

final class DeleteUserSuccess extends UserState {}

final class DeleteUserFaliure extends UserState {
  final String errMessage ;

  DeleteUserFaliure({required this.errMessage});
}
