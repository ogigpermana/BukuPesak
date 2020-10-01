import 'dart:async';
import 'dart:convert';

import 'package:buku_pesak/core/models/currency/rate.dart';
import 'package:buku_pesak/core/services/currency/consts.dart';
import 'package:http/http.dart';

Future<ExchangeRate> fetchLatestRates(Client client, String base) async {
  final response = await client.get(URL_LATEST_BASE + base);

  if (response == null) throw new Exception("Response is null");
  if (response.statusCode < 200 || response.statusCode > 400) {
    throw Exception(response.body);
  } else {
    return ExchangeRate.fromMap(JsonDecoder().convert(response.body));
  }
}