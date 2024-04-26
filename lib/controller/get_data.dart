import 'dart:convert';

import 'package:listview_api_http/model/model.dart';
import 'package:http/http.dart' as http;

Future<List<Post>> fetchPost() async {
  final uri =
      Uri.parse("https://api.escuelajs.co/api/v1/products?offset=0&limit=10");
  final response = await http.get(uri);

  if (response.statusCode == 200) {
    List<dynamic> jsonData = json.decode(response.body);
    List<Post> posts = jsonData.map((data) => Post.fromJson(data)).toList();
    return posts;
  } else {
    throw Exception('Failed to load posts');
  }
}
