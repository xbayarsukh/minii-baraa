import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniibaraa/config/theme/app_theme.dart';
import 'package:miniibaraa/core/storage/get_storage.dart';
import 'package:miniibaraa/core/view_models/sellers/product_and_shop_screen/add_product_screen_view_model.dart';
import 'package:miniibaraa/pages/widget/custom_app_bar.dart';
import 'package:miniibaraa/pages/widget/custom_elevated_button.dart';
import 'package:miniibaraa/pages/widget/custom_global_textfield.dart';
import 'package:provider/provider.dart';
import 'package:styled_widget/styled_widget.dart';

class AddProductScreen extends StatelessWidget {
  final Map<String, dynamic>? product;
  const AddProductScreen({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    final int userType = AppDatabase().getUserType();
    return Consumer<AddProductScreenViewModel>(builder: (context, model, __) {
      return Scaffold(
        appBar: CustomAppBar(title: "Бараа нэмэх"),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomGlobalTextField(
                hintText: "Нэр",
                controller: model.nameController,
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 244, 246, 248),
                  borderRadius: BorderRadius.circular(8),
                ),
                margin:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      model.category,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: model.category == "Ангилал"
                            ? const Color.fromARGB(255, 169, 176, 187)
                            : Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    const Icon(
                      Icons.arrow_drop_down_circle_outlined,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 244, 246, 248),
                  borderRadius: BorderRadius.circular(8),
                ),
                margin:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      model.subCategory,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: model.subCategory == "Дэд ангилал"
                            ? const Color.fromARGB(255, 169, 176, 187)
                            : Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    const Icon(
                      Icons.arrow_drop_down_circle_outlined,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
              const Divider(
                height: 30,
                thickness: 2,
                color: Color.fromARGB(255, 244, 246, 248),
              ).padding(horizontal: 25),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 244, 246, 248),
                  borderRadius: BorderRadius.circular(8),
                ),
                margin:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      model.status,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: model.status == "Барааны төлөв"
                            ? const Color.fromARGB(255, 169, 176, 187)
                            : Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    const Icon(
                      Icons.arrow_drop_down_circle_outlined,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
              CustomGlobalTextField(
                hintText: "Үлдэгдэл",
                controller: model.countController,
              ),
              CustomGlobalTextField(
                hintText: "Үнэ",
                controller: model.priceController,
              ),
              const Divider(
                height: 30,
                thickness: 2,
                color: Color.fromARGB(255, 244, 246, 248),
              ).padding(horizontal: 25),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Wrap(
                  spacing: 8.0, // Adjust the spacing between tokens
                  runSpacing: 8.0, // Adjust the spacing between token rows
                  children: model.sizer.map((token) {
                    return Container(
                      padding: const EdgeInsets.all(
                          8.0), // Adjust the padding around each token
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color.fromARGB(255, 244, 246, 248)),
                      child: Text(token),
                    );
                  }).toList(),
                ),
              ),
              CustomGlobalTextField(
                hintText: "Хэмжээ",
                controller: model.sizeController,
                onChanged: (String value) {
                  model.handleTextChanges(false, value);
                },
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Wrap(
                  spacing: 8.0, // Adjust the spacing between tokens
                  runSpacing: 8.0, // Adjust the spacing between token rows
                  children: model.colors.map((token) {
                    return Container(
                      padding: const EdgeInsets.all(
                          8.0), // Adjust the padding around each token
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color.fromARGB(255, 244, 246, 248)),
                      child: Text(token),
                    );
                  }).toList(),
                ),
              ),
              CustomGlobalTextField(
                hintText: "Өнгө",
                controller: model.colorController,
                onChanged: (String value) {
                  model.handleTextChanges(true, value);
                },
              ),
              const Divider(
                height: 30,
                thickness: 2,
                color: Color.fromARGB(255, 244, 246, 248),
              ).padding(horizontal: 25),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color.fromARGB(255, 244, 246, 248),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: TextField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Барааны тухай",
                    hintStyle: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 169, 176, 187),
                    ),
                  ),
                  controller: model.descriptionController,
                  minLines: 14,
                  maxLines: 18,
                  style: const TextStyle(fontSize: 15),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 244, 246, 248),
                  borderRadius: BorderRadius.circular(5),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 34,
                      child: Center(
                        child: Text("Зураг оруулах"),
                      ),
                    ),
                    const Divider(
                      thickness: 2,
                      color: Color.fromARGB(50, 202, 208, 215),
                    ),
                    model.imagePath == null
                        ? GestureDetector(
                            onTap: () {
                              model.pickImage();
                            },
                            child: SizedBox(
                              height: 135,
                              child: Center(
                                child: Icon(
                                  CupertinoIcons.camera,
                                  color: AppTheme.color(userType),
                                ),
                              ),
                            ),
                          )
                        : Image.asset(model.imagePath!)
                  ],
                ),
              ),
              CustomElevatedButton(
                onPressed: product == null ? () {} : () {},
                textColor: Colors.white,
                buttonTitle: "Бараа нэмэх",
              ).padding(horizontal: 25, vertical: 30)
            ],
          ),
        ),
      );
    });
  }
}
