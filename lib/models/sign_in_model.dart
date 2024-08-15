import 'package:task_ninja_flutter/core_API/API/end_points.dart';

class SignInModel {
  final String message ;
  final String token ;


  factory SignInModel.fromJson(json){
    return SignInModel(
      message: json['user'][APIKey.message] ,
     token: json['user'][APIKey.token]
     );
  }

  SignInModel({required this.message, required this.token});
}