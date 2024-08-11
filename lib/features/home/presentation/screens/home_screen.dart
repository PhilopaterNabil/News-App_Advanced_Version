import 'package:flutter/material.dart';
import 'package:news_app_team/features/home/presentation/screens/widgets/custom_home_app_bar.dart';
import 'package:news_app_team/features/home/presentation/screens/widgets/custom_home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomHomeAppBar(),
      // drawer: CustomHomeDrawer(),
      body: CustomHomeBody(),
    );
  }
}
