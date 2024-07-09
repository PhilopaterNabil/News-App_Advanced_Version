import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:page_transition/page_transition.dart';
import 'package:sin_api/cubit/user_cubit.dart';
import 'package:sin_api/cubit/user_state.dart';
// import 'package:sin_api/screens/sign_in_screen.dart';
import 'package:sin_api/widgets/App/custom_form_button.dart';
import 'package:sin_api/widgets/App/custom_input_field.dart';
import 'package:sin_api/widgets/App/page_heading.dart';
import 'package:sin_api/widgets/Sign_UP_Widget/pick_image_widget.dart';

class UpdateProfile extends StatelessWidget {
  const UpdateProfile({super.key});

  static String id = "Update_Profile";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is UpDateSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.message),
          ));
          Navigator.pop(context);
        } else if (state is UpDateFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.errMessage),
          ));
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(children: [
                SizedBox(height: 25),
                const PageHeading(title: 'Sign-up'),
                //! Image
                const PickImageWidget(),
                const SizedBox(height: 16),
                //! Name
                CustomInputField(
                  keyboardType: TextInputType.name,
                  labelText: 'Name',
                  hintText: 'Your name',
                  isDense: true,
                  controller: context.read<UserCubit>().signUpName,
                ),
                SizedBox(height: 20),
                CustomInputField(
                  keyboardType: TextInputType.phone,
                  labelText: 'Phone number',
                  hintText: 'Your phone number ex:01234567890',
                  isDense: true,
                  controller: context.read<UserCubit>().signUpPhoneNumber,
                ),
                SizedBox(height: 20),
                if (state is UpDateLoading)
                  const CircularProgressIndicator()
                else
                  CustomFormButton(
                    innerText: 'change ',
                    onPressed: () {
                      context.read<UserCubit>().updateUserProfile();
                    },
                  ),
                SizedBox(height: 15),
                CustomFormButton(
                  innerText: 'cancle',
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ]),
            ),
          ),
        );
      },
    );
  }
}
