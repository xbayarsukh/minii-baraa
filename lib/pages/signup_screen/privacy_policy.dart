import 'package:flutter/material.dart';
import 'package:miniibaraa/pages/signup_screen/signup_screen.dart';
import 'package:miniibaraa/pages/widget/custom_app_bar.dart';
import 'package:miniibaraa/pages/widget/custom_elevated_button.dart';
import 'package:styled_widget/styled_widget.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Бүртгүүлэх",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Center(
                child: Text(
              "Үйлчилгээний нөхцөлтэй танилцана уу?",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            )).padding(horizontal: 80, vertical: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 244, 246, 248),
              ),
              child: Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: const ExpansionTile(
                  title: Text("Нийтлэг үндэс"),
                  children: [Divider(), Text("data")],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 244, 246, 248),
              ),
              child: Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: const ExpansionTile(
                  title: Text("Хэрэглэгчийн зөвшөөрөл"),
                  children: [Divider(), Text("data")],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 244, 246, 248),
              ),
              child: Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: const ExpansionTile(
                  title: Text("Мэдээлэл ашиглах нөхцөл"),
                  children: [Divider(), Text("data")],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 244, 246, 248),
              ),
              child: Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: const ExpansionTile(
                  title: Text("Хэрэглэгчийн эрх үүрэг"),
                  children: [Divider(), Text("data")],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 244, 246, 248),
              ),
              child: Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: const ExpansionTile(
                  title: Text("Бусад нөхцөл"),
                  children: [Divider(), Text("data")],
                ),
              ),
            ),
            InkWell(
              onTap: () => Navigator.pushNamed(context, '/signup'),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(
                    value: true,
                    checkColor: Colors.white,
                    activeColor: Colors.blue,
                    onChanged: (bool? val) {},
                  ),
                  const Text(
                    "Би зөвшөөрч байна",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomElevatedButton(
        color: const Color.fromARGB(255, 250, 108, 81),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SignupScreen(),
            ),
          );
        },
        buttonTitle: "Дараагийн алхам",
        textColor: Colors.white,
      ).padding(horizontal: 30, vertical: 30),
    );
  }
}
