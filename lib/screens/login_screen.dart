import 'package:flutter/material.dart';
import 'package:sin_api/widgets/login_widget/login_Filed.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static String id = "SignInScreen";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: const Color(0xffEEF1F3),
          body: LoginFiled(size: size),
        ),
      ),
    );
  }
}
