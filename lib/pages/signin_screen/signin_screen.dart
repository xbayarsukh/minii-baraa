import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniibaraa/core/storage/get_storage.dart';
import 'package:miniibaraa/core/view_models/signin_screen/signin_screen_view_model.dart';
import 'package:miniibaraa/pages/selllers/home_screen/home_screen.dart';
import 'package:miniibaraa/pages/signup_screen/privacy_policy.dart';
import 'package:miniibaraa/pages/widget/custom_elevated_button.dart';
import 'package:miniibaraa/pages/widget/custom_textfield_widget.dart';
import 'package:provider/provider.dart';
import 'package:styled_widget/styled_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Consumer<SigninScreenViewModel>(
            builder: (context, model, __) => Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                    child: Container(
                      width: 100,
                      height: 100,
                      margin: const EdgeInsets.only(top: 95, bottom: 45),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        image: const DecorationImage(
                          image: AssetImage("assets/logo/logo.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: TabBar(
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.black,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                        color: Color.fromARGB(255, 244, 246, 248),
                        border: Border(
                          bottom: BorderSide(
                            color: Color.fromARGB(255, 254, 192, 0),
                          ),
                        ),
                      ),
                      tabs: [
                        Tab(
                          text: "Хэрэглэгч",
                        ),
                        Tab(
                          text: "Үйлдвэрлэгч",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 350,
                    child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        Column(
                          children: [
                            CustomTextFormField(
                              hintText: "Хэрэглэгчийн нэр",
                              type: "username",
                              controller: model.usernameController,
                            ).padding(horizontal: 30, vertical: 10),
                            CustomTextFormField(
                              hintText: "Нууц үг",
                              type: "password",
                              controller: model.passwordController,
                              obscureText: true,
                            ).padding(horizontal: 30, vertical: 10),
                            CustomElevatedButton(
                              color: const Color.fromARGB(255, 254, 192, 0),
                              onPressed: () {
                                AppDatabase().saveUserType(0);
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomeScreen(),
                                  ),
                                );
                              },
                              buttonTitle: "Нэвтрэх",
                              textColor: Colors.white,
                            ).padding(horizontal: 30, vertical: 10),
                            InkWell(
                              onTap: () =>
                                  Navigator.pushNamed(context, '/signup'),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Нууц үгээ мартсан уу?",
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "Сэргээх",
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
                        Column(
                          children: [
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
                                    children: List<Widget>.generate(
                                        model.fruitNames.length, (int index) {
                                      return Center(
                                          child: Text(model.fruitNames[index]));
                                    }),
                                  ),
                                  context),
                              child: Container(
                                height: 50,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(41, 158, 158, 158),
                                ),
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 10),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 10),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        model.dropdownController.text.isEmpty
                                            ? "Үйлдвэрлэгч"
                                            : model.dropdownController.text,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                      const Icon(
                                        Icons.arrow_drop_down_circle_outlined,
                                        color: Colors.grey,
                                      )
                                    ]),
                              ),
                            ),
                            CustomTextFormField(
                              hintText: "Хэрэглэгчийн нэр",
                              color: model.selectedFruit == 0
                                  ? const Color.fromARGB(255, 250, 108, 81)
                                  : model.selectedFruit == 1
                                      ? const Color.fromARGB(255, 158, 210, 106)
                                      : const Color.fromARGB(255, 94, 156, 234),
                              type: "username",
                              controller: model.usernameController,
                            ).padding(horizontal: 30, vertical: 10),
                            CustomTextFormField(
                              hintText: "Нууц үг",
                              color: model.selectedFruit == 0
                                  ? const Color.fromARGB(255, 250, 108, 81)
                                  : model.selectedFruit == 1
                                      ? const Color.fromARGB(255, 158, 210, 106)
                                      : const Color.fromARGB(255, 94, 156, 234),
                              type: "password",
                              obscureText: true,
                              controller: model.passwordController,
                            ).padding(horizontal: 30, vertical: 10),
                            CustomElevatedButton(
                              color: model.selectedFruit == 0
                                  ? const Color.fromARGB(255, 250, 108, 81)
                                  : model.selectedFruit == 1
                                      ? const Color.fromARGB(255, 158, 210, 106)
                                      : const Color.fromARGB(255, 94, 156, 234),
                              onPressed: () {
                                AppDatabase()
                                    .saveUserType(model.selectedFruit + 1);
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomeScreen(),
                                  ),
                                );
                              },
                              buttonTitle: "Нэвтрэх",
                              textColor: Colors.white,
                            ).padding(horizontal: 30, vertical: 10),
                            InkWell(
                              onTap: () =>
                                  Navigator.pushNamed(context, '/signup'),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Нууц үгээ мартсан уу?",
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "Сэргээх",
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
                      ],
                    ),
                  ),
                  CustomElevatedButton(
                    onPressed: () {},
                    color: Colors.black,
                    textColor: Colors.white,
                    buttonTitle: "Зочиноор нэвтрэх",
                  ).padding(horizontal: 30, vertical: 10),
                  CustomElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PrivacyPolicy()));
                    },
                    color: Colors.white,
                    textColor: Colors.black,
                    buttonTitle: "Бүртгэл үүсгэх",
                  ).padding(horizontal: 30).padding(bottom: 30),
                ],
              ),
            ),
          ),
        ),
        
      ),
    );
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
