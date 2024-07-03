// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sin_api/cubit/user_state.dart';
import 'package:sin_api/models/SignUpModel.dart';
import 'package:sin_api/services/SignUpServer.dart';
import 'package:sin_api/services/check-email_server.dart';
import 'package:sin_api/services/signing_server.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());
  //Sign in Form key
  GlobalKey<FormState> signInFormKey = GlobalKey();
  //Sign in email
  TextEditingController signInEmail = TextEditingController();
  //Sign in password
  TextEditingController signInPassword = TextEditingController();
  //Sign Up Form key
  GlobalKey<FormState> signUpFormKey = GlobalKey();
  //Profile Pic
  XFile? profilePic;
  //Sign up name
  TextEditingController signUpName = TextEditingController();
  //Sign up phone number
  TextEditingController signUpPhoneNumber = TextEditingController();
  //Sign up email
  TextEditingController signUpEmail = TextEditingController();
  //Sign up password
  TextEditingController signUpPassword = TextEditingController();
  //Sign up confirm password
  TextEditingController confirmPassword = TextEditingController();

  Future<void> signing() async {
    // late dynamic oo;
    emit(SignInLoading());
    print("Loding state emitted");
    try {
      final response = await SigningServer()
          .signIn(email: signInEmail.text, password: signInPassword.text);
      emit(SignInSuccess());
      print("Success state emitted");
      // oo = response;
    } catch (e) {
      print("Error: $e");
      emit(SignInFailure(errMessage: e.toString()));
    }
  }

  Future<void> signUp() async {
    emit(SignUpLoading());
    print("Lodding state emitted");
    try {
      final SignUpModel response = await SignUpServer().SignUp(
        email: signUpEmail.text,
        password: signUpPassword.text,
        confirmPassword: confirmPassword.text,
        name: signUpName.text,
        phone: signUpPhoneNumber.text,
        // profilePic: profilePic!,
      );
      emit(SignUpSuccess(message: response.toString()));
      print("****Success state emitted + ${response.toString()}******");
    } catch (e) {
      print("Error: $e");
      emit(SignUpFailure(errMessage: e.toString()));
    }
  }

  Future<void> CheckEmail() async {
    emit(SignUpLoading());
    print("Loding state emitted");
    try {
      final response = await Check_email_Server().checkEmail(
        email: signUpEmail.text,
      );
      emit(SignUpSuccess(message: response.toString()));
      print("********Success state emitted");
    } catch (e) {
      print("Error: $e");
      emit(SignUpFailure(errMessage: e.toString()));
    }
  }
}
