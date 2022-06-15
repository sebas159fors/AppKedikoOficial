import 'package:flutter/material.dart';

//fijar el color para toda la pagina
final colorBG = Color.fromRGBO(244, 252, 255, 1.0);
//color del texto
final colorTitle = Color.fromRGBO(15, 55, 91, 1);
//color de la descripcion
final colorDescripcionRecetas = Color.fromRGBO(183, 195, 206, 1);
//color de los iconos APPBAR
final colorIconosAppBar = Color.fromRGBO(183, 195, 206, 1);
//color de los iconos
final colorIconos = Color.fromRGBO(243, 198, 36, 1);

//poniendo estilo a todo el texto de la App

final titlesStyle = TextStyle(
    fontFamily: 'PlayfairDisplay-Bold',
    fontWeight: FontWeight.bold,
    color: colorTitle,
    fontSize: 24.0);
//estilo de las letras de la categoria
final titlesStyleCategoria = TextStyle(
    fontFamily: 'PlayfairDisplay-Bold',
    fontWeight: FontWeight.bold,
    color: colorTitle,
    fontSize: 34.0);

//estilo de las letras de la receta
final titlesRecipeStyle = TextStyle(
    fontFamily: 'PlayfairDisplay-Bold',
    fontWeight: FontWeight.bold,
    color: colorTitle,
    fontSize: 18.0);

final descripcionRecipeStyle = TextStyle(
    fontFamily: 'Avenir',
    fontWeight: FontWeight.bold,
    color: colorDescripcionRecetas,
    fontSize: 14.0);

//estilo de las letras de la receta de detalle
final titlesRecipeStyleDetalle = TextStyle(
    fontFamily: 'PlayfairDisplay-Bold',
    fontWeight: FontWeight.bold,
    color: colorTitle,
    fontSize: 22.0);

//estilo del Menu Lateral
final estiloTextoMenuLateral = TextStyle(
    fontFamily: 'PlayfairDisplay-Bold',
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontSize: 28.0);
