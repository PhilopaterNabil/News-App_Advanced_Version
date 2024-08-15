import 'package:task_ninja_flutter/core_API/API/end_points.dart';

class UserModel {

  final String name ;
  final String password ;
  final String email ;
  final String phone ;

  UserModel({required this.name, required this.password, required this.email, required this.phone});

  factory UserModel.fromJson(json){
    return UserModel(
      name: json['user'][APIKey.name] ,
     password: json['user'][APIKey.password] ,
     email: json['user'][APIKey.email] ,
      phone: json['user'][APIKey.phone] ,
      );
  }
}