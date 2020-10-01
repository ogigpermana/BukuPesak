import 'package:flutter/material.dart';
import 'package:buku_pesak/core/models/category.dart';
import 'package:buku_pesak/core/viewmodels/insert_transaction_model.dart';
import 'package:buku_pesak/ui/shared/app_colors.dart';
import 'package:buku_pesak/ui/shared/ui_helpers.dart';
import 'package:buku_pesak/ui/views/base_view.dart';

class InsertTranscationView extends StatelessWidget {
  final Category category;
  final int selectedCategory;
  InsertTranscationView(this.category, this.selectedCategory);
  @override
  Widget build(BuildContext context) {
    return BaseView<InsertTransactionModel>(
      onModelReady: (model) => model.init(selectedCategory, category.index),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title:
              selectedCategory == 1 ? Text('Pendapatan') : Text('Pengeluaran'),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: <Widget>[
                ListTile(
                  title: Text(category.name),
                  leading: CircleAvatar(
                      child: Icon(
                    category.icon,
                    size: 20,
                  )),
                ),
                UIHelper.verticalSpaceMedium(),
                buildTextField(
                    model.memoController,
                    'Judul Task:',
                    "Masukan name pengeluaran atau pemasukan",
                    Icons.edit,
                    false),
                UIHelper.verticalSpaceMedium(),
                buildTextField(model.amountController, 'Jumlah Nominal:',
                    "Masukan jumlah nominal uang", Icons.attach_money, true),
                UIHelper.verticalSpaceMedium(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Pilih Tanggal:',
                    style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
                  ),
                ),
                Divider(
                  thickness: 2,
                ),
                Container(
                  width: 20,
                  height: 50,
                  child: RaisedButton(
                    child: Text(model.getSelectedDate()),
                    onPressed: () async {
                      await model.selectDate(context);
                    },
                  ),
                ),
                UIHelper.verticalSpaceLarge(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: RaisedButton(
                    child: Text(
                      'Tambah',
                      style: TextStyle(fontSize: 16),
                    ),
                    color: backgroundColor,
                    textColor: Colors.black,
                    onPressed: () async {
                      await model.addTransaction(context);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField buildTextField(TextEditingController controller, String text,
      String helperText, IconData icon, isNumeric) {
    return TextFormField(
      cursorColor: Colors.black,
      maxLength: isNumeric ? 10 : 40,
      keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        icon: Icon(
          icon,
          color: Colors.black,
        ),
        labelText: text,
        suffixIcon: InkWell(
          onTap: () {
            controller.clear();
          },
          child: Icon(
            Icons.clear,
            color: Colors.black,
          ),
        ),
        labelStyle: TextStyle(
          color: Color(0xFFFF000000),
        ),
        helperText: helperText,
      ),
    );
  }
}
