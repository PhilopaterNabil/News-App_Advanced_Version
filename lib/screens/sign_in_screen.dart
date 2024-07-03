import 'package:flutter/material.dart';
import 'package:sin_api/widgets/Sign_inWidget/Sign_in_Filed.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffEEF1F3),
        body: Sign_in_Filed(size: size),
      ),
    );
  }
}

