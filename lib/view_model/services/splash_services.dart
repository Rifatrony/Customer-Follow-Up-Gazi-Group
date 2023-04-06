import 'dart:async';

import 'package:follow_up_customer/view/login_screen.dart';
import 'package:follow_up_customer/view/profile_screen.dart';
import 'package:follow_up_customer/view_model/controller/user_preferences/user_preference_view_model.dart';
import 'package:get/get.dart';

class SplashServices {

  UserPrefernce userPrefernce = UserPrefernce();

  void isLogin() {

    Timer(const Duration(seconds: 3), () {
      Get.to(const LoginScreen());
    });


    // userPrefernce.getUser().then((value) {
    //   if(value.accessToken!.isEmpty || value.accessToken.toString() == "null"){
    //     Timer(const Duration(seconds: 2), () {
    //       Get.off(const LoginScreen());
    //     });
    //   }else{
    //     Timer(const Duration(seconds: 2), () {
    //       Get.off(const ProfileScreen());
    //     });
    //   }
    // });
  }
}