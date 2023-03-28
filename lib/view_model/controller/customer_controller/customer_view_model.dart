import 'package:flutter/material.dart';
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

  void addCustomerApi () {
    
  }
}