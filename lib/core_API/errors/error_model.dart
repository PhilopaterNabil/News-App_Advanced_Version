import 'package:task_ninja_flutter/core_API/API/end_points.dart';

class ErrorModel {
  final int status ;
  final String errMessage ;

  ErrorModel({required this.status, required this.errMessage});

  factory ErrorModel.fromJson(json){
    return ErrorModel(
      status: json[APIKey.status] ,
     errMessage: json[APIKey.errorMessage] ,
     );
  }

}