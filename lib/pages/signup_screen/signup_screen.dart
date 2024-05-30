import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniibaraa/core/view_models/signup_screen/signup_screen_view_model.dart';
import 'package:miniibaraa/pages/otp_screen/otp_screen.dart';
import 'package:miniibaraa/pages/widget/custom_app_bar.dart';
import 'package:miniibaraa/pages/widget/custom_elevated_button.dart';
import 'package:miniibaraa/pages/widget/custom_textfield_widget.dart';
import 'package:provider/provider.dart';
import 'package:styled_widget/styled_widget.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SignupScreenViewModel>(builder: (context, model, __) {
      return Scaffold(
        appBar: CustomAppBar(
          title: "Бүртгүүлэх",
        ),
        body: Column(
          children: [
            const Center(
                child: Text(
              "Та өөрийн хувийн мэдээллээ бөглөнө үү?",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            )).padding(horizontal: 80, vertical: 20),
            GestureDetector(
              onTap: () => _showDialog(
                  CupertinoPicker(
                    magnification: 1.22,
                    squeeze: 2,
                    useMagnifier: true,
                    itemExtent: model.kItemExtent,
                    // This sets the initial item.
                    scrollController: FixedExtentScrollController(
                      initialItem: model.selectedFruit,
                    ),
                    // This is called when selected item is changed.
                    onSelectedItemChanged: (int selectedItem) {
                      model.setDropdownString(selectedItem);
                    },
                    children: List<Widget>.generate(model.fruitNames.length,
                        (int index) {
                      return Center(child: Text(model.fruitNames[index]));
                    }),
                  ),
                  context),
              child: Container(
                height: 50,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(41, 158, 158, 158),
                ),
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        model.dropdownController.text.isEmpty
                            ? "Хэрэглэгч"
                            : model.dropdownController.text,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      const Icon(
                        Icons.arrow_drop_down_circle_outlined,
                        color: Colors.grey,
                      )
                    ]),
              ),
            ),
            CustomTextFormField(
              hintText: "Нэр",
              color: model.selectedFruit == 3
                  ? const Color.fromARGB(255, 94, 156, 234)
                  : model.selectedFruit == 2
                      ? const Color.fromARGB(255, 158, 210, 106)
                      : const Color.fromARGB(255, 250, 108, 81),
              controller: model.nameController,
              onChanged: (value) {
                model.setNameControllerToString(value);
              },
            ).padding(horizontal: 30, vertical: 10),
            CustomTextFormField(
              hintText: "Нэвтрэх нэр",
              color: model.selectedFruit == 3
                  ? const Color.fromARGB(255, 94, 156, 234)
                  : model.selectedFruit == 2
                      ? const Color.fromARGB(255, 158, 210, 106)
                      : const Color.fromARGB(255, 250, 108, 81),
              controller: model.usernameController,
              onChanged: (value) {
                model.setUsernameControllerToString(value);
              },
            ).padding(horizontal: 30, vertical: 10),
            CustomTextFormField(
              hintText: "Утасны дугаар",
              color: model.selectedFruit == 3
                  ? const Color.fromARGB(255, 94, 156, 234)
                  : model.selectedFruit == 2
                      ? const Color.fromARGB(255, 158, 210, 106)
                      : const Color.fromARGB(255, 250, 108, 81),
              controller: model.phoneController,
              onChanged: (value) {
                model.setPhoneControllerToString(value);
              },
            ).padding(horizontal: 30, vertical: 10),
          ],
        ),
        bottomNavigationBar: CustomElevatedButton(
          color: model.selectedFruit == 3
              ? const Color.fromARGB(255, 94, 156, 234)
              : model.selectedFruit == 2
                  ? const Color.fromARGB(255, 158, 210, 106)
                  : const Color.fromARGB(255, 250, 108, 81),
          onPressed: model.nameController.text.isNotEmpty &&
                  model.usernameController.text.isNotEmpty &&
                  model.phoneController.text.isNotEmpty
              ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OtpScreen(),
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

  void _showDialog(Widget child, context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => StatefulBuilder(
        builder: (context, setState) => Container(
          height: 216,
          padding: const EdgeInsets.only(top: 6.0),
          // The Bottom margin is provided to align the popup above the system navigation bar.
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          // Provide a background color for the popup.
          color: CupertinoColors.systemBackground.resolveFrom(context),
          // Use a SafeArea widget to avoid system overlaps.
          child: SafeArea(
            top: false,
            child: Column(
              children: [
                SizedBox(height: 100, child: child),
                CustomElevatedButton(
                  color: const Color.fromARGB(255, 250, 108, 81),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  buttonTitle: "Сонгох",
                  textColor: Colors.white,
                ).padding(horizontal: 30, vertical: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
