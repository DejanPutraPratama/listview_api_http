import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:listview_api_http/model/model.dart';
import 'package:listview_api_http/utils/custom_colors.dart';
import 'package:listview_api_http/utils/functions.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Post post = ModalRoute.of(context)?.settings.arguments as Post;
    CustomColors _customColors = CustomColors();
    bool validUrl = Functions().isValidUrl(post.images[0]);
    return validUrl
        ? Scaffold(
            appBar: AppBar(
              title: Text(
                "Detail Produk",
                style: GoogleFonts.getFont('Roboto',
                    textStyle: const TextStyle(fontWeight: FontWeight.bold)),
              ),
              backgroundColor: const Color.fromARGB(255, 86, 224, 93),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.network(post.images[0]),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          post.title,
                          style: GoogleFonts.getFont('Roboto',
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 24)),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          '\$${post.price}',
                          style: GoogleFonts.getFont('Roboto',
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Colors.black54)),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          post.description,
                          style: GoogleFonts.getFont('Roboto',
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w300, fontSize: 16)),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text(
                "Detail Produk",
                style: GoogleFonts.getFont('Roboto',
                    textStyle: const TextStyle(fontWeight: FontWeight.bold)),
              ),
              backgroundColor: const Color.fromARGB(255, 86, 224, 93),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Icon(
                    Icons.broken_image,
                    size: 300,
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          post.title,
                          style: GoogleFonts.getFont('Roboto',
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 24)),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          '\$${post.price}',
                          style: GoogleFonts.getFont('Roboto',
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Colors.black54)),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          post.description,
                          style: GoogleFonts.getFont('Roboto',
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w300, fontSize: 16)),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
  }
}
