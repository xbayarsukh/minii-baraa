import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class IntroPage extends StatelessWidget {
  final String title;
  final String description;
  final String imageAsset;

  const IntroPage({
    super.key,
    required this.title,
    required this.description,
    required this.imageAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imageAsset).padding(bottom: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20.0),
          Text(
            description,
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
