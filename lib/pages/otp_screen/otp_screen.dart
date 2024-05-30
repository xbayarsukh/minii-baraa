import 'package:flutter/material.dart';
import 'package:miniibaraa/core/view_models/signup_screen/signup_screen_view_model.dart';
import 'package:miniibaraa/pages/signup_screen/set_password_screen.dart';
import 'package:miniibaraa/pages/widget/counter_widget.dart';
import 'package:miniibaraa/pages/widget/custom_app_bar.dart';
import 'package:miniibaraa/pages/widget/custom_elevated_button.dart';
import 'package:provider/provider.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:styled_widget/styled_widget.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> with TickerProviderStateMixin {
  AnimationController? controller;
  int levelClock = 180;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this,
        duration: Duration(
            seconds:
                levelClock) // gameData.levelClock is a user entered number elsewhere in the applciation
        );

    controller?.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SignupScreenViewModel>(builder: (context, model, __) {
      return Scaffold(
        appBar: CustomAppBar(
          title: "OTP нууц код",
        ),
        body: Column(
          children: [
            const Center(
                child: Text(
              "Таны гар утсанд ирсэн 4 оронтой тоог оруулна уу?",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            )).padding(horizontal: 50, vertical: 20),
            PinFieldAutoFill(
              currentCode: model.otpString,
              decoration: BoxLooseDecoration(
                hintText: "0000",
                gapSpace: 15,
                textStyle: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
                bgColorBuilder: PinListenColorBuilder(
                  model.selectedFruit == 3
                      ? const Color.fromARGB(255, 94, 156, 234)
                      : model.selectedFruit == 2
                          ? const Color.fromARGB(255, 158, 210, 106)
                          : const Color.fromARGB(255, 250, 108, 81),
                  const Color.fromARGB(255, 244, 246, 248),
                ),
                strokeColorBuilder: PinListenColorBuilder(
                  model.selectedFruit == 3
                      ? const Color.fromARGB(255, 94, 156, 234)
                      : model.selectedFruit == 2
                          ? const Color.fromARGB(255, 158, 210, 106)
                          : const Color.fromARGB(255, 250, 108, 81),
                  const Color.fromARGB(255, 244, 246, 248),
                ),
              ),
              onCodeSubmitted: (string) {
                model.setOtpString(string);
              },
              onCodeChanged: (string) {
                model.setOtpString(string);
              },
              codeLength: 4,
            ).padding(horizontal: 80, vertical: 10),
            Countdown(
              animation: StepTween(
                begin: levelClock, // THIS IS A USER ENTERED NUMBER
                end: 0,
              ).animate(
                controller!,
              ),
            ).padding(vertical: 10),
            CustomElevatedButton(
              color: const Color.fromARGB(255, 244, 246, 248),
              textColor: Colors.black,
              onPressed: () => {},
              buttonTitle: "Send again",
            ).padding(horizontal: 120)
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
                      builder: (context) => const SetPasswordScreen(),
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
