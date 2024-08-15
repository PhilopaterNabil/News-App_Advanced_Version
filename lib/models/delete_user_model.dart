class DeleteUserModel {
  final String message ;

  DeleteUserModel({required this.message});

  factory DeleteUserModel.fromJson(json){
    return DeleteUserModel(message: json['message']) ;
  }

}
