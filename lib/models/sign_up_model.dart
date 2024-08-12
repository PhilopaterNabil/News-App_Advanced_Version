import 'package:sin_api/core/Api/end_point.dart';

class SignUpModel {
  final String message;

  SignUpModel({required this.message});

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
      message: json[ApiKey.message],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
    };
  }
}
