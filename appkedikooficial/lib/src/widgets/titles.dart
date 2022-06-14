import 'package:flutter/material.dart';
//estilos
import 'package:appkedikooficial/styles/styles.dart';

Widget titles(String Texto, TextStyle estilos) {
  //estilos del texto
  return Container(
      alignment: AlignmentDirectional.topStart,
      margin: EdgeInsets.only(left: 30.0),
      child: Text(
        Texto,
        style: estilos,
      ));
}
