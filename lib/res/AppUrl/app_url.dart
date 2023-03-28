import 'package:follow_up_customer/model/login/login_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppUrl {
  static const String baseUrl = 'https://gazi.techjetit.com/customer-service';
  static const String loginUrl = '$baseUrl/api/auth/login';
  static const String productUrl = '$baseUrl/api/auth/products';
  static const String profileUrl = '$baseUrl/api/auth/profile';

} 