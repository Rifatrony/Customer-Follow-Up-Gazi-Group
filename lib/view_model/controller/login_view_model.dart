import 'package:flutter/material.dart';
import 'package:follow_up_customer/model/login/login_response_model.dart';
import 'package:follow_up_customer/repositories/auth_repository/login_repository.dart';
import 'package:follow_up_customer/utils/utils.dart';
import 'package:follow_up_customer/view/home_screen.dart';
import 'package:follow_up_customer/view/profile_screen.dart';
import 'package:follow_up_customer/view_model/controller/user_preferences/user_preference_view_model.dart';
import 'package:get/get.dart';

class LoginViewModel extends GetxController{

  final _api = LoginRepository();

  UserPrefernce userPrefernce = UserPrefernce();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;

  void loginApi() {
    loading.value = true;
    Map data = {
      'phone': emailController.value.text.trim(),
      'password': passwordController.value.text.trim()
    };
    _api.loginApi(data).then((value) {
      
      loading.value = false;

      if(value['message'] == "Unauthorized"){
        Utils.snackBar(
        "Credential Don't Match.", value['message'] + " Please check your Number & Password",
        );
      }
      else{

        Utils.snackBar(
          "Login Successful","Welcome back ☺️ ",
        );

        userPrefernce.saveUser(LoginResponseModel.fromJson(value)).then((value) {
        Get.to(const ProfileScreen());
        }).onError((error, stackTrace) {
          Utils.snackBar("Error", error.toString());
        });

        

      }
      
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.snackBar("Error", error.toString());
    });
  }
}