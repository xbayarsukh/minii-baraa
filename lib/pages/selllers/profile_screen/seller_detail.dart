import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:miniibaraa/config/theme/app_theme.dart';
import 'package:miniibaraa/core/storage/get_storage.dart';
import 'package:miniibaraa/pages/widget/custom_app_bar.dart';
import 'package:styled_widget/styled_widget.dart';

class SellerDetail extends StatelessWidget {
  final Map<String, dynamic> sellerDetail;
  const SellerDetail({super.key, required this.sellerDetail});

  @override
  Widget build(BuildContext context) {
    final int userType = AppDatabase().getUserType();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "Борлуулагч",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SellerDetail(
                          sellerDetail: sellerDetail,
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
                          backgroundImage: AssetImage(sellerDetail["image"]),
                        ).padding(right: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              sellerDetail["name"],
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/phone.svg",
                        colorFilter: ColorFilter.mode(
                          AppTheme.color(userType),
                          BlendMode.srcIn,
                        ),
                      ).padding(right: 10),
                      Text(sellerDetail["phone"].toString()).padding(right: 18),
                      SvgPicture.asset(
                        "assets/icons/paper_plane.svg",
                        colorFilter: ColorFilter.mode(
                          AppTheme.color(userType),
                          BlendMode.srcIn,
                        ),
                      ).padding(right: 10),
                      Text(
                        sellerDetail["email"].toString(),
                        maxLines: 1,
                      )
                    ],
                  ),
                )
              ],
            ).padding(horizontal: 25).padding(top: 15),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: const Color.fromARGB(255, 244, 246, 248),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(5)),
              child: Theme(
                data: Theme.of(context).copyWith(
                  dividerColor: Colors.transparent,
                ),
                child: ExpansionTile(
                  backgroundColor: Colors.white,
                  iconColor: Colors.black,
                  collapsedIconColor: Colors.black,
                  title: const Text(
                    "Description",
                    style: TextStyle(color: Colors.black),
                  ),
                  children: [
                    const Divider(
                      color: Color.fromARGB(255, 244, 246, 248),
                      thickness: 1,
                    ).padding(horizontal: 18),
                    Text(sellerDetail["description"]).padding(all: 18)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
