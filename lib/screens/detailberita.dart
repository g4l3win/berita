import 'package:flutter/material.dart';

class DetailBerita extends StatelessWidget {
  DetailBerita({required this.nama, required this.gambar});
  final String nama;
  final String gambar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // Tambahkan scroll untuk seluruh halaman detail
        child: Column(
          children: [
            Container(
              height: 240.0,
              child: Hero(
                tag: nama,
                child: Material(
                  child: InkWell(
                    child: Image.asset(
                      "img/$gambar",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            BagianNama(nama: nama),
            Keterangan(), // Bagian yang mengalami overflow
          ],
        ),
      ),
    );
  }
}

class BagianNama extends StatelessWidget {
  BagianNama({required this.nama});
  final String nama;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            //biar sampai ke sudut
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nama,
                  style: TextStyle(fontSize: 20, color: Colors.blue),
                ),
                Text(
                  nama + "@gmail.com",
                  style: TextStyle(fontSize: 17, color: Colors.grey),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Icon(Icons.star, size: 50, color: Colors.blue),
              Text(
                "12",
                style: TextStyle(fontSize: 18),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class IconTeks extends StatelessWidget {
  IconTeks({required this.icon, required this.teks});

  final IconData icon;
  final String teks;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 50.0,
          color: Colors.blue,
        ),
        Text(teks, style: TextStyle(color: Colors.blue, fontSize: 16.0)),
      ],
    );
  }
}

class Keterangan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(10),
      child: Card(
        child: SingleChildScrollView(
          // Tambahkan scroll untuk menghindari overflow
          child: Text(
            "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of "
            "classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin "
            "professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, "
            "consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical "
            "literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 "
            "of (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the "
            "theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, , comes from "
            "a line in section 1.10.32.",
            style: TextStyle(fontSize: 18), // Font lebih besar
          ),
        ),
      ),
    );
  }
}
