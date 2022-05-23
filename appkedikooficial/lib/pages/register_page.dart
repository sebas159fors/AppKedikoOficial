import 'dart:ffi';
import 'dart:io';
import 'package:flutter_modulo1_fake_backend/user.dart';
import 'package:flutter/material.dart';
//import 'package:appkedikooficial/src/components/image_picker_widget.dart';
import 'package:appkedikooficial/src/conection/server_controller.dart';

class RegisterPage extends StatefulWidget {
  //cambios del server controller
  Servercontroller serverController;
  BuildContext context;

  RegisterPage(this.serverController, this.context, {Key key})
      : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //iniciando el estado loading
  bool _loading = false;
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffKey = GlobalKey<ScaffoldState>();

  String userName = "";
  String password = "";
  Genrer genrer = Genrer.MALE;

  String _errorMessage = "";
  // File imageFile = File("");
  File imageFile;
  bool showPassword = false;

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
            /* ImagePickerWidget(
              imageFile: this.imageFile,
              onImageSelected: (File file) {
                setState(() {
                  imageFile = file;
                });
              },
            ),*/
            SizedBox(
                child: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  //color del icono flecha para retroceder
                  iconTheme: IconThemeData(color: Colors.black),
                ),
                height: kToolbarHeight + 25),
            //agergar tarjeta de logeo
            Center(
              child: Transform.translate(
                offset: Offset(0, -40),
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
                    child: ListView(
                      //mainAxisSize: MainAxisSize.min,
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
                        SizedBox(height: 20),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Contraseña:",
                            suffixIcon: IconButton(
                              //ocultar o mostrar contraseña
                              icon: Icon(showPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  showPassword = !showPassword;
                                });
                              },
                            ),
                          ),
                          //para ocultar contraseña
                          obscureText: !showPassword,
                          onSaved: (value) {
                            password = value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Este campo es obligatorio";
                            }
                          },
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text(
                                "Género",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[700]),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  RadioListTile(
                                    title: Text(
                                      "Masculino",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    value: Genrer.MALE,
                                    groupValue: genrer,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          genrer = value;
                                        },
                                      );
                                    },
                                  ),
                                  RadioListTile(
                                    title: Text(
                                      "Femenino",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    value: Genrer.FEMALE,
                                    groupValue: genrer,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          genrer = value;
                                        },
                                      );
                                    },
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        // en el actual flutter ya no se usa raizedButoon
                        SizedBox(height: 20),

                        ElevatedButton(
                          onPressed: () => _register(context),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Registrar"),
                              if (_loading)
                                Container(
                                  height: 20,
                                  width: 20,
                                  margin: const EdgeInsets.only(left: 20),
                                  child: CircularProgressIndicator(),
                                )
                            ],
                          ),
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
                      ],
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

  _register(BuildContext context) async {
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
      if (imageFile == null) {
        showSnackBar(context, "Seleccione una imágen por favor", Colors.orange);
        return;
      }
      User user = User(
          genrer: this.genrer,
          nickname: this.userName,
          password: this.password,
          photo: this.imageFile);

      final state = await widget.serverController.addUser(user);
      if (state == false) {
        showSnackBar(context, "No se pudo guardar", Colors.orange);
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Información"),
              content: Text("Su usuario ha sido registrado exitosamente"),
              actions: <Widget>[
                FlatButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                )
              ],
            );
          },
        );
      }
    }
  }

  void showSnackBar(BuildContext context, String title, Color backcolor) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          title,
          textAlign: TextAlign.center,
        ),
        backgroundColor: backcolor,
      ),
    );
  }
}
