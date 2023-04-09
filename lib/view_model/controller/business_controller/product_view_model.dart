import 'package:follow_up_customer/model/Business/product_model.dart';
import 'package:follow_up_customer/repositories/business/product_repository.dart';
import 'package:get/get.dart';

class ProductViewModel extends GetxController {
  final _api = ProductRepository();

  final loading = true.obs;

  final productList = ProductModel().obs;
  final selectedProductId = 0.obs;
  Data? selectedProduct;

  void setLoading(bool value) {
    loading.value = value;
  }

  void setProductList(ProductModel value) {
    productList.value = value;
  }

  final selected = "".obs;

  void setSelected(String value) {
    selected.value = value;
  }

  void getProductList() {
    setLoading(true);
    try {
      _api.productListApi().then((value) {
        setLoading(false);
        setProductList(value);
      }).onError((error, stackTrace) {
        setLoading(false);
      });
    } catch (error) {
      setLoading(false);
    }
  }
}
