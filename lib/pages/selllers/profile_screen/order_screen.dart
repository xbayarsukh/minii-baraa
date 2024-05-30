import 'package:flutter/material.dart';
import 'package:miniibaraa/core/utils/util.dart';
import 'package:miniibaraa/core/view_models/profile_screen/order_screen_view_model.dart';
import 'package:miniibaraa/pages/widget/custom_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:styled_widget/styled_widget.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Захиалга"),
      body: Consumer<OrderScreenViewModel>(builder: (context, model, __) {
        return ListView.builder(
          itemCount: model.orderList.length,
          itemBuilder: (context, index) {
            final order = model.orderList[index];
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
                              order["image"],
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
                                  order["name"],
                                  maxLines: 2,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      order["category"],
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
                                      order["subcategory"],
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
                                      order["type"],
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
                                      "Тоо ширхэг",
                                      maxLines: 2,
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15,
                                      ),
                                    ),
                                    Text(
                                      order["count"],
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
                                      unit(double.parse(order["price"])),
                                      maxLines: 2,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ).padding(top: 5),
                              ],
                            ),
                          )
                        ],
                      ),
                      Container(
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        margin: const EdgeInsets.only(top: 18),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Төлөв",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                              Icon(
                                Icons.arrow_drop_down_circle_outlined,
                                color: Colors.grey,
                              )
                            ]),
                      )
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
