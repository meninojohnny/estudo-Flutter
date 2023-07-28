import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/homePage',
        routes: {
          '/': (context) => StarterPage(),
          '/homePage': (context) => HomePage(),
        },
        //home: StarterPage(),
      ),
    );

class StarterPage extends StatefulWidget {
  @override
  StarterPageState createState() => StarterPageState();
}

class StarterPageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.yellow,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              colors: [
                Colors.black.withOpacity(.9),
                Colors.black.withOpacity(.5),
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Talking Order For Faster Delivery',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'See restaurants nearby by \nadding location',
                  style:
                      TextStyle(color: Colors.white, fontSize: 18, height: 1.4),
                ),
                SizedBox(height: 100),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.yellow,
                        Colors.orange,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('/homePage');
                    },
                    child: Text(
                      'Start',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ), // MaterialButton
                ), // Container
                SizedBox(height: 20),
                Center(
                  child: Text(
                    'Now Delivery To Your Door 24/7',
                    style: TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                ),
                SizedBox(height: 30),
              ],
            ), // Column
          ),
        ),
      ),
    ); // Scaffold
  }
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
        backgroundColor: Colors.white,
        elevation: 0,
        leading: null,
        actions: [
          IconButton(
            onPressed: () {
              print('Ainda não contem nada');
            },
            icon: Icon(Icons.shopping_basket, color: Colors.black),
          ),
        ],
      ), // AppBar
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Food Delivery',
                    style: TextStyle(
                        color: Colors.grey[80],
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 40,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        makeCategory(title: 'Pizza'),
                        makeCategory(title: 'Burgers'),
                        makeCategory(title: 'Kebab'),
                        makeCategory(title: 'Desert'),
                        makeCategory(title: 'Salad'),
                      ],
                    ), // ListView
                  ), // Container
                  SizedBox(height: 25),
                  Text(
                    'Free Delivery',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                  //SizedBox(height: 10),
                ],
              ), // Column
            ), // Padding
            Expanded(
              child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height, 
                    child: ListView(
                      children: [
                        makeItem(),
                      ],
                    ),
                  ),
              ),
            ),
          ],
        ),
      ),
    ); // Scaffold
  }

  Widget makeCategory({title}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50),
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Text(
          title,
          style:
              TextStyle(color: Colors.grey[800], fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget makeItem() {
    return Container(
    );
  }
}
