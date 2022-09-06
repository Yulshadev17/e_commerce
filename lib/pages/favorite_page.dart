// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:e_commerce/dummy/favourite_json.dart';
import 'package:e_commerce/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
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
        'Favorite',
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
            'Add to Cart',
            style: TextStyle(
                color: white, fontSize: 18, fontWeight: FontWeight.w600),
          ),
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
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Wrap(
              spacing: 20,
              runSpacing: 20,
              children: List.generate(favouriteJson.length, (index) {
                return Column(
                  children: [
                    Container(
                      width: (size.width - 50) / 2,
                      height: 250,
                      child: Stack(
                        children: [
                          Positioned(
                            top: 15,
                            child: Container(
                              width: (size.width - 50) / 2,
                              height: 220,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(22),
                                color: secondary.withOpacity(0.07),
                                border: Border.all(
                                  width:
                                      favouriteJson[index]['active'] ? 1.5 : .5,
                                  color: favouriteJson[index]['active']
                                      ? secondary
                                      : Colors.transparent,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        Icon(
                                          LineIcons.star,
                                          size: 22,
                                          color: secondary,
                                        ),
                                        SizedBox(width: 5),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 3),
                                          child: Text(
                                            favouriteJson[index]['rate'],
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: 35,
                                      height: 35,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      decoration: BoxDecoration(boxShadow: [
                                        BoxShadow(
                                            offset: Offset(0, 3),
                                            blurRadius: 5.5)
                                      ], color: white, shape: BoxShape.circle),
                                      child: favouriteJson[index]['active']
                                          ? Icon(LineIcons.heartAlt)
                                          : Icon(LineIcons.heart),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: -10,
                            child: Container(
                              width: (size.width - 50) / 2,
                              height: 190,
                              child: Image.asset(
                                favouriteJson[index]['image'],
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    Column(
                      children: [
                        Text(
                          favouriteJson[index]['name'],
                          style: TextStyle(
                              color: secondary,
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ),
                        Container(
                          width: (size.width - 50) / 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Text(
                                '\$',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              ),
                              SizedBox(width: 5),
                              Text(
                                favouriteJson[index]['price'],
                                style: TextStyle(
                                    color: secondary,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
