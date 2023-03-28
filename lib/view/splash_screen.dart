import 'package:flutter/material.dart';
import 'package:follow_up_customer/res/Colors/appColor.dart';
import 'package:follow_up_customer/res/assets/image_assets.dart';
import 'package:follow_up_customer/res/components/round_button.dart';
import 'package:follow_up_customer/utils/utils.dart';
import 'package:follow_up_customer/view_model/services/splash_services.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  SplashServices splashServices = SplashServices();
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  splashServices.isLogin();
  }
  
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