import 'package:flutter/material.dart';
import 'package:miniibaraa/core/view_models/signup_screen/signup_screen_view_model.dart';
import 'package:miniibaraa/pages/widget/custom_elevated_button.dart';
import 'package:miniibaraa/pages/widget/intro_page.dart';
import 'package:provider/provider.dart';
import 'package:styled_widget/styled_widget.dart';

class SuccessfullRegister extends StatelessWidget {
  const SuccessfullRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SignupScreenViewModel>(builder: (context, model, __) {
      return Scaffold(
        body: const Column(
          children: [
            SizedBox(
              height: 200,
            ),
            IntroPage(
              imageAsset: "assets/img/complete.png",
              title: "Хүссэн үедээ",
              description:
                  "Use your resources to make impact in your community.",
            ),
          ],
        ),
        bottomNavigationBar: CustomElevatedButton(
          color: model.selectedFruit == 3
              ? const Color.fromARGB(255, 94, 156, 234)
              : model.selectedFruit == 2
                  ? const Color.fromARGB(255, 158, 210, 106)
                  : const Color.fromARGB(255, 250, 108, 81),
          onPressed: model.otpString.isNotEmpty
              ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SuccessfullRegister(),
                    ),
                  );
                }
              : null,
          buttonTitle: "Цааш нэвтрэх",
          textColor: Colors.white,
        ).padding(horizontal: 30, vertical: 30),
      );
    });
  }
}
