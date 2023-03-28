import 'package:follow_up_customer/res/routes/routes_name.dart';
import 'package:follow_up_customer/view/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {

  static appRoutes () => {
    GetPage(
      name: RouteName.splashScreen, 
      page: () => SplashScreen(),
      // transitionDuration: const Duration(milliseconds: 250),
      // transition: Transition.leftToRightWithFade
    ),

    GetPage(
      name: RouteName.loginScreen, 
      page: () => SplashScreen(),
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade
    )
  };
}