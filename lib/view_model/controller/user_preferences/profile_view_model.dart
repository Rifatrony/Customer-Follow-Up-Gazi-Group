import 'package:follow_up_customer/data/response/status.dart';
import 'package:follow_up_customer/model/login/profile_model.dart';
import 'package:follow_up_customer/repositories/auth_repository/profile_repository.dart';
import 'package:get/get.dart';

class ProfileViewModel extends GetxController{

  final _api = ProfileRepository();
  final rxRequestStatus = Status.LOADING.obs;

  final user = ProfileModel().obs;


  void setRxRequestStatus(Status _value) {
    rxRequestStatus.value = _value;
  }

  void setUserDetails(ProfileModel _value) {
    user.value = _value;
  }

  Future<void> getUserProfile () async {
    try{
      _api.getUserProfile().then((value) {

        setRxRequestStatus(Status.COMPLETED);
        setUserDetails(value);
        
      }).onError((error, stackTrace) {
        setRxRequestStatus(Status.ERROR);
      });
    }
    catch(e){
      print(e.toString());
    }
    
  }
}