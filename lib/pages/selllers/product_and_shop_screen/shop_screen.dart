import 'package:flutter/material.dart';
import 'package:miniibaraa/config/theme/app_theme.dart';
import 'package:miniibaraa/core/storage/get_storage.dart';
import 'package:miniibaraa/core/view_models/sellers/product_and_shop_screen/shop_screen_view_model.dart';
import 'package:miniibaraa/pages/widget/bottom_navbar_widget.dart';
import 'package:miniibaraa/pages/widget/user_app_bar_widget.dart';
import 'package:provider/provider.dart';
import 'package:styled_widget/styled_widget.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final int userType = AppDatabase().getUserType();
    return Scaffold(
      appBar: const UserAppBarWidget(),
      body: Consumer<ShopScreenViewModel>(builder: (context, model, __) {
        return SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: model.shopLists.length,
                itemBuilder: (context, index) {
                  final shop = model.shopLists[index];
                  return Container(
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.only(top: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  shop["image"],
                                ),
                              )),
                          margin: const EdgeInsets.only(right: 15),
                        ),
                        SizedBox(
                          width:
                              MediaQuery.of(context).size.width - 80 - 90 - 15,
                          child: Column(
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    shop["name"],
                                    maxLines: 2,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ).padding(bottom: 3),
                                  Text(
                                    shop["description"],
                                    maxLines: 1,
                                    style: const TextStyle(
                                        fontSize: 13,
                                        color:
                                            Color.fromARGB(255, 169, 176, 187)),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            model.setStatus(shop["id"]);
                          },
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: shop["status"]
                                  ? AppTheme.color(userType)
                                  : const Color.fromARGB(255, 228, 232, 235),
                            ),
                            child: const Icon(
                              Icons.circle,
                              color: Colors.white,
                              size: 10,
                            ),
                          ),
                        ),
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
