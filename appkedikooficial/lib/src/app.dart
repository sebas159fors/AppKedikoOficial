import 'package:appkedikooficial/pages/login_page.dart';
import 'package:flutter/material.dart';

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

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: '/',
      //establecer el tema
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.orange.shade800,
          accentColor: Colors.orange.shade300),
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (BuildContext context) {
          switch (settings.name) {
            case "/":
              return LoginPage();
            //siempre tiene que haber un retorno en el witget BuildCOntext
            default:
              return LoginPage();
          }
        });
      },
    );
  }
}
