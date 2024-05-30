import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:miniibaraa/core/view_models/connectivity_view_model.dart';
import 'package:miniibaraa/core/view_models/profile_screen/my_info_view_model.dart';
import 'package:miniibaraa/core/view_models/profile_screen/my_shop_view_model.dart';
import 'package:miniibaraa/core/view_models/profile_screen/order_screen_view_model.dart';
import 'package:miniibaraa/core/view_models/profile_screen/returns_screen_view_model.dart';
import 'package:miniibaraa/core/view_models/profile_screen/sales_screen_view_model.dart';
import 'package:miniibaraa/core/view_models/profile_screen/sellers_screen_view_model.dart';
import 'package:miniibaraa/core/view_models/sellers/home_screen/home_screen_view_model.dart';
import 'package:miniibaraa/core/view_models/sellers/notification_screen/notification_screen_view_model.dart';
import 'package:miniibaraa/core/view_models/sellers/product_and_shop_screen/add_product_screen_view_model.dart';
import 'package:miniibaraa/core/view_models/sellers/product_and_shop_screen/product_screen_view_model.dart';
import 'package:miniibaraa/core/view_models/sellers/product_and_shop_screen/shop_screen_view_model.dart';
import 'package:miniibaraa/core/view_models/signin_screen/signin_screen_view_model.dart';
import 'package:miniibaraa/core/view_models/signup_screen/signup_screen_view_model.dart';
import 'package:miniibaraa/core/view_models/users/payment_view_model.dart';
import 'package:miniibaraa/core/view_models/users/product_detail/product_detail_view_model.dart';
import 'package:miniibaraa/core/view_models/users/user_home_screen/user_home_screen_view_model.dart';
import 'package:miniibaraa/pages/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  await GetStorage.init();
  runApp(const MiniiBrand());
}

class MiniiBrand extends StatelessWidget {
  const MiniiBrand({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (ctx) => SigninScreenViewModel()),
          ChangeNotifierProvider(create: (ctx) => ConnectivityProvider()),
          ChangeNotifierProvider(create: (ctx) => SignupScreenViewModel()),
          ChangeNotifierProvider(create: (ctx) => HomeScreenViewModel()),
          ChangeNotifierProvider(create: (ctx) => UserHomeScreenViewModel()),
          ChangeNotifierProvider(create: (ctx) => ProductScreenViewModel()),
          ChangeNotifierProvider(create: (ctx) => AddProductScreenViewModel()),
          ChangeNotifierProvider(
              create: (ctx) => NotificationScreenViewModel()),
          ChangeNotifierProvider(create: (ctx) => MyInfoViewModel()),
          ChangeNotifierProvider(create: (ctx) => MyShopViewModel()),
          ChangeNotifierProvider(create: (ctx) => OrderScreenViewModel()),
          ChangeNotifierProvider(create: (ctx) => SalesScreenViewModel()),
          ChangeNotifierProvider(create: (ctx) => ReturnsScreenViewModel()),
          ChangeNotifierProvider(create: (ctx) => SellersScreenViewModel()),
          ChangeNotifierProvider(create: (ctx) => ShopScreenViewModel()),
          ChangeNotifierProvider(create: (ctx) => ProductDetailViewModel()),
          ChangeNotifierProvider(create: (ctx) => PaymentViewModel()),
        ],
        child: MaterialApp(
          color: const Color.fromARGB(255, 246, 248, 249),
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            useMaterial3: false,
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 254, 192, 0),
            ),
          ),
          home: const SplashScreen(),
        ));
  }
}
