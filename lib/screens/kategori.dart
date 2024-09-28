import 'package:flutter/material.dart';
import 'detailberita.dart';

class Kategori extends StatefulWidget {
  const Kategori({super.key});

  @override
  State<Kategori> createState() => _Kategori();
}

class _Kategori extends State<Kategori> {
  List<Container> daftarsuperhero = [];
  var karakter = [
    {"nama": "Olahraga", "gambar": "EdgeShot.png"},
    {"nama": "Ekonomi", "gambar": "eraserhead.png"},
    {"nama": "Kuliner", "gambar": "Fatgum.png"},
    {"nama": "Internasional", "gambar": "GangOrca.png"},
    {"nama": "Olahraga", "gambar": "Miruko.png"},
    {"nama": "Politik", "gambar": "nedzu.png"},
    {"nama": "Hiburan", "gambar": "PresentMic.png"},
    {"nama": "Edukasi", "gambar": "Ryukyu.png"},
  ];

  @override
  void initState() {
    super.initState();
    _buatlist(); // Panggil _buatlist di initState
  }

  void _buatlist() {
    for (var i = 0; i < karakter.length; i++) {
      final karakternya = karakter[i];
      daftarsuperhero.add(
        Container(
          padding: const EdgeInsets.all(10),
          child: Card(
            color: Colors.black, // Mengubah warna card menjadi hitam
            child: Column(
              children: [
                Hero(
                  tag: karakternya['nama']!,
                  child: Material(
                    color:
                        Colors.transparent, // Transparan agar Hero bekerja baik
                    child: InkWell(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => DetailBerita(
                              nama: karakternya['nama']!,
                              gambar: karakternya["gambar"]!),
                        ),
                      ),
                      child: Image.asset(
                        "img/${karakternya["gambar"]}",
                        fit: BoxFit.cover,
                        height: 100,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10), // Gunakan SizedBox untuk jarak
                Text(
                  karakternya["nama"]!,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kategori Berita'),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            alignment: Alignment.topCenter,
            child: const Text(
              "Pilih kategori berita",
              style: TextStyle(fontSize: 25, color: Colors.black),
            ),
          ),
          // Menampilkan daftar kategori dalam grid
          Expanded(
            child: GridView.builder(
              itemCount: daftarsuperhero.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Menampilkan 2 item per baris
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return daftarsuperhero[index];
              },
            ),
          ),
        ],
      ),
    );
  }
}
