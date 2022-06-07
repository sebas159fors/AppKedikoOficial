import 'package:appkedikooficial/API/Api_listaReceta.dart';
import 'package:appkedikooficial/pages/paginas_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class MenuInicio extends StatefulWidget {
  // final User loggedUser;
  //para que el usuario se logee antes de ingresar al menu inicio
  const MenuInicio(/*this.loggedUser,*/ {Key key}) : super(key: key);

  @override
  State<MenuInicio> createState() => _MenuInicioeState();
}

class _MenuInicioeState extends State<MenuInicio> {
  final navigationkey = GlobalKey<CurvedNavigationBarState>();
  final User usuario = FirebaseAuth.instance.currentUser;
  String email = "";
  //si usuario es distinto que null
  // if (usuario != null) email = usuario.email;
  //iniciar en la pagina cero
  int index = 0;

  final screens = [
    //se pueden agregar mas opciones
    RecetasInicio(),
    RecetasFavoritas(),
    VideosDeRecetas(),
  ];

  /* int _selectDrawerItem = 0;
  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return ApiListaReceta();
    }
  }*/

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      //se pueden agregar mas iconos
      const Icon(
        Icons.home,
        //tamaño de los iconos
        size: 30,
      ),
      const Icon(
        Icons.favorite,
        size: 30,
      ),
      const Icon(
        Icons.movie,
        size: 30,
      ),
    ];
    return Scaffold(
      //menu drawer
      drawer: DrawerRecetas(),
      // body: _getDrawerItemWidget(_selectDrawerItem),
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

        //Boton de logout esta para colocar a la izquierda
        /* leading: new Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              child: TextButton.icon(
                onPressed: () {
                  _salir(context);
                },
                label: Text('Salir',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                icon: Icon(
                  Icons.logout,
                  color: Colors.white70,
                ),
              ),
            ),
          ],
        ),*/
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

  void _salir(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pop(context);
  }
}
