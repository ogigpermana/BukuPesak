import 'package:flutter/material.dart';
import 'package:buku_pesak/ui/shared/text_styles.dart';
import 'package:buku_pesak/ui/shared/ui_helpers.dart';
import 'package:intl/intl.dart';

class SummaryWidget extends StatelessWidget {
  final int income;
  final int expense;

  const SummaryWidget({this.income, this.expense});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text('Pendapatan', style: summaryTextStyle),
                  UIHelper.verticalSpaceSmall(),
                  Text(
                      NumberFormat.currency(
                              locale: 'id', decimalDigits: 0, symbol: 'Rp')
                          .format(income),
                      style: summaryNumberTextStyleIncome)
                ],
              ),
              Text(
                '|',
                style: TextStyle(
                    fontSize: 32,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w200),
              ),
              Column(
                children: <Widget>[
                  Text(
                    'Pengeluaran',
                    style: summaryTextStyle,
                  ),
                  UIHelper.verticalSpaceSmall(),
                  Text(
                      NumberFormat.currency(
                              locale: 'id', decimalDigits: 0, symbol: 'Rp')
                          .format(expense),
                      style: summaryNumberTextStyleExpense)
                ],
              ),
              Text(
                '|',
                style: TextStyle(
                    fontSize: 32,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w200),
              ),
              Column(
                children: <Widget>[
                  Text(
                    'Saldo',
                    style: summaryTextStyle,
                  ),
                  UIHelper.verticalSpaceSmall(),
                  Text(
                      NumberFormat.currency(
                              locale: 'id', decimalDigits: 0, symbol: 'Rp')
                          .format(income - expense),
                      style: (income - expense) >= 0
                          ? summaryNumberTextStyleBalance
                          : summaryNumberTextStyleExpense)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
