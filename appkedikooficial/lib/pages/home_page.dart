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
    //se pueden agregar mas opciones
    RecetasInicio(),
    RecetasFavoritas(),
    VideosDeRecetas(),
  ];

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      //se pueden agregar mas iconos
      Icon(
        Icons.home,
        //tamaño de los iconos
        size: 30,
      ),
      Icon(
        Icons.favorite,
        size: 30,
      ),
      Icon(
        Icons.movie,
        size: 30,
      ),
    ];
    return Scaffold(
      //menu drawer
      drawer: DrawerRecetas(),
      //extender mas el body
      extendBody: true,
      appBar: AppBar(
        title: Text('App Kediko'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                //colores del app bar o encabezado
                Colors.orange.shade400,
                Colors.orangeAccent,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        //para que el titulo de las recetas aparesca centrado
        centerTitle: true,
      ),
      body: screens[index],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: IconThemeData(color: Colors.white),
        ),
        child: CurvedNavigationBar(
          key: navigationkey,
          //tamaño de la barra inferior
          height: 60,
          //dar animacion especial a los iconos
          animationCurve: Curves.easeInOut,
          //color de la barra inferior
          color: Colors.orange.shade400,
          //color de los iconos (borde)
          buttonBackgroundColor: Colors.orange.shade400,
          //para que el fondo del boton sea transparente
          backgroundColor: Colors.transparent,
          //duracion de la animacion de pase a otra ventana
          animationDuration: Duration(milliseconds: 400),
          index: index,
          items: items,
          //para llamar al ontap y nos lleve de una pagina a otra
          onTap: (index) => setState(() => this.index = index),
        ),
      ),
    );
  }
}
