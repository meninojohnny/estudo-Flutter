import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnePage(),
    );
  }
}

class OnePage extends StatefulWidget {
  const OnePage({Key? key}) : super(key: key);

  @override
  State<OnePage> createState() => _OnePageState();
}

class _OnePageState extends State<OnePage> {
  ValueNotifier<List<Post>> posts = ValueNotifier<List<Post>>([]);

  callAPI() async {
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => callAPI(),
                child: Text('Clicar'),
              ),
              SizedBox(height: 10),
              ValueListenableBuilder(
                valueListenable: posts,
                builder: (_, valor, __) => ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: valor.length,
                  itemBuilder: (_, index) => ListTile(
                    title: Text(valor[index].title),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post(this.userId, this.id, this.title, this.body);

  factory Post.fromJson(Map json) {
    return Post(json['userId'], json['id'], json['title'], json['body']);
  }

  @override
  String toString() {
    return 'Id: $id';
  }
}
