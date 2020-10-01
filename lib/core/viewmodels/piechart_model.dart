import 'package:buku_pesak/core/enums/viewstate.dart';
import 'package:buku_pesak/core/services/category_icon_service.dart';
import 'package:buku_pesak/core/viewmodels/base_model.dart';
import 'package:buku_pesak/core/database/moor_database.dart';
import 'package:buku_pesak/core/services/moordatabase_service.dart';
import '../../locator.dart';

class PieChartModel extends BaseModel {
  List<String> months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  final MoorDatabaseService _moorDatabaseService =
      locator<MoorDatabaseService>();

  final CategoryIconService _categoryIconService =
      locator<CategoryIconService>();

  List<Transaction> transactions = List<Transaction>();

  int selectedMonthIndex = 0;

  Map<String, double> dataMap = new Map<String, double>();

  String type = 'expense';

  List<String> types = ["Pendapatan", "Pengeluaran"];

  init(bool firstTime) async {
    if (firstTime) selectedMonthIndex = DateTime.now().month - 1;

    setState(ViewState.Busy);
    notifyListeners();

    transactions = await _moorDatabaseService.getAllTransactionsForType(
        months.elementAt(selectedMonthIndex), type);

    dataMap = getDefaultDataMap(transactions);

    transactions.forEach((element) {
      prepareDataMap(element);
    });

    print(dataMap.toString());

    setState(ViewState.Idle);
    notifyListeners();
  }

  changeSelectedMonth(int val) async {
    selectedMonthIndex = val;

    transactions = await _moorDatabaseService.getAllTransactionsForType(
        months.elementAt(selectedMonthIndex), type);
    // clear old data
    dataMap = getDefaultDataMap(transactions);

    transactions.forEach((element) {
      prepareDataMap(element);
    });

    notifyListeners();
  }

  Map<String, double> getDefaultDataMap(List<Transaction> transactions) {
    Map<String, double> fullExpensesMap = {
      'Makanan': 0,
      'Tagihan': 0,
      'Transportasi': 0,
      'Rumah': 0,
      'Hiburan': 0,
      'Belanja': 0,
      'Pakaian': 0,
      'Asuransi': 0,
      'Telepon': 0,
      'Kesehatan': 0,
      'Olahraga': 0,
      'Kecantikan': 0,
      'Pendidikan': 0,
      'Hadiah': 0,
      'Peliharaan': 0,
      'Gaji': 0,
      'Penghargaan': 0,
      'Pemberian': 0,
      'Sewa': 0,
      'Investasi': 0,
    };

    Map<String, double> fullIncomeMap = {
      'Gaji': 0,
      'Penghargaan': 0,
      'Pemberian': 0,
      'Sewa': 0,
      'Investasi': 0,
    };

    List<String> transactionsCategories = List();

    transactions.forEach((element) {
      if (type == 'income') {
        String category = _categoryIconService.incomeList
            .elementAt(element.categoryindex)
            .name;
        transactionsCategories.add(category);
      } else {
        String category = _categoryIconService.expenseList
            .elementAt(element.categoryindex)
            .name;
        transactionsCategories.add(category);
      }
    });

    if (type == 'income') {
      fullIncomeMap.removeWhere((key, value) {
        return !transactionsCategories.contains(key);
      });
      return fullIncomeMap;
    }

    fullExpensesMap.removeWhere((key, value) {
      return !transactionsCategories.contains(key);
    });

    return fullExpensesMap;
  }

  changeType(int val) async {
    // 0 => income
    // 1 => expense
    if (val == 0) {
      type = 'income';
    } else {
      type = 'expense';
    }

    await init(false);
  }

  void prepareDataMap(element) {
    if (type == 'income') {
      dataMap[_categoryIconService.incomeList
          .elementAt(element.categoryindex)
          .name] = dataMap[_categoryIconService.incomeList
              .elementAt(element.categoryindex)
              .name] +
          element.amount;
    } else {
      dataMap[_categoryIconService.expenseList
          .elementAt(element.categoryindex)
          .name] = dataMap[_categoryIconService.expenseList
              .elementAt(element.categoryindex)
              .name] +
          element.amount;
    }
  }
}
