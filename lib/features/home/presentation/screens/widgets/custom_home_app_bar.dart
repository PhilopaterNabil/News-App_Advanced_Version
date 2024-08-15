import 'package:flutter/material.dart';
import 'package:news_app_team/features/home/presentation/screens/widgets/circle_person_avatar_app_Bar.dart';
import 'package:news_app_team/features/home/presentation/screens/widgets/custom_title_app_bar.dart';
import 'package:news_app_team/screens/settings_screen.dart';

class CustomHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,
      leading: const CirclePersonAvatarAppBar(),
      title: const CustomTitleAppBar(),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SettingsScreen(),
              )),
          icon: const Icon(
            Icons.settings,
            color: Colors.deepPurple,
            size: 35,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
