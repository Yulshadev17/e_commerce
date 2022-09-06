// ignore_for_file: prefer_const_constructors

import 'package:e_commerce/pages/card_page.dart';
import 'package:e_commerce/pages/favorite_page.dart';
import 'package:e_commerce/pages/home_page.dart';
import 'package:e_commerce/pages/order_page.dart';
import 'package:line_icons/line_icons.dart';

List sideMenuItems = [
  {
    "label": "Home",
    "selected": true,
    "icon": LineIcons.home,
    "page": HomePage(),
  },
  {
    "label": "My Cart",
    "selected": true,
    "icon": LineIcons.shoppingCart,
    "page": CardPage(),
  },
  {
    "label": "Favourite",
    "selected": true,
    "icon": LineIcons.heart,
    "page": FavoritePage(),
  },
  {
    "label": "Orders",
    "selected": true,
    "icon": LineIcons.history,
    "page": OrderPage(),
  },
];
