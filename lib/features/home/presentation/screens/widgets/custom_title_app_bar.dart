import 'package:flutter/material.dart';
import 'package:news_app_team/features/home/presentation/screens/widgets/custom_single_char_title.dart';

class CustomTitleAppBar extends StatelessWidget {
  const CustomTitleAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomSingleCharTitle(char: 'B'),
        CustomSingleCharTitle(char: 'B'),
        CustomSingleCharTitle(char: 'C'),
      ],
    );
  }
}