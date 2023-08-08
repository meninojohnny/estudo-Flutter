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
      body: Stack(
        children: [
          Container(
            color: Colors.green,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  colors: [
                    Colors.black,
                    Colors.black.withOpacity(.3),
                  ],
                ), // LinearGradient
              ), // BoxDecoration
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 160,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          makeImage(),
                          makeImage(),
                          makeImage(),
                          makeImage(),
                        ],
                      ), // ListView
                    ), // Container
                  ],
                ), // Column
              ), // Padding
            ), // Container
          ), // Container
          makePoint(top: 100, left: 100),
          makePoint(top: 200, left: 200),
          makePoint(top: 100, left: 300),
        ],
      ), // Stack
    ); // Scaffold
  }
  
  Widget makePoint({top, left}) {
    return Positioned(
      top: top,
      left: left,
      child: Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
  
  Widget makeImage() {
    return AspectRatio(
      aspectRatio: .9,
      child: Container(
        margin: EdgeInsets.only(right: 15),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ), // BoxDecoration
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ), // Container
                Container(
                  height: 25,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(10),
                  ), // BoxDecoration
                  child: Center(
                    child: Text(
                    '2.1 mi',
                    //textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 11),
                  ), // Text
                  ),
                ),
              ],
            ), // Row
            SizedBox(height: 20),
            Text(
              'Golden Gate Bridge',
              style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold, height: 1.4),
            ), // Text
            Align(
              alignment: Alignment.bottomRight,
              child: Icon(Icons.star_border, color: Colors.yellow[700], size: 30),
            ),
          ],
        ), // Column
      ), // Container
    ); // AspectRatio
  } // makeImage
 
}
