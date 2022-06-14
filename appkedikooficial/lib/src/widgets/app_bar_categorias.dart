import 'package:appkedikooficial/styles/styles.dart';
import 'package:flutter/material.dart';

Widget appBarCategoria(String title) {
  return SliverAppBar(
      backgroundColor: colorBG,
      floating: false,
      pinned: true,
      elevation: 0.0,
      /*title: Text(
        title,
        style: TextStyle(
          fontFamily: 'PlayfairDisplay-Bold',
          fontWeight: FontWeight.bold,
          color: colorTitle,
        ),
      ),*/
      iconTheme: IconThemeData(color: colorIconosAppBar));
}
