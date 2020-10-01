import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:buku_pesak/core/database/moor_database.dart';
import 'package:buku_pesak/core/viewmodels/home_model.dart';
import 'package:intl/intl.dart';

class TransactionsListView extends StatefulWidget {
  final List<Transaction> transactions;
  final HomeModel model;

  const TransactionsListView(
    this.transactions,
    this.model,
  );

  @override
  _TransactionsListViewState createState() => _TransactionsListViewState();
}

class _TransactionsListViewState extends State<TransactionsListView> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView(
        controller: widget.model.scrollController,
        padding: EdgeInsets.all(8),
        children: widget.transactions.map((transaction) {
          return Card(
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, "details", arguments: transaction)
                    .then((value) => {
                          if (value != null)
                            {
                              if (value) {widget.model.init()}
                            }
                        });
              },
              child: Container(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          transaction.day + ', ' + transaction.month,
                          style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                        Text(
                          transaction.type +
                              ": " +
                              NumberFormat.currency(
                                      locale: 'id',
                                      decimalDigits: 0,
                                      symbol: 'Rp')
                                  .format(transaction.amount),
                          style: TextStyle(fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.blue.withOpacity(.1),
                        child: widget.model.getIconForCategory(
                            transaction.categoryindex, transaction.type),
                      ),
                      title: Text(transaction.memo),
                      trailing: transaction.type == 'expense'
                          ? Text(
                              '- ' +
                                  NumberFormat.currency(
                                          locale: 'id',
                                          decimalDigits: 0,
                                          symbol: 'Rp')
                                      .format(transaction.amount),
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold))
                          : Text(
                              NumberFormat.currency(
                                      locale: 'id',
                                      decimalDigits: 0,
                                      symbol: 'Rp')
                                  .format(transaction.amount),
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
