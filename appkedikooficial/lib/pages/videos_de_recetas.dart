import 'package:flutter/material.dart';

class VideosDeRecetas extends StatelessWidget {
  const VideosDeRecetas({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Videos de Recetas",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
