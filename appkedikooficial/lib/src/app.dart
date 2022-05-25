import 'package:appkedikooficial/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'conection/server_controller.dart';
import 'package:flutter_modulo1_fake_backend/user.dart';
import 'package:appkedikooficial/pages/home_page.dart';
import 'package:appkedikooficial/pages/register_page.dart';

/*class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        home: Scaffold(
            appBar: AppBar(
              title: Text('Material App'),
            ),
            body: Center(
                child: Container(
              child: Text('Hello World'),
            ))));
  }
}*/
//instanciamos serverController
Servercontroller _serverController = Servercontroller();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: '/',
      //establecer el tema
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.orange[800],
          accentColor: Colors.orange[300]),
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (BuildContext context) {
          switch (settings.name) {
            case "/":
              return LoginPage(_serverController, context);
            case "/home":
              //definir argumentos para el User
              User userLogged = settings.arguments;
              return MenuInicio(/*userLogged*/);
            //siempre tiene que haber un retorno en el witget BuildCOntext
            /*default:
              return LoginPage(_serverController, context);*/
            case "/register":
              return RegisterPage(_serverController, context);
          }
        });
      },
    );
  }
}
