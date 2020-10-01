import 'package:flutter/material.dart';
import 'package:buku_pesak/ui/shared/app_colors.dart';
import 'package:buku_pesak/ui/views/home_view.dart';
import 'package:splashscreen/splashscreen.dart';

class SpashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(child: buildSpashScreen()));
  }

  buildSpashScreen() {
    return SplashScreen(
        seconds: 2,
        navigateAfterSeconds: HomeView(),
        title: new Text(
          'Buku Pesak',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
        ),
        image: new Image.asset(
          'assets/icons/wallet.png',
          height: 100,
          width: 100,
        ),
        backgroundColor: backgroundColor,
        loadingText: Text(
          'Tempat untuk semua catatan pengeluaran anda.',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
        photoSize: 100.0,
        loaderColor: Colors.orange);
  }
}
