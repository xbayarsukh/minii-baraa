import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:miniibaraa/config/theme/app_theme.dart';
import 'package:miniibaraa/pages/selllers/notification_screen/notification_screen.dart';
import 'package:miniibaraa/pages/selllers/home_screen/home_screen.dart';
import 'package:miniibaraa/pages/selllers/product_and_shop_screen/product_screen.dart';
import 'package:miniibaraa/pages/selllers/product_and_shop_screen/shop_screen.dart';

class BottomNavBarWidget extends StatelessWidget {
  final int? selectedIndex;
  final int? userType;
  const BottomNavBarWidget({
    super.key,
    required this.selectedIndex,
    required this.userType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: selectedIndex == 1
                ? null
                : () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  },
            child: SvgPicture.asset(
              "assets/icons/home.svg",
              colorFilter: ColorFilter.mode(
                selectedIndex == 1 ? AppTheme.color(userType) : Colors.grey,
                BlendMode.srcIn,
              ),
            ),
          ),
          InkWell(
            onTap: selectedIndex == 2
                ? null
                : () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => userType == 2
                            ? const ShopScreen()
                            : const ProductScreen(),
                      ),
                    );
                  },
            child: SvgPicture.asset(
              "assets/icons/product.svg",
              colorFilter: ColorFilter.mode(
                selectedIndex == 2 ? AppTheme.color(userType) : Colors.grey,
                BlendMode.srcIn,
              ),
            ),
          ),
          InkWell(
            onTap: selectedIndex == 3
                ? null
                : () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NotificationScreen(),
                      ),
                    );
                  },
            child: SvgPicture.asset(
              "assets/icons/notification.svg",
              colorFilter: ColorFilter.mode(
                selectedIndex == 3 ? AppTheme.color(userType) : Colors.grey,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
