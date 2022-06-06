import 'package:appkedikooficial/src/app.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

//import 'app/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MainPage());
}
