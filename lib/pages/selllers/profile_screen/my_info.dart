import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:miniibaraa/config/theme/app_theme.dart';
import 'package:miniibaraa/core/storage/get_storage.dart';
import 'package:miniibaraa/core/view_models/profile_screen/my_info_view_model.dart';
import 'package:miniibaraa/pages/widget/custom_app_bar.dart';
import 'package:miniibaraa/pages/widget/custom_elevated_button.dart';
import 'package:miniibaraa/pages/widget/custom_global_textfield.dart';
import 'package:provider/provider.dart';
import 'package:styled_widget/styled_widget.dart';

class MyInfo extends StatelessWidget {
  const MyInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final int userType = AppDatabase().getUserType();
    return Consumer<MyInfoViewModel>(builder: (context, model, __) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          title: "Хэрэглэгч",
        ),
        body: Column(
          children: [
            CustomGlobalTextField(
              hintText: userType == 2 ? "Нэр" : "Байгууллагын нэр",
            ),
            CustomGlobalTextField(
              hintText: userType == 2 ? "Хаяг" : "Үйл ажилгааны чиглэл",
            ),
            const CustomGlobalTextField(
              hintText: "Нэвтрэх нэр",
            ),
            const CustomGlobalTextField(
              hintText: "Утасны дугаар",
            ),
            const Divider(
              height: 30,
              thickness: 1,
            ).padding(horizontal: 25),
            GestureDetector(
              onTap: () {
                model.showDialog(
                    CupertinoPicker(
                      magnification: 1.22,
                      squeeze: 2,
                      useMagnifier: true,
                      itemExtent: 32.0,
                      // This sets the initial item.
                      scrollController: FixedExtentScrollController(
                        initialItem: model.selectedBank,
                      ),
                      // This is called when selected item is changed.
                      onSelectedItemChanged: (int selectedItem) {
                        model.setDropdownString(selectedItem);
                      },
                      children: List<Widget>.generate(model.bank_lists.length,
                          (int index) {
                        return Center(child: Text(model.bank_lists[index]));
                      }),
                    ),
                    context);
              },
              child: Container(
                height: 50,
                margin:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color.fromARGB(255, 244, 246, 248),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/bank.svg",
                      colorFilter: ColorFilter.mode(
                          AppTheme.color(userType), BlendMode.srcIn),
                    ).padding(right: 15),
                    Text(model.dropdownText),
                    const Spacer(),
                    const Icon(
                      Icons.arrow_drop_down_circle,
                      color: Color.fromARGB(255, 203, 209, 216),
                    ),
                  ],
                ),
              ),
            ),
            const CustomGlobalTextField(
              hintText: "Дансны нэр",
            ),
            const CustomGlobalTextField(
              hintText: "Дансны дугаар",
            ),
          ],
        ),
        bottomNavigationBar: CustomElevatedButton(
          color: AppTheme.color(userType),
          onPressed: () {},
          buttonTitle: "Хадгалах",
        ).padding(horizontal: 25, vertical: 35),
      );
    });
  }
}
