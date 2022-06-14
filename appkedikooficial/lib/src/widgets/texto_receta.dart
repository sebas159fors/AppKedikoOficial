//importamos estilos
import 'package:appkedikooficial/styles/styles.dart';
import 'package:flutter/material.dart';

Widget textoReceta() {
  return Column(
    children: <Widget>[
      Container(
        alignment: AlignmentDirectional.topStart,
        margin: EdgeInsets.only(left: 30.0, top: 0.0),
        child: Column(
          //aliniear el contenido de receta
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //titulo de la receta
            Text(
              'Ensalada de frutas',
              textAlign: TextAlign.left,
              style: titlesRecipeStyle,
            ),
            //descropcion de la receta
            Text(
              'Buena receta para hacer una ensalada marianada de frutas',
              textAlign: TextAlign.left,
              style: descripcionRecipeStyle,
            ),
            SizedBox(
              height: 10.0,
            ),
            //subtexto
            Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.alarm, color: colorIconos),
                        Container(
                          margin: EdgeInsets.only(left: 5.0),
                          child: Text(
                            '20 min',
                            style: TextStyle(
                                fontFamily: 'Avenir',
                                fontWeight: FontWeight.bold,
                                color: colorTitle,
                                fontSize: 14.0),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.fastfood, color: colorIconos),
                        Container(
                          margin: EdgeInsets.only(left: 5.0),
                          child: Text(
                            'Facil',
                            style: TextStyle(
                                fontFamily: 'Avenir',
                                fontWeight: FontWeight.bold,
                                color: colorTitle,
                                fontSize: 14.0),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ],
  );
}
