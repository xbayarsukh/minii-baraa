import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:miniibaraa/config/theme/app_theme.dart';
import 'package:miniibaraa/core/storage/get_storage.dart';
import 'package:miniibaraa/core/view_models/profile_screen/sellers_screen_view_model.dart';
import 'package:miniibaraa/pages/selllers/profile_screen/seller_detail.dart';
import 'package:miniibaraa/pages/widget/custom_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:styled_widget/styled_widget.dart';

class SellersScreen extends StatelessWidget {
  const SellersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final int userType = AppDatabase().getUserType();
    return Scaffold(
      appBar: CustomAppBar(
        title: "Борлуулагчид",
      ),
      body: Consumer<SellersScreenViewModel>(
        builder: (context, model, child) {
          return ListView.builder(
              itemCount: model.sellersList.length,
              itemBuilder: (context, index) {
                var sellers = model.sellersList[index];
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SellerDetail(
                              sellerDetail: sellers,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: 70,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 244, 246, 248),
                          border: Border.all(
                            color: const Color.fromARGB(255, 244, 246, 248),
                            width: 1,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 15,
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(sellers["image"]),
                            ).padding(right: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  sellers["name"],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                const Text(
                                  "Test text",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color.fromARGB(255, 169, 176, 187),
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.keyboard_arrow_right,
                              color: Color.fromARGB(255, 202, 208, 215),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: const Color.fromARGB(255, 244, 246, 248),
                          width: 1,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 16),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/phone.svg",
                            colorFilter: ColorFilter.mode(
                              AppTheme.color(userType),
                              BlendMode.srcIn,
                            ),
                          ).padding(right: 10),
                          Text(sellers["phone"].toString()).padding(right: 18),
                          SvgPicture.asset(
                            "assets/icons/paper_plane.svg",
                            colorFilter: ColorFilter.mode(
                              AppTheme.color(userType),
                              BlendMode.srcIn,
                            ),
                          ).padding(right: 10),
                          Text(
                            sellers["email"].toString(),
                            maxLines: 1,
                          )
                        ],
                      ),
                    )
                  ],
                ).padding(horizontal: 25).padding(top: 15);
              });
        },
      ),
    );
  }
}
