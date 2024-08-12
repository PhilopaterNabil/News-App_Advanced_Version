class CheckEmailModel {
  final String message;

  CheckEmailModel({required this.message});

  factory CheckEmailModel.fromJson(Map<String, dynamic> json) {
    return CheckEmailModel(
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
    };
  }
}
