import 'package:flutter/material.dart';
import 'package:news_app_team/App_widget.dart';
import 'package:news_app_team/models/image_provider.dart';
import 'package:news_app_team/models/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => ImageProfileProvider()),
      ],
      child: const NewsApp(),
    ),
  );
}
