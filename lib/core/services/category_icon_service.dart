import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:buku_pesak/core/models/category.dart';

class CategoryIconService {
  //* FIRST : EXPENSE LIST
  final expenseList = {
    Category(0, "Makanan", FontAwesomeIcons.pizzaSlice, Colors.green),
    Category(1, "Tagihan", FontAwesomeIcons.moneyBill, Colors.blue),
    Category(2, "Transportasi", FontAwesomeIcons.bus, Colors.blueAccent),
    Category(3, "Rumah", FontAwesomeIcons.home, Colors.brown),
    Category(4, "Hiburan", FontAwesomeIcons.gamepad, Colors.cyanAccent),
    Category(5, "Belanja", FontAwesomeIcons.shoppingBag, Colors.deepOrange),
    Category(6, "Pakaian", FontAwesomeIcons.tshirt, Colors.deepOrangeAccent),
    Category(7, "Asuransi", FontAwesomeIcons.hammer, Colors.indigo),
    Category(8, "Telepon", FontAwesomeIcons.phone, Colors.indigoAccent),
    Category(9, "Kesehatan", FontAwesomeIcons.briefcaseMedical, Colors.lime),
    Category(10, "Olahraga", FontAwesomeIcons.footballBall, Colors.limeAccent),
    Category(11, "Kecantikan", FontAwesomeIcons.marker, Colors.pink),
    Category(12, "Pendidikan", FontAwesomeIcons.book, Colors.teal),
    Category(13, "Hadiah", FontAwesomeIcons.gift, Colors.redAccent),
    Category(14, "Peliharaan", FontAwesomeIcons.dog, Colors.deepPurpleAccent),
  };
  //* SECOND : INCOME LIST
  final incomeList = {
    Category(0, "Gaji", FontAwesomeIcons.wallet, Colors.green),
    Category(1, "Penghargaan", FontAwesomeIcons.moneyCheck, Colors.amber),
    Category(2, "Pemberian", FontAwesomeIcons.gifts, Colors.lightGreen),
    Category(3, "Sewa", FontAwesomeIcons.fantasyFlightGames, Colors.yellow),
    Category(4, "Investasi", FontAwesomeIcons.home, Colors.cyanAccent),
  };
}
