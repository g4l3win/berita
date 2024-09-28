import 'package:flutter/material.dart';

class CarouselPage extends StatefulWidget {
  const CarouselPage({Key? key}) : super(key: key);

  @override
  _CarouselPageState createState() => _CarouselPageState();
}

class _CarouselPageState extends State<CarouselPage> {
//list berita harian
  List<Map<String, dynamic>> beritaterbaru = [
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

  // Controller for the PageView
  final PageController _pageController = PageController();
  int currentPage = 0;

  // List of image URLs
  final List<String> imageList = [
    'img/BestJeanist.png',
    'img/Ectoplasm.png',
    'img/EdgeShot.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Berita",
        ),
      ),
      body: SingleChildScrollView(
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
                    setState(() {
                      currentPage = index;
                    });
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
              // Expanded ListView untuk daftar produk
              ListView.builder(
                shrinkWrap: true, // Agar tidak menyebabkan overflow
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
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black, // Mengatur warna latar belakang hitam
        selectedItemColor: Colors.orange.shade900, // Warna ikon terpilih
        unselectedItemColor: Colors.white70, // Warna ikon yang tidak terpilih
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.rss_feed_rounded),
            label: "Feed",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }

  // Create an indicator (dots) for current image
  Widget _buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(imageList.length, (index) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 5.0),
          height: 10.0,
          width: currentPage == index ? 20.0 : 10.0,
          decoration: BoxDecoration(
            color: currentPage == index ? Colors.blue : Colors.grey,
            borderRadius: BorderRadius.circular(5.0),
          ),
        );
      }),
    );
  }
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
            borderRadius: BorderRadius.circular(16), // Sudut melengkung gambar
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
                    maxLines: 2, // Batasi maksimal 2 baris
                    overflow: TextOverflow
                        .ellipsis, // Tambahkan titik tiga jika teks terlalu panjang
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
