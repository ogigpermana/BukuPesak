import 'package:flutter/material.dart';

class AboutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Tentang Aplikasi")),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              RichText(
                text: TextSpan(
                  text: 'Buku Pesak v1.1+b220920',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Divider(),
              RichText(
                text: TextSpan(
                  text:
                      'Buku Pesak adalah aplikasi sederhana yang dibuat untuk memenuhi pencatatan harian baik pendapatan atau pengeluaran ',
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
                  text: 'Fitur Aplikasi',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                      // fontWeight: FontWeight.bold
                      ),
                ),
              ),
              Divider(),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(text: ' - Pengingat Harian'),
                    TextSpan(
                        text: ' - Chart Pemasukan dan Pengeluaran Bulanan'),
                    TextSpan(text: ' - Kalkulator'),
                    TextSpan(text: ' - Konversi Mata Uang')
                  ],
                  style: TextStyle(
                    color: Colors.teal,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
