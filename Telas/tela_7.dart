import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController();
  int page = 0;

  @override
  void initialState() {
    super.initState();
    _pageController = PageController(initialPage: page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          page1(color: Colors.green),
          Dashboard(),
        ],
      ),
    );
  }

  Widget page1({color}) {
    return Container(
      color: color,
      child: Container(
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            colors: [Colors.black, Colors.black.withOpacity(.2)],
          ), // LinearGradient
        ), // BoxDecoration
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Exerciese 1',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            Text(
              '15',
              style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'Minutes',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              '3',
              style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'Exercises',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 100),
            Center(
              child: Text(
                'Start the morning with your health',
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: Colors.white, fontSize: 30, height: 1.3),
              ),
            ), // Center
            SizedBox(height: 30),
            Center(
              child: GestureDetector(
                onTap: () {
                   _pageController.animateToPage(
                    1,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ],
        ), // Column
      ), // Container
    ); // Container
  } // page1
}

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: Text(
          'Dashboard',
          textAlign: TextAlign.center,
        ),
        actions: [
          Icon(Icons.person, color: Colors.white),
        ],
      ), // AppBar
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Today',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ), // Text
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    makeItem(color: Colors.blue, title: 'Steps', date: '3 500'),
                    SizedBox(width: 20),
                    makeItem(
                        color: Colors.blue, title: 'Sports', date: '25 min'),
                  ],
                ), // Row
                SizedBox(height: 30),
                Text(
                  'Health Categories',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ), // Text
                SizedBox(height: 20),
                makeCategory(),
                makeCategory(),
                makeCategory(),
                makeCategory(),
                makeCategory(),
              ],
            ), // Column
          ), // Padding
        ),
      ), // SafeArea
    ); // Scaffold
  }

  Widget makeItem({color, title, date}) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              date,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
      ), // Container
    ); // Expanded;
  }

  Widget makeCategory() {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      padding: EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Text(
        'Activity',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
