import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sin_api/cubit/user_cubit.dart';
import 'package:sin_api/cubit/user_state.dart';
import 'package:sin_api/widgets/Sign_UP_Widget/already_have_an_account_widget.dart';
import 'package:sin_api/widgets/App/custom_form_button.dart';
import 'package:sin_api/widgets/App/custom_input_field.dart';
import 'package:sin_api/widgets/App/page_header.dart';
import 'package:sin_api/widgets/App/page_heading.dart';
import 'package:sin_api/widgets/Sign_UP_Widget/pick_image_widget.dart';

class SignUpFiled extends StatelessWidget {
  const SignUpFiled({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.message),
          ));
        } else if (state is SignUpFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.errMessage),
          ));
        }
      },
      builder: (context, state) {
        return Column(
          children: <Widget>[
            const PageHeader(),
            const PageHeading(title: 'Sign-up'),
            //! Image
            const PickImageWidget(),
            const SizedBox(height: 16),
            //! Name
            CustomInputField(
              labelText: 'Name',
              hintText: 'Your name',
              isDense: true,
              controller: context.read<UserCubit>().signUpName,
            ),
            const SizedBox(height: 16),
            //!Email
            CustomInputField(
              labelText: 'Email',
              hintText: 'Your email',
              isDense: true,
              controller: context.read<UserCubit>().signUpEmail,
            ),
            const SizedBox(height: 16),
            //! Phone Number
            CustomInputField(
              labelText: 'Phone number',
              hintText: 'Your phone number ex:01234567890',
              isDense: true,
              controller: context.read<UserCubit>().signUpPhoneNumber,
            ),
            const SizedBox(height: 16),
            //! Password
            CustomInputField(
              labelText: 'Password',
              hintText: 'Your password',
              isDense: true,
              obscureText: true,
              suffixIcon: true,
              controller: context.read<UserCubit>().signUpPassword,
            ),
            //! Confirm Password
            CustomInputField(
              labelText: 'Confirm Password',
              hintText: 'Confirm Your password',
              isDense: true,
              obscureText: true,
              suffixIcon: true,
              controller: context.read<UserCubit>().confirmPassword,
            ),
            const SizedBox(height: 22),
            //!Sign Up Button
            if (state is SignUpLoading)
              const CircularProgressIndicator()
            else
              CustomFormButton(
                innerText: 'Signup',
                onPressed: () {
                  // context.read<UserCubit>().signUp();
                },
              ),
            const SizedBox(height: 18),
            //! Already have an account widget
            const AlreadyHaveAnAccountWidget(),
            const SizedBox(height: 30),
          ],
        );
      },
    );
  }
}
