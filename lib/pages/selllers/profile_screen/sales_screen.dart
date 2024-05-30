import 'package:flutter/material.dart';
import 'package:miniibaraa/core/utils/util.dart';
import 'package:miniibaraa/core/view_models/profile_screen/sales_screen_view_model.dart';
import 'package:miniibaraa/pages/widget/custom_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:styled_widget/styled_widget.dart';

class SalesScreen extends StatelessWidget {
  const SalesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Борлуулалт"),
      body: Consumer<SalesScreenViewModel>(builder: (context, model, __) {
        return ListView.builder(
          itemCount: model.salesList.length,
          itemBuilder: (context, index) {
            final sales = model.salesList[index];
            return Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.only(top: 15, right: 25, left: 25),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 244, 246, 248),
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(5)),
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
                              sales["image"],
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width -
                                80 -
                                90 -
                                15 -
                                40,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  sales["name"],
                                  maxLines: 2,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      sales["category"],
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
                                      sales["subcategory"],
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
                                      "Тоо ширхэг",
                                      maxLines: 2,
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15,
                                      ),
                                    ),
                                    Text(
                                      sales["count"],
                                      maxLines: 2,
                                      style: const TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ).padding(top: 5),
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
                                      unit(double.parse(sales["price"])),
                                      maxLines: 2,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ).padding(top: 5),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Б.шимтгэл",
                                      maxLines: 2,
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15,
                                      ),
                                    ),
                                    Text(
                                      unit(double.parse(sales["b_shimtgel"])),
                                      maxLines: 2,
                                      style: const TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ).padding(top: 5),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "С.шимтгэл",
                                      maxLines: 2,
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15,
                                      ),
                                    ),
                                    Text(
                                      unit(double.parse(sales["s_shimtgel"])),
                                      maxLines: 2,
                                      style: const TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ).padding(top: 5),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Үйлдвэрлэгч",
                                      maxLines: 2,
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15,
                                      ),
                                    ),
                                    Text(
                                      unit(double.parse(sales["producer"])),
                                      maxLines: 2,
                                      style: const TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ).padding(top: 5),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(5)),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage("assets/img/avatar.png"),
                      ).padding(right: 15.5),
                      const Text(
                        "Уянга Төр",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      )
                    ],
                  ),
                )
              ],
            );
          },
        );
      }),
    );
  }
}
