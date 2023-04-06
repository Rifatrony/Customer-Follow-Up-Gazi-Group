import 'package:follow_up_customer/data/network/network_api_services.dart';
import 'package:follow_up_customer/res/AppUrl/app_url.dart';

class AddCustomerRepository {
  final _apiServices = NetworkApiServices();

  Future<dynamic> addCustomerApi(var data) async {
    dynamic response = 
        await _apiServices.postApiWithRawData(data, AppUrl.customersUrl);
    return response;
  }
}