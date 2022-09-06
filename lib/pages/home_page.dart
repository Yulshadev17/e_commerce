// ignore_for_file: prefer_const_constructors, sort_child_properties_last, sized_box_for_whitespace, avoid_unnecessary_containers
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:animate_do/animate_do.dart';
import 'package:e_commerce/dummy/ads_json.dart';
import 'package:e_commerce/dummy/home_json.dart';
import 'package:e_commerce/pages/product_detail_page.dart';
import 'package:e_commerce/pages/side_menu_page.dart';
import 'package:e_commerce/theme/colors.dart';
import 'package:e_commerce/widgets/custom_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var pageIndex = 0;

  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: primary,
      appBar: PreferredSize(
        child: getAppBar(),
        preferredSize: Size.fromHeight(60),
      ),
      drawer: SideMenuPage(),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: primary,
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () {
          scaffoldKey.currentState?.openDrawer();
        },
        icon: Icon(
          Icons.menu,
          color: secondary,
        ),
      ),
      actions: [
        Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 1.5,
              color: secondary.withOpacity(0.5),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1557296387-5358ad7997bb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8ZmFjZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 20),
      ],
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              'Hello Azizbek,',
              style: TextStyle(
                  color: secondary, fontWeight: FontWeight.w500, fontSize: 22),
            ),
            Text(
              'Let\'s get something',
              style: TextStyle(color: secondary.withOpacity(0.6), fontSize: 15),
            ),
            SizedBox(height: 20),
            getSliders(),
            SizedBox(height: 20),
            getCategorySection(),
            SizedBox(height: 20),
            getItemLists(),
          ],
        ),
      ),
    );
  }

  Widget getSliders() {
    return SingleChildScrollView(
      child: CustomSlider(
        items: adsJson,
      ),
    );
  }

  Widget getCategorySection() {
    var size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Category',
          style: TextStyle(
              color: secondary, fontSize: 22, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Container(
              width: (size.width - 30) * 0.7,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    categoryItems.length,
                    (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 15, left: 0),
                        child: Container(
                          width: 70,
                          decoration: pageIndex == index
                              ? BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 1.5, color: secondary)),
                                )
                              : BoxDecoration(),
                          child: Text(
                            categoryItems[index]['title'],
                            style: TextStyle(
                                color: pageIndex == index
                                    ? secondary
                                    : secondary.withOpacity(0.5),
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            Flexible(
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: secondary.withOpacity(0.1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(22),
                    bottomRight: Radius.circular(22),
                    bottomLeft: Radius.circular(15),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 8),
                    Icon(
                      Icons.search,
                      size: 25,
                    ),
                    SizedBox(width: 3),
                    Text('Search...')
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }

  Widget getItemLists() {
    var size = MediaQuery.of(context).size;
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      children: List.generate(homeJson.length, (index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ProductDeatilPage(
                  name: homeJson[index]['name'],
                  img: homeJson[index]['image'],
                  price: homeJson[index]['price'],
                  rate: homeJson[index]['rate'],
                  colors: homeJson[index]['colors'],
                ),
              ),
            );
          },
          child: FadeInLeft(
            duration: Duration(milliseconds: 500),
            child: Column(
              children: [
                Container(
                  width: (size.width - 50) / 2,
                  height: 220,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 20,
                        child: Container(
                          width: (size.width - 50) / 2,
                          height: 200,
                          decoration: BoxDecoration(
                              color: secondary.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(22)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, bottom: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(LineIcons.star),
                                SizedBox(width: 5),
                                Text(
                                  homeJson[index]['rate'],
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                Spacer(),
                                Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: primary,
                                    boxShadow: [
                                      BoxShadow(
                                          color: secondary.withOpacity(0.5),
                                          blurRadius: 5,
                                          offset: Offset(0.8, .0))
                                    ],
                                  ),
                                  child: Icon(
                                    LineIcons.shoppingBag,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: -10,
                        left: -10,
                        width: (size.width - 50) / 2,
                        height: 180,
                        child: Image.asset(
                          homeJson[index]['image'],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: (size.width - 70) / 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        homeJson[index]['name'],
                        style: TextStyle(
                            color: secondary,
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      ),
                      Container(
                        width: (size.width - 40) / 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '\$',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                            SizedBox(width: 10),
                            Text(
                              homeJson[index]['price'],
                              style: TextStyle(
                                  color: secondary.withOpacity(0.5),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
