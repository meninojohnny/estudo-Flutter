import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(218, 215, 205, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(237, 255, 217, 1),
        //brightness: Brightness.dark, // ajusta o brilho do conteudo da appBar
        elevation: 0, // controla a sombra da appBar
        leading: IconButton(
          // leading cria um botão do lado esquerdo da appBar
          icon: Icon(Icons.menu, color: Colors.black),
          onPressed: () {
            print('Hello');
          },
        ),
      ), //appBAr
      body: SafeArea(
        child: ListView(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color.fromRGBO(237, 255, 217, 1),
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(
                        15)), // arredonda apenas os cantos escolhidos
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Find Your',
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                  SizedBox(height: 3),
                  Text(
                    'Inspiration',
                    style: TextStyle(color: Colors.black, fontSize: 40),
                  ),
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(218, 215, 205, 1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none, // tira a borda do textField
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        hintText:
                            'Search you lookink for', // define o texto dentro do field
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                    ), // TextField
                  ), // Container
                  SizedBox(height: 5),
                ],
              ), // Column
            ), // Container
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 20), // coloca padding apenas horizontalmente
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Promo Today',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  Container(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis
                          .horizontal, // o conteudo será exibido horizontalemnte
                      children: [
                        promoCard(Colors.orange),
                        promoCard(Colors.red),
                        promoCard(Colors.green),
                      ],
                    ), // ListView
                  ), // Container
                  SizedBox(height: 15),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blue,
                    ),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          'Best Design',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ), // Column
            ), // Padding
          ],
        ), // Column
      ), // SafeArea
    );
  }

  Widget promoCard(MaterialColor color) {
    return AspectRatio(
      aspectRatio: 2.7 / 3,
      child: Container(
        margin: EdgeInsets.only(right: 15), // cria uma margem do lado direito
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          /*image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/one.jpg'),
          ),*/
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              // faz um degrade
              begin: Alignment.bottomRight, // direção do degrade
              stops: [0.1, 0.9], // n]ao entendi muito bem ("-")
              colors: [
                Colors.black.withOpacity(.8),
                Colors.black.withOpacity(.1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
