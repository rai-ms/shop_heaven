import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shop_heaven/data/app_exceptions/app_exception.dart';
import 'package:shop_heaven/utils/app_helper/app_strings.dart';

GlobalKey<ScaffoldMessengerState> navigatorKeyNew =
    GlobalKey<ScaffoldMessengerState>();
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
GlobalKey<ScaffoldMessengerState> navigatorScaffoldKey =
    GlobalKey<ScaffoldMessengerState>();
const Duration apiTimeOut = Duration(minutes: 2);

bool isNullOrEmpty(dynamic value) {
  if (value == null) {
    return true;
  } else {
    if (value is List || value is String) {
      return value.isEmpty;
    } else {
      return value == AppStrings.emptyString;
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
    if (data != null || data != AppStrings.emptyString) {
      return data.toString();
    } else {
      return AppStrings.na;
    }
  } catch (e) {
    throw UnableToConvert(AppStrings.dataTypeMismatch);
  }
}

SizedBox sizedBox({double? hei, double? wid}) {
  return SizedBox(
    height: hei ?? 0.0,
    width: wid ?? 0.0,
  );
}