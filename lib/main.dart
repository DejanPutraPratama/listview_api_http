import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:listview_api_http/Model/model.dart';

Future<List<Post>> fetchPost() async {
  final uri = Uri.parse("https://api.escuelajs.co/api/v1/products?offset=2&limit=10");
  final response = await http.get(uri);

  if (response.statusCode == 200) {
    List<dynamic> jsonData = json.decode(response.body);
    List<Post> posts = jsonData.map((data) => Post.fromJson(data)).toList();
    return posts;
  } else {
    throw Exception('Failed to load posts');
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Produk Unggulan',
    home: HomeScreen(),
    theme: ThemeData(
      primaryColor: Colors.amber,
    )
    );
  }
}

// Home Screen with FutureBuilder
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Produk Unggulan'),
      ),
      body: FutureBuilder<List<Post>>(
        future: fetchPost(), // Menyesuaikan dengan tipe data baru
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final posts = snapshot.data!; // Daftar produk
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return ListTile(
                  title: Text(post.title),
                  subtitle: Text('Price: ${post.price}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(post: post),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}

// Detail Screen
class DetailScreen extends StatelessWidget {
  final Post post;

  DetailScreen({required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              post.title,
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              'Price: ${post.price}',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              post.description,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}