import 'package:flutter/material.dart';

class CardGoodMorning extends StatelessWidget {
  const CardGoodMorning({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: const Icon(Icons.sunny, color: Color(0xff59981A)),
      onPressed: () {},
      label: const Text(
        "Good Morning",
        style: TextStyle(color: Color(0xff59981A)),
      ),
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
    );
  }
}
