import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CirclePersonAvatarAppBar extends StatelessWidget {
  const CirclePersonAvatarAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 2),
      child: IconButton(
        onPressed: () {},
        icon: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.deepPurpleAccent[100],
              ),
            ),
            const Icon(
              CupertinoIcons.person_fill,
              size: 24,
              color: Colors.black87,
            ),
          ],
        ),
      ),
    );
  }
}
