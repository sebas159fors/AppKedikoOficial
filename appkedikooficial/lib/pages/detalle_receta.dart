import 'package:appkedikooficial/src/widgets/app_bar_detalle.dart';
import 'package:appkedikooficial/src/widgets/swiper_ingredientes.dart';
import 'package:appkedikooficial/src/widgets/texto_receta.dart';
import 'package:appkedikooficial/src/widgets/titles.dart';
import 'package:appkedikooficial/styles/styles.dart';
import 'package:flutter/material.dart';

class DetallesPage extends StatelessWidget {
  final String descripcion =
      'Usa frutas cuyos sabores se diferencien fácilmente unos de otros. Es decir, si usas nectarinas y duraznos vas a tener sabores similares, igual que si usas mandarinas y naranjas. ¿Lo ideal? Te doy un ejemplo: fresas, mandarinas, peras y nectarinas.Otro ejemplo: sandía, kiwi y nectarinas. Puedes ir probando qué te gusta más, y claro, usando lo que tengas en la nevera.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBG,
      body: CustomScrollView(
        slivers: <Widget>[
          appBarDetalle('Ensaladas'),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                    // Margenes de cuadro de detalles receta
                    padding: const EdgeInsets.only(right: 8.0, bottom: 8.0),
                    child: Text('hola')
                    //textoReceta(titlesRecipeStyleDetalle),
                    ),
                titles('Ingredientes', titlesStyle),
                SizedBox(
                  height: 20.0,
                ),
                sliderIngredientes(),
                SizedBox(
                  height: 15.0,
                ),
                titles('Preparación', titlesStyle),
                _textoDescription(descripcion)
              ],
            ),
          ),
        ],
      ),
    );
  }
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
