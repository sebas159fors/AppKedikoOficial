import 'package:appkedikooficial/styles/styles.dart';
import 'package:flutter/material.dart';

Widget appBarDetalle(String title) {
  return SliverAppBar(
    backgroundColor: colorBG,
    //para expandir en el encabezado
    expandedHeight: 200.0,
    floating: false,
    pinned: true,
    elevation: 0.0,

    iconTheme: IconThemeData(color: colorIconosAppBar),
    //flexible da un espacio adicional para poder cualquier cosa ejm fotos
    flexibleSpace: FlexibleSpaceBar(
      background: FadeInImage(
        placeholder: NetworkImage(
            "https://firebasestorage.googleapis.com/v0/b/ke-diko.appspot.com/o/recetas%20vegetarianas%2Fensalada%20de%20verduras.jpg?alt=media&token=312832d2-6a0c-40e5-b6ed-1f2c3ccb2a33"),
        image: NetworkImage(
            "https://firebasestorage.googleapis.com/v0/b/ke-diko.appspot.com/o/recetas%20vegetarianas%2Fensalada%20de%20verduras.jpg?alt=media&token=312832d2-6a0c-40e5-b6ed-1f2c3ccb2a33"),
        fadeInDuration: Duration(milliseconds: 150),
        fit: BoxFit.cover,
      ),
    ),
  );
}
