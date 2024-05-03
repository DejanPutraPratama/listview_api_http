import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:listview_api_http/model/model.dart';
import 'package:listview_api_http/utils/custom_colors.dart';

class CustomWidgets {
  final CustomColors _customColors = CustomColors();

  PreferredSizeWidget appbarOne() {
    return AppBar(
      foregroundColor: _customColors.green,
      surfaceTintColor: Colors.grey,
      shadowColor: _customColors.green,
      title: Text(
        "Daftar Produk",
        style: GoogleFonts.getFont('Roboto',
            textStyle: const TextStyle(fontWeight: FontWeight.bold)),
      ),
      centerTitle: true,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
          child: TextField(
            decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                prefixIcon: const Icon(Icons.search),
                suffixIcon: const Icon(Icons.close),
                hintText: 'Cari barang...',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget appbarTwo(String title) {
    return AppBar(
      title: Text(
        title,
        style: GoogleFonts.getFont('Roboto',
            textStyle: const TextStyle(fontWeight: FontWeight.bold)),
      ),
      backgroundColor: _customColors.green,
      actions: const [
        Icon(
          Icons.edit_square,
          color: Colors.white70,
        ),
        SizedBox(
          width: 10,
        ),
        Icon(
          Icons.delete_forever,
          color: Colors.white70,
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }

  Widget banner(String img) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Stack(
        children: [
          Image.asset(img),
          Positioned(
            top: 10,
            left: 15,
            child: SizedBox(
              width: 200,
              child: Text(
                "Semua Kebutuhan Ada di Tangan Anda",
                style: GoogleFonts.getFont('Roboto',
                    textStyle: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500)),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 15,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Text(
                "Disc 70%",
                textAlign: TextAlign.end,
                style: GoogleFonts.getFont('Roboto',
                    textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.amber)),
              ),
            ),
          )
        ],
      ),
    );
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
                textStyle: TextStyle(
                    fontWeight: FontWeight.w300, color: _customColors.green))),
        splashColor: const Color.fromARGB(255, 32, 75, 34),
        onTap: () {
          Navigator.pushNamed(context, '/detail', arguments: data);
        },
      ),
    );
  }
}
