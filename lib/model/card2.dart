import 'package:flutter/material.dart';

class Card2 extends StatelessWidget {
  const Card2({
    super.key,
    required this.textnya,
    required this.imageee,
  });

  final String textnya;
  final String imageee;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(imageee), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(20)),
      child: Text(
        textnya,
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
