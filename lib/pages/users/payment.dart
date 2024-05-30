import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:miniibaraa/config/theme/app_theme.dart';
import 'package:miniibaraa/core/view_models/users/payment_view_model.dart';
import 'package:miniibaraa/pages/widget/custom_app_bar.dart';
import 'package:miniibaraa/pages/widget/custom_elevated_button.dart';
import 'package:provider/provider.dart';
import 'package:styled_widget/styled_widget.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Төлбөр төлөх',
      ),
      backgroundColor: Colors.white,
      body: DefaultTabController(
        length: 2,
        child: Consumer<PaymentViewModel>(
          builder: (context, model, __) => Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Color(0xFFF4F6F8))),
                child: TabBar(
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  indicatorSize: TabBarIndicatorSize.tab,
                  onTap: (value) => model.setTabIndex(value),
                  indicator: BoxDecoration(
                      color: AppTheme.color(0),
                      borderRadius: BorderRadius.circular(4)),
                  tabs: const [
                    Tab(
                      text: "Банкаар төлөх",
                    ),
                    Tab(
                      text: "Шилжүүлэх",
                    ),
                  ],
                ),
              ),
              TabBarView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: [
                  GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      childAspectRatio: 1.2,
                    ),
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            width: 1,
                            color: const Color(0xFFF4F6F8),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset('assets/img/bank_icon.png')
                                .padding(bottom: 20)
                                .expanded(),
                            Text(
                              'Simple',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ).padding(vertical: 4),
                            Text(
                              'Банкны картаар',
                              style:
                                  TextStyle(fontSize: 13, color: Colors.grey),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 60,
                        height: 60,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 12),
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(
                            width: 1,
                            color: const Color(0xFFF4F6F8),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Дансны дугаар',
                                  style: TextStyle(fontSize: 13),
                                ),
                                Text(
                                  '503050040',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            Text(
                              'Хуулах',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 60,
                        height: 60,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 12),
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(
                            width: 1,
                            color: const Color(0xFFF4F6F8),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Хүлээн авагч банк',
                                  style: TextStyle(fontSize: 13),
                                ),
                                Text(
                                  'Голомт Банк',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            Text(
                              'Хуулах',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 60,
                        height: 60,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 12),
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(
                            width: 1,
                            color: const Color(0xFFF4F6F8),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Хүлээн авагч',
                                  style: TextStyle(fontSize: 13),
                                ),
                                Text(
                                  'Minibrand',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            Text(
                              'Хуулах',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 60,
                        height: 60,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 12),
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(
                            width: 1,
                            color: const Color(0xFFF4F6F8),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Төлөх дүн',
                                  style: TextStyle(fontSize: 13),
                                ),
                                Text(
                                  '369’500.00',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            Text(
                              'Хуулах',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 60,
                        height: 60,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 12),
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(
                            width: 1,
                            color: const Color(0xFFF4F6F8),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Гүйлгээний утга',
                                  style: TextStyle(fontSize: 13),
                                ),
                                Text(
                                  'УХ503050040',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            Text(
                              'Хуулах',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ).padding(vertical: 20).expanded(),
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
                        Text("Нийлбэр дүн"),
                        Text(
                          "650'000.00",
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
                        Text("Хүргэлт"),
                        Text(
                          "0.00",
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
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Хэмнэлт"),
                        Text(
                          "495'000.00",
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
                          "2'650'000.00",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  model.tabIndex == 0
                      ? CustomElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const PaymentScreen()));
                              },
                              buttonTitle: "Төлбөр төлөх")
                          .padding(top: 40, bottom: 40, horizontal: 20)
                      : const SizedBox(
                          height: 40,
                        ),
                ],
              ).padding(horizontal: 30)
            ],
          ),
        ),
      ),
    );
  }
}
