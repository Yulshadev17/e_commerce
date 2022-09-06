// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:animate_do/animate_do.dart';
import 'package:e_commerce/dummy/home_json.dart';
import 'package:e_commerce/dummy/my_cart_json.dart';
import 'package:e_commerce/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:line_icons/line_icons.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      appBar: PreferredSize(
        child: getAppBar(),
        preferredSize: Size.fromHeight(60),
      ),
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      backgroundColor: primary,
      elevation: 0,
      centerTitle: true,
      title: Text(
        'Cart',
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w600, color: secondary),
      ),
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            decoration: BoxDecoration(
                color: primary,
                border: Border.all(width: 1, color: secondary.withOpacity(0.5)),
                shape: BoxShape.circle),
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Icon(
                Icons.arrow_back_ios,
                color: secondary,
              ),
            ),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                color: primary,
                border: Border.all(width: .5, color: secondary),
                shape: BoxShape.circle,
                boxShadow: [BoxShadow(offset: Offset(0, 0.5), blurRadius: 5)]),
            child: Padding(
              padding: const EdgeInsets.only(
                  bottom: 10, top: 8, right: 10, left: 10),
              child: Icon(
                LineIcons.shoppingBag,
                color: secondary,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getCardLists(),
            SizedBox(height: 20),
            getPromotionCode(),
            SizedBox(height: 40),
            getSummary(),
          ],
        ),
      ),
    );
  }

  Widget getCardLists() {
    var size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(
        myCartJson.length,
        ((index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: FadeInLeft(
              child: Row(
                children: [
                  Container(
                    width: (size.width - 30) * 0.7,
                    height: 90,
                    child: Row(
                      children: [
                        Container(
                          width: 90,
                          height: 90,
                          child: Stack(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            myCartJson[index]['image']))),
                              ),
                              Positioned(
                                top: 10,
                                child: Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: secondary.withOpacity(0.04),
                                    border: Border.all(
                                        width: 1.5,
                                        color: secondary.withOpacity(0.3)),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10),
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                myCartJson[index]['name'],
                                style: TextStyle(
                                    color: secondary,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '\$',
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 16),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    myCartJson[index]['price'],
                                    style: TextStyle(
                                        color: secondary,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Flexible(
                    child: Container(
                      height: 80,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Icon(
                              Icons.close,
                              size: 22,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                LineIcons.minusSquare,
                                size: 30,
                              ),
                              SizedBox(width: 10),
                              Text(
                                '1',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(width: 10),
                              Icon(
                                LineIcons.plusSquare,
                                size: 30,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget getPromotionCode() {
    var size = MediaQuery.of(context).size;
    return Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: secondary.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(12),
          color: secondary.withOpacity(0.06)),
      child: Row(
        children: [
          Container(
            width: (size.width - 30) * 0.7,
            height: 55,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                cursorColor: secondary,
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: 'Promo Code'),
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: 55,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8), color: secondary),
                child: Center(
                  child: Text(
                    'Apply',
                    style: TextStyle(
                        color: white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getSummary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Subtotal',
              style: TextStyle(
                  color: secondary, fontWeight: FontWeight.w600, fontSize: 18),
            ),
            SizedBox(width: 5),
            Text(
              '(3 items)',
              style: TextStyle(
                  color: secondary, fontWeight: FontWeight.w400, fontSize: 18),
            ),
            SizedBox(width: 10),
            Dash(
              direction: Axis.horizontal,
              length: 200,
              dashLength: 10,
              dashColor: secondary.withOpacity(0.5),
            ),
            SizedBox(width: 10),
            Text(
              '\$600',
              style: TextStyle(
                  color: secondary, fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Text(
              'Delivery charge',
              style: TextStyle(
                  color: secondary, fontWeight: FontWeight.w600, fontSize: 18),
            ),
            SizedBox(width: 5),
            SizedBox(width: 10),
            Dash(
              direction: Axis.horizontal,
              length: 220,
              dashLength: 10,
              dashColor: secondary.withOpacity(0.5),
            ),
            SizedBox(width: 10),
            Text(
              'Free',
              style: TextStyle(
                  color: Colors.red, fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Text(
              'Total',
              style: TextStyle(
                  color: secondary, fontWeight: FontWeight.w600, fontSize: 18),
            ),
            SizedBox(width: 5),
            SizedBox(width: 10),
            Dash(
              direction: Axis.horizontal,
              length: 310,
              dashLength: 10,
              dashColor: secondary.withOpacity(0.5),
            ),
            SizedBox(width: 10),
            Text(
              '\$600',
              style: TextStyle(
                  color: secondary, fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ],
        ),
      ],
    );
  }

  Widget getFooter() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Container(
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: secondary),
        child: Center(
          child: Text(
            'Proceed checkout',
            style: TextStyle(
                color: white, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
