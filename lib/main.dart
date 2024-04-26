import 'package:flutter/material.dart';
import 'package:listview_api_http/view/detail_screen.dart';

import 'package:listview_api_http/view/home_screen.dart';
import 'package:listview_api_http/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Produk Unggulan',
      theme: ThemeData(
        colorSchemeSeed: Colors.greenAccent,
      ),
      routes: {
        '/home': (context) => const HomeScreen(),
        '/detail': (context) => const DetailScreen(),
        '/splash': (context) => const SplashScreen(),
      },
      initialRoute: '/splash',
    );
  }
}
