import 'package:follow_up_customer/data/response/status.dart';
import 'package:follow_up_customer/model/Business/product_model.dart';
import 'package:follow_up_customer/repositories/business/product_repository.dart';
import 'package:get/get.dart';

class ProductViewModel extends GetxController{

  final _api = ProductRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final productList = ProductModel().obs;

  void setRxRequestStatus(Status _value) {
    rxRequestStatus.value = _value;
  }
  void setProductList(ProductModel _value) {
    productList.value = _value;
  }


  void getProductList() {
    _api.productListApi().then((value) {

      setRxRequestStatus(Status.COMPLETED);
      setProductList(value);

    }).onError((error, stackTrace) {
      setRxRequestStatus(Status.ERROR);
    });
  }


}