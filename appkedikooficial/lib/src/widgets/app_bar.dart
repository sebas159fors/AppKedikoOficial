//delegate
import 'package:appkedikooficial/src/delegates/search_recipes_delegate.dart';
import 'package:flutter/material.dart';

Widget appBar(BuildContext context, GlobalKey<ScaffoldState> key) {
  //efecto sliver al app bar
  return SliverAppBar(
    backgroundColor: Color.fromRGBO(244, 252, 255, 1.0),
    floating: false,
    leading: GestureDetector(
      onTap: () {
        //abrir el drawer en la imagen de menu hambuergesa
        key.currentState.openDrawer();
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Image(
          image: AssetImage("assets/images/menu1.png"),
          width: 10.0,
          height: 10.0,
        ),
      ),
    ),
    actions: <Widget>[
      //icono de buscador
      Container(
          padding: EdgeInsets.all(15.0),
          child: IconButton(
            icon: Icon(
              Icons.search,
              color: Color.fromRGBO(183, 195, 206, 1.0),
              size: 25.0,
            ),
            onPressed: () {
              showSearch(context: context, delegate: RecetasSearchDelegate());
            },
          )),
    ],
  );
}
