import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:miniibaraa/config/theme/app_theme.dart';
import 'package:miniibaraa/core/storage/get_storage.dart';
import 'package:miniibaraa/pages/selllers/profile_screen/my_info.dart';
import 'package:miniibaraa/pages/selllers/profile_screen/my_shop.dart';
import 'package:miniibaraa/pages/selllers/profile_screen/order_screen.dart';
import 'package:miniibaraa/pages/selllers/profile_screen/returns_screen.dart';
import 'package:miniibaraa/pages/selllers/profile_screen/sales_screen.dart';
import 'package:miniibaraa/pages/selllers/profile_screen/sellers_screen.dart';
import 'package:miniibaraa/pages/signin_screen/signin_screen.dart';
import 'package:miniibaraa/pages/widget/container_widget.dart';
import 'package:miniibaraa/pages/widget/custom_app_bar.dart';
import 'package:styled_widget/styled_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final int userType = AppDatabase().getUserType();
    return Scaffold(
      appBar: CustomAppBar(
        title: "Профайл",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 140,
              margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Column(
                children: [
                  Container(
                    height: 70,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 244, 246, 248)),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage(
                            "assets/img/avatar.png",
                          ),
                          backgroundColor: Colors.transparent,
                        ).padding(right: 10),
                        const Text(
                          "Уянга Төр",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 70,
                    decoration: const BoxDecoration(color: Colors.white),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 244, 246, 248),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.only(right: 10),
                          child: SvgPicture.asset(
                            "assets/icons/wallet.svg",
                            colorFilter: ColorFilter.mode(
                                AppTheme.color(userType), BlendMode.srcIn),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Миний данс",
                              style: TextStyle(
                                fontSize: 13,
                                color: Color.fromARGB(255, 169, 176, 187),
                              ),
                            ).padding(bottom: 5),
                            const Text(
                              "550,000.00",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ContainerWidget(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyInfo(),
                  ),
                );
              },
              text: "Миний мэдээлэл",
              svgPath: "assets/icons/circle_user.svg",
            ),
            ContainerWidget(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyShop(),
                  ),
                );
              },
              text: userType == 2 ? "Миний танилцуулга" : "Миний дэлгүүр",
              svgPath: "assets/icons/shop.svg",
            ),
            ContainerWidget(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OrderScreen(),
                  ),
                );
              },
              text: "Захиалга",
              svgPath: "assets/icons/box.svg",
            ),
            ContainerWidget(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SalesScreen(),
                  ),
                );
              },
              text: "Борлуулалт",
              svgPath: "assets/icons/sack.svg",
            ),
            ContainerWidget(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ReturnsScreen(),
                  ),
                );
              },
              text: "Буцаалт",
              svgPath: "assets/icons/refresh.svg",
            ),
            userType == 2
                ? const SizedBox()
                : ContainerWidget(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SellersScreen(),
                        ),
                      );
                    },
                    text: "Борлуулагчид",
                    svgPath: "assets/icons/users.svg",
                  ),
            const Divider(
              height: 35,
              thickness: 1,
            ).padding(horizontal: 25),
            ContainerWidget(
              onPressed: () {
                AppDatabase().deleteUserType();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
              text: "Гарах",
              svgPath: "assets/icons/logout.svg",
            ),
          ],
        ),
      ),
    );
  }
}
