import 'package:flutter/material.dart';
import 'package:miniibaraa/pages/signin_screen/signin_screen.dart';
import 'package:miniibaraa/pages/widget/custom_elevated_button.dart';
import 'package:miniibaraa/pages/widget/intro_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: const [
                // Add your intro screen pages here
                IntroPage(
                  imageAsset: "assets/img/intro_1.png",
                  title: "Хүссэн үедээ",
                  description:
                      "Use your resources to make impact in your community.",
                ),
                IntroPage(
                  imageAsset: "assets/img/intro_2.png",
                  title: "Хэрэглэгч төвтэй",
                  description:
                      "Use your resources to make impact in your community.",
                ),
                IntroPage(
                  imageAsset: "assets/img/intro_3.png",
                  title: "Хаанаас ч бүгдийг",
                  description:
                      "Use your resources to make impact in your community.",
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < 3; i++)
                _buildPageIndicator(i == _currentPage),
            ],
          ),
          const SizedBox(height: 20.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 45, vertical: 7.5),
                child: CustomElevatedButton(
                    color: const Color.fromARGB(255, 255, 192, 0),
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    buttonTitle: "Нэвтрэх"),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 45, vertical: 7.5),
                child: CustomElevatedButton(
                    color: const Color.fromARGB(255, 244, 246, 248),
                    textColor: Colors.black,
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    buttonTitle: "Алгасах"),
              ),
            ],
          ),
          const SizedBox(height: 30.0),
        ],
      ),
    );
  }

  Widget _buildPageIndicator(bool isActive) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      height: 16.0,
      width: 8.0,
      decoration: BoxDecoration(
        color: isActive
            ? const Color.fromARGB(255, 255, 192, 0)
            : const Color.fromARGB(255, 244, 246, 248),
        borderRadius: BorderRadius.circular(4.0),
      ),
    );
  }
}
