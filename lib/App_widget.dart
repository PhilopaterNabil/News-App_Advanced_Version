import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:news_app_team/screens/home_screen.dart';
import 'package:news_app_team/models/theme_provider.dart';
import 'package:provider/provider.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nwes App',
      theme: Provider.of<ThemeProvider>(context).themedata,
      home: const HomeScreen(),
    );
  }
}
