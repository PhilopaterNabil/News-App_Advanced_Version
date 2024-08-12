import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sin_api/cache/cach_helper.dart';
import 'package:sin_api/core/Api/dio_consumer.dart';
import 'package:sin_api/cubit/user_cubit.dart';
import 'package:sin_api/screens/profile_screen.dart';
import 'package:sin_api/screens/login_screen.dart';
import 'package:sin_api/screens/update_profile.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
  runApp(
    BlocProvider(
      create: (context) => UserCubit(DioConsumer(dio: Dio())),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const LoginScreen(),
        UpdateProfile.id: (context) => const UpdateProfile(),
        ProfileScreen.id: (context) => const ProfileScreen(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: LoginScreen.id,
    );
  }
}
