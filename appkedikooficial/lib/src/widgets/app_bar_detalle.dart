import 'package:appkedikooficial/styles/styles.dart';
import 'package:flutter/material.dart';

//pasando el argumento foto al detalle receta
Widget appBarDetalle(String foto) {
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
        placeholder: NetworkImage(foto),
        image: NetworkImage(foto),
        fadeInDuration: Duration(milliseconds: 150),
        fit: BoxFit.cover,
      ),
    ),
  );
}
