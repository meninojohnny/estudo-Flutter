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
                    Colors.black.withOpacity(.3)
                  ],
                ),
              ),
            ), // Container
          ), // Container
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 140,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      makeItem(),
                      makeItem(),
                      makeItem(),
                      makeItem(),
                      makeItem(),
                      makeItem(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ), // Stack
    ); // Scaffold
  }
  
  Widget makeItem() {
    return AspectRatio(
      aspectRatio: .9,
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ), // BoxDecoration
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ), // BoxDecoration  
                ), // Container
                Container(
                  height: 20,
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.grey[400],
                  ), // BoxDecoration 
                  child: Center(child: Text('2.1 mi', style: TextStyle(fontSize: 11,),),),
                ), // Container
              ],
            ), // Row
            SizedBox(height: 20),
            Text('Golden Gate Bridge', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
            Align(
              alignment: Alignment.bottomRight,
              child: Icon(Icons.star_border, color: Colors.yellow[700], size: 25),
            ), // Align
          ],
        ), // Column
      ), // Container
    ); // AspectRatio
  }
  
}
