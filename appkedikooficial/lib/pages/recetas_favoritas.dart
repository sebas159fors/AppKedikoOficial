import 'package:flutter/material.dart';

class RecetasFavoritas extends StatelessWidget {
  const RecetasFavoritas({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Recetas Favoritas",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
