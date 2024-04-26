import 'package:flutter/material.dart';
import 'package:listview_api_http/controller/get_data.dart';
import 'package:listview_api_http/model/model.dart';
import 'package:google_fonts/google_fonts.dart';

// Home Screen with FutureBuilder
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text(
          "Daftar Produk",
          style: GoogleFonts.getFont('Roboto',
              textStyle: const TextStyle(fontWeight: FontWeight.bold)),
        ),
      ),
      body: FutureBuilder<List<Post>>(
        future: fetchPost(), // Menyesuaikan dengan tipe data baru
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return Center(
                child: Text('Terjadi Kesalahan!',
                    style: GoogleFonts.getFont('Roboto',
                        textStyle:
                            const TextStyle(fontWeight: FontWeight.bold))));
          } else {
            final posts = snapshot.data!; // Daftar produk
            return ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];
                  return ListTile(
                    leading: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network(post.image)),
                    title: Text(post.title,
                        style: GoogleFonts.getFont('Roboto',
                            textStyle:
                                const TextStyle(fontWeight: FontWeight.w500))),
                    subtitle: Text('Price: ${post.price}',
                        style: GoogleFonts.getFont('Roboto',
                            textStyle:
                                const TextStyle(fontWeight: FontWeight.w300))),
                    splashColor: Colors.greenAccent,
                    onTap: () {
                      Navigator.pushNamed(context, '/detail',
                          arguments: posts[index]);
                    },
                  );
                });
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
        child: const Icon(Icons.refresh_rounded),
      ),
    );
  }
}
