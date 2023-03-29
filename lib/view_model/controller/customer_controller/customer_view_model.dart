import 'package:flutter/material.dart';
import 'package:follow_up_customer/repositories/customer/add_customer_repository.dart';
import 'package:follow_up_customer/utils/utils.dart';
import 'package:get/get.dart';

class CustomerViewModel extends GetxController{

  final nameController = TextEditingController().obs;
  final phoneController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final addressController = TextEditingController().obs;

  final nameFocusNode = FocusNode().obs;
  final phoneFocusNode = FocusNode().obs;
  final emailFocusNode = FocusNode().obs;
  final addressocusNode = FocusNode().obs;

  RxBool loading = false.obs;

  final customerRepository = AddCustomerRepository();
  // AddCustomerModel addCustomerModel = AddCustomerModel();

  void addCustomerApi () {

    loading.value = true;

    Map data = {
      "name": nameController.value.text,
      "mobile": phoneController.value.text,
      "email": emailController.value.text,
      "address": addressController.value.text,
      "lat": "23.864587",
      "long": "90.3990245",
      "area_id": "1",
      "priority_id": "1",
      "business_cat_id": "1",
      "product_id": "1",
      "date": "2023-03-20"
    };
      
    customerRepository.addCustomerApi(data).then((value) {
      
      loading.value = false;

      if(value['message'] == "The mobile has already been taken."){
        Utils.snackBar("Message is ", value['message']);
      }
      else if(value['success'] == "Customer saved successfully."){
         Utils.snackBar(
          "New Customer Added","Welcome back ",
        );
      }
      
      

    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.snackBar("Error Found", error.toString());
    });
  }
}