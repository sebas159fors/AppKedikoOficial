import 'package:flutter/material.dart';

class RecetasInicio extends StatelessWidget {
  const RecetasInicio({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Recetas Inicio",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
