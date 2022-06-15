import 'package:flutter/material.dart';

//Swiper
import 'package:flutter_swiper/flutter_swiper.dart';

final controller = PageController(initialPage: 1, viewportFraction: 0.3);

Widget sliderIngredientes() {
  return Container(
    height: 120.0,
    padding: EdgeInsets.only(left: 5.0),
    child: Swiper(
        itemCount: 3,
        layout: SwiperLayout.DEFAULT,
        itemBuilder: (BuildContext context, int index) {
          return PageView(
            controller: controller,
            children: [
              _imagen(),
              _imagen(),
              _imagen(),
              _imagen(),
            ],
          );
        }),
  );
}

Widget _imagen() {
  return Center(
    child: Image(
      alignment: Alignment.topLeft,
      image: NetworkImage(
          "https://firebasestorage.googleapis.com/v0/b/ke-diko.appspot.com/o/Ingredientes%2Fingre1.png?alt=media&token=736d4b8f-1185-4789-ad19-80392cea4a16"),
    ),
  );
}
