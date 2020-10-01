import 'package:buku_pesak/ui/widgets/currency_view_widget/currency_page.dart';
import 'package:flutter/material.dart';

class CurrencyConverterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Konversi Mata Uang'),
      ),
      body: CurrencyPage(),
    );
  }
}