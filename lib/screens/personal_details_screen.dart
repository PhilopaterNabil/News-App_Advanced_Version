import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_ninja_flutter/components/build_detail_row.dart';
import 'package:task_ninja_flutter/cubit/user_cubit.dart';
import 'package:task_ninja_flutter/cubit/user_state.dart';


class PersonalDetailsScreen extends StatelessWidget {
  const PersonalDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
          if (state is GetUserDataFaliure ) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: state is GetUserDataLoading ? const CircularProgressIndicator() : state is GetUserDataSuccess ?
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Personal details",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              BuildDetailRow(
                title: 'Email',
                value: state.user.email ,
                action: 'Edit',
              ),
              BuildDetailRow(
                title: 'Password',
                value: state.user.password ,
                action: 'Edit',
              ),
              BuildDetailRow(
                title: 'Display name',
                value: state.user.name ,
                action: 'Add',
              ),
              BuildDetailRow(
                title: 'Year of birth',
                value: '2004',
              ),
              BuildDetailRow(
                title: 'Country of residence',
                value: 'Egypt',
                action: 'Edit',
              ),
              const SizedBox(height: 20),
              const Text(
                'Delete your account',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              InkWell(
                onTap: () {
                  
                },
                child: const Text(
                  'I want to delete my account',
                  style: TextStyle(
                    color: Color.fromARGB(255, 184, 33, 33),
                    decoration: TextDecoration.underline,
                    decorationColor: Color.fromARGB(255, 184, 33, 33),
                    decorationThickness: 2,
                  ),
                ),
              ),
            ],
          ),
        ) : const Text("oops , there was an error") ,
      );
      },
    );
  }
}
