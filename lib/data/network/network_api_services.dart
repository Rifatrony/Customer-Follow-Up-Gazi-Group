import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:follow_up_customer/data/app_exceptions.dart';
import 'package:follow_up_customer/data/network/base_api_services.dart';
import 'package:follow_up_customer/view_model/controller/user_preferences/user_preference_view_model.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {

  @override
  Future getApi(String url) async {

    dynamic responseJson;
    
    try {
      
      var tok = await UserPrefernce().getAccessToken();

      final response =
          await http.get(
            Uri.parse(url),
            headers: {
              'Authorization': 'Bearer $tok'
            }
          ).timeout(const Duration(seconds: 20));
          responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }

    return responseJson;

  }

  @override
  Future postApi(var data, String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.post(
            Uri.parse(url),
            body: data,
          ).timeout(const Duration(seconds: 20));
          responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;

  }

  @override
  Future<dynamic> postApiWithRawData(var data, String url) async {
    dynamic responseJson;
    
    try {
      var token = await UserPrefernce().getAccessToken();

      // var token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2dhemkudGVjaGpldGl0LmNvbS9jdXN0b21lci1zZXJ2aWNlL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNjgwMDg4MzgwLCJleHAiOjE2ODAzMDQzODAsIm5iZiI6MTY4MDA4ODM4MCwianRpIjoiMG02V0VHNVBoM1pNN1dQOSIsInN1YiI6IjIiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.CK70StjpSnBLqIfGCLYE0b6Q-3Y0huaOIiFCpjRtSI0";

    
      final response =
          await http.post(
            Uri.parse(url),
            body: json.encode(data),
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $token',
            },
          ).timeout(const Duration(seconds: 20));
          responseJson = returnResponse(response);

          if (kDebugMode) {
        print("Token in Post API without Raw Data $token");
      }
          
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    
    return responseJson;

  }

  dynamic returnResponse(http.Response response) {
    
    switch(response.statusCode){
      case 200: 
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      case 400: 
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      default : 
        throw FetchDataException("Error while communication with server with status code ${response.statusCode}");
    }
  }
}
