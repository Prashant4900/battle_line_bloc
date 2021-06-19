import 'dart:io';
import 'package:battle_line/constant/api_route.dart';
import 'package:battle_line/services/api/http_exceptions.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class ApiBaseHelper {
  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      final response = await http.get(Uri.http(ApiRoute.baseApi, url));
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api get recieved!');
    return responseJson;
  }

  // Future<dynamic> post(String url, dynamic body) async {
  //   print('Api Post, url $url');
  //   var responseJson;
  //   try {
  //     final response = await http.post(Uri.https(ApiRoute.baseApi, url), body: body);
  //     responseJson = _returnResponse(response);
  //   } on SocketException {
  //     print('No net');
  //     throw FetchDataException('No Internet connection');
  //   }
  //   print('api post.');
  //   return responseJson;
  // }

  // Future<dynamic> put(String url, dynamic body) async {
  //   print('Api Put, url $url');
  //   var responseJson;
  //   try {
  //     final response = await http.put(Uri.https(ApiRoute.baseApi, url), body: body);
  //     responseJson = _returnResponse(response);
  //   } on SocketException {
  //     print('No net');
  //     throw FetchDataException('No Internet connection');
  //   }
  //   print('api put.');
  //   print(responseJson.toString());
  //   return responseJson;
  // }

  // Future<dynamic> delete(String url) async {
  //   print('Api delete, url $url' + " 1");
  //   var apiResponse;
  //   try {
  //     final response = await http.delete(Uri.https(ApiRoute.baseApi, url));
  //     apiResponse = _returnResponse(response);
  //   } on SocketException {
  //     print('No net');
  //     throw FetchDataException('No Internet connection');
  //   }
  //   print('api delete.');
  //   return apiResponse;
  // }
}

dynamic _returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = json.decode(response.body.toString());
      // print(response.body);
      return responseJson;
    case 400:
      throw BadRequestException(response.body.toString());
    case 401:
    case 403:
      throw UnauthorisedException(response.body.toString());
    case 500:
    default:
      throw FetchDataException('Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  }
}
