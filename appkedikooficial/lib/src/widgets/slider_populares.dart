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
            children: <Widget>[
              _tarjeta(),
              _tarjeta2(),
              _tarjeta3(),
              _tarjeta4()
            ],
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

Widget _tarjeta2() {
  return Container(
    //margen del carousel de imagenes
    margin: EdgeInsets.only(right: 30.0),
    alignment: AlignmentDirectional.centerEnd,
    child: Image(
      image: NetworkImage(
          "https://firebasestorage.googleapis.com/v0/b/ke-diko.appspot.com/o/Im%C3%A1genes%20del%20Carrusel%2Fdiseno-de-banner-de-cocina-facil.jpg?alt=media&token=764fd1ba-4923-401f-88a2-1dc281b013a0"),
      fit: BoxFit.fill,
    ),
  );
}

Widget _tarjeta3() {
  return Container(
    //margen del carousel de imagenes
    margin: EdgeInsets.only(right: 30.0),
    alignment: AlignmentDirectional.centerEnd,
    child: Image(
      image: NetworkImage(
          "https://firebasestorage.googleapis.com/v0/b/ke-diko.appspot.com/o/Im%C3%A1genes%20del%20Carrusel%2FPasta-con-alb%C3%B3ndigas-300x198.jpg?alt=media&token=6797aa50-08b9-488f-a99a-ff33ed1b642d"),
      fit: BoxFit.fill,
    ),
  );
}

Widget _tarjeta4() {
  return Container(
    //margen del carousel de imagenes
    margin: EdgeInsets.only(right: 30.0),
    alignment: AlignmentDirectional.centerEnd,
    child: Image(
      image: NetworkImage(
          "https://firebasestorage.googleapis.com/v0/b/ke-diko.appspot.com/o/Im%C3%A1genes%20del%20Carrusel%2Fensalda-de-atun.jpg?alt=media&token=3bddb6f7-c69e-4c77-9251-879230888360"),
      fit: BoxFit.fill,
    ),
  );
}
