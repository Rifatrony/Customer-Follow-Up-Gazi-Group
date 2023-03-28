import 'package:follow_up_customer/data/network/network_api_services.dart';
import 'package:follow_up_customer/model/Business/product_model.dart';
import 'package:follow_up_customer/res/AppUrl/app_url.dart';

class ProductRepository {
  final _apiServices = NetworkApiServices();

  Future<ProductModel> productListApi() async {

    dynamic response = 
        await _apiServices.getApi(
          AppUrl.productUrl
        );
    return ProductModel.fromJson(response);
  }
}
