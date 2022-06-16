//Provider
import 'package:appkedikooficial/src/providers/recetas_providers.dart';
//ViewModel
import 'package:appkedikooficial/src/viewModels/categorias_listado.dart';
import 'package:flutter/material.dart';

//Swiper
import 'package:flutter_swiper/flutter_swiper.dart';

class SliderCategorias extends StatelessWidget {
  final controller = PageController(initialPage: 1, viewportFraction: 0.3);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.0,
      child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return FutureBuilder(
              future: recetasProvider.cargarCategorias(),
              initialData: [],
              //builder es el constructor para ordenar los datos de firebase
              builder: (BuildContext context,
                  AsyncSnapshot<List<dynamic>> snapshot) {
                //se tiene que poner PageView para que reciba los Widgets
                return PageView(
                    controller: controller,
                    children: categoriaListado(context));
              },
            );
          },
          itemCount: 3,
          layout: SwiperLayout.DEFAULT),
    );
  }

/*
  Widget _imagenCategoria(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'categoria');
      },
      child: Container(
          child: Image(
        image: NetworkImage(
            "https://firebasestorage.googleapis.com/v0/b/ke-diko.appspot.com/o/recetas%20vegetarianas%2Fpasta%20vegana.jpg?alt=media&token=5fd5b3a8-ecb4-44b6-8730-19935b1e4284"),
      )),
    );
  }*/
}
