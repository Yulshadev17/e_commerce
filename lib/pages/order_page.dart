// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:animate_do/animate_do.dart';
import 'package:e_commerce/dummy/order_json.dart';
import 'package:e_commerce/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int pageIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: getAppBar(),
      ),
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: primary,
      centerTitle: true,
      title: Text(
        'Order History',
        style: TextStyle(
            color: secondary, fontWeight: FontWeight.w600, fontSize: 20),
      ),
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Flexible(
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: secondary.withOpacity(0.3),
                ),
                shape: BoxShape.circle),
            child: Padding(
              padding: const EdgeInsets.only(left: 3),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: secondary,
                ),
              ),
            ),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: white,
              shape: BoxShape.circle,
              boxShadow: [BoxShadow(offset: Offset(0, 2.5), blurRadius: 2.5)],
            ),
            child: Icon(
              LineIcons.trash,
              color: secondary,
            ),
          ),
        ),
      ],
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            getTabs(),
            SizedBox(height: 20),
            pageIndex == 0 ? getCurrentItemsList() : getPostItemsList(),
          ],
        ),
      ),
    );
  }

  Widget getTabs() {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 55,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: secondary.withOpacity(0.05)),
      child: Row(children: [
        pageIndex == 0
            ? Flexible(
                child: ElasticIn(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        pageIndex = 0;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Container(
                        height: 50,
                        width: (size.width - 45) / 2,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: secondary.withOpacity(0.15),
                                  blurRadius: 3.5,
                                  offset: Offset(0, 5)),
                            ],
                            borderRadius: BorderRadius.circular(30),
                            color: white),
                        child: Center(
                          child: Text(
                            'Current Order',
                            style: TextStyle(
                                color: secondary,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : GestureDetector(
                onTap: () {
                  setState(() {
                    pageIndex = 0;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Container(
                    height: 50,
                    width: (size.width - 45) / 2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.transparent),
                    child: Center(
                      child: Text(
                        'Current Order',
                        style: TextStyle(
                            color: secondary,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ),
        pageIndex == 1
            ? Flexible(
                child: ElasticIn(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        pageIndex = 1;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Container(
                        height: 50,
                        width: (size.width - 45) / 2,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: secondary.withOpacity(0.15),
                                  blurRadius: 3.5,
                                  offset: Offset(0, 5)),
                            ],
                            borderRadius: BorderRadius.circular(30),
                            color: white),
                        child: Center(
                          child: Text(
                            'Post Order',
                            style: TextStyle(
                                color: secondary,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : GestureDetector(
                onTap: () {
                  setState(() {
                    pageIndex = 1;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Container(
                    height: 50,
                    width: (size.width - 45) / 2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.transparent),
                    child: Center(
                      child: Text(
                        'Post Order',
                        style: TextStyle(
                            color: secondary,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ),
      ]),
    );
  }

  Widget getCurrentItemsList() {
    var size = MediaQuery.of(context).size;
    return Column(
      children: List.generate(currentOrderList.length, (index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Container(
            width: size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: secondary.withOpacity(0.05)),
            child: Padding(
              padding: EdgeInsets.all(18),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        currentOrderList[index]['date'],
                        style: TextStyle(
                            color: secondary,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      ),
                      Text(
                        'Delivery Processing',
                        style: TextStyle(
                            color: Colors.orangeAccent,
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Container(
                        width: size.width * 0.6,
                        child: Row(
                          children: [
                            Container(
                              width: 90,
                              height: 90,
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 10,
                                    child: Container(
                                      width: 80,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                          color: secondary.withOpacity(0.1),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 80,
                                    height: 80,
                                    child: Image.asset(
                                        currentOrderList[index]['image']),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 5),
                            Flexible(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    currentOrderList[index]['name'],
                                    style: TextStyle(
                                        color: secondary,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '\$',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16),
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        currentOrderList[index]['price'],
                                        style: TextStyle(
                                            color: secondary,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Row(
                          children: [
                            Container(
                              width: 2,
                              height: 60,
                              decoration: BoxDecoration(
                                color: secondary.withOpacity(0.15),
                              ),
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Total items:'),
                                Text(currentOrderList[index]['time'])
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget getPostItemsList() {
    var size = MediaQuery.of(context).size;
    return Column(
      children: List.generate(pastOrderList.length, (index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Container(
            width: size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: secondary.withOpacity(0.05)),
            child: Padding(
              padding: EdgeInsets.all(18),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        currentOrderList[index]['date'],
                        style: TextStyle(
                            color: secondary,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      ),
                      Text(
                        'Delivery Processing',
                        style: TextStyle(
                            color: Colors.orangeAccent,
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Container(
                        width: size.width * 0.6,
                        child: Row(
                          children: [
                            Container(
                              width: 90,
                              height: 90,
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 10,
                                    child: Container(
                                      width: 80,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                          color: secondary.withOpacity(0.1),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 80,
                                    height: 80,
                                    child: Image.asset(
                                        pastOrderList[index]['image']),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 5),
                            Flexible(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    pastOrderList[index]['name'],
                                    style: TextStyle(
                                        color: secondary,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '\$',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16),
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        pastOrderList[index]['price'],
                                        style: TextStyle(
                                            color: secondary,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Row(
                          children: [
                            Container(
                              width: 2,
                              height: 60,
                              decoration: BoxDecoration(
                                color: secondary.withOpacity(0.15),
                              ),
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Total items:'),
                                Text(pastOrderList[index]['time'])
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }),
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
            'Reorder',
            style: TextStyle(
                color: white, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
