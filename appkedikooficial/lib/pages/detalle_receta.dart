import 'package:appkedikooficial/src/widgets/app_bar_detalle.dart';
import 'package:appkedikooficial/src/widgets/swiper_ingredientes.dart';
import 'package:appkedikooficial/src/widgets/titles.dart';
import 'package:appkedikooficial/styles/styles.dart';
import 'package:flutter/material.dart';

class DetallesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //pasando los argumentos de receta
    final Map<String, dynamic> receta =
        ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: colorBG,
      body: CustomScrollView(
        slivers: <Widget>[
          appBarDetalle(receta['foto']),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                    // Margenes de cuadro de detalles receta
                    padding: const EdgeInsets.only(right: 8.0, bottom: 8.0),
                    child: _cuerpoReceta(receta, titlesRecipeStyleDetalle)
                    //textoReceta(titlesRecipeStyleDetalle),
                    ),

                // se comento ingredientes ya que sale un error en el app que no cargan los ingredientes de firebase
                // titles('Ingredientes', titlesStyle),
                SizedBox(
                  height: 20.0,
                ),
                //SliderIngredientes(receta['ingredientes']),
                SizedBox(
                  height: 15.0,
                ),
                titles('Preparación', titlesStyle),
                //llamando a la preparacion de la receta desde la firebase
                _textoDescription(receta['preparacion'])
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//recibiendo receta y estilos al widget _cuerpoReceta
Widget _cuerpoReceta(Map<String, dynamic> receta, TextStyle estilos) {
  return Container(
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
  );
}

Widget _textoDescription(String texto) {
  return Container(
    margin: const EdgeInsets.only(top: 5.0, left: 30.0, right: 30.0),
    child: Text(
      texto,
      style: const TextStyle(
          fontFamily: 'Avenir',
          fontWeight: FontWeight.normal,
          color: Color.fromRGBO(15, 55, 91, 1),
          fontSize: 15.0),
    ),
  );
}
