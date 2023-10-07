import 'package:flutter/material.dart';

class HumidityCard extends StatelessWidget {
  final title;
  final value;
  const HumidityCard(this.title, this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 12.0, bottom: 19, top: 15, right: 12),
      child: Column(
        children: [
          Text(
            "$title",
            style: const TextStyle(color: Color(0xff59981A), fontSize: 10),
          ),
          Text(
            "$value",
            style: const TextStyle(color: Color(0xffD8E84D), fontSize: 10),
          ),
        ],
      ),
    );
  }
}
