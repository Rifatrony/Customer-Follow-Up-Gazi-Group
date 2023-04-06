import 'dart:async';

import 'package:flutter/material.dart';
import 'package:follow_up_customer/res/Colors/appColor.dart';
import 'package:follow_up_customer/res/assets/image_assets.dart';
import 'package:follow_up_customer/view/login_screen.dart';
import 'package:follow_up_customer/view/profile_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    checkAccessToken();
  }

  Future<void> checkAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('access_token');

    if (accessToken != null) {
      Timer(const Duration(seconds: 3), () {
      Get.to(const ProfileScreen());
    });
    }
    else{
      Timer(const Duration(seconds: 3), () {
      Get.to(const LoginScreen());
    });
    }
  }
  
  // SplashServices splashServices = SplashServices();
  
  // @override
  // void initState() {
  //   super.initState();
  //   splashServices.isLogin();
  // }
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Center(
        child: Image(
              height: 200,
              width: 200,
              image: AssetImage(ImageAssets.splashScreen),
            ),
      ),
    );
  }
}