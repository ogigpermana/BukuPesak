import 'package:buku_pesak/ui/views/about_view.dart';
import 'package:buku_pesak/ui/views/currency_converter_view.dart';
import 'package:buku_pesak/ui/views/help_view.dart';
import 'package:flutter/material.dart';
import 'package:buku_pesak/core/database/moor_database.dart';
import 'package:buku_pesak/ui/views/details_view.dart';
import 'package:buku_pesak/ui/views/edit_view.dart';
import 'package:buku_pesak/ui/views/home_view.dart';
import 'package:buku_pesak/ui/views/insert_transaction_view.dart';
import 'package:buku_pesak/ui/views/new_transaction_view.dart';
import 'package:buku_pesak/ui/views/piechart_view.dart';
import 'package:buku_pesak/ui/views/reminder_view.dart';
import 'package:buku_pesak/ui/views/spash_view.dart';
import 'package:buku_pesak/ui/views/calculator_view.dart';

const String initialRoute = "login";

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SpashView());
      case 'home':
        return MaterialPageRoute(builder: (_) => HomeView());
      case 'edit':
        var transaction = settings.arguments as Transaction;
        return MaterialPageRoute(builder: (_) => EditView(transaction));
      case 'chart':
        return MaterialPageRoute(builder: (_) => PieChartView());
      case 'newtransaction':
        return MaterialPageRoute(builder: (_) => NewTransactionView());
      case 'inserttransaction':
        var args = settings.arguments as List<dynamic>;
        return MaterialPageRoute(
            builder: (_) =>
                InsertTranscationView(args.elementAt(0), args.elementAt(1)));
      case 'details':
        var transaction = settings.arguments as Transaction;
        return MaterialPageRoute(builder: (_) => DetailsView(transaction));
      case 'reminder':
        return MaterialPageRoute(builder: (_) => ReminderView());
      case 'calculator':
        return MaterialPageRoute(builder: (_) => CalculatorView());
      case 'currencyconverter':
        return MaterialPageRoute(builder: (_) => CurrencyConverterView());
      case 'help':
        return MaterialPageRoute(builder: (_) => HelpView());
      case 'about':
        return MaterialPageRoute(builder: (_) => AboutView());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
