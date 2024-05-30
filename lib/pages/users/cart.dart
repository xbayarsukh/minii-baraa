import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniibaraa/config/constants/dummy_datas.dart';
import 'package:miniibaraa/pages/users/payment.dart';
import 'package:miniibaraa/pages/widget/custom_app_bar.dart';
import 'package:miniibaraa/pages/widget/custom_elevated_button.dart';
import 'package:styled_widget/styled_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Таны сагс",
      ),
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: cartProducts.length,
            itemBuilder: (context, index) {
              var product = cartProducts[index];
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
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                  const Text(
                                    " ",
                                    maxLines: 2,
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Text(
                                    product["subcategory"],
                                    maxLines: 2,
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ).padding(top: 5, bottom: 20),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Өнгө",
                                    maxLines: 2,
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    "Ногоон",
                                    maxLines: 2,
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Хэмжээ",
                                    maxLines: 2,
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    '35',
                                    maxLines: 2,
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "850'000.00",
                                    maxLines: 2,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ).padding(vertical: 20),
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: 46,
                      margin: const EdgeInsets.only(bottom: 20),
                      padding: const EdgeInsets.all(11),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: const Color(0xFFF4F6F8),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 244, 246, 248),
                            ),
                            child: const Icon(
                              CupertinoIcons.minus,
                              size: 14,
                            ),
                          ),
                          const Text('30 ширхэг'),
                          Container(
                            width: 24,
                            height: 24,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 244, 246, 248),
                            ),
                            child: const Icon(
                              CupertinoIcons.plus,
                              size: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color.fromARGB(255, 244, 246, 248),
                              width: 1,
                            ),
                          ),
                          width: (MediaQuery.of(context).size.width / 2) - 45,
                          child: CustomElevatedButton(
                            onPressed: () {},
                            color: Colors.white,
                            textColor: Colors.black,
                            buttonTitle: "Хадгалах",
                          ),
                        ),
                        SizedBox(
                          width: (MediaQuery.of(context).size.width / 2) - 45,
                          child: CustomElevatedButton(
                            color: const Color.fromARGB(255, 244, 246, 248),
                            textColor: Colors.black,
                            onPressed: () {},
                            buttonTitle: "Устгах",
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          ).expanded(),
          Column(
            children: [
              Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 18),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 244, 246, 248),
                    borderRadius: BorderRadius.circular(3)),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Хүргэлт"),
                    Text(
                      "370'000.00",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Хямдрал"),
                    Text(
                      "30%",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 18),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 244, 246, 248),
                    borderRadius: BorderRadius.circular(3)),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Нийт үнэ"),
                    Text(
                      "305'000.00",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              CustomElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PaymentScreen()));
                      },
                      buttonTitle: "Төлбөр төлөх")
                  .padding(top: 50, bottom: 40, horizontal: 20),
            ],
          )
        ],
      ).padding(horizontal: 20),
    );
  }
}
