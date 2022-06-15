import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

//firebase
import 'package:cloud_firestore/cloud_firestore.dart';

class _RecetasProvider {
  List<dynamic> recetas = [];
  List<dynamic> categorias = [];
  List<dynamic> recetasCategoria = [];

//creando la instancia de firestore
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<dynamic>> cargarRecetas() async {
    final List<dynamic> recetasTempList = [];

    await firestore
        .collection("recetas")
        .get()
        .then((QuerySnapshot querySnapshot) => {
              //llamar a cada una de las recetas que hay en la Firebase
              querySnapshot.docs.forEach((doc) {
                //entra string por un salo y sale dinamico por el otro
                Map<String, dynamic> recetasMap = doc.data();
                //añadiendo los Map
                recetasTempList.add(recetasMap);
              })
            });
    recetas = recetasTempList;
    return recetas;
  }
}

final recetasProvider = _RecetasProvider();
