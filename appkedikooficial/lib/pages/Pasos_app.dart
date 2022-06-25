import 'package:flutter/material.dart';

class PasosdelApp extends StatefulWidget {
  const PasosdelApp({
    Key key,
  }) : super(key: key);
  //final String title;
  @override
  State<PasosdelApp> createState() => _PasosdelAppState();
}

class _PasosdelAppState extends State<PasosdelApp> {
  int _actualpaso = 0;
  List<Step> mispasos = [
    const Step(
        title: Text("Paso 1"),
        content: Text("Logearse con su cuenta del app o del google.")),
    const Step(
        title: Text("Paso 2"),
        content: Text(
            "Si no tiene cuenta puede crearse una en el boton registrar.")),
    const Step(
        title: Text("Paso 3"),
        content: Text("Una vez logeado aparecera en la pantalla de inicio.")),
    const Step(
        title: Text("Paso 4"),
        content: Text(
            "Puede utilizar el Boton hamburgesa para navegar en las pestañas del app.")),
    const Step(
        title: Text("Paso 5"),
        content: Text("Puede ver las ultimas recetas subidas a la app.")),
    const Step(
        title: Text("Paso 6"),
        content: Text(
            "Puede usar tambien nuestro buscador para buscar recetas que hay en el App.")),
    const Step(
        title: Text("Paso 7"),
        content: Text(
            "Tambien puede ver recetas Internacionales con nuestro Api en el menu lateral.")),
    const Step(
        title: Text("Paso 8"),
        content: Text(
            "Tambien puede ver categorias de comidas que le ayudaran a encontrar lo que busca..")),
    const Step(
        title: Text("Paso 9"),
        content: Text(
            "Tambien puede ver los detalles de cada comida asi como su preparacion haciendo click en cada una de ellas.")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pasos del App"),
      ),
      body: Center(
        child: Stepper(
          //Indica el paso actual del Stepper
          currentStep: _actualpaso,
          steps: mispasos,
          //cambiamos la forma del Stepper
          type: StepperType.vertical,
          onStepContinue: () {
            setState(() {
              if (_actualpaso < mispasos.length - 1) {
                _actualpaso++;
              } else {
                _actualpaso = 0;
              }
            });
            print("Mi paso actual es " + _actualpaso.toString());
          },
          onStepCancel: () {
            setState(() {
              if (_actualpaso > 0) {
                _actualpaso--;
              } else {
                _actualpaso = 0;
              }
            });

            print("Mi paso actual es " + _actualpaso.toString());
          },
          onStepTapped: (Paso) {
            setState(() {
              _actualpaso = Paso;
            });
            print("Mi paso actual es " + _actualpaso.toString());
          },
        ),
      ),
    );
  }
}
