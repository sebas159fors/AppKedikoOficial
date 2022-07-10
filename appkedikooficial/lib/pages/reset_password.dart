import 'package:appkedikooficial/src/app.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ResetPasswordPage extends StatelessWidget {
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 227, 197, 151),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Restablecer Contraseña",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 100, 71, 60),
              ),
            ),
            Description(
                text:
                    "Se Enviara un correo al Email registrado, si en caso no lo recibe , revisar la pestaña de Spam de su correo, y poner que es un correo seguro"),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    labelText: "Ingresa tu Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  )),
            ),
            ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance
                      .sendPasswordResetEmail(email: controller.text.trim())
                      .then((value) => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login())));
                },
                child: Text("Reiniciar Contraseña"))
          ],
        ));
  }
}

class Description extends StatelessWidget {
  final String text;

  Description({
    Key key,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Text(
        this.text,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}
