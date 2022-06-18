import 'package:appkedikooficial/styles/styles.dart';
import 'package:flutter/material.dart';

Drawer menuLateral(context) {
  return Drawer(
    elevation: 0.0,
    child: Container(
      color: colorBG,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://firebasestorage.googleapis.com/v0/b/ke-diko.appspot.com/o/pizaa%20americana.jpg?alt=media&token=079ea2ac-26dc-4615-83dd-5c411b542241"),
                  fit: BoxFit.cover),
            ),
            child: Container(
              child: Text('APP KEDIKO', style: estiloTextoMenuLateral),
            ),
          ),
          ListTile(
            leading: Icon(Icons.fastfood, color: colorIconos),
            title: Text('Categorías'),
            onTap: () {
              Navigator.pushNamed(context, 'categoria');
            },
          ),
          ListTile(
            leading: Icon(Icons.help, color: colorIconos),
            title: Text('Ayuda'),
            onTap: () {
              Navigator.pushNamed(context, 'categoria');
            },
          ),
          ListTile(
            leading: Icon(Icons.api, color: colorIconos),
            title: Text('Api Recetas Internacionales'),
            onTap: () {
              Navigator.pushNamed(context, 'API');
            },
          ),
          //se pueden añadir mas opciones siempre especificando la ruta en routes
        ],
      ),
    ),
  );
}
