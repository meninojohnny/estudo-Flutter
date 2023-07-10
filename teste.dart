import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State {
  
  /*callAPI() async {
    var client = http.Client();
    try {
      var response = await client.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      );
      var decodedResponse = jsonDecode(response.body) as List;
      //print(await client.get(decodedResponse));
      posts.value = decodedResponse.map((e) => Post.fromJson(e)).toList();
      //print(posts);
    } finally {
      client.close();
    }
  }*/
  
  
  List posts = [];
  callAPI() async {
    
    var client = http.Client();
    try {
      var response = await client.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      );
      var decodedResponse = jsonDecode(response.body) as List;
      posts = decodedResponse.map((e) => Posts.fromJson(e)).toList();
      print(posts);
    } catch(e) {
      print(e);
    } finally {
      client.close();
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
      child: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => callAPI(),
              child: Text('Clicar'),
            ),
            ValueListenableBuilder(
              valueListenable: posts,
              builder: (_, valor, __) => ListView.builder(
                itemCount: valor.length,
                itemBuilder: (_, index) => ListTile(
                  title: Text(valor[index].title),
                )
              ),
            )
          ]
        ),
      ),
    ));
  }
}

class Posts {
  final int useId;
  final int id;
  final String title;
  final String body;
  
  Posts(this.useId, this.id, this.title, this.body);
  factory Posts.fromJson(Map json) => Posts(json['userId'], json['id'], json['title'], json['body']);
}



