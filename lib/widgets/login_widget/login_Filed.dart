import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sin_api/cubit/user_cubit.dart';
import 'package:sin_api/cubit/user_state.dart';
import 'package:sin_api/screens/profile_screen.dart';
import 'package:sin_api/widgets/App/custom_form_button.dart';
import 'package:sin_api/widgets/App/custom_input_field.dart';
import 'package:sin_api/widgets/App/page_header.dart';
import 'package:sin_api/widgets/App/page_heading.dart';
import 'package:sin_api/widgets/login_widget/dont_have_an_account.dart';
import 'package:sin_api/widgets/login_widget/forget_password_widget.dart';

class LoginFiled extends StatelessWidget {
  const LoginFiled({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(listener: (context, state) {
      if (state is SignInSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("success"),
          ),
        );
        context.read<UserCubit>().getUserProfile();
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            duration: const Duration(milliseconds: 375),
            child: const ProfileScreen(),
          ),
        );
      } else if (state is SignInFailure) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
                'oops error enter email , password  reset or cheack Email'),
          ),
        );
      }
    }, builder: (context, state) {
      return Column(
        children: [
          const PageHeader(),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: context.read<UserCubit>().signInFormKey,
                  child: Column(
                    children: [
                      const PageHeading(title: 'Login'),
                      //!Email
                      CustomInputField(
                        keyboardType: TextInputType.emailAddress,
                        labelText: 'Email',
                        hintText: 'Your email',
                        controller: context.read<UserCubit>().signInEmail,
                      ),
                      const SizedBox(height: 16),
                      //!Password
                      CustomInputField(
                        keyboardType: TextInputType.visiblePassword,
                        labelText: 'Password',
                        hintText: 'Your password',
                        obscureText: true,
                        suffixIcon: true,
                        controller: context.read<UserCubit>().signInPassword,
                      ),
                      const SizedBox(height: 16),
                      //! Forget password?
                      ForgetPasswordWidget(size: size),
                      const SizedBox(height: 20),
                      //!Sign In Button
                      if (state is SignInLoading)
                        const CircularProgressIndicator()
                      else
                        CustomFormButton(
                          innerText: 'Login',
                          onPressed: () {
                            context.read<UserCubit>().signIn();
                          },
                        ),
                      const SizedBox(height: 18),
                      //! Dont Have An Account ?
                      DontHaveAnAccountWidget(size: size),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
