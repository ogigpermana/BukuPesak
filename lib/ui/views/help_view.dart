import 'package:flutter/material.dart';

class HelpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 300.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text("Petunjuk Penggunaan"),
                background: Image.asset(
                  'assets/icons/help.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  RichText(
                    text: TextSpan(
                      text: '=>Fitur Grafis Chart<=',
                      style: TextStyle(
                          color: Colors.teal,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(),
                  RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      text:
                          'Untuk melihat persentase pengeluaran dan pemasukan setiap bulan dalam satu tahun, saat ini fitur belum dilengkapi dengan laporan dalam bentuk format pdf atau excel',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        // fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Divider(),
                  RichText(
                    text: TextSpan(
                      text: '=>Fitur Pengingat<=',
                      style: TextStyle(
                          color: Colors.teal,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(),
                  RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      text:
                          'Digunakan sebagai pengingat harian yang bisa anda atur jam berapa aplikasi memberitahu anda setiap harinya',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        // fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Divider(),
                  RichText(
                    text: TextSpan(
                      text: '=>Fitur Kalkulator<=',
                      style: TextStyle(
                          color: Colors.teal,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(),
                  RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      text:
                          'Fitur ini merupakan fitur yang sudah tidak asing, digunakan untuk membatu perhitungan matematis seperti penambahan, pengurangan, perkalian dan pembagian',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        // fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Divider(),
                  RichText(
                    text: TextSpan(
                      text: '=>Fitur konversi Mata Uang<=',
                      style: TextStyle(
                          color: Colors.teal,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(),
                  RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      text:
                          'Fitur ini berguna untuk mengetahui valuta asing, caranya dengan membandingkan harga mata uang di berbagai negara, fitur ini menggunakan API dari api.exchangeratesapi.io, sehingga datanya bisa berubah-ubah setiap waktu ada perubahan dari server',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        // fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Divider(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
