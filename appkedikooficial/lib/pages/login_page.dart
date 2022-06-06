import 'dart:ffi';
import 'package:flutter_modulo1_fake_backend/user.dart';
import 'package:flutter/material.dart';
import 'package:appkedikooficial/src/conection/server_controller.dart';

class LoginPage extends StatefulWidget {
  //cambios del server controller
  Servercontroller serverController;
  BuildContext context;

  LoginPage(this.serverController, this.context, {Key key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //iniciando el estado loading
  bool _loading = false;
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  String userName = "";
  String password = "";

  String _errorMessage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(
        title: Text('Material App Bar')
      ),*/
      body: Form(
        key: _formkey,
        child: Stack(
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
              //imagen de kediko falla en el celular
              /*child: Image.asset("assets/images/logo.png",
                  width: 250, height: 250),*/
            ),
            //agergar tarjeta de logeo
            Transform.translate(
              offset: Offset(0, -40),
              child: Center(
                child: SingleChildScrollView(
                  child: Card(
                    elevation: 2,
                    //dar borde circular a la card
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    margin: const EdgeInsets.only(
                        left: 20, right: 20, top: 260, bottom: 20),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 35, vertical: 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          TextFormField(
                            decoration: InputDecoration(labelText: "Usuario:"),
                            onSaved: (value) {
                              userName = value;
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Ingrese su usuario";
                              }
                            },
                          ),
                          //espacio entre los dos campos
                          SizedBox(height: 40),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "Contraseña:",
                            ),
                            //para ocultar contraseña
                            obscureText: true,
                            onSaved: (value) {
                              password = value;
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Por favor ingrese su Contraseña";
                              }
                            },
                          ),
                          SizedBox(height: 40),
                          // en el actual flutter ya no se usa raizedButoon
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 25),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("Iniciar Sesion"),
                                if (_loading)
                                  Container(
                                    height: 20,
                                    width: 20,
                                    margin: const EdgeInsets.only(left: 20),
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  )
                              ],
                            ),
                            onPressed: () => _login(context),
                          ),
                          //mensaje de error
                          if (_errorMessage.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                _errorMessage,
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                '¿No estas registrado?',
                              ),
                              TextButton(
                                /*textColor:Theme.of(context).primaryColor,*/
                                child: Text("Registrarse"),
                                onPressed: () {
                                  _showRegister(context);
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  //creando el metodo _login

  void _login(BuildContext context) async {
    if (!_loading) {
      if (_formkey.currentState.validate()) {
        _formkey.currentState.save();

        setState(() {
          _loading = true;
          _errorMessage = " ";
        });
        User user = await widget.serverController.login(userName, password);
        if (user != null) {
          //los argumentos van a llegar por la clase y el constructor
          Navigator.of(context).pushReplacementNamed("/home", arguments: user);
        } else {
          setState(() {
            //configurando el mensaje de error y el loading
            _errorMessage = "Usuario o contraseña incorrecto";
            _loading = false;
          });
        }
      }
    }
  }

  void _showRegister(BuildContext context) {
    Navigator.of(context).pushNamed(
      '/register',
    );
  }

  @override
  void initState() {
    super.initState();
    widget.serverController.init(widget.context);
  }
}
