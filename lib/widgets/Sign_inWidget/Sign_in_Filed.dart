import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sin_api/cubit/user_cubit.dart';
import 'package:sin_api/cubit/user_state.dart';
import 'package:sin_api/screens/profile_screen.dart';
import 'package:sin_api/widgets/App/custom_form_button.dart';
import 'package:sin_api/widgets/App/custom_input_field.dart';
import 'package:sin_api/widgets/Sign_inWidget/dont_have_an_account.dart';
import 'package:sin_api/widgets/Sign_inWidget/forget_password_widget.dart';
import 'package:sin_api/widgets/App/page_header.dart';
import 'package:sin_api/widgets/App/page_heading.dart';

class Sign_in_Filed extends StatelessWidget {
  const Sign_in_Filed({
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
        // context.read<UserCubit>().getUserProfile();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ProfileScreen(),
          ),
        );
      } else if (state is SignInFailure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                'opps error enter email , password  reset or cheack Email'),
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
                      const PageHeading(title: 'Sign-in'),
                      //!Email
                      CustomInputField(
                        labelText: 'Email',
                        hintText: 'Your email',
                        controller: context.read<UserCubit>().signInEmail,
                      ),
                      const SizedBox(height: 16),
                      //!Password
                      CustomInputField(
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
                          innerText: 'Sign In',
                          onPressed: () {
                            context.read<UserCubit>().signing();

                            context.read<UserCubit>().CheckEmail();
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
