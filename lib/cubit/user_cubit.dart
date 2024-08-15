import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:task_ninja_flutter/cubit/user_state.dart';
import 'package:task_ninja_flutter/repos/user_repo.dart';


class UserCubit extends Cubit<UserState>  {

 final UserRepo userRepo ;
  //Sign in Form key
  GlobalKey<FormState> signInFormKey = GlobalKey();
  //Sign in email
  TextEditingController signInEmail = TextEditingController();
  //Sign in password
  TextEditingController signInPassword = TextEditingController();
  //Sign Up Form key
  GlobalKey<FormState> signUpFormKey = GlobalKey();
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

  UserCubit(this.userRepo) : super(UserInitial());


  signIn() async {
    emit(SignInLoading());
    final response = await userRepo.signIn(email: signInEmail.text , password: signInPassword.text ) ;
    response.fold(
     (signInModel)=>emit(SignInSuccess()) , 
      (errMessage) => emit(SignInFaliure(errMessage: errMessage)) ) ;

  }


  signUp() async {
    emit(SignUpLoading()) ;
    final response = await userRepo.signUp(
      name: signUpName.text ,
     email: signUpEmail.text ,
      password: signUpPassword.text ,
       confirmPassword: confirmPassword.text ,
        phone: signUpPhoneNumber.text ); 

        response.fold(
          (signUpModel) => emit(SignUpSuccess()) ,
           (errMessage)=> emit(SignUpFaliure(errMessage: errMessage)) ) ;
  }


  getUserData() async {
    
    final response = await userRepo.getUserData() ;
    response.fold(
      (user) => emit(GetUserDataSuccess(user: user)) ,
       ( errMessage ) =>emit(GetUserDataFaliure(errMessage: errMessage)) ) ;
  }


  deleteUser () async {
    emit(DeleteUserLoading()) ;

    final response = await userRepo.deleteUser() ; 

  }

  
}