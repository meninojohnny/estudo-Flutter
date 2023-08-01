import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Home Page',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ), // AppBar
      body: ListView(
        children: [
          Container(
            color: Colors.white.withOpacity(.8),
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      creditCard(name: 'Johnny Vitor', value: 1000, color: Colors.black),
                      creditCard(name: 'Maluiza Nasci', value: 1000, color: Colors.blue),
                      creditCard(name: 'Evelyn Cardozo', value: 1000, color: Colors.pink),
                    ],
                  ),
                ),
                
                SizedBox(height: 20),
                Text('Last Transations'),
                SizedBox(height: 15),
                cardTransation(description: 'Pix', value: 500, type: '+'),
                cardTransation(description: 'Shopping', value: 540, type: '-'),
                cardTransation(description: 'Salary', value: 1300, type: '+'),
                cardTransation(description: 'Burguer', value: 67, type: '-'),
              ],
            ), // Column
          ), // Container
        ],
      ),
    ); //Scaffold
  }

  Widget creditCard({name, value, color}) {
    return Container(
      height: 210,
      child: AspectRatio(
        aspectRatio: 3.1 / 2,
        child: GestureDetector(
          onTap: () {print('Olá ${name}');},
          child: Container(
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.red.withOpacity(.8),
                              shape: BoxShape.circle,
                            ),
                          ), // Container
                          Transform.translate(
                            offset: Offset(-15, 0),
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.orange.withOpacity(.8),
                                shape: BoxShape.circle,
                              ),
                            ), // Container
                          ), // Transform
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '${value}',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            ' US',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ), // Row

                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ), // Text
                          SizedBox(height: 10),
                          FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              '1234 **** **** 1234',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  letterSpacing: 6),
                            ),
                          ), // FittedBox
                        ],
                      ),
                    ],
                  ),
                ],
              ), // Column
            ),
          ), // Container
        ), // GestureDetector
      ), // AspectRatio
    ); // Container
  }

  Widget cardTransation({description, value, type}) {
    return Container(
      padding: EdgeInsets.all(13),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                type == '+' ? (Icons.arrow_upward) : (Icons.arrow_downward),
                color: type == '+' ? Colors.green : Colors.red,
                
              ),
              SizedBox(width: 10),
              Text(
                description,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                '${type}${value}',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(
                ' US',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

