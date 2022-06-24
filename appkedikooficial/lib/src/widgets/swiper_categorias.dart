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
}
