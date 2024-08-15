import 'package:flutter/material.dart';
import 'package:task_ninja_flutter/screens/settings_screen.dart';

import 'my_container.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: Column(
        children: [
          AppBar(
            backgroundColor: Theme.of(context).colorScheme.surface,
            title: const Row(
              children: [
                MyContainer(
                  text: "B",
                ),
                SizedBox(
                  width: 7,
                ),
                MyContainer(
                  text: "B",
                ),
                SizedBox(
                  width: 7,
                ),
                MyContainer(
                  text: "C",
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.grey,
            child: Row(
              children: [
                const Expanded(
                  flex: 5,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Search news , topics and more',
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 50,
                    color: Colors.black,
                    child: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsScreen(),
                )),
            child: Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Icon(
                      Icons.person,
                      color: Color.fromARGB(255, 72, 72, 72),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "your account",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
