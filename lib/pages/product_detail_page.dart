// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:animate_do/animate_do.dart';
import 'package:e_commerce/dummy/home_json.dart';
import 'package:e_commerce/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class ProductDeatilPage extends StatefulWidget {
  final String name;
  final String img;
  final String price;
  final String rate;
  final List colors;

  const ProductDeatilPage(
      {super.key,
      required this.name,
      required this.img,
      required this.price,
      required this.rate,
      required this.colors});

  @override
  State<ProductDeatilPage> createState() => _ProductDeatilPageState();
}

class _ProductDeatilPageState extends State<ProductDeatilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: getAppBar(),
      ),
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: primary,
      centerTitle: true,
      title: Text(
        'Product page',
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w600, color: secondary),
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 1.5,
              color: secondary.withOpacity(0.2),
            ),
          ),
          child: Icon(
            Icons.arrow_back_ios_new,
            color: secondary,
            size: 15,
          ),
        ),
      ),
    );
  }

  Widget getFooter() {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          color: secondary),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Text(
              'More',
              style: TextStyle(
                  color: white, fontWeight: FontWeight.w600, fontSize: 18),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 120,
                  height: 40,
                  decoration: BoxDecoration(
                      color: white.withOpacity(0.3),
                      border: Border.all(width: 1.5, color: white),
                      borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(child: Icon(LineIcons.minus)),
                        ),
                        Text(
                          '1',
                          style: TextStyle(
                              color: white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                        ),
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(child: Icon(LineIcons.plus)),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  width: 50,
                  height: 50,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: white),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Icon(
                        LineIcons.shoppingBag,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.name,
              style: TextStyle(
                  color: secondary, fontWeight: FontWeight.w500, fontSize: 26),
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Icon(LineIcons.star),
                SizedBox(width: 10),
                Text(
                  "${widget.rate} + Reviews",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text(
                  "\$",
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
                SizedBox(width: 5),
                Text(
                  "${widget.price}",
                  style: TextStyle(
                      color: secondary,
                      fontWeight: FontWeight.w500,
                      fontSize: 22),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: white,
                    // ignore: prefer_const_literals_to_create_immutables
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Icon(
                    LineIcons.heart,
                    size: 28,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FadeInLeft(
                  child: Container(
                    width: (size.width - 100) / 6,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        children: List.generate(widget.colors.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Container(
                              width: 70,
                              height: 70,
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 10,
                                    child: Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: secondary.withOpacity(0.1),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 60,
                                    height: 60,
                                    child: Image.asset(
                                      widget.colors[index],
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Flexible(
                  child: Container(
                    height: 350,
                    child: Stack(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(top: 40, left: 40, right: 20),
                          child: Container(
                            height: 300,
                            decoration: BoxDecoration(
                              color: secondary.withOpacity(0.12),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(160),
                                topLeft: Radius.circular(160),
                                topRight: Radius.circular(20),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: Container(
                            height: 350,
                            child: Image.asset(
                              widget.img,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
