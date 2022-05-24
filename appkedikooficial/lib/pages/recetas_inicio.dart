import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class RecetasInicio extends StatelessWidget {
  const RecetasInicio({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //imagenes del carousel
    final carouselImages = [
      "https://firebasestorage.googleapis.com/v0/b/ke-diko.appspot.com/o/hamburgesa.jpg?alt=media&token=a7742e1d-4d5c-4c27-9776-136f9b96e38c",
      "https://firebasestorage.googleapis.com/v0/b/ke-diko.appspot.com/o/lomo%20saltado.jpg?alt=media&token=b6b6e80e-9172-4c04-a8e5-adae0c929ce5",
      "https://firebasestorage.googleapis.com/v0/b/ke-diko.appspot.com/o/pizaa%20americana.jpg?alt=media&token=079ea2ac-26dc-4615-83dd-5c411b542241",
    ];

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              //color principal
              Colors.orange.shade200,
              //siempre poner 0xff antes de poner un color html
              Color(0xffF69959),
              //color acentuado
              Colors.blueAccent
            ],
            //girar la pantalla de fondo
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        //llamando al carouselImages
        child: ListView(
          children: [
            const SizedBox(
              height: 15,
            ),
            CarouselSlider.builder(
              itemCount: carouselImages.length,
              itemBuilder: (context, index, realIndex) {
                final carouselImage = carouselImages[index];
                return builImage(carouselImage, index);
              },
              options: CarouselOptions(
                height: 190,
                //para que solo se cambie en carousel
                autoPlay: true,
                scrollDirection: Axis.horizontal,
                autoPlayCurve: Curves.easeInOut,
                //duracion del intervalo de las imagenes
                autoPlayInterval: Duration(seconds: 3),
                //visualizar imagenes del centro mas grandes
                enlargeCenterPage: true,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, top: 15),
              child: Center(
                child: Text(
                  "Lista de Recetas",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: SizedBox(
                height: 140,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CardImagesRecetas(),
                    CardImagesRecetas(),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 15),
              child: Center(
                child: Text(
                  "Recetas vegetarianas",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: SizedBox(
                height: 140,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CardImagesRecetas(),
                    CardImagesRecetas(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //implementando builImage
  Widget builImage(String cardImage, int index) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          width: 400.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              cardImage,
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
}

//creando un constructor para la CARD ahorra mucho codigo
class CardImagesRecetas extends StatelessWidget {
  const CardImagesRecetas({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orangeAccent,
      //parametros del borde de la caja o card
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.white, width: 1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: SizedBox(
        //tamaño de la caja de recetas vegetarianas
        width: 170,
        // height: 100,
        child: Column(
          children: const <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Image(
                image: NetworkImage(
                    "https://firebasestorage.googleapis.com/v0/b/ke-diko.appspot.com/o/recetas%20vegetarianas%2Fbrocheta%20de%20verduras.jpg?alt=media&token=3a1c99e4-e6cf-4729-85c6-56570e820474"),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(3.0),
              //agregar texto al cuadro
              child: Text(
                "Recetas Vegetarianas",
                //modificar los parametros, como tamaño, color
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
