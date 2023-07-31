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
      backgroundColor: Color.fromRGBO(238, 241, 242, 1),
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
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height: 210,
              child: AspectRatio(
                aspectRatio: 3.1 / 2,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: Colors.black,
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
                                    '1000',
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
                                    'CardName',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ), // Text
                                  SizedBox(height: 10),
                                  FittedBox(
                                    fit: BoxFit.contain,
                                    child: Text(
                                      '1234 **** **** 1234',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15, letterSpacing: 6),
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
            ), // Container
          ],
        ), // Column
      ),
    ); //Scaffold
  }
}
