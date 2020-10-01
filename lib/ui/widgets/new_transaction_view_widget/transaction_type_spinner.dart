import 'package:flutter/material.dart';

class TransactionTypeSpinner extends StatelessWidget {
  final selectedItem;
  final Function changedSelectedItem;
  const TransactionTypeSpinner(this.selectedItem, this.changedSelectedItem);

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        value: selectedItem,
        items: [
          DropdownMenuItem(
            child: Text("Pendapatan"),
            value: 1,
          ),
          DropdownMenuItem(
            child: Text("Pengeluaran"),
            value: 2,
          ),
        ],
        onChanged: (value) {
          changedSelectedItem(value);
        });
  }
}
