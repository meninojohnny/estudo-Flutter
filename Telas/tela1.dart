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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        //brightness: Brightness.dark, // ajusta o brilho do conteudo da appBar
        elevation: 0, // controla a sombra da appBar
        leading: IconButton( // leading cria um botão do lado esquerdo da appBar
          icon: Icon(Icons.menu, color: Colors.black),
          onPressed: () {print('Hello world');},
        ),
      ), //appBAr
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color.fromRGBO(229, 212, 206, 1),
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)), // arredonda apenas os cantos escolhidos
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Find Your', style: TextStyle(color: Colors.black, fontSize: 25),),
                  SizedBox(height: 3),
                  Text('Inspiration', style: TextStyle(color: Colors.black, fontSize: 40),),
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(244, 243, 243, 1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none, // tira a borda do textField
                        prefixIcon: Icon(Icons.search, color: Colors.black,),
                        hintText: 'Search you lookink for', // define o texto dentro do field
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                    ), // TextField
                  ), // Container
                  SizedBox(height: 5),
                ],
              ), // Column
            ), // Container
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20), // coloca padding apenas horizontalmente
              child: Column(
                children: [
                  Text('Promo Today', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                ],
              ),
            ), // Padding
          ],
        ), // Collumn
      ), // SafeArea
    );
  }
}
