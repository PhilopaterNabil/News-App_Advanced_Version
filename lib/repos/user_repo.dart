import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:task_ninja_flutter/cache/cache_helper.dart';
import 'package:task_ninja_flutter/core_API/API/end_points.dart';
import 'package:task_ninja_flutter/core_API/errors/exceptions.dart';
import 'package:task_ninja_flutter/models/delete_user_model.dart';
import 'package:task_ninja_flutter/models/sign_in_model.dart';
import 'package:task_ninja_flutter/models/sign_up_model.dart';
import 'package:task_ninja_flutter/models/user_model.dart';

class UserRepo {
 final Dio api ;

  UserRepo({required this.api});

  
 Future<Either< SignInModel , String >> signIn ( {required String email,  required String password} ) async {
  try {
    final response = await api.post(
    EndPoints.signIn ,
    data:  {
      APIKey.email : email ,
      APIKey.password : password ,
    }
     ) ;

    final user = SignInModel.fromJson(response) ;
    final decodedToken = JwtDecoder.decode(user.token) ;
    CacheHelper().saveData(key: APIKey.token, value: user.token) ;
    CacheHelper().saveData(key: APIKey.id, value: decodedToken[APIKey.id] );

    return left(user) ;
  }
  on ServerException catch (e){
    return right( e.errModel.errMessage) ; 
  }
 }


 Future<Either< SignUpModel , String >> signUp ( { required String name ,required String email,  required String password , required String confirmPassword , required String phone }) async {
  try {
    final response = await api.post(
    EndPoints.signUp ,
      
    data:  {
      APIKey.name : name, 
      APIKey.email : email ,
      APIKey.password : password ,
      APIKey.confirmPassword : confirmPassword ,
      APIKey.phone : phone ,
    }
    
     ) ;

    final user = SignUpModel.fromJson(response) ;

    return left(user) ;
  }
  on ServerException catch (e){
    return right( e.errModel.errMessage) ; 
  }
 }


 Future<Either<UserModel , String>> getUserData () async {
    try {
    final response = await api.get(
      EndPoints.getUserData(
        CacheHelper().getData(key: APIKey.id , )
      ) ,
      
    ) ;
    final user = UserModel.fromJson(response) ;
    return left(user)  ;
    }
    on ServerException catch (e){
        return right(e.errModel.errMessage) ;
    }


  }

  Future<Either<DeleteUserModel,String>> deleteUser () async {
    try {
    final response = await api.delete(
      EndPoints.delete(
        CacheHelper().getData(key: APIKey.id)
      ) 
    ) ;
    final user = DeleteUserModel.fromJson(response) ;
    return left(user) ; }
    on ServerException catch (e) {
      return right(e.errModel.errMessage) ;
    }
  } 


}