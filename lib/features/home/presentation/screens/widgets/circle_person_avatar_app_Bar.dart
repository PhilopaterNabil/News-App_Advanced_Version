import 'package:flutter/material.dart';
import 'package:news_app_team/models/image_provider.dart';
import 'package:news_app_team/screens/personal_details_screen.dart';
import 'package:provider/provider.dart';


class CirclePersonAvatarAppBar extends StatelessWidget {
  const CirclePersonAvatarAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final imageProvider = Provider.of<ImageProfileProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 2),
      child: IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PersonalDetailsScreen(),
            ),
          );
        },
        icon: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
              child: imageProvider.image != null
                  ? CircleAvatar(
                      radius: 20,
                      backgroundImage: MemoryImage(imageProvider.image!),
                    )
                  : const Icon(
                      Icons.person,
                      size: 24,
                      color: Colors.black87,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
