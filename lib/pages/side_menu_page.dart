// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:animate_do/animate_do.dart';
import 'package:e_commerce/dummy/side_menu_json.dart';
import 'package:e_commerce/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class SideMenuPage extends StatefulWidget {
  const SideMenuPage({super.key});

  @override
  State<SideMenuPage> createState() => _SideMenuPageState();
}

class _SideMenuPageState extends State<SideMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          getHeader(),
          getBody(),
          getFooter(),
        ],
      ),
    );
  }

  Widget getHeader() {
    return SizedBox(
      child: DrawerHeader(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5),
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1557296387-5358ad7997bb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8ZmFjZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Hey,',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Text(
            'Azizbek',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
          ),
        ],
      )),
    );
  }

  Widget getBody() {
    return Column(
      children: List.generate(sideMenuItems.length, (index) {
        if (sideMenuItems[index]['selected']) {
          return FadeInLeft(
            duration: Duration(milliseconds: 300),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: white,
                  border:
                      Border.all(color: secondary.withOpacity(0.3), width: 0.5),
                  boxShadow: [
                    BoxShadow(
                      color: secondary.withOpacity(0.5),
                      blurRadius: 5,
                      offset: Offset(0.9, 0),
                    ),
                  ],
                ),
                child: ListTile(
                  minLeadingWidth: 10,
                  onTap: (() {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => sideMenuItems[index]['page'],
                      ),
                    );
                  }),
                  leading: Icon(
                    sideMenuItems[index]['icon'],
                    color: secondary,
                    size: 25,
                  ),
                  title: Text(
                    sideMenuItems[index]['label'],
                    style: TextStyle(
                        color: secondary,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                ),
              ),
            ),
          );
        }
        return FadeInLeft(
          duration: Duration(
            milliseconds: index * 300,
          ),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ListTile(
              onTap: () {},
              minLeadingWidth: 10,
              leading: Icon(
                sideMenuItems[index]['icon'],
                color: secondary,
                size: 25,
              ),
              title: Text(
                sideMenuItems[index]['label'],
                style: TextStyle(
                    color: secondary,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget getFooter() {
    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        Divider(),
        FadeInLeft(
          duration: Duration(milliseconds: 300),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Container(
              child: ListTile(
                minLeadingWidth: 10,
                onTap: () {},
                leading: Icon(
                  LineIcons.alternateSignOut,
                  color: secondary,
                  size: 25,
                ),
                title: Text(
                  'LogOut',
                  style: TextStyle(
                      color: secondary,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
