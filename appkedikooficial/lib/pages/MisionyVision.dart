import 'package:flutter/material.dart';

class MisionyVision extends StatelessWidget {
  const MisionyVision({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBar(
              bottom: const TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.food_bank)),
                  Tab(icon: Icon(Icons.people_alt)),
                ],
              ),
              /* title: Text(
                'TabBar',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),*/
              backgroundColor: Color.fromARGB(255, 227, 197, 151),
            ),
          ),
          body: TabBarView(
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Mision",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 100, 71, 60),
                        fontSize: 35,
                      ),
                    ),
                    Description(
                        text:
                            "Nuestra misión es ser la plataforma de alimentos más inteligente y útil que existe. Estamos cumpliendo esta misión al mejorar la vida en la cocina de millones de cocineros caseros en todo el mundo."),
                    SizedBox(
                      height: 10,
                    ),
                    Image.network(
                      'https://cdn.pixabay.com/photo/2017/01/26/02/06/platter-2009590_960_720.jpg',
                      fit: BoxFit.fill,
                      width: 350.0,
                      height: 180.0,
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Vision",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 100, 71, 60),
                        fontSize: 35,
                      ),
                    ),
                    Description(
                        text:
                            "Ser la aplicación numero uno en busqueda de comidas, ademas de ser un referente en cuando a aplicaciones de alimentos y recomendaciones."),
                    SizedBox(
                      height: 10,
                    ),
                    Image.network(
                      'https://cdn.pixabay.com/photo/2019/12/14/11/44/paris-4694708_960_720.jpg',
                      fit: BoxFit.fill,
                      width: 350.0,
                      height: 180.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
