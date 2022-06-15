import 'package:appkedikooficial/src/app.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

//import 'app/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //se cambiara a MyApp para verificar las rutas
  runApp(MainPage());
}

/*
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        // '/': (BuildContext context) => MainPage(),
        //se cambio a inicio por / para que pueda salir categoria
        '/': (BuildContext context) => MenuInicio(),
        'categoria': (BuildContext context) => CategoriaPage(),
        'detalle': (BuildContext context) => DetallesPage()
      },
    );
  }
}
*/
