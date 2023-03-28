import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:follow_up_customer/res/Colors/appColor.dart';
import 'package:follow_up_customer/res/components/round_button.dart';
import 'package:follow_up_customer/utils/utils.dart';
import 'package:follow_up_customer/view_model/controller/login_view_model.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final loginViewModel = Get.put(LoginViewModel());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.whiteColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.15,),

            const Text(
              "Welcome Back\nLogin to Continue",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
            Form(
              key: _formKey,
              child: Column(
                children: [

                  TextFormField(
                    controller: loginViewModel.emailController.value,
                    keyboardType: TextInputType.number,
                    focusNode: loginViewModel.emailFocusNode.value,

                    validator: (value) {
                      if(value!.isEmpty){
                        Utils.snackBar("Email", "Please Enter your email");
                      }
                    },
                    decoration: InputDecoration(
                      isDense: true,
                      labelText: "Phone",
                      hintText: 'Phone',
                      prefixIcon: const Icon(
                        Icons.phone_outlined,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onFieldSubmitted: (value) {
                      Utils.fieldFocusChange(
                          context, loginViewModel.emailFocusNode.value, loginViewModel.passwordFocusNode.value);
                    },
                  ),
                 

                  const SizedBox(height: 20,),

                  TextFormField(
                    controller: loginViewModel.passwordController.value,
                    obscureText: true,
                    focusNode: loginViewModel.passwordFocusNode.value,
                     validator: (value) {
                      if(value!.isEmpty){
                        Utils.snackBar("Password", "Please Enter your Password");
                      }
                    },
                    decoration: InputDecoration(
                      isDense: true,
                      labelText: "Password",
                      hintText: 'password_hint'.tr,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)
                      ),
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 40,),
            Obx(() {
              return RoundButton(
                title: "login".tr,
                loading: loginViewModel.loading.value,
                buttonColor: Colors.blueAccent.shade200,
                height: 50,
                onPress: (){
                  if(_formKey.currentState!.validate()){
                    loginViewModel.loginApi();
                  }
                },
                textColor: AppColor.whiteColor,
              );
            })
          ],
        ),
      ),
    );
  }
}