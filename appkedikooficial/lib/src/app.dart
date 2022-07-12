//import 'package:appkedikooficial/pages/login_page.dart';
//antiguo inicio
//import 'package:appkedikooficial/pages/home_page.dart';
import 'package:appkedikooficial/API/Api_listaReceta.dart';
import 'package:appkedikooficial/pages/Pagina_inicio.dart';
import 'package:appkedikooficial/pages/Pasos_app.dart';
import 'package:appkedikooficial/pages/categorias.dart';
import 'package:appkedikooficial/pages/detalle_receta.dart';
import 'package:appkedikooficial/pages/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:appkedikooficial/src/registro.dart';
import 'package:appkedikooficial/src/auxiliar.dart';
import 'package:google_sign_in/google_sign_in.dart';
//mision y vision
import 'package:appkedikooficial/pages/MisionyVision.dart';
//import 'package:google_sign_in/google_sign_in.dart';
//import 'conection/server_controller.dart';
//import 'package:flutter_modulo1_fake_backend/user.dart';
//import 'package:appkedikooficial/pages/home_page.dart';
//import 'package:appkedikooficial/pages/register_page.dart';

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
/*
//codigo anterior
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
*/

class MainPage extends StatefulWidget {
  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    this._estaUsuarioAutenticado();
  }

  void _estaUsuarioAutenticado() {
    //se omitio ? al costado de User por problema de version
    // es para la seguridad null
    FirebaseAuth.instance.authStateChanges().listen((User user) {
      if (user == null)
        print("Usuario no autenticado");
      else
        print("Usuario autenticado");
    });
  }

//material app de login y las rutas
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
      //parte copiada
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        // '/': (BuildContext context) => MainPage(),
        //se cambio a inicio por / para que pueda salir categoria
        // se comento la linea 108 ya que era redundante y salia error
        // '/': (BuildContext context) => MenuInicio(),
        'Pasos': (BuildContext context) => PasosdelApp(),
        'categoria': (BuildContext context) => CategoriaPage(),
        'detalle': (BuildContext context) => DetallesPage(),
        //se agrego api
        'API': (BuildContext context) => ApiListaReceta(),
        //MisionyVision
        'MisionyVision': (BuildContext context) => MisionyVision(),
        'ResetPassword': (BuildContext context) => ResetPasswordPage()
      },
    );
  }
}

