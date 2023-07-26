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
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black),
          onPressed: () {
            print('Olá');
          },
        ),
      ), // AppBar
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color.fromRGBO(237, 255, 217, 1),
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(20)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Find Your',
                    style: TextStyle(fontSize: 25),
                  ),
                  Text(
                    'Inspiration',
                    style: TextStyle(fontSize: 40),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(218, 215, 205, 1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search, color: Colors.black),
                        hintText: 'Search you lookink for',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ), // Column
            ), // Container 1
            Container(
              
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Promo Today',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        promoCard(Colors.orange),
                        promoCard(Colors.red),
                        promoCard(Colors.green),
                      ],
                    ), // ListView
                  ), // Container
                  SizedBox(height: 15),
                  Container(
                    padding: EdgeInsets.all(15),
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue,
                    ),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text('Best Design', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                    ),
                  ),
                ],
              ), // Column
            ), // Container
          ],
        ), // ListView
      ), // SafeArea
    ); // Scaffold
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
