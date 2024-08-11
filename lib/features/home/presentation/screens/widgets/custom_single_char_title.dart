import 'package:flutter/material.dart';

class CustomSingleCharTitle extends StatelessWidget {
  const CustomSingleCharTitle({super.key, required this.char});

  final String char;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.035,
      width: MediaQuery.sizeOf(context).width * 0.07,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(right: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.black,
      ),
      child: Text(
        char,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 26,
        ),
      ),
    );
  }
}
