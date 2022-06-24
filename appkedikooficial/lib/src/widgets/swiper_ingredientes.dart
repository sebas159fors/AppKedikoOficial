import 'package:appkedikooficial/src/viewModels/ingredientes_listado.dart';
import 'package:flutter/material.dart';

//Swiper
import 'package:flutter_swiper/flutter_swiper.dart';

final controller = PageController(initialPage: 1, viewportFraction: 0.3);

Widget SliderIngredientes(List<dynamic> ingredientes) {
  return Container(
    height: 120.0,
    padding: EdgeInsets.only(left: 5.0),
    child: Swiper(
        itemCount: 3,
        layout: SwiperLayout.DEFAULT,
        itemBuilder: (BuildContext context, int index) {
          return PageView(
            controller: controller,
            children: ingredientesListado(ingredientes),
          );
        }),
  );
}
