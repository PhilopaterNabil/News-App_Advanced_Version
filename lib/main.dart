import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_ninja_flutter/cache/cache_helper.dart';
import 'package:task_ninja_flutter/cubit/user_cubit.dart';
import 'package:task_ninja_flutter/repos/user_repo.dart';
import 'package:task_ninja_flutter/theme/theme_provider.dart';
import 'screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; 

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
  runApp(
    MultiProvider(
      providers: [
        BlocProvider(
          create: (context) => UserCubit(UserRepo(api: Dio())),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),
      theme: Provider.of<ThemeProvider>(context).themedata,
    );
  }
}