import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:follow_up_customer/res/Colors/appColor.dart';
import 'package:get/get.dart';

class Utils {

  static void fieldFocusChange ( BuildContext context, FocusNode current, FocusNode next ) {
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }

  static toastMessage(String message){
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: AppColor.blackColor,
    );
  }

  static bool isValidEmail(String email){
    final RegExp emailRegex = RegExp(
      r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$'
    );
    return emailRegex.hasMatch(email);
  }

  static snackBar(String title, String message){
    Get.snackbar(
      title,
      message,
      colorText: Colors.white,
      backgroundColor: Colors.green.shade400,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.only(
        bottom: 26,
        left: 16,
        right: 16
      )
    );
  }

}