import 'package:flutter/material.dart';
import 'package:listview_api_http/controller/get_data.dart';
import 'package:listview_api_http/model/model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:listview_api_http/utils/custom_widgets.dart';
import 'package:listview_api_http/utils/functions.dart';

// Home Screen with FutureBuilder
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CustomWidgets _customWidgets = CustomWidgets();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _customWidgets.appbarOne(),
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
                itemCount: posts.length + 1,
                itemBuilder: (context, index) {
                  index -= 1;
                  if (index == -1) {
                    return _customWidgets.banner('assets/images/home.png');
                  }
                  final post = posts[index];
                  bool validUrl = Functions().isValidUrl(post.images[0]);
                  if (!validUrl) {
                    return _customWidgets.productTile(
                      Container(
                        color: const Color.fromRGBO(100, 100, 100, 1),
                        width: 55,
                        height: 55,
                        child: const Icon(
                          Icons.broken_image,
                        ),
                      ),
                      post,
                      context,
                    );
                  } else {
                    return _customWidgets.productTile(
                      Image.network(post.images[0]),
                      post,
                      context,
                    );
                  }
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
