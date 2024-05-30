import 'package:flutter/material.dart';
import 'package:miniibaraa/core/view_models/signup_screen/signup_screen_view_model.dart';
import 'package:miniibaraa/pages/signup_screen/successfull_register.dart';
import 'package:miniibaraa/pages/widget/custom_app_bar.dart';
import 'package:miniibaraa/pages/widget/custom_elevated_button.dart';
import 'package:miniibaraa/pages/widget/custom_textfield_widget.dart';
import 'package:provider/provider.dart';
import 'package:styled_widget/styled_widget.dart';

class SetPasswordScreen extends StatelessWidget {
  const SetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SignupScreenViewModel>(builder: (context, model, __) {
      return Scaffold(
        appBar: CustomAppBar(
          title: "Нууц үг үүсгэх",
        ),
        body: Column(
          children: [
            const Center(
                child: Text(
              "Та цааш нэвтэрч орох нууц үгээ үүсгэнэ үү.",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            )).padding(horizontal: 80, vertical: 20),
            CustomTextFormField(
              hintText: "Нууц үг",
              color: Colors.black,
              obscureText: true,
              controller: model.passwordController,
              onChanged: (value) {
                model.setPasswordControllerToString(value);
              },
            ).padding(horizontal: 30, vertical: 10),
            CustomTextFormField(
              hintText: "Нууц үг давтах",
              color: !model.isconfirmPassword
                  ? const Color.fromARGB(255, 250, 108, 81)
                  : Colors.black,
              obscureText: model.isHidePassword,
              suffixPressed: () {
                model.toggleHidePassword();
              },
              onChanged: (value) {
                model.checkPassword(value);
              },
              controller: model.passwordconfirmController,
            ).padding(horizontal: 30, vertical: 10),
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
          buttonTitle: "Дараагийн алхам",
          textColor: Colors.white,
        ).padding(horizontal: 30, vertical: 30),
      );
    });
  }
}
