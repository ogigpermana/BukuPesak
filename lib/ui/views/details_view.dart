import 'package:flutter/material.dart';
import 'package:buku_pesak/core/database/moor_database.dart';
import 'package:buku_pesak/core/viewmodels/details_model.dart';
import 'package:buku_pesak/ui/shared/app_colors.dart';
import 'package:buku_pesak/ui/views/base_view.dart';
import 'package:buku_pesak/ui/widgets/details_view_widgets/details_card.dart';

class DetailsView extends StatelessWidget {
  final Transaction transaction;
  DetailsView(this.transaction);

  @override
  Widget build(BuildContext context) {
    return BaseView<DetailsModel>(
        builder: (context, model, child) => WillPopScope(
              onWillPop: () {
                Navigator.of(context).pushReplacementNamed('home');
                return Future.value(true);
              },
              child: Scaffold(
                appBar: AppBar(
                  leading: InkWell(
                    child: Icon(Icons.arrow_back),
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed('home');
                    },
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Details'),
                      InkWell(
                        child: Icon(Icons.delete),
                        onTap: () {
                          showDeleteDialog(context, model);
                        },
                      ),
                    ],
                  ),
                ),
                body: Stack(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: 300,
                      padding: const EdgeInsets.all(10.0),
                      child: DetailsCard(
                        transaction: transaction,
                        model: model,
                      ),
                    ),
                    Positioned(
                      right: 18,
                      top: 235,
                      child: FloatingActionButton(
                        child: Icon(Icons.edit, color: Colors.black38),
                        backgroundColor: backgroundColor,
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed('edit', arguments: transaction);
                        },
                      ),
                    )
                  ],
                ),
              ),
            ));
  }

  showDeleteDialog(BuildContext context, DetailsModel model) async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Hapus"),
            content: Text("Anda yakin mau menghapus catatan transaksi?"),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  "Hapus",
                ),
                onPressed: () async {
                  await model.deleteTransacation(transaction);
                  // hide dialog
                  Navigator.of(context).pop();
                  // exit detailsscreen
                  Navigator.of(context).pop(true);
                },
              ),
              FlatButton(
                child: Text("Batal"),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              )
            ],
          );
        });
  }
}
