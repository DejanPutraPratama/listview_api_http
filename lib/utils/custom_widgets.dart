import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:listview_api_http/model/model.dart';

class CustomWidgets {
  Widget appbarOne() {
    return const Placeholder();
  }

  Widget appbarTwo() {
    return const Placeholder();
  }

  Widget banner(String img) {
    return const Placeholder();
  }

  Widget productTile(Widget img, Post data, BuildContext context) {
    return Card(
      surfaceTintColor: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: ListTile(
        leading: ClipRRect(borderRadius: BorderRadius.circular(5), child: img),
        title: Text(data.title,
            style: GoogleFonts.getFont('Roboto',
                textStyle: const TextStyle(fontWeight: FontWeight.w500))),
        subtitle: Text('\$${data.price}',
            style: GoogleFonts.getFont('Roboto',
                textStyle: const TextStyle(fontWeight: FontWeight.w300))),
        splashColor: const Color.fromARGB(255, 32, 75, 34),
        onTap: () {
          Navigator.pushNamed(context, '/detail', arguments: data);
        },
      ),
    );
  }
}
