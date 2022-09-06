// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() => runApp(
      MaterialApp(
        theme: ThemeData(fontFamily: "Poppins"),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
