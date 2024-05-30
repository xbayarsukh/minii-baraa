import 'package:flutter/material.dart';
import 'package:miniibaraa/config/theme/app_theme.dart';
import 'package:miniibaraa/core/storage/get_storage.dart';

class CustomElevatedButton extends StatelessWidget {
  final String buttonTitle;
  final VoidCallback? onPressed;
  final GlobalKey<FormState>? formKey;
  final bool? isLoading;
  final Widget? icon;
  final Color? color;
  final Color? textColor;

  const CustomElevatedButton({
    Key? key,
    this.onPressed,
    this.formKey,
    required this.buttonTitle,
    this.isLoading,
    this.icon,
    this.color,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isLoading != null) {
      return isLoading!
          ? const Center(child: CircularProgressIndicator())
          : ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 1,
                backgroundColor:
                    color ?? AppTheme.color(AppDatabase().getUserType()),
                shape: const RoundedRectangleBorder(),
              ),
              onPressed: onPressed,
              child: Container(
                padding: const EdgeInsets.all(10.0),
                height: 50,
                child: Center(
                    child: Text(
                  buttonTitle,
                  style: TextStyle(color: textColor),
                )),
              ),
            );
    } else {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 1,
          backgroundColor: color ?? AppTheme.color(AppDatabase().getUserType()),
          shape: const RoundedRectangleBorder(),
        ),
        onPressed: onPressed,
        child: Container(
          padding: const EdgeInsets.all(10.0),
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                buttonTitle,
                style: TextStyle(color: textColor),
              ),
              SizedBox(
                child: icon,
              ),
            ],
          ),
        ),
      );
    }
  }
}
