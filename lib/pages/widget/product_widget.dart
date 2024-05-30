import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:miniibaraa/pages/selllers/product_and_shop_screen/product_detail.dart';
import 'package:styled_widget/styled_widget.dart';

class ProductWidget extends StatelessWidget {
  final String? shopImage;
  final String? shopName;
  final String? category;
  final String? subCategory;
  final double? price;
  final String? productImage;
  final int? length;
  const ProductWidget({
    super.key,
    this.shopImage,
    this.shopName,
    this.category,
    this.subCategory,
    this.price,
    this.productImage,
    this.length = 1,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const ProductDetail(productDetail: {
                      'id': 1,
                      'name': 'Nike SB Zoom Blazer Low Pro',
                      'description':
                          'Энд тухайн барааны дэлгэрнгүй мэдээлэл байрлана.',
                      'image': 'assets/img/product_1.png',
                      'category': 'Clothes',
                      'subcategory': 'Lifestyle',
                      'type': 'Онцлох',
                      'status': 'Тийм',
                      'count': '350',
                      'price': '850000',
                      'b_shimtgel': '70000',
                      's_shimtgel': '50000',
                      'producer': '550000',
                      'size': '42 67 98',
                      'color': 'хар цагаан бор',
                      'shop_id': 1,
                    })));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: const BoxDecoration(color: Colors.white),
        margin: const EdgeInsets.only(bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage:
                      AssetImage(shopImage ?? "assets/img/shop1.jpg"),
                ).padding(left: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      shopName ?? "Minimart",
                      style: const TextStyle(fontSize: 15),
                    ).padding(bottom: 3),
                    const Text(
                      "data",
                      style: TextStyle(
                        color: Color.fromARGB(255, 169, 176, 187),
                        fontSize: 13,
                      ),
                    ),
                  ],
                ).padding(left: 10),
                const Spacer(),
                SvgPicture.asset("assets/icons/star.svg").padding(right: 20),
                const Icon(
                  Icons.more_horiz,
                  size: 30,
                ).padding(right: 20)
              ],
            ).padding(bottom: 15),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 244, 246, 248),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    category ?? "#women",
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 244, 246, 248),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    subCategory ?? "#beauty",
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
                const Spacer(),
                Text(
                  price == null ? "350,000.00" : "$price",
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.bold),
                ).padding(right: 20),
              ],
            ).padding(bottom: 15),
            length == 1
                ? SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 275,
                    child: Image.asset(
                      productImage ?? "assets/img/product_1.png",
                      fit: BoxFit.cover,
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: (MediaQuery.of(context).size.width - 10) / 2,
                        height: 170,
                        child: Image.asset(
                          productImage ?? "assets/img/product_1.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width - 10) / 2,
                        height: 170,
                        child: Image.asset(
                          productImage ?? "assets/img/product_1.png",
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  ),
            Row(
              children: [
                SvgPicture.asset("assets/icons/like.svg").padding(left: 20),
                const Text(
                  "data",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w200,
                      color: Color.fromARGB(255, 169, 176, 187)),
                ).padding(left: 7),
                SvgPicture.asset("assets/icons/comment.svg").padding(left: 20),
                const Text(
                  "data",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w200,
                      color: Color.fromARGB(255, 169, 176, 187)),
                ).padding(left: 7),
                const Spacer(),
                SvgPicture.asset("assets/icons/refresh2.svg").padding(right: 20)
              ],
            ).padding(vertical: 10),
            const Divider(
              height: 20,
              thickness: 2,
              color: Color.fromARGB(255, 244, 246, 248),
            ),
            Row(
              children: [
                const CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage("assets/img/avatar.png"),
                ).padding(left: 20, right: 10),
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width - 90,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 244, 246, 248)),
                  child: const Center(
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: "Сэтгэгдэл"),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
