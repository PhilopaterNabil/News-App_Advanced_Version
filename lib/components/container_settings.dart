import 'package:flutter/material.dart';

class ContainerSettings extends StatelessWidget {
  final Icon icon;
  final String title;
  final void Function()? onTap;
  const ContainerSettings(
      {super.key,
      required this.icon,
      required this.title,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              icon,
              const SizedBox(
                width: 20,
              ),
              Text(
                title,
                style: const TextStyle(
                  color: Color.fromARGB(255, 184, 33, 33),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
