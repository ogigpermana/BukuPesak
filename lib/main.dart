import 'package:buku_pesak/ui/router.dart';
import 'package:buku_pesak/ui/shared/app_colors.dart';
import 'package:flutter/material.dart';

import 'locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buku Pesak',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: backgroundColor,
        accentColor: Colors.orange[800],
      ),
      initialRoute: '/',
      onGenerateRoute: Router.generateRoute,
    );
  }
}
