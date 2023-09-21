import 'dart:convert';
import 'dart:io';

import 'package:shop_heaven/data/app_exceptions/app_exception.dart';
import 'package:shop_heaven/data/network/base_api_service.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  @override
  Future getAPI(String url) async {
    http.Response res;
    try {
      res = await http.get(Uri.parse(url));
      return returnResponse(res);
    } on SocketException {
      throw InternetException("No Network ");
    } on RequestTimeOut {
      throw RequestTimeOut("Taking more time ");
    }
  }

  @override
  Future postAPI(String url, dynamic data)async {
     http.Response res;
    try {
      res = await http.post(Uri.parse(url), body: jsonEncode(data));
      return returnResponse(res);
    } on SocketException {
      throw InternetException("No Network ");
    } on RequestTimeOut {
      throw RequestTimeOut("Taking more time ");
    }
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 400:
        throw InvalidUrl("Invalid Url");
      default:
        throw FetchDataException("Unable to fetch data");
    }
  }
}
