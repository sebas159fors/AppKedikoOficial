//widgets
import 'package:appkedikooficial/src/widgets/texto_receta.dart';

import 'package:flutter/material.dart';

Widget recetasListado(BuildContext context) {
  return Column(
    children: <Widget>[
      SizedBox(
        height: 20.0,
      ),
      GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, 'detalle');
        },
        child: Image(
          image: NetworkImage(
              "https://firebasestorage.googleapis.com/v0/b/ke-diko.appspot.com/o/recetas%20vegetarianas%2Fensalada%20de%20verduras.jpg?alt=media&token=312832d2-6a0c-40e5-b6ed-1f2c3ccb2a33"),
          fit: BoxFit.fill,
          width: 380.0,
          height: 180.0,
        ),
      ),
      textoReceta()
    ],
  );

  //clase
}
