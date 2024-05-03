import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Setelah 5 detik, navigasikan ke HomeScreen
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(
        context,
        '/home',
      );
    });

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 43, 43, 43),
      body: Center(
        // child: Text(
        //   'Loading...',
        //   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        // ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image(
                    height: 100,
                    image: AssetImage('assets/images/logo_flutter.png')),
                Image(
                    height: 100,
                    image: AssetImage('assets/images/logo_platzi.png'))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Flutter RestAPI with Platzi Fake Store API",
              style: GoogleFonts.getFont('Roboto',
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white)),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: LinearProgressIndicator(),
            )
          ],
        ),
      ),
    );
  }
}
