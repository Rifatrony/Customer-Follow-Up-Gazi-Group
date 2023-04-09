import 'package:follow_up_customer/data/network/network_api_services.dart';
import 'package:follow_up_customer/model/Business/business_category.dart';
import 'package:follow_up_customer/res/AppUrl/app_url.dart';

class BusinessRepository {
  final apiServices = NetworkApiServices();
  Future<BusinesssCategoryModel> getBusinessCategory() async {
    dynamic respone = await apiServices.getApi(AppUrl.businessUrl);
    return BusinesssCategoryModel.fromJson(respone);
  }
}