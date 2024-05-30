import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniibaraa/config/theme/app_theme.dart';
import 'package:miniibaraa/core/storage/get_storage.dart';
import 'package:miniibaraa/core/utils/util.dart';
import 'package:miniibaraa/core/view_models/sellers/product_and_shop_screen/add_product_screen_view_model.dart';
import 'package:miniibaraa/core/view_models/sellers/product_and_shop_screen/product_screen_view_model.dart';
import 'package:miniibaraa/pages/selllers/product_and_shop_screen/add_product_screen.dart';
import 'package:miniibaraa/pages/widget/bottom_navbar_widget.dart';
import 'package:miniibaraa/pages/widget/custom_elevated_button.dart';
import 'package:miniibaraa/pages/widget/user_app_bar_widget.dart';
import 'package:provider/provider.dart';
import 'package:styled_widget/styled_widget.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final int userType = AppDatabase().getUserType();
    return Scaffold(
      appBar: const UserAppBarWidget(),
      body: Consumer<ProductScreenViewModel>(builder: (context, model, __) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width - 105,
                    margin: const EdgeInsets.only(right: 15),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(
                      child: TextField(
                        maxLines: 1,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search Product",
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: const Icon(
                        Icons.filter_alt,
                        size: 25,
                        color: Colors.grey,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 45,
                child: ListView.builder(
                  itemCount: model.filterLists.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final filter = model.filterLists[index];
                    return GestureDetector(
                      onTap: () {
                        model.setFilterList(filter["name"], index);
                      },
                      child: Container(
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        margin: EdgeInsets.only(
                            right: model.filterLists.length == filter["id"]
                                ? 0
                                : 10),
                        decoration: BoxDecoration(
                          color: model.selectedFilter == index
                              ? AppTheme.color(userType)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            filter["name"],
                            style: TextStyle(
                              color: model.selectedFilter == index
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ).padding(top: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width - 40,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddProductScreen(),
                      ),
                    );
                  },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Шинэ бараа нэмэх",
                        style: TextStyle(color: Colors.black),
                      ),
                      Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          CupertinoIcons.plus,
                          size: 16,
                        ),
                      ),
                    ],
                  ).padding(vertical: 12),
                ),
              ).padding(top: 10),
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: model.productLists.length,
                itemBuilder: (context, index) {
                  final product = model.productLists[index];
                  return Container(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.only(top: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              margin: const EdgeInsets.only(right: 15),
                              child: Image.asset(
                                product["image"],
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width -
                                  80 -
                                  90 -
                                  15 -
                                  58,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product["name"],
                                    maxLines: 2,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        product["category"],
                                        maxLines: 2,
                                        style:
                                            const TextStyle(color: Colors.grey),
                                      ),
                                      const Text(
                                        "•",
                                        maxLines: 2,
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      Text(
                                        product["subcategory"],
                                        maxLines: 2,
                                        style:
                                            const TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ).padding(top: 5, bottom: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Төлөв",
                                        maxLines: 2,
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15,
                                        ),
                                      ),
                                      Text(
                                        product["type"],
                                        maxLines: 2,
                                        style: const TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Зарах эсэх",
                                        maxLines: 2,
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15,
                                        ),
                                      ),
                                      Text(
                                        product["status"],
                                        maxLines: 2,
                                        style: const TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Тоо ширхэг",
                                        maxLines: 2,
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15,
                                        ),
                                      ),
                                      Text(
                                        product["count"],
                                        maxLines: 2,
                                        style: const TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Үнэ",
                                        maxLines: 2,
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15,
                                        ),
                                      ),
                                      Text(
                                        unit(double.parse(product["price"])),
                                        maxLines: 2,
                                        style: const TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 244, 246, 248),
                                  width: 1,
                                ),
                              ),
                              width:
                                  (MediaQuery.of(context).size.width / 2) - 45,
                              child: CustomElevatedButton(
                                onPressed: () {
                                  Provider.of<AddProductScreenViewModel>(
                                          context,
                                          listen: false)
                                      .setProduct(product);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const AddProductScreen(),
                                    ),
                                  );
                                },
                                color: Colors.white,
                                textColor: Colors.black,
                                buttonTitle: "Засах",
                              ),
                            ),
                            SizedBox(
                              width:
                                  (MediaQuery.of(context).size.width / 2) - 45,
                              child: CustomElevatedButton(
                                color: const Color.fromARGB(255, 244, 246, 248),
                                textColor: Colors.black,
                                onPressed: () {},
                                buttonTitle: "Устгах",
                              ),
                            ),
                          ],
                        ).padding(top: 15)
                      ],
                    ),
                  );
                },
              )
            ],
          ).padding(horizontal: 20, vertical: 10),
        );
      }),
      extendBody: true,
      bottomNavigationBar: BottomNavBarWidget(
        selectedIndex: 2,
        userType: userType,
      ),
    );
  }
}
