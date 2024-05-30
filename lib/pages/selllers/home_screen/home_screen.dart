import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:miniibaraa/config/constants/dummy_datas.dart';
import 'package:miniibaraa/config/theme/app_theme.dart';
import 'package:miniibaraa/core/storage/get_storage.dart';
import 'package:miniibaraa/core/view_models/connectivity_view_model.dart';
import 'package:miniibaraa/core/view_models/sellers/home_screen/home_screen_view_model.dart';
import 'package:miniibaraa/core/view_models/users/user_home_screen/user_home_screen_view_model.dart';
import 'package:miniibaraa/pages/selllers/product_and_shop_screen/product_detail.dart';
import 'package:miniibaraa/pages/widget/bottom_navbar_widget.dart';
import 'package:miniibaraa/pages/widget/connection_error_screen.dart';
import 'package:miniibaraa/pages/widget/custom_elevated_button.dart';
import 'package:miniibaraa/pages/widget/product_widget.dart';
import 'package:miniibaraa/pages/widget/user_app_bar_widget.dart';
import 'package:provider/provider.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final connectivityProvider = Provider.of<ConnectivityProvider>(context);
    final connectivityResult = connectivityProvider.connectivityResult;
    final userType = AppDatabase().getUserType();
    if (userType > 0) {
      return Consumer<HomeScreenViewModel>(
        builder: (context, model, __) {
          return Scaffold(
            appBar: const UserAppBarWidget(),
            body: connectivityResult == ConnectivityResult.none
                ? const ConnectivityErrorScreen()
                : SingleChildScrollView(
                    child: Center(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              container(context, userType, 368, "Дэлгүүр",
                                  "assets/icons/shop.svg"),
                              container(context, userType, 368, "Захиалга",
                                  "assets/icons/box.svg"),
                            ],
                          ).padding(horizontal: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              container(context, userType, 350000, "Борлуулалт",
                                  "assets/icons/sack.svg"),
                              container(context, userType, 80, "Буцаалт",
                                  "assets/icons/refresh.svg"),
                            ],
                          ).padding(horizontal: 20),
                          SizedBox(
                            height: 250,
                            child: SfCartesianChart(
                              // Initialize category axis
                              primaryXAxis: CategoryAxis(),
                              series: <AreaSeries<SalesData, String>>[
                                AreaSeries<SalesData, String>(
                                    color: AppTheme.color(userType)
                                        .withOpacity(0.6),
                                    // Bind data source
                                    dataSource: <SalesData>[
                                      SalesData('1 сар', 5),
                                      SalesData('2 сар', 30),
                                      SalesData('3 сар', 20),
                                      SalesData('4 сар', 40),
                                      SalesData('5 сар', 20),
                                      SalesData('6 сар', 21)
                                    ],
                                    xValueMapper: (SalesData sales, _) =>
                                        sales.year,
                                    yValueMapper: (SalesData sales, _) =>
                                        sales.sales)
                              ],
                            ),
                          ).padding(vertical: 15, horizontal: 20)
                        ],
                      ),
                    ),
                  ),
            bottomNavigationBar: BottomNavBarWidget(
              selectedIndex: 1,
              userType: userType,
            ),
            extendBody: true,
          );
        },
      );
    } else {
      return Consumer<UserHomeScreenViewModel>(builder: (context, model, __) {
        return Scaffold(
          appBar: const UserAppBarWidget(
            isUser: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 80,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: model.categoryList.length,
                          itemBuilder: (context, index) {
                            var category = model.categoryList[index];
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 56,
                                  height: 56,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 244, 246, 248),
                                        width: 2),
                                    borderRadius: BorderRadius.circular(28),
                                  ),
                                  padding: const EdgeInsets.all(15),
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: SvgPicture.asset(category["image"]),
                                ),
                                Text(
                                  category["name"],
                                  style: const TextStyle(fontSize: 13),
                                )
                              ],
                            ).padding(
                              left: index == 0 ? 20 : 15,
                              right: index == model.categoryList.length - 1
                                  ? 20
                                  : 0,
                            );
                          },
                        ),
                      ).padding(bottom: 18),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 255,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/img/ads.png"),
                          ),
                        ),
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Stack(children: [
                          Positioned(
                            bottom: 56,
                            left: 25,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 182,
                                  child: Text(
                                    "Air jordan 11 Retro Vasity Sneaker"
                                        .toUpperCase(),
                                    style: const TextStyle(
                                      fontSize: 23,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ).padding(bottom: 20),
                                CustomElevatedButton(
                                  onPressed: () {},
                                  color: Colors.white,
                                  textColor: Colors.black,
                                  buttonTitle: "Buy now",
                                ),
                              ],
                            ),
                          )
                        ]),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                margin: EdgeInsets.only(
                                  left: index == 0 ? 20 : 15,
                                  right: index == model.filterLists.length - 1
                                      ? 20
                                      : 0,
                                ),
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
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetail(
                          productDetail: products[0],
                        ),
                      ),
                    );
                  },
                  child: const ProductWidget(),
                ),
                const ProductWidget(),
                const ProductWidget(),
                const ProductWidget(
                  length: 2,
                ),
                const SizedBox(
                  height: 70,
                )
              ],
            ),
          ),
          extendBody: true,
          extendBodyBehindAppBar: true,
          bottomNavigationBar:
              BottomNavBarWidget(selectedIndex: 1, userType: userType),
        );
      });
    }
  }

  Widget container(context, userType, count, shopName, icon) {
    return Container(
      width: MediaQuery.of(context).size.width / 2 - 25,
      height: 134,
      margin: const EdgeInsets.only(top: 15),
      padding: const EdgeInsets.all(18),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            width: 40,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppTheme.color(userType),
            ),
            child: SvgPicture.asset(
              icon,
              colorFilter:
                  const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
          ),
          const Spacer(),
          Text(
            "$count",
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            shopName,
            style: const TextStyle(
              fontSize: 13,
            ),
          )
        ],
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
