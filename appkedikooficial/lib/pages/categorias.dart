import 'package:appkedikooficial/src/widgets/app_bar_categorias.dart';
import 'package:appkedikooficial/src/widgets/receta_listado.dart';
import 'package:appkedikooficial/src/widgets/slider_populares.dart';
import 'package:appkedikooficial/src/widgets/titles.dart';
import 'package:appkedikooficial/styles/styles.dart';
import 'package:flutter/material.dart';

class CategoriaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBG,
      body: CustomScrollView(
        slivers: <Widget>[
          appBarCategoria('Comida Vegetariana'),
          SliverList(
            delegate: SliverChildListDelegate([
              titles('Comida Vegetariana', titlesStyleCategoria),
              // swiperPopulares(),
              recetasListado(context),
              recetasListado(context),
              recetasListado(context),
              recetasListado(context)
            ]),
          )
        ],
      ),
    );
  }
}
