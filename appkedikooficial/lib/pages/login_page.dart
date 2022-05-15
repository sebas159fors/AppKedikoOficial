import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(
        title: Text('Material App Bar')
      ),*/
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            //para dar padding a la imagen
            padding: EdgeInsets.symmetric(vertical: 60),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                //colores de la pantalla de logeo
                colors: [
                  Colors.orange.shade300,
                  Colors.orange.shade800,
                ],
              ),
            ),
            child:
                Image.asset("assets/images/logo.png", width: 250, height: 250),
          ),
          //agergar tarjeta de logeo
          Center(
            child: Card(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 260),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(labelText: "Usuario:"),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
