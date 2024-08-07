import 'dart:core';

import 'package:flutter/material.dart';

class BuildDetailRow extends StatelessWidget {
  final String title;
   final String value;
    String? action;
   BuildDetailRow({super.key , required this.title , required this.value , this.action });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 25,
                    color: Color.fromARGB(255, 132, 46, 46),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            if (action != null)
              Row(
                children: [
                  Text(
                    action!,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 184, 33, 33)),
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit,
                        color: Color.fromARGB(255, 184, 33, 33)),
                    onPressed: () {
                      // Handle edit action
                    },
                  ),
                ],
              ),
          ],
        ),
        const Divider(
          endIndent: 100,
        ),
      ],
    );
  }
}
