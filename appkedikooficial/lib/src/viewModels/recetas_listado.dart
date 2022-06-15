//Estilos
import 'package:appkedikooficial/styles/styles.dart';
import 'package:flutter/material.dart';

//recibimos los datos de provider y aqui los ordenamos
List<Widget> recetasListado(
    BuildContext context, List<dynamic> recetasPopulares) {
  final List<Widget> listadoRecetas = [];

  recetasPopulares.forEach((receta) {
    final listadoWidgetProvisional =
        _cuerpoRecetaListado(context, titlesRecipeStyle, receta);
    listadoRecetas.add(listadoWidgetProvisional);
  });

  return listadoRecetas;
}

//el cuerpo de las recetas
Widget _cuerpoRecetaListado(
    BuildContext context, TextStyle estilos, Map<String, dynamic> receta) {
  return Column(
    children: <Widget>[
      SizedBox(
        height: 20.0,
      ),
      GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, 'detalle');
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image(
            //aqui se pone el nombre de la clave con que has guardado la foto
            image: NetworkImage(receta['foto']),
            fit: BoxFit.fill,
            width: 350.0,
            height: 180.0,
          ),
        ),
      ),
      Container(
        alignment: AlignmentDirectional.topStart,
        margin: EdgeInsets.only(left: 30.0, top: 0.0),
        child: Column(
          //aliniear el contenido de receta
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //titulo de la receta
            Text(
              receta['titulo'],
              textAlign: TextAlign.left,
              style: estilos,
            ),
            //descropcion de la receta
            Text(
              receta['descripcion'],
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
                            receta['duracion'],
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
                            receta['dificultad'],
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
