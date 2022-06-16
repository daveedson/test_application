import 'dart:developer';

import 'package:test_app/utils/extensions.dart';

class ParserUtil<T> {
  static DateTime parseJsonDate(String? dateString) {
    try {
      return DateTime.parse(dateString!);
    } catch (e) {
      return DateTime.now();
    }
  }

  
  static String parseJsonString(
    Object? json,
    String param, {
    String? defaultValue,
    bool isTitleCase = false,
  }) {
    try {
      json = json as Map;
      Object? result = json[param];

      if (result == null) return defaultValue ?? '';

      String resultString = result.toString();
      final parsedString =
          resultString.isEmpty ? defaultValue ?? resultString : resultString;

      if (isTitleCase) return parsedString.titleCase;
      return parsedString;
    } catch (e) {
      log(e.toString());
      if (isTitleCase) return defaultValue?.titleCase ?? '';
      return defaultValue ?? '';
    }
  }

  static bool parseJsonBoolean(Map? json, String param) {
    try {
      Object? result = json![param];

      if (result == null) return false;
      return result as bool;
    } catch (e) {
      return false;
    }
  }

  static double parseJsonDouble(Map? json, String param) {
    try {
      Object? result = json![param];

      if (result == null) return 0.0;
      return double.parse(result.toString());
    } catch (e) {
      print(e.toString());
      return 0.0;
    }
  }

  static int parseJsonInt(Map? json, String param) {
    try {
      Object? result = json![param];

      if (result == null) return 0;
      return result as int;
    } catch (e) {
      return 0;
    }
  }

  List<T> parseJsonList({ required List<dynamic>? json, required T Function(dynamic json) fromJson,}) {
    try {
      final data = List<dynamic>.from(json!);

      return List<T>.from(
        data.map(
          (e) => fromJson(e),
        ),
      );
    } catch (e) {
     log(e.toString());
      return [];
    }
  }
}
