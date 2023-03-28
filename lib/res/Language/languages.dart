
import 'package:get/get_navigation/src/root/internacionalization.dart';

class Languages extends Translations{
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US' : {
      'email_hint' : 'Email',
      'password_hint' : 'Password',
      'login' : 'Login',
    },
    'bn_BD' : {
      'email_hint' : 'ইমেইল প্রদান করুন'
    },
  };
}