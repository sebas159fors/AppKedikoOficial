import 'package:appkedikooficial/pages/paginas_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modulo1_fake_backend/models.dart';

class MenuInicio extends StatefulWidget {
  final User loggedUser;
  //para que el usuario se logee antes de ingresar al menu inicio
  const MenuInicio(this.loggedUser, {Key key}) : super(key: key);

  @override
  State<MenuInicio> createState() => _MenuInicioeState();
}

class _MenuInicioeState extends State<MenuInicio> {
  final navigationkey = GlobalKey<CurvedNavigationBarState>();
  //iniciar en la pagina cero
  int index = 0;

  final screens = [
    RecetasInicio(),
    RecetasFavoritas(),
    VideosDeRecetas(),
  ];

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(Icons.home),
      Icon(Icons.favorite),
      Icon(Icons.movie),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('App Kediko'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.orange.shade200,
                Colors.indigoAccent,
              ],
            ),
          ),
        ),
        //para que el titulo de las recetas aparesca centrado
        centerTitle: true,
      ),
    );
  }
}
