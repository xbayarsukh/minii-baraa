import 'package:flutter/material.dart';

class CustomGlobalTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  const CustomGlobalTextField(
      {super.key, required this.hintText, this.controller, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color.fromARGB(255, 244, 246, 248),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: TextField(
        onChanged: onChanged,
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 15,
            color: Color.fromARGB(255, 169, 176, 187),
          ),
        ),
        style: const TextStyle(fontSize: 15),
      ),
    );
  }
}
