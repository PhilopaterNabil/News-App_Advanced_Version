import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_team/features/home/presentation/screens/widgets/circle_person_avatar_app_Bar.dart';
import 'package:news_app_team/features/home/presentation/screens/widgets/custom_title_app_bar.dart';

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
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.exit_to_app,
            color: Colors.red,
            size: 35,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
