import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:miniibaraa/config/theme/app_theme.dart';
import 'package:miniibaraa/core/storage/get_storage.dart';
import 'package:styled_widget/styled_widget.dart';

class ContainerWidget extends StatelessWidget {
  final String text;
  final String? svgPath;
  final VoidCallback? onPressed;
  const ContainerWidget(
      {super.key, required this.text, this.svgPath, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final int userType = AppDatabase().getUserType();
    return GestureDetector(
      onTap: onPressed ?? () {},
      child: Container(
        height: 70,
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 244, 246, 248),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.all(8),
              child: svgPath == null
                  ? Icon(
                      Icons.wallet,
                      color: AppTheme.color(
                        userType,
                      ),
                    )
                  : SvgPicture.asset(
                      svgPath!,
                      colorFilter: ColorFilter.mode(
                        AppTheme.color(userType),
                        BlendMode.srcIn,
                      ),
                      height: 20,
                      width: 18,
                    ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ).padding(bottom: 5),
                const Text(
                  "Use your to make impact",
                  style: TextStyle(
                    fontSize: 13,
                    color: Color.fromARGB(255, 169, 176, 187),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
