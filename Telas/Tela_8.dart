import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 209, 204, 204),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi Rakib',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '10 tasks peding',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 109, 107, 107),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration:
                      BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
                  child: Icon(Icons.person, size: 30, color: Colors.black),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Container(
                  width: 300,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 165, 158, 158),
                      borderRadius: BorderRadius.circular(20)),
                  child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search, color: Colors.black),
                        border: InputBorder.none),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                  child: Icon(Icons.settings,
                      color: Color.fromARGB(255, 212, 207, 207)),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text('Categories',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                makeCategorie(
                    color: Color.fromARGB(255, 211, 169, 111),
                    title: 'MobileApp',
                    info: '10 Tasks'),
                makeCategorie(
                    color: Color.fromARGB(255, 103, 192, 108),
                    title: 'Website',
                    info: '05 Tasks'),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Ongoing tasks',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text('See all'),
              ],
            ),
            SizedBox(height: 15),
            Column(
              children: [
                makeItem(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget makeCategorie({color, title, info}) {
    return Container(
      padding: EdgeInsets.all(20),
      width: 170,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            info,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget makeItem() {
    return Container(
      padding: EdgeInsets.all(20),
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Wallet App Design',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black,
                ),
                child: Text(
                  '6d',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          Text(
            'Team members',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 48, 45, 45),
            ),
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.only(right: 5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green
                ),
                child: Icon(Icons.person, size: 20, color: Colors.black),
              ),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.only(right: 5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
                child: Icon(Icons.person, size: 20, color: Colors.black),
              ),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.only(right: 5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
                child: Icon(Icons.person, size: 20, color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
