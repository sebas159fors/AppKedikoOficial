import 'package:appkedikooficial/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:appkedikooficial/src/app.dart';

Drawer menuLateral(context) {
  final User usuario = FirebaseAuth.instance.currentUser;
  String email = "";
  if (usuario != null) email = usuario.email;

  return Drawer(
    elevation: 0.0,
    child: Container(
      color: Color.fromARGB(255, 227, 197, 151),
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
            leading: Icon(Icons.person, color: Color.fromARGB(255, 78, 49, 4)),
            title: Text(
              'Bienvenido \n' + email,
              style: TextStyle(fontSize: 18),
            ),
          ),

          ListTile(
            leading:
                Icon(Icons.fastfood, color: Color.fromARGB(255, 78, 49, 4)),
            title: Text('Pasos para usar el App'),
            onTap: () {
              Navigator.pushNamed(context, 'Pasos');
            },
          ),
          ListTile(
            leading: Icon(Icons.api, color: Color.fromARGB(255, 78, 49, 4)),
            title: Text('Api Recetas Internacionales'),
            onTap: () {
              Navigator.pushNamed(context, 'API');
            },
          ),
          ListTile(
            leading: Icon(Icons.miscellaneous_services_outlined,
                color: Color.fromARGB(255, 78, 49, 4)),
            title: Text('Mision y Vision'),
            onTap: () {
              Navigator.pushNamed(context, 'MisionyVision');
            },
          ),
          AboutListTile(
            child: Text("Información del APP"),
            applicationIcon:
                Icon(Icons.favorite, color: Color.fromARGB(255, 78, 49, 4)),
            applicationVersion: "v 1.0.4",
            applicationName: "App Kediko",
            icon: Icon(Icons.info, color: Color.fromARGB(255, 78, 49, 4)),
          ),

          ListTile(
            leading: Icon(Icons.logout, color: Color.fromARGB(255, 78, 49, 4)),
            title: Text('Salir'),
            onTap: () async {
              await FirebaseAuth.instance.signOut().then((value) =>
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login())));
            },
          ),

          //se pueden añadir mas opciones siempre especificando la ruta en routes
        ],
      ),
    ),
  );
}
