import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => StarterPage(),
        '/homePage': (context) => HomePage(),
      },
    ),
  );
}

class StarterPage extends StatefulWidget {
  @override
  _StatePageState createState() => _StatePageState();
}

class _StatePageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            colors: [
              Colors.black.withOpacity(.9),
              Colors.black.withOpacity(.5),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(right: 40),
              child: Text(
                'Talking Order For Faster Delivery',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'See restaurantes nearby by \nadding location',
              style: TextStyle(color: Colors.white, fontSize: 18, height: 1.4),
            ),
            SizedBox(height: 50),
            Container(
              padding: EdgeInsets.symmetric(vertical: 6),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                gradient: LinearGradient(
                  colors: [
                    Colors.yellow,
                    Colors.orange,
                  ],
                ),
              ),
              child: MaterialButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/homePage');
                },
                child: Text('Start', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'Now Deliver To Your Door 24/7',
                style: TextStyle(color: Colors.white70, fontSize: 13),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_basket, color: Colors.black),
          ),
        ],
      ), // AppBar
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Food Delivery',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 45,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  makeGategory(title: 'Pizza'),
                  makeGategory(title: 'Burguer'),
                  makeGategory(title: 'Kebab'),
                  makeGategory(title: 'Desert'),
                  makeGategory(title: 'Salad'),
                ],
              ), // ListView
            ), // Container
            SizedBox(height: 20),
            Text(
              'Free Delivery',
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    makeItem(color: Colors.red),
                    makeItem(color: Colors.green),
                    makeItem(color: Colors.red),
                    makeItem(color: Colors.pink),
                    makeItem(color: Colors.orange),
                    makeItem(color: Colors.blue),
                  ],
                ),
              ),
            ), // Expanded
            SizedBox(height: 20),
          ],
        ), // Column 1
      ),
    );
  }

  Widget makeGategory({title}) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.symmetric(horizontal: 45),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.yellow,
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

  Widget makeItem({color}) {
    return AspectRatio(
      aspectRatio: 1.5 / 2.2,
      child: Container(
        margin: EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color,
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Icon(Icons.favorite, color: Colors.white),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\$ 15.00',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Vegetarian Pizza',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
