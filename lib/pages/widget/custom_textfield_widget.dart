import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final String? type;
  final Color? color;
  final bool? obscureText;
  final VoidCallback? suffixPressed;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String?>? onSaved;

  const CustomTextFormField(
      {Key? key,
      required this.hintText,
      this.obscureText,
      this.type,
      this.color,
      this.onSaved,
      this.suffixPressed,
      this.onChanged,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Color.fromARGB(41, 158, 158, 158)),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
      child: TextFormField(
        onChanged: onChanged,
        onSaved: onSaved,
        controller: controller,
        obscureText: obscureText ?? false,
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.next,
        obscuringCharacter: '●',
        style: TextStyle(color: color ?? color),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIconColor: color ?? color,
          border: InputBorder.none,
          suffix: suffixPressed == null
              ? null
              : IconButton(
                  onPressed: suffixPressed ?? () {},
                  icon: Icon(!obscureText!
                      ? CupertinoIcons.eye_fill
                      : CupertinoIcons.eye_slash),
                ),
          prefixIcon: type == null
              ? null
              : type == "username"
                  ? const Icon(CupertinoIcons.person)
                  : const Icon(CupertinoIcons.lock),
        ),
      ),
    );
  }
}
