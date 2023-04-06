import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:follow_up_customer/data/response/status.dart';
import 'package:follow_up_customer/view_model/controller/business_controller/product_view_model.dart';
import 'package:follow_up_customer/view_model/controller/user_preferences/user_preference_view_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  final productViewModel = Get.put(ProductViewModel());

  UserPrefernce userPrefernce = UserPrefernce();
  var token;

  @override
  void initState() {
    super.initState();
    productViewModel.getProductList();
    checkAccessToken();
  }

  Future<void> checkAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('access_token');

    if (accessToken != null) {
      print(accessToken);
    }
  }
  
  @override
  Widget build(BuildContext context) {

    var token = UserPrefernce().getAccessToken();
    print("token");

  // userPrefernce.getUser().then((value) {
  //   token = value.accessToken.toString();
  //   if (kDebugMode) {
  //     print("Printing the token form home page $token");
  //   }
  // });
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: (){
              
            }, 
            icon: const Icon(Icons.logout_outlined)
          ),
        ],
        
      ),
      body: 
        Obx(() {
          switch(productViewModel.rxRequestStatus.value) {
            case Status.LOADING:
              return Center(child: CircularProgressIndicator());

            case Status.ERROR:
              return Text("Error");

            case Status.COMPLETED:
            // return Text("Successfull");
              return ListView.builder(
                itemCount: productViewModel.productList.value.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)
                    ),
                    child: ListTile(
                      title: Text(productViewModel.productList.value.data![index].name.toString()),
                      subtitle: Text(productViewModel.productList.value.data![index].businessCatName.toString()),
                    ),
                  );
                }
              );
          }
        })
    );
  }
}