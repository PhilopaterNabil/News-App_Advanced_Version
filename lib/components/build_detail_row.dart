import 'dart:core';

import 'package:flutter/material.dart';

class BuildDetailRow extends StatelessWidget {
  const BuildDetailRow(
      {super.key, required this.title, required this.value, this.action});

  final String title;
  final String value;
  final String? action;

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
                    color: Colors.grey,
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 25,
                    color: Colors.purpleAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            if (action != null)
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.purpleAccent),
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
