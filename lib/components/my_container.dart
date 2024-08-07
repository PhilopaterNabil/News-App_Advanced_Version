import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  final String text;
  const MyContainer({super.key , required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 30,
      child:  Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
