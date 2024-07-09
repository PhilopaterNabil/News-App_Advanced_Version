import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sin_api/cubit/user_cubit.dart';
import 'package:sin_api/cubit/user_state.dart';
import 'package:sin_api/models/user_model.dart';
import 'package:sin_api/screens/sign_in_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    // context.read<UserCubit>().userCubit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is UserLoding) {
            return Center(child: CircularProgressIndicator());
          } else if (state is GetUserSuccess) {
            return ProfileDetails(user: state.user);
          } else if (state is Userfailer) {
            return Center(child: Text(state.errMessage));
          } else {
            return Center();
          }
        },
      ),
    );
  }
}

class ProfileDetails extends StatelessWidget {
  final UserModel user;

  const ProfileDetails({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        CircleAvatar(
          radius: 80,
          backgroundImage: NetworkImage(user.profilePic),
        ),
        SizedBox(height: 16),
        ListTile(
          leading: Icon(Icons.person),
          title: Text(user.name),
        ),
        ListTile(
          leading: Icon(Icons.email),
          title: Text(user.email),
        ),
        ListTile(
          leading: Icon(Icons.phone),
          title: Text(user.phone),
        ),
        ListTile(
          leading: Icon(Icons.location_city),
          title: Text(user.location.type),
        ),
        ElevatedButton(
          onPressed: () {
            context.read<UserCubit>().DeleteUser();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DeletUser(),
              ),
            );
          },
          child: Text('Delete Profile'),
        ),
        ElevatedButton(
          onPressed: () {
            context.read<UserCubit>().logOut();
            {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignInScreen(),
                ),
              );
            }
          },
          child: Text('log Out'),
        )
      ],
    );
  }
}

class DeletUser extends StatelessWidget {
  const DeletUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
          if (state is DeleteUserLoding) {
            Center(child: CircularProgressIndicator());
          } else if (state is DeleteUserSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.deldetModel.message ?? "Done"),
              ),
            );
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SignInScreen(),
              ),
            );
          } else if (state is DeleteUserfailer) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errMessage),
              ),
            );
          }
        },
        builder: (context, state) {
           return Center(
              child: Text('Delete Profile'),
            );
        },
      ),
    );
  }
}
