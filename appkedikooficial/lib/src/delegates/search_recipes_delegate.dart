//estilos
import 'package:appkedikooficial/src/providers/recetas_providers.dart';
import 'package:appkedikooficial/src/viewModels/recetas_buscador_view_model.dart';
import 'package:appkedikooficial/styles/styles.dart';
import 'package:flutter/material.dart';

class RecetasSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    //borrar texto
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            this.query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //flecha para regresar hacia atras
    return IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          this.close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
        future: recetasProvider.cargarRecetas(),
        initialData: [],
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          List<dynamic> recetas = snapshot.data;
          var recetaBuscada = this.query.toLowerCase();

          return CustomScrollView(slivers: [
            SliverList(
              delegate: SliverChildListDelegate([
                Column(
                  children:
                      recetasListadoBuscador(context, recetas, recetaBuscada),
                )
              ]),
            )
          ]);
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //receta favorita de fondo
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Text(
        'Busca tu receta favorita....',
        style: descripcionRecipeStyle,
      ),
    );
  }
}
