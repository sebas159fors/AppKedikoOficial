import 'package:appkedikooficial/src/providers/recetas_providers.dart';
import 'package:appkedikooficial/src/viewModels/recetas_listado.dart';
import 'package:appkedikooficial/src/widgets/app_bar_categorias.dart';

import 'package:appkedikooficial/src/widgets/titles.dart';
import 'package:appkedikooficial/styles/styles.dart';
import 'package:flutter/material.dart';

class CategoriaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //aqui se recibe el objeto desde la firebase
    final Map<String, dynamic> categoria =
        ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: colorBG,
      body: CustomScrollView(
        slivers: <Widget>[
          //llamando los parametros desde la firebase
          appBarCategoria(categoria['nombre']),
          SliverList(
            delegate: SliverChildListDelegate([
              titles(categoria['nombre'], titlesStyleCategoria),
              FutureBuilder(
                future: recetasProvider
                    .cargarRecetasCategorias(categoria['nombre']),
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
            ]),
          )
        ],
      ),
    );
  }
}
