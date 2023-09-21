import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shop_heaven/data/app_exceptions/app_exception.dart';

GlobalKey<ScaffoldMessengerState> navigatorKeyNew =
    GlobalKey<ScaffoldMessengerState>();
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
GlobalKey<ScaffoldMessengerState> navigatorScaffoldKey =
    GlobalKey<ScaffoldMessengerState>();
const Duration apiTimeOut = Duration(minutes: 2);
Function(String)? updateMessage;

bool isNullOrEmpty(dynamic value) {
  if (value == null) {
    return true;
  } else {
    if (value is List || value is String) {
      return value.isEmpty;
    } else {
      return value == '';
    }
  }
}

void printDebug(dynamic object) {
  if (kDebugMode) {
    print(object);
  }
}

String convertNA(data) {
  try {
    if (data != null || data != '') {
      return data.toString();
    } else {
      return 'N/A';
    }
  } catch (e) {
    throw UnableToConvert("DataType Mismatch");
  }
}

SizedBox sizedBox({double? hei, double? wid}) {
  return SizedBox(
    height: hei ?? 0.0,
    width: wid ?? 0.0,
  );
}
