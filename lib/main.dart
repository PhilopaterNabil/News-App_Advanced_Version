import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_ninja_flutter/theme/theme_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(   ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        child: const MyApp(),
      ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: const HomeScreen(),
          theme: Provider.of<ThemeProvider>(context).themedata,
    );
  }
}