//mate app

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  static bool _contrasenaVisible = false;
  static bool visible = false;
  static bool googleVisible = false;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _contrasenaController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  void initState() {
    super.initState();
    visible = false;
    googleVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color.fromARGB(255, 227, 197, 151),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 40.0, bottom: 0.0),
                child: Text(
                  'Kediko App',
                  style: TextStyle(
                    fontSize: 40,
                    color: Color.fromARGB(255, 100, 71, 60),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0, bottom: 35.0),
                child: Center(
                  child: Container(
                      width: 200,
                      height: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Image.asset('assets/images/Logo2.jpg')),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.mail_outline_rounded,
                        color: Colors.white70,
                      ),
                      filled: true,
                      fillColor: Colors.black12,
                      labelStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                      hintStyle: TextStyle(
                        color: Colors.white54,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1.5),
                      ),
                      labelText: 'Email',
                      hintText: 'Email'),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 10.0, bottom: 30.0),
                //padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: TextFormField(
                  controller: _contrasenaController,
                  obscureText: !_contrasenaVisible,
                  keyboardType: TextInputType.visiblePassword,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock_outline_rounded,
                        color: Colors.white70,
                      ),
                      suffixIcon: IconButton(
                          icon: Icon(
                            _contrasenaVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.white70,
                          ),
                          onPressed: () {
                            setState(() {
                              _contrasenaVisible = !_contrasenaVisible;
                            });
                          }),
                      filled: true,
                      fillColor: Colors.black12,
                      labelStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                      hintStyle: TextStyle(
                        color: Colors.white54,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(color: Colors.white, width: 0.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(color: Colors.white, width: 2),
                      ),
                      labelText: 'Contraseña',
                      hintText: 'Contraseña'),
                ),
              ),
              Container(
                height: 50,
                width: 350,
                child: ElevatedButton(
                  onPressed: () {
                    if (!_emailController.text.contains('@')) {
                      mostrarSnackBar('Email no correcto', context);
                    } else if (_contrasenaController.text.length < 6) {
                      mostrarSnackBar(
                          'La contraseña debe contener al menos 6 caracteres',
                          context);
                    } else {
                      setState(() {
                        _cambiarEstadoIndicadorProgreso();
                      });
                      acceder(context);
                    }
                  },
                  child: Text(
                    'Acceder',
                    //style: TextStyle(color: Colors.white, fontSize: 20,),
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black45,
                    onPrimary: Colors.white,
                    shadowColor: Colors.black45,
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(
                        color: Colors.white70,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  visible: visible,
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Container(
                          width: 320,
                          margin: EdgeInsets.only(),
                          child: LinearProgressIndicator(
                            minHeight: 2,
                            backgroundColor: Colors.blueGrey[800],
                            valueColor: AlwaysStoppedAnimation(Colors.white),
                          )))),
              SizedBox(
                height: 20.0,
              ),
              Container(
                height: 60,
                width: 200,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'ResetPassword');
                  },
                  child: const Text(
                    '¿Olvidó la contraseña?',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              /*
              Container(
                height: 60,
                width: 350,
                padding: EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _cambiarEstadoIndicadorProgresoGoogle();
                    });
                    //para acceder por google
                    //invocamos este metodo
                    // se cambia accederGoogle por Authenticator
                    accederGoogle(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Row(
                      children: <Widget>[
                        Image(
                          image: AssetImage("assets/images/google_logo.png"),
                          height: 30.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40, right: 55),
                          child: Text(
                            'Acceder con Google',
                            style: TextStyle(
                              fontSize: 19,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              backgroundColor: Colors.transparent,
                              letterSpacing: 0.0,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    onPrimary: Colors.white,
                    shadowColor: Colors.black45,
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(
                        color: Colors.white70,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
              */
              Visibility(
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  visible: googleVisible,
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Container(
                          width: 320,
                          margin: EdgeInsets.only(bottom: 20),
                          child: LinearProgressIndicator(
                            minHeight: 2,
                            backgroundColor: Colors.blueGrey[800],
                            valueColor: AlwaysStoppedAnimation(Colors.white),
                          )))),
              Container(
                height: 50,
                width: 250,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                PaginaRegistro()));
                  },
                  child: Text(
                    'Registrar',
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black45,
                    onPrimary: Colors.white,
                    shadowColor: Colors.black45,
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(
                        color: Colors.white70,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> acceder(BuildContext context) async {
    // validad la clave del formulario
    final formState = _formKey.currentState;
    // se omitio ! al costado de fromState por problemas de version
    if (formState.validate()) {
      //si se ha validado se guarda
      formState.save();
      try {
        UserCredential credencial = await auth.signInWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _contrasenaController.text.trim());
        //si sigue la ejecucion se pasa a otra pantalla
        // en este caso pasa a la pantalla de inicio.dart

        //se cambia Home por MenuInicio
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => new MenuInicio()));
        setState(() {
          _cambiarEstadoIndicadorProgreso();
        });
      } on FirebaseAuthException catch (e) {
        if (e.code == "user-not-found")
          mostrarSnackBar("Usuario desconocido", context);
        else if (e.code == "wrong-password")
          mostrarSnackBar("Contraseña incorrecta", context);
        else
          mostrarSnackBar("Lo sentimos, hubo un error", context);
        setState(() {
          _cambiarEstadoIndicadorProgreso();
        });
      }
    }
  }

  /*
  Future<void> accederGoogle(BuildContext context) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    GoogleSignIn _googleSignIn = GoogleSignIn();

    try {
      //se quito los finals
      // se elimino ? que esta al costado de googleSingAuth por porblemas de version
      GoogleSignInAccount _googleSignInAccount = await _googleSignIn.signIn();
      // se elimino ! de _googleSignInAccount por problemas de version
      GoogleSignInAuthentication _googleSignInAuthentication =
          await _googleSignInAccount.authentication;

      //crear las credenciales de google, y llamamos al googleAuthProvider para verificar si esta registrado en google
      AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: _googleSignInAuthentication.accessToken,
          idToken: _googleSignInAuthentication.idToken);
      // pasar la credencial con el sistema
      await _auth.signInWithCredential(credential);

      //se elimino ! de currentSate
      _formKey.currentState.save();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => new MenuInicio()));
    } on FirebaseAuthException catch (e) {
      mostrarSnackBar("Lo sentimos, se produjo un error", context);
    } finally {
      setState(() {
        _cambiarEstadoIndicadorProgresoGoogle();
      });
    }
  }
  */
  void _cambiarEstadoIndicadorProgreso() {
    visible = !visible;
  }

  void _cambiarEstadoIndicadorProgresoGoogle() {
    googleVisible = !googleVisible;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _contrasenaController.dispose();
    super.dispose();
  }
}
