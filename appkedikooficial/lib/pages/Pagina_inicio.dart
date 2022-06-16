import 'package:appkedikooficial/src/providers/recetas_providers.dart';
//ViewModel
import 'package:appkedikooficial/src/viewModels/recetas_listado.dart';

import 'package:appkedikooficial/src/widgets/slider_populares.dart';
import 'package:appkedikooficial/src/widgets/swiper_categorias.dart';
import 'package:appkedikooficial/src/widgets/titles.dart';
import 'package:flutter/material.dart';
//estilos
import 'package:appkedikooficial/styles/styles.dart';
//Widgets
import '../src/widgets/app_bar.dart';
import 'package:appkedikooficial/src/widgets/menu_lateral.dart';

//se cambio de nombre a Menu Inicio para poder llamarla despues del auth
class MenuInicio extends StatelessWidget {
  //iniciar la porpiedad key
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: menuLateral(context),
      key: _scaffoldKey,
      backgroundColor: colorBG,
      //para crear una pagina con scroll
      body: CustomScrollView(
        slivers: <Widget>[
          //viene de app_bar.dart
          // llamar a _scaffoldkey para abrir el drawer con la imagen
          appBar(context, _scaffoldKey),
          SliverList(
            // a partir de este array podremos poner todos los widgets que creamos
            delegate: SliverChildListDelegate([
              //Column te deja poner mas widgets
              Column(
                children: <Widget>[
                  swiperPopulares(),
                  titles('Categorías', titlesStyle),
                  SliderCategorias(),
                  titles('Recetas Populares', titlesStyle),
                  //para darle un poco de separacion a recetas populares
                  //recetasListado(context),

                  //FutureBuilder se utiliza para llamar datos de una base de datos ya sea json o firebase
                  FutureBuilder(
                    future: recetasProvider.cargarRecetas(),
                    initialData: [],
                    //builder es el constructor para ordenar los datos de firebase
                    builder: (BuildContext context,
                        AsyncSnapshot<List<dynamic>> snapshot) {
                      //se tiene que poner colum para que reciba los Widgets
                      return Column(
                        children: recetasListado(context, snapshot.data),
                      );
                    },
                  ),
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
