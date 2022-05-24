import 'package:flutter/material.dart';

class DrawerRecetas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.orange.shade400,
              const Color(0xffF69959),
              Colors.orangeAccent
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          //para que cubra todo el ancho del drawer y la imagen no se vea pequeña
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(),
                image: DecorationImage(
                  image: AssetImage("assets/images/UsuarioReceta.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              //encabezado del drawer
              child: Align(
                //alineacion de la flecha de retorno
                alignment: Alignment.bottomLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  //flecha de retorno
                  icon: const CircleAvatar(
                    //color de la flecha y forma
                    backgroundColor: Colors.blueAccent,
                    child: Icon(Icons.arrow_back),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: const _ListitleWidget(
                      icon: Icons.home,
                      text: "Menu De Inicio",
                      iconColor: Colors.blueAccent,
                    ),
                  ),
                  const _ListitleWidget(
                    icon: Icons.favorite,
                    text: "Recetas Favoritas",
                    iconColor: Colors.blueAccent,
                  ),
                  const _ListitleWidget(
                    icon: Icons.play_circle,
                    text: "Videos de recetas",
                    iconColor: Colors.blueAccent,
                  ),
                  const _ListitleWidget(
                    icon: Icons.share,
                    text: "Compartir App",
                    iconColor: Colors.blueAccent,
                  ),
                  const _ListitleWidget(
                    icon: Icons.book,
                    text: "Terminos y condiciones",
                    iconColor: Colors.blueAccent,
                  ),
                ],
              ),
            ),
            //Equipo Takya INC
            const Align(
              child: ListTile(
                title: Center(
                  child: Text(
                    "Equipo TakyaINC",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      //poner la letra en cursiva
                      fontStyle: FontStyle.italic,
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
}

//constructor de los items de la lista del drawer (clase privada)
class _ListitleWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  //declarando el color de los iconos
  final Color iconColor;

  const _ListitleWidget({
    Key key,
    this.text,
    this.icon,
    this.iconColor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        //instanciando iconColor
        color: iconColor,
      ),
      title: Text(
        text,
        style: const TextStyle(
          fontSize: 15,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
