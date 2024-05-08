import 'package:flutter/material.dart';

class ReUseAbleBtn extends StatelessWidget {
  final String btnTitle;
  const ReUseAbleBtn({super.key, required this.btnTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          btnTitle,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
