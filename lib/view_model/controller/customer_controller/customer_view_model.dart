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

  void addCustomerApi (var data) {

    loading.value = true;
      
    customerRepository.addCustomerApi(data).then((value) {
      
      loading.value = false;

      if(value['message'] == "The mobile has already been taken."){
        Utils.snackBar("Message is ", value['message']);
      }
      else {
         Utils.snackBar(
          "New Customer Added","Successfully added new customer",
        );
      }
      
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.snackBar("Error Found", error.toString());
    });
  }
}