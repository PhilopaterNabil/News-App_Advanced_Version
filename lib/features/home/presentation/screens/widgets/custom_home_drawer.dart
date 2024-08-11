import 'package:flutter/material.dart';

class CustomHomeDrawer extends StatelessWidget {
  const CustomHomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.8),
                ],
              ),
            ),
            child: const Row(
              children: [],
            ),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(
              Icons.home,
            ),
            title: const Text(
              'Home',
            ),
          ),
        ],
      ),
    );
  }
}