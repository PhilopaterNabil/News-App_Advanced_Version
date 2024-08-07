import 'package:flutter/material.dart';
import 'package:task_ninja_flutter/components/my_container.dart';
import 'package:task_ninja_flutter/components/my_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade600,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
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
      drawer: const MyDrawer(),
    );
  }
}
