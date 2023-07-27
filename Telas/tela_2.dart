import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State {
  PageController _pageController = PageController();
  Texts texts = Texts();
  int totalPages = 4;

  @override
  void initState() {
    _pageController = PageController(initialPage: 3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          makePage(color: Colors.blue, page: 1),
          makePage(color: Colors.red, page: 2),
          makePage(color: Colors.green, page: 3),
          makePage(color: Colors.orange, page: 4),
          
        ],
      ),
    ); // Scaffold
  }

  Widget makePage({color, page}) {
    return Container(
      color: color,
//       image: DecorationImage(
//         image: AssetImage(),
//         fit: BoxFit.cover
//       ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            stops: [.3, .9],
            colors: [
              Colors.black.withOpacity(.9),
              Colors.black.withOpacity(.5),
            ],
          ), // LinearGradient
        ), // BoxDecoration
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 10),
                  Text(
                    '${page}',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '/${totalPages}',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ],
              ), // Row
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      texts.posts[page - 1]['title'],
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          height: 1.3,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 3),
                          child:
                              Icon(Icons.star, color: Colors.yellow, size: 15),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 3),
                          child:
                              Icon(Icons.star, color: Colors.yellow, size: 15),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 3),
                          child:
                              Icon(Icons.star, color: Colors.yellow, size: 15),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 3),
                          child:
                              Icon(Icons.star, color: Colors.yellow, size: 15),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 3),
                          child: Icon(Icons.star, color: Colors.grey, size: 15),
                        ),
                        Text(
                          '4.0',
                          style: TextStyle(color: Colors.white70),
                        ),
                        Text(
                          '(2300)',
                          style: TextStyle(color: Colors.white38, fontSize: 12),
                        ),
                      ],
                    ), // Row
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.only(right: 50),
                      child: Text(
                        texts.posts[page - 1]['body'],
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text('READ MORE', style: TextStyle(color: Colors.white,),),
                    SizedBox(height: 20),
                  ],
                ), // Column
              ), // Expanded
            ],
          ), // Column
        ), // Padding
      ), // Container
    ); // Container
  }
}

class Texts {
  List posts = [
    {
      'title': 'Yosemite Ntional Park',
      'body':
          'Lorem ipsum dolor sit amet. Et quod facere et quod ipsum est ratione autem eos autem sequi. Et doloribus sunt non omnis doloribus est voluptatem deserunt.'
    },
    {
      'title': 'Golden Gate Bridge',
      'body':
          'Lorem ipsum dolor sit amet. Et quod facere et quod ipsum est ratione autem eos autem sequi. Et doloribus sunt non omnis doloribus est voluptatem deserunt.',
    },
    {
      'title': 'Sedona',
      'body':
          'Lorem ipsum dolor sit amet. Et quod facere et quod ipsum est ratione autem eos autem sequi. Et doloribus sunt non omnis doloribus est voluptatem deserunt.',
    },
    {
      'title': 'Savannah',
      'body':
          'Lorem ipsum dolor sit amet. Et quod facere et quod ipsum est ratione autem eos autem sequi. Et doloribus sunt non omnis doloribus est voluptatem deserunt.',
    }
  ];
}
