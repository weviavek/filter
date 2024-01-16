import 'dart:convert';

import 'package:flutter/services.dart';

class DataFetchControllers {
  Future<Map<String, dynamic>> loadJSONFromFile() async {
    String data = await rootBundle.loadString('assets/filter.json');
    return jsonDecode(data);
  }
}
