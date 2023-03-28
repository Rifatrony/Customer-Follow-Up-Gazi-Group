import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:follow_up_customer/res/Language/languages.dart';
import 'package:follow_up_customer/res/routes/routes.dart';
import 'package:follow_up_customer/view/profile_screen.dart';
import 'package:follow_up_customer/view/splash_screen.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Customer Follow Up',
      translations: Languages(),
      locale: Locale('en', 'US'),
      fallbackLocale: Locale('en', 'US'),
      // locale: Locale('bn', 'BD'),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      // getPages: [
      //   GetPage(name: '/', page: () => ProfileScreen()),
      //  // GetPage(name: '/second_screen', page: () => SecondScreen()),
      //  // GetPage(name: '/third_screen', page: () => ThirdScreen()),
      // ],
      // getPages: AppRoutes.appRoutes(),
    );
  }
}
