import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:follow_up_customer/data/response/status.dart';
import 'package:follow_up_customer/res/AppUrl/app_url.dart';
import 'package:follow_up_customer/res/components/AppText.dart';
import 'package:follow_up_customer/view/add_customer_screen.dart';
import 'package:follow_up_customer/view_model/controller/user_preferences/profile_view_model.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

 

  final userProfileViewModel = Get.put(ProfileViewModel());

   @override
    void initState() {
      super.initState();
      userProfileViewModel.getUserProfile();
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
    return Scaffold(
      body: Obx( (){
        switch(userProfileViewModel.rxRequestStatus.value){
          case Status.LOADING:
              return const Center(child: CircularProgressIndicator());

        case Status.ERROR:
          return const Text("Error here");

        case Status.COMPLETED:
          return Stack(
            clipBehavior: Clip.none,
            children: [

              Container(
                height: Get.height * 1,
                width: Get.width * 1,
                color: Colors.white,
              ),
              
              Positioned(
                child: Container(
                  height: Get.height * 0.3,
                  width: Get.width * 1,
                  decoration: BoxDecoration(
                    color: Colors.greenAccent.shade400,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(26),
                      bottomRight: Radius.circular(26),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Obx( () =>
                                  Text(
                                    userProfileViewModel.user.value.data!.name.toString(),
                                    maxLines: 1,
                                    style: const TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.7
                                    ),
                                  ),
                                ),
                          
                                SizedBox(height: Get.height * 0.01,),
                          
                                Text(
                                  userProfileViewModel.user.value.data!.phone.toString(),
                                  style: GoogleFonts.roboto(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                          
                                Text(
                                  userProfileViewModel.user.value.data!.email.toString(),
                                  style: GoogleFonts.roboto(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                          
                          
                                Text(
                                  userProfileViewModel.user.value.data!.division.toString(),
                                  style: GoogleFonts.notoEmoji(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 1.5
                                  ),
                                ),
        
                                Text(
                                  userProfileViewModel.user.value.data!.designation.toString(),
                                  style: GoogleFonts.notoEmoji(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 1.5
                                  ),
                                ),
                              ],
                            ),
                        ),
                        
                        Expanded(
                          flex: 1,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.grey.shade400,
                                radius: 56,
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.white, width: 3),
                                  ),
                                  child: CircleAvatar(
                                    radius: 50,
                                    backgroundColor: Colors.grey.shade400,
                                    backgroundImage: userProfileViewModel.user.value.data!.avatar != null ?  const NetworkImage("${AppUrl.baseUrl}/storage/user-avatar/y9UXDd1WpBDsJFcv8NlKE94R6BT9CwankjxsiqYG.jpg") : const NetworkImage("https://media.istockphoto.com/id/1322277517/photo/wild-grass-in-the-mountains-at-sunset.jpg?s=612x612&w=0&k=20&c=6mItwwFFGqKNKEAzv0mv6TaxhLN3zSE43bWmFN--J5w="),
                                        
                                  ),
                                ),
                              ),
                        
                              Positioned(
                                top: 70,
                                left: 70,
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white.withOpacity(0.9)
                                  ),
                                  child: const Icon(
                                    Icons.add_a_photo_outlined, 
                                    color: Colors.black,
                                    size: 22,
                                  ),
                                ),
                              ),
                              
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              
              Positioned(
                top: Get.height * 0.25,
                left: Get.width * 0.08,
                right: Get.width * 0.08,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  height: Get.height * 0.20,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 8,),
                      Text(
                        "Target",
                        style: GoogleFonts.roboto(
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 4
                        ),
                      ),
                      const SizedBox(height: 8,),
                  
                      Text(
                        userProfileViewModel.user.value.data!.month.toString(),
                        style: GoogleFonts.roboto(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 3,
                          color: Colors.purple
                        ),
                      ),
                      
                      const SizedBox(height: 20,),
                      
                      IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                AppText(title: "Remaining\nTarget", textColor: Colors.red.shade500, fontSize: 13, fontWeight: FontWeight.w500,),
                                const SizedBox(height: 5,),
                                AppText(
                                  title: "${userProfileViewModel.user.value.data!.target! - userProfileViewModel.user.value.data!.recovery!}", 
                                  textColor: Colors.grey.shade600, 
                                  fontSize: 14, 
                                  fontWeight: FontWeight.w400,
                                ),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 6),
                              child: VerticalDivider(
                                color: Colors.grey,
                                thickness: 1,
                              ),
                            ),
                      
                            Column(
                              children: [
                                AppText(title: "Completed\nTarget", textColor: Colors.greenAccent.shade700, fontSize: 13, fontWeight: FontWeight.w500,),
                                const SizedBox(height: 5,),
                                AppText(
                                  title: userProfileViewModel.user.value.data!.recovery.toString(), 
                                  textColor: Colors.grey.shade600, 
                                  fontSize: 14, 
                                  fontWeight: FontWeight.w400,
                                ),
                              ],
                            ),
                  
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 6),
                              child:  VerticalDivider(
                                color: Colors.grey,
                                thickness: 1,
                              ),
                            ),
                      
                            Column(
                              children: [
                                AppText(title: "My Total\nTarget", textColor: Colors.blueAccent.shade700, fontSize: 13, fontWeight: FontWeight.w500,),
                                const SizedBox(height: 5,),
                                AppText(
                                  title: userProfileViewModel.user.value.data!.target.toString(), 
                                  textColor: Colors.grey.shade600, 
                                  fontSize: 14, 
                                  fontWeight: FontWeight.w400,
                                ),
                              ],
                            ),
                  
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
        
              Positioned(
                top: Get.height * 0.48,
                left: Get.width * 0.08,
                right: Get.width * 0.08,
                child: SizedBox(
                  height: 150,
                  width: Get.width * 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          height: Get.height * 0.2,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(16)
                          ),
                          child: InkWell(
                            onTap: () {
                              Get.to(const AddCustomerScreen());
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(
                                  "https://indyme.com/wp-content/uploads/2020/11/customer-icon.png",
                                  height: 60,
                                  width: 60,
                                ),
                                const SizedBox(height: 10,),
                                Text(
                                  "Customer", 
                                  style: GoogleFonts.karla(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500
                                  ),
                                ),
                              ],
                            ),
                          )
                        ),
                      ),

                      const SizedBox(width: 16,),

                      Expanded(
                        child: Container(
                          height: Get.height * 0.2,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(16)
                          ),
                          child: InkWell(
                            onTap: (){
                              print("Follow Up");
                            }, 
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(
                                  "https://www.kindpng.com/picc/m/723-7236770_follow-up-and-processing-follow-up-icon-hd.png",
                                  height: 60,
                                  width: 60,
                                ),
                                const SizedBox(height: 10,),
                                Text(
                                  "Follow Up", 
                                  style: GoogleFonts.karla(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500
                                  ),
                                ),
                              ],
                            )
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
          }
        }
      ),
    );
  }
}
