// import 'dart:convert';

// ignore_for_file: unnecessary_null_comparison, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:sin_api/cache/cach_helper.dart';
import 'package:sin_api/core/Api/api_consumer.dart';
import 'package:sin_api/core/Api/end_point.dart';
import 'package:sin_api/core/Error/exceptions.dart';
import 'package:sin_api/core/functions/upload_image_to_api.dart';
import 'package:sin_api/cubit/user_state.dart';
import 'package:sin_api/models/delete_user_model.dart';
import 'package:sin_api/models/sign_up_model.dart';
import 'package:sin_api/models/signin_model.dart';
import 'package:sin_api/models/user_model.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.api) : super(UserInitial());
  final ApiConsumer api;
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

  SignInModel? user;

  uploadProFilePic(XFile image) {
    profilePic = image;
    emit(UploadProfilePic());
  }

  SignUp() async {
    try {
      if (profilePic == null) {
        emit(SignUpFailure(errMessage: 'Profile picture is required.'));
        return;
      }
      emit(SignUpLoading());
      final response = await api.post(
        EndPoint.signUp,
        isFromData: true,
        data: {
          ApiKey.name: signUpName.text,
          ApiKey.email: signUpEmail.text,
          ApiKey.phone: signUpPhoneNumber.text,
          ApiKey.password: signUpPassword.text,
          ApiKey.confirmPassword: confirmPassword.text,
          ApiKey.location:
              '{"name":"methalfa","address":"meet halfa","coordinates":[30.1572709,31.224779]}',
          ApiKey.profilePic: await uploadImageToAPI(profilePic!),
        },
      );
      final signUpModel = SignUpModel.fromJson(response);
      emit(SignUpSuccess(message: signUpModel.message));
    } on ServerException catch (e) {
      emit(SignUpFailure(errMessage: e.errModel.errorMessage));
    }
  }

  signIn() async {
    try {
      emit(SignInLoading());
      final response = await api.post(
        EndPoint.signIn,
        data: {
          ApiKey.email: signInEmail.text,
          ApiKey.password: signInPassword.text,
        },
      );
      user = SignInModel.fromJson(response);
      final decodedToken = JwtDecoder.decode(user?.token ?? '');
      CacheHelper().saveData(key: ApiKey.token, value: user!.token);
      CacheHelper().saveData(key: ApiKey.id, value: decodedToken[ApiKey.id]);
      emit(SignInSuccess());
    } on ServerException catch (e) {
      emit(SignInFailure(errMessage: e.errModel.errorMessage));
    }
  }

  getUserProfile() async {
    try {
      emit(UserLoding());
      final response = await api.get(
        EndPoint.getUserDataEndPoint(CacheHelper().getData(key: ApiKey.id)),
      );
      emit(GetUserSuccess(
        user: UserModel.fromJson(response),
      ));
    } on ServerException catch (e) {
      emit(Userfailer(errMessage: e.errModel.errorMessage));
    }
  }

  logOut() async {
    try {
      emit(UserLoding());
      final response = await api.get(
        EndPoint.logout,
      );
      emit(UserlogoutSuccess());
    } on ServerException catch (e) {
      emit(UserlogoutFailre(errMessage: e.errModel.errorMessage));
    }
  }

  DeleteUser() async {
    try {
      emit(DeleteUserLoding());
      final userId = CacheHelper().getData(key: ApiKey.id);
      if (userId == null) {
        throw Exception('User ID not found');
      }

      print('User ID: $userId');

      final response = await api.delete(
        EndPoint.DeleteUserEndPoint(userId),
        queryParameters: {
          'id': '${userId.toString()}',
        },
        data: {
          // 'id': '/${userId.toString()}',
        },
        isFromData: true,
      );

      print('Response: ${response.toString()}');

      emit(DeleteUserSuccess(deldetModel: DeldetModel.fromJson(response)));
    } on ServerException catch (e) {
      emit(DeleteUserfailer(errMessage: e.errModel.errorMessage));
      print('ServerException: ${e.errModel.errorMessage}');
    } catch (e) {
      emit(DeleteUserfailer(errMessage: e.toString()));
      print('Exception: ${e.toString()}');
    }
  }
}
