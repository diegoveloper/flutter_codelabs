import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

Future<List> loadData() async {
  /*
  final response = await http
        .get("http://www.json-generator.com/api/json/get/caTFRWoMSW?indent=2");
  final data = response.body;      */
  final data = await rootBundle.loadString('assets/data.json');
  List list = json.decode(data);
  await Future.delayed(const Duration(seconds: 3));
  return list;
}
