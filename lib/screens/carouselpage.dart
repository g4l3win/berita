import 'package:flutter/material.dart';
import 'kategori.dart';

class CarouselPage extends StatefulWidget {
  const CarouselPage({Key? key}) : super(key: key);

  @override
  _CarouselPageState createState() => _CarouselPageState();
}

class _CarouselPageState extends State<CarouselPage> {
  int _selectIndex = 0;

  // Daftar halaman untuk BottomNavigationBar
  static List<Widget> _widgetOptions = <Widget>[
    // Halaman Carousel
    CarouselContent(),
    // Halaman Kategori
    Kategori(),
  ];

  // Fungsi untuk mengubah halaman berdasarkan tab yang dipilih
  void _onItemTapped(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  // Mengganti pengguna (contoh fitur pada drawer)
  String gambar1 =
      "https://this-person-does-not-exist.com/img/avatar-gend9dd41a772150a54ed730233a24e69fe.jpg";
  String gambar2 = "https://thispersondoesnotexist.com/";
  String backup =
      "https://i.pinimg.com/736x/84/79/13/847913365f383d3244f71f869bddcc61.jpg";

  String nama1 = "Ricky Rixc";
  String nama2 = "Andrew McCourtney";
  String backupnama = " ";

  void gantiuser() {
    setState(() {
      backup = gambar1;
      gambar1 = gambar2;
      gambar2 = backup;

      backupnama = nama1;
      nama1 = nama2;
      nama2 = backupnama;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Berita",
        ),
      ),

      // drawer
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                nama1,
                style: const TextStyle(color: Colors.black),
              ),
              accountEmail: const Text(
                "RickyR@gmail.com",
                style: TextStyle(color: Colors.black),
              ),
              currentAccountPicture: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  // Kamu bisa menambahkan navigasi ke halaman detail pengguna di sini
                },
                child: CircleAvatar(
                  backgroundImage: NetworkImage(gambar1),
                ),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://i.pinimg.com/736x/84/79/13/847913365f383d3244f71f869bddcc61.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              otherAccountsPictures: [
                GestureDetector(
                  onTap: () => gantiuser(),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(gambar2),
                  ),
                ),
              ],
            ),
            ListTile(
              title: const Text("Setting"),
              trailing: const Icon(Icons.settings),
            ),
            ListTile(
              title: const Text("Close"),
              trailing: const Icon(Icons.close),
              onTap: () {
                Navigator.of(context).pop(); // Tutup drawer
              },
            ),
          ],
        ),
      ),

      // Mengubah tampilan berdasarkan tab yang dipilih
      body: _widgetOptions.elementAt(_selectIndex),
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black, // Mengatur warna latar belakang hitam
        selectedItemColor: Colors.orange.shade900, // Warna ikon terpilih
        unselectedItemColor: Colors.white70, // Warna ikon yang tidak terpilih
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.rss_feed_rounded),
            label: "Kategori",
          ),
        ],
        currentIndex: _selectIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

// Widget untuk konten halaman carousel
class CarouselContent extends StatelessWidget {
  final List<Map<String, dynamic>> beritaterbaru = [
    {
      'gambar': 'img/BestJeanist.png',
      'judul': 'Teens have abandoned Facebook, Pew study says',
      'penulis': 'Amanda Silberling',
    },
    {
      'gambar': 'img/Ectoplasm.png',
      'judul':
          'Fox-owned Tubi expands its free streaming service to five Latin American countries',
      'penulis': 'Ectoplasm',
    }
  ];

  final PageController _pageController = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bagian Breaking News
            Text(
              "Breaking News",
              style: TextStyle(
                fontSize: 26.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),

            // Carousel dengan gambar dan teks
            SizedBox(
              height: 200, // Atur tinggi carousel sesuai kebutuhan
              child: PageView.builder(
                controller: _pageController,
                itemCount: beritaterbaru.length,
                onPageChanged: (index) {
                  currentPage = index;
                },
                itemBuilder: (context, index) {
                  final berita = beritaterbaru[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16.0),
                          child: Image.asset(
                            berita['gambar'],
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 200,
                          ),
                        ),
                        // Overlay for the text (judul dan penulis)
                        Positioned(
                          bottom: 16, // Teks berada di bagian bawah gambar
                          left: 16,
                          right: 16,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withOpacity(0.7),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  berita['judul'],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  berita['penulis'],
                                  style: const TextStyle(
                                    color: Colors.white54,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Recent News",
              style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics:
                  NeverScrollableScrollPhysics(), // Menghindari scroll ganda
              itemCount: beritaterbaru.length,
              itemBuilder: (context, index) {
                final product = beritaterbaru[index];
                return _buildProductItem(
                  product['gambar'],
                  product['judul'],
                  product['penulis'],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk membangun tampilan setiap item produk
  Widget _buildProductItem(String gambar, String judul, String penulis) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black, // Background hitam
          borderRadius: BorderRadius.circular(16), // Sudut melengkung
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar di sisi kiri
            ClipRRect(
              borderRadius:
                  BorderRadius.circular(16), // Sudut melengkung gambar
              child: Image.asset(
                gambar,
                width: 120,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            // Kolom untuk judul berita dan penulis
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      judul,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      penulis,
                      style: const TextStyle(
                        color: Colors.white54,
                        fontSize: 12,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
