import 'package:follow_up_customer/data/network/network_api_services.dart';
import 'package:follow_up_customer/res/AppUrl/app_url.dart';
import 'package:http/http.dart';

class LoginRepository {
  final _apiServices = NetworkApiServices();

  Future<dynamic> loginApi(var data) async {
    dynamic response = 
        await _apiServices.postApi(data, AppUrl.loginUrl);
    return response;
  }
}