import 'package:flutter/material.dart';

List<Widget> ingredientesListado(List<dynamic> ingredientes) {
  final List<Widget> listadoIngredientes = [];
  final List<dynamic> ingredientesListado = ingredientes;

  //me devuelve cada uno de los maps de la firebase en el apartado de ingredientes
  ingredientesListado.forEach((ingrediente) {
    final Widget widgetProv = _imagen(ingrediente);
    listadoIngredientes.add(widgetProv);
  });
  //lista de ingredientes que se retorna y se muestra en el Pageview
  return listadoIngredientes;
}

Widget _imagen(Map<String, dynamic> ingrediente) {
  return Center(
    child: Stack(
      children: [
        Container(
          width: 130.0,
          height: 100.0,
          margin: EdgeInsets.only(right: 10.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image(
              image: NetworkImage(ingrediente['fotoingrediente']),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.all(20.0),
          child: Text(ingrediente['ingrediente'],
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black,
                      offset: Offset(5.0, 5.0),
                    )
                  ])),
        )
      ],
    ),
  );
}
