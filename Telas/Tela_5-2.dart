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
  InfoController infos = InfoController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 300,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Container(
                    color: Colors.green,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          colors: [Colors.black, Colors.black.withOpacity(.3)],
                        ), // LinearGradient
                      ), // BoxDecoration
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            infos.text['title'],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 25),
                          Row(
                            children: [
                              Text(
                                '${infos.text['numberVideos']} Videos',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 14),
                              ),
                              SizedBox(width: 20),
                              Text(
                                '${infos.text['numberSubsCribers']} SubsCribers',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ), // Container
                  ), // Container
                ), // FlexibleSpaceBar
              ), // SliverAppBar
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          infos.text['body'],
                          style: TextStyle(
                              fontSize: 14, color: Colors.grey, height: 1.4),
                        ),
                        SizedBox(height: 30),
                        Text(
                          'Born',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          infos.text['born'],
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 30),
                        Text(
                          'Nationaly',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          infos.text['nationaly'],
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 30),
                        Text(
                          'Videos',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 100,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              makeVideo(color: Colors.red),
                              makeVideo(color: Colors.blue),
                              makeVideo(color: Colors.green),
                              makeVideo(color: Colors.pink),
                            ],
                          ), // ListView
                        ),
                      ],
                    ), // Column
                  ), // Padding
                  SizedBox(height: 40),
                ]),
              ), // SliverList
            ],
          ), // CustomScrollView
          Positioned.fill(
            bottom: 10,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.yellow[700],
                  borderRadius: BorderRadius.circular(20),
                ), // BoxDecoration
                child: Center(
                  child: Text(
                    'Follow',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ],
      ), // Stack
    ); // Scaffold
  }

  Widget makeVideo({color}) {
    return AspectRatio(
      aspectRatio: 1.5 / 1,
      child: Container(
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 2, color: Colors.white),
        ),
        child: Center(
          child: Icon(Icons.play_arrow, color: Colors.white, size: 40),
        ), // Center
      ), // Container
    ); // AspectRatio
  }
}

class InfoController {
  Map text = {
    'title': 'Emma Watson',
    'numberVideos': 60,
    'numberSubsCribers': '240K',
    'body':
        'Emma Charlotter Duerre Watson was born in Paris, France, to English parents. Jacqueline Luesby and Cris Watson, both lawyers. She moved to Oxfordshikre when she was five, where she attended the Dragon Scholl.',
    'born': 'April, 15th 1990, Paris, France',
    'nationaly': 'British'
  };
}
