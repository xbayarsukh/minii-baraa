import 'package:flutter/material.dart';
import 'package:miniibaraa/config/theme/app_theme.dart';
import 'package:miniibaraa/core/storage/get_storage.dart';
import 'package:miniibaraa/core/view_models/profile_screen/my_shop_view_model.dart';
import 'package:miniibaraa/pages/widget/custom_app_bar.dart';
import 'package:miniibaraa/pages/widget/custom_elevated_button.dart';
import 'package:miniibaraa/pages/widget/custom_global_textfield.dart';
import 'package:provider/provider.dart';
import 'package:styled_widget/styled_widget.dart';

class MyShop extends StatelessWidget {
  const MyShop({super.key});

  @override
  Widget build(BuildContext context) {
    final int userType = AppDatabase().getUserType();
    return Consumer<MyShopViewModel>(builder: (context, model, __) {
      return Scaffold(
        appBar: CustomAppBar(
          title: "Миний дэлгүүр",
        ),
        body: Column(
          children: [
            const CustomGlobalTextField(hintText: "Товч мэдээлэл")
                .padding(top: 15),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color.fromARGB(255, 244, 246, 248),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: const TextField(
                minLines: 10,
                maxLines: 14,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Дэлгэрэнгүй мэдээлэл",
                  hintStyle: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 169, 176, 187),
                  ),
                ),
                style: TextStyle(fontSize: 15),
              ),
            ),
          ],
        ),
        bottomNavigationBar: CustomElevatedButton(
                onPressed: () {},
                color: AppTheme.color(userType),
                buttonTitle: "Хадгалах")
            .padding(
          horizontal: 25,
          vertical: 30,
        ),
      );
    });
  }
}
