import 'package:follow_up_customer/data/network/network_api_services.dart';
import 'package:follow_up_customer/model/login/profile_model.dart';
import 'package:follow_up_customer/res/AppUrl/app_url.dart';

class ProfileRepository {
  final _apiServices = NetworkApiServices();
  Future<ProfileModel> getUserProfile() async {
    dynamic response = await _apiServices.getApi(
      AppUrl.profileUrl
    );

    return ProfileModel.fromJson(response);
  }
}