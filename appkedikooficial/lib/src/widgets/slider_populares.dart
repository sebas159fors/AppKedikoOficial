import 'package:flutter/material.dart';

//Swiper
import 'package:flutter_swiper/flutter_swiper.dart';

class swiperPopulares extends StatelessWidget {
  //controlador de la tarjeta
  final controller = PageController(initialPage: 1, viewportFraction: 1);

  @override
  Widget build(BuildContext context) {
    return Container(
      //tamaño de los widgets
      height: 200.0,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return PageView(
            controller: controller,
            children: <Widget>[_tarjeta(), _tarjeta(), _tarjeta(), _tarjeta()],
          );
        },
        itemCount: 1,
        layout: SwiperLayout.DEFAULT,
      ),
    );
  }
}

//widget de la tarjeta para el nuevo carosuel slider
Widget _tarjeta() {
  return Container(
    //margen del carousel de imagenes
    margin: EdgeInsets.only(right: 30.0),
    alignment: AlignmentDirectional.centerEnd,
    child: Image(
      image: NetworkImage(
          "https://firebasestorage.googleapis.com/v0/b/ke-diko.appspot.com/o/recetas%20vegetarianas%2Fbrocheta%20de%20verduras.jpg?alt=media&token=3a1c99e4-e6cf-4729-85c6-56570e820474"),
      fit: BoxFit.fill,
    ),
  );
}
