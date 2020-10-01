import 'package:flutter/material.dart';
import 'package:buku_pesak/ui/shared/app_colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer(
    BuildContext context, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Image.asset(
              'assets/icons/wallet.png',
              width: 100,
              height: 100,
              alignment: Alignment.centerLeft,
            ),
            decoration: BoxDecoration(
              color: backgroundColor,
            ),
          ),
          ListTile(
            title: Text('Chart'),
            leading: FaIcon(FontAwesomeIcons.chartPie),
            onTap: () {
              Navigator.of(context).pushNamed("chart");
            },
          ),
          Divider(
            thickness: 1,
          ),
          ListTile(
            title: Text('Pengingat'),
            leading: FaIcon(FontAwesomeIcons.bell),
            onTap: () {
              Navigator.of(context).pushNamed("reminder");
            },
          ),
          Divider(
            thickness: 1,
          ),
          ListTile(
            title: Text('Kalkulator'),
            leading: FaIcon(FontAwesomeIcons.calculator),
            onTap: () {
              Navigator.of(context).pushNamed("calculator");
            },
          ),
          Divider(
            thickness: 1,
          ),
          ListTile(
            title: Text('Konversi Mata Uang'),
            leading: FaIcon(FontAwesomeIcons.dollarSign),
            onTap: () {
              Navigator.of(context).pushNamed("currencyconverter");
            },
          ),
          Divider(
            thickness: 1,
          ),
          ListTile(
            title: Text('Bantuan'),
            leading: FaIcon(FontAwesomeIcons.wrench),
            onTap: () {
              Navigator.of(context).pushNamed("help");
            },
          ),
          Divider(
            thickness: 1,
          ),
          ListTile(
            title: Text('Tentang Aplikasi'),
            leading: FaIcon(FontAwesomeIcons.info),
            onTap: () {
              Navigator.of(context).pushNamed("about");
            },
          ),
          Divider(
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
