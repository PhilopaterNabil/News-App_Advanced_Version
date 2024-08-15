import 'package:task_ninja_flutter/core_API/API/end_points.dart';

class SignUpModel {
  final String message ;

  SignUpModel({required this.message});

  factory SignUpModel.fromJson(json){
    return SignUpModel(message: json[APIKey.message] );
  }
}