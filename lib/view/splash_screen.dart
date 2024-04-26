import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Setelah 2 detik, navigasikan ke HomeScreen
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(
        context,
        '/home',
      );
    });

    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 224, 224, 224),
      body: Center(
        // child: Text(
        //   'Loading...',
        //   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        // ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
                image: NetworkImage(
                    "https://fakeapi.platzi.com/_astro/logo.aa139940.png")),
            SizedBox(
              height: 20,
            ),
            Text("Flutter RestAPI with Platzi Fake Store API")
          ],
        ),
      ),
    );
  }
}
