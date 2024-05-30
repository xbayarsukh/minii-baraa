import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:miniibaraa/config/theme/app_theme.dart';
import 'package:miniibaraa/core/storage/get_storage.dart';
import 'package:miniibaraa/core/view_models/users/product_detail/product_detail_view_model.dart';
import 'package:miniibaraa/pages/users/cart.dart';
import 'package:miniibaraa/pages/widget/custom_elevated_button.dart';
import 'package:miniibaraa/pages/widget/product_widget.dart';
import 'package:provider/provider.dart';
import 'package:styled_widget/styled_widget.dart';

class ProductDetail extends StatelessWidget {
  final Map<String, dynamic> productDetail;
  const ProductDetail({super.key, required this.productDetail});

  @override
  Widget build(BuildContext context) {
    final text = productDetail["color"].replaceAll(RegExp(r'\s+'), ' ');
    final splitTokens = text.split(' ');
    final textSize = productDetail["size"].replaceAll(RegExp(r'\s+'), ' ');
    final splitTokensSize = textSize.split(' ');
    List<String> colors = splitTokens;
    List<String> sizer = splitTokensSize;
    final userType = AppDatabase().getUserType();

    return Consumer<ProductDetailViewModel>(builder: (context, model, __) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 2,
                          color: const Color.fromARGB(255, 244, 246, 248))),
                  margin: const EdgeInsets.only(right: 15),
                  child: const Icon(
                    Icons.arrow_back,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 205,
                child: Text(
                  productDetail["name"],
                  maxLines: 1,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 2,
                          color: const Color.fromARGB(255, 244, 246, 248))),
                  margin: const EdgeInsets.only(right: 15, left: 15),
                  child: const Icon(
                    CupertinoIcons.bag,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 2,
                          color: const Color.fromARGB(255, 244, 246, 248))),
                  child: const Icon(
                    Icons.more_horiz,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 335,
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Image.asset(
                  "assets/img/product_1.png",
                  fit: BoxFit.cover,
                ),
              ),
              Row(
                children: [
                  Container(
                    height: 105,
                    margin: const EdgeInsets.only(left: 20),
                    width: (MediaQuery.of(context).size.width - 60) / 3,
                    child: Image.asset(
                      "assets/img/product_1.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    height: 105,
                    margin: const EdgeInsets.only(left: 10),
                    width: (MediaQuery.of(context).size.width - 60) / 3,
                    child: Image.asset(
                      "assets/img/product_1.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    height: 105,
                    margin: const EdgeInsets.only(right: 20, left: 10),
                    width: (MediaQuery.of(context).size.width - 60) / 3,
                    child: Image.asset(
                      "assets/img/product_1.png",
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ).padding(bottom: 20),
              Text(
                productDetail["name"],
                style:
                    const TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
              ).padding(left: 20),
              Text(
                productDetail["category"],
                style: const TextStyle(
                    fontSize: 15, color: Color.fromARGB(255, 169, 176, 187)),
              ).padding(left: 20, bottom: 20),
              Row(
                children: [
                  const Text(
                    "370,000.00",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ).padding(left: 20),
                  const Spacer(),
                  RatingBar(
                    initialRating: 3,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 18,
                    glowColor: Colors.transparent,
                    ratingWidget: RatingWidget(
                      full: SvgPicture.asset("assets/icons/star.svg"),
                      half: SvgPicture.asset("assets/icons/star.svg"),
                      empty: SvgPicture.asset("assets/icons/star_empty.svg"),
                    ),
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    onRatingUpdate: (rating) {
                      // print(rating);
                    },
                  ).padding(right: 20)
                ],
              ),
              const Divider(
                height: 30,
                thickness: 2,
                color: Color.fromARGB(255, 244, 246, 248),
              ).padding(horizontal: 20),
              Container(
                height: 70,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 244, 246, 248)),
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      margin: const EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                              image: AssetImage("assets/img/shop1.jpg"))),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Minimart",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ).padding(bottom: 3),
                        const Text(
                          "data",
                          style: TextStyle(
                            color: Color.fromARGB(255, 169, 176, 187),
                            fontSize: 13,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Divider(
                height: 30,
                thickness: 2,
                color: Color.fromARGB(255, 244, 246, 248),
              ).padding(horizontal: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Өнгө сонгох",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ).padding(bottom: 15),
                  SizedBox(
                    height: 41,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: colors.length,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          final color = colors[index];
                          return Container(
                            padding: const EdgeInsets.all(7),
                            margin: const EdgeInsets.only(right: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(
                                width: 2,
                                color: model.selectedColor == color
                                    ? const Color.fromARGB(255, 244, 246, 248)
                                    : Colors.transparent,
                              ),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                model.setSelected(color, "color");
                              },
                              child: Container(
                                width: 24.0,
                                height: 24.0,
                                padding: EdgeInsets.zero,
                                decoration: BoxDecoration(
                                  color: AppTheme.stringColor(color),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                          );
                        }),
                  ).padding(bottom: 20),
                  const Text(
                    "Хэмжээ сонгох",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ).padding(bottom: 15),
                  SizedBox(
                    height: 47,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: sizer.length,
                      itemBuilder: (context, index) {
                        final size = sizer[index];
                        return GestureDetector(
                          onTap: () {
                            model.setSelected(size, "size");
                          },
                          child: Container(
                            width: 47,
                            height: 47,
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              color: model.selectedSize == size
                                  ? Colors.grey
                                  : null,
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(
                                width: 2,
                                color: const Color.fromARGB(255, 244, 246, 248),
                              ),
                            ),
                            child: Center(
                                child: Text(
                              size,
                              style: TextStyle(
                                color: model.selectedSize == size
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            )),
                          ),
                        );
                      },
                    ),
                  ).padding(bottom: 7.5),
                  const Divider(
                    height: 30,
                    thickness: 2,
                    color: Color.fromARGB(255, 244, 246, 248),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 7.5),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 244, 246, 248),
                    ),
                    child: Theme(
                      data: Theme.of(context)
                          .copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        expandedCrossAxisAlignment: CrossAxisAlignment.start,
                        title: const Text("Description"),
                        childrenPadding: const EdgeInsets.all(8),
                        children: [
                          const Divider(
                            height: 1,
                            thickness: 1,
                            color: Color.fromARGB(24, 0, 0, 0),
                          ),
                          const Text("data")
                              .padding(horizontal: 12, vertical: 8)
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 7.5),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 244, 246, 248),
                    ),
                    child: Theme(
                      data: Theme.of(context)
                          .copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        expandedCrossAxisAlignment: CrossAxisAlignment.start,
                        title: const Text("Returns"),
                        childrenPadding: const EdgeInsets.all(8),
                        children: [
                          const Divider(
                            height: 1,
                            thickness: 1,
                            color: Color.fromARGB(24, 0, 0, 0),
                          ),
                          const Text("data")
                              .padding(horizontal: 12, vertical: 8)
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 7.5),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 244, 246, 248),
                    ),
                    child: Theme(
                      data: Theme.of(context)
                          .copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        expandedCrossAxisAlignment: CrossAxisAlignment.start,
                        title: const Text("Size & Fit"),
                        childrenPadding: const EdgeInsets.all(8),
                        children: [
                          const Divider(
                            height: 1,
                            thickness: 1,
                            color: Color.fromARGB(24, 0, 0, 0),
                          ),
                          const Text("data")
                              .padding(horizontal: 12, vertical: 8)
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    height: 30,
                    thickness: 2,
                    color: Color.fromARGB(255, 244, 246, 248),
                  ),
                  const Text(
                    "Борлуулагч",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ).padding(bottom: 15),
                ],
              ).padding(horizontal: 20),
              Container(
                width: double.infinity,
                height: 375,
                margin: const EdgeInsets.only(top: 10),
                child: const GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(47.895, 106.885),
                    zoom: 14,
                  ),
                ),
              ),
              Container(
                height: 120,
                margin: const EdgeInsets.symmetric(vertical: 15),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: 300,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 70,
                            width: 300,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 244, 246, 248),
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  margin: const EdgeInsets.only(
                                      left: 15, right: 10),
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image:
                                          AssetImage('assets/img/avatar.png'),
                                    ),
                                  ),
                                ),
                                const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Uyanga Enkhtuul",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      "Verified Seller",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 169, 176, 187)),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                SvgPicture.asset(
                                  "assets/icons/phone.svg",
                                  width: 24,
                                  height: 24,
                                  colorFilter: ColorFilter.mode(
                                      AppTheme.color(userType),
                                      BlendMode.srcIn),
                                ).padding(right: 25)
                              ],
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 300,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(
                                width: 2,
                                color: const Color.fromARGB(255, 244, 246, 248),
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/location_compass.svg",
                                  height: 20,
                                  width: 20,
                                ).padding(right: 10),
                                Text("Баянгол дүүрэг, $index-р хороо")
                              ],
                            ),
                          )
                        ],
                      ),
                    ).padding(
                        right: index == 3 ? 20 : 15, left: index == 0 ? 20 : 0);
                  },
                ),
              ),
              const Divider(
                height: 30,
                thickness: 2,
                color: Color.fromARGB(255, 244, 246, 248),
              ).padding(horizontal: 20),
              Container(
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 244, 246, 248),
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        model.qtyMinus();
                      },
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Icon(
                          Icons.remove,
                          size: 16,
                          weight: 7,
                        ),
                      ),
                    ),
                    Text("${model.qty} ширхэг"),
                    GestureDetector(
                      onTap: () {
                        model.qtyPlus();
                      },
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Icon(
                          Icons.add,
                          size: 16,
                          weight: 7,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              CustomElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CartScreen(),
                    ),
                  );
                },
                buttonTitle: "Сагсанд хийх",
              ).padding(horizontal: 20, vertical: 15),
              const Divider(
                height: 30,
                thickness: 2,
                color: Color.fromARGB(255, 244, 246, 248),
              ).padding(horizontal: 20),
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
                      children: [Text("Төрөл"), Text("Малгайтай цамц")],
                    ),
                  ),
                  Container(
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Загвар"), Text("Хувцас")],
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
                      children: [Text("Насны ангилал"), Text("Том хүн")],
                    ),
                  ),
                  Container(
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Улирал"), Text("Хавар, Намар")],
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
                      children: [Text("Материал"), Text("Ноолуур")],
                    ),
                  ),
                  Container(
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Өнгө"),
                        Text(productDetail["color"])
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
                      children: [Text("Зориулалт"), Text("Өдөр тутам")],
                    ),
                  ),
                ],
              ).padding(horizontal: 20),
              const ProductWidget(),
              const ProductWidget(),
              const Divider(
                height: 30,
                thickness: 2,
                color: Color.fromARGB(255, 244, 246, 248),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: const BoxDecoration(color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Сэтгэгдэл",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ).padding(bottom: 15),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              margin: const EdgeInsets.only(right: 10),
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/img/avatar.png"),
                                ),
                              ),
                            ),
                            Container(
                                height: 200,
                                width:
                                    MediaQuery.of(context).size.width - 40 - 40,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 244, 246, 248),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                padding: const EdgeInsets.all(15),
                                margin: const EdgeInsets.only(bottom: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Uyanga Enkhtuul",
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ).padding(bottom: 7),
                                            RatingBar(
                                              initialRating: 3,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              itemSize: 14,
                                              glowColor: Colors.transparent,
                                              ratingWidget: RatingWidget(
                                                full: SvgPicture.asset(
                                                    "assets/icons/star.svg"),
                                                half: SvgPicture.asset(
                                                    "assets/icons/star.svg"),
                                                empty: SvgPicture.asset(
                                                    "assets/icons/star_empty.svg"),
                                              ),
                                              itemPadding:
                                                  const EdgeInsets.only(
                                                      right: 5.0),
                                              onRatingUpdate: (rating) {
                                                // print(rating);
                                              },
                                            )
                                          ],
                                        ),
                                        const Text(
                                          "4ц өмнө",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Color.fromARGB(
                                                255, 169, 176, 187),
                                          ),
                                        )
                                      ],
                                    ).padding(bottom: 15),
                                    const Text(
                                      "We are a dynamic group of forward thinkers who want to change the world for the better.",
                                      maxLines: 100,
                                    ).padding(bottom: 20),
                                    Container(
                                      constraints: const BoxConstraints(
                                        minWidth: 20,
                                        maxWidth: 105,
                                      ),
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3),
                                        color: Colors.white,
                                      ),
                                      child: IntrinsicWidth(
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                              "assets/icons/like.svg",
                                              width: 16,
                                              height: 16,
                                            ).padding(right: 5),
                                            IntrinsicWidth(
                                              child: Text(
                                                index == 1 ? "like" : "100",
                                                style: const TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                          ],
                        );
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: Container(
          constraints: const BoxConstraints(
            maxHeight: 200,
            minHeight: 50,
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          padding: const EdgeInsets.only(
            bottom: 30,
            top: 10,
            right: 20,
            left: 20,
          ),
          child: Row(
            children: [
              const Icon(
                Icons.add_circle,
                size: 24,
              ).padding(right: 15),
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width - 130,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 244, 246, 248),
                  borderRadius: BorderRadius.circular(3),
                ),
                margin: const EdgeInsets.only(right: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                child: const Center(
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Сэтгэгдэл",
                        hintStyle: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 169, 176, 187),
                        )),
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: const Color.fromARGB(255, 244, 246, 248),
                  ),
                  borderRadius: BorderRadius.circular(3),
                ),
                child: const Center(
                    child: Icon(
                  Icons.arrow_upward,
                  size: 18,
                )),
              )
            ],
          ),
        ),
      );
    });
  }
}
