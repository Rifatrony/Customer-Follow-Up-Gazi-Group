import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:follow_up_customer/data/response/status.dart';
import 'package:follow_up_customer/model/Customer/add_customer_model.dart';
import 'package:follow_up_customer/res/Colors/appColor.dart';
import 'package:follow_up_customer/res/components/round_button.dart';
import 'package:follow_up_customer/utils/utils.dart';
import 'package:follow_up_customer/view_model/controller/business_controller/product_view_model.dart';
import 'package:follow_up_customer/view_model/controller/customer_controller/customer_view_model.dart';
import 'package:follow_up_customer/view_model/controller/customer_controller/customerlocation_view_model.dart';
import 'package:get/get.dart';

class AddCustomerScreen extends StatefulWidget {
  const AddCustomerScreen({super.key});

  @override
  State<AddCustomerScreen> createState() => _AddCustomerScreenState();
}

class _AddCustomerScreenState extends State<AddCustomerScreen> {

  CustomerViewModel customerViewModel = Get.put(CustomerViewModel());
  ProductViewModel productViewModel = Get.put(ProductViewModel());
  LocationController locationController = Get.put(LocationController());
  AddCustomerModel addCustomerModel = AddCustomerModel();

  final _formKey = GlobalKey<FormState>();

  double height = Get.height;

   String? selectedItem;
   int? selectedItemId;

  @override
  void initState() {
    super.initState();
    locationController.getLocation();
    productViewModel.getProductList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Add new Customer",
          style: TextStyle(
            color: Colors.black
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            
            children: [      
              
              SizedBox(height: Get.height * 0.05,),
        
              Form(
                key: _formKey,
                child: Column(
                  children: [
          
                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller: customerViewModel.nameController.value,
                      focusNode: customerViewModel.nameFocusNode.value,
                        validator: (value) {
                        if(value!.isEmpty){
                          Utils.snackBar("Name", "Name Required");
                        }
                      },
                      decoration: InputDecoration(
                        isDense: true,
                        labelText: "Name",
                        hintText: 'Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)
                        ),
                        prefixIcon: const Icon(
                          Icons.person_outline,
                          color: Colors.black,
                        ),
                      ),
                      onFieldSubmitted: (value) {
                        Utils.fieldFocusChange(
                            context, customerViewModel.nameFocusNode.value, customerViewModel.phoneFocusNode.value);
                      },
                    ),
          
                    SizedBox(height: height * 0.01,),
          
                    TextFormField(
                      controller: customerViewModel.phoneController.value,
                      keyboardType: TextInputType.number,
                      focusNode: customerViewModel.phoneFocusNode.value,
          
                      validator: (value) {
                        if(value!.isEmpty){
                          Utils.snackBar("Phone Number Required", "Please Enter your email");
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
                            context, customerViewModel.phoneFocusNode.value, customerViewModel.emailFocusNode.value);
                      },
                    ),

                    SizedBox(height: height * 0.01,),
          
                    TextFormField(
                      controller: customerViewModel.emailController.value,
                      keyboardType: TextInputType.emailAddress,
                      focusNode: customerViewModel.emailFocusNode.value,
          
                      // Email is not required so turn off email validation
          
                      //  validator: (value) {
                      //   if(value!.isEmpty){
                      //     Utils.snackBar("Email", "Please Enter your Email");
                      //   }
                      // },
                      decoration: InputDecoration(
                        labelText: "Email",
                        hintText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)
                        ),
                        prefixIcon: const Icon(
                          Icons.lock_outline,
                          color: Colors.black,
                        ),
                      ),
                      onFieldSubmitted: (value) {
                        Utils.fieldFocusChange(
                            context, customerViewModel.emailFocusNode.value, customerViewModel.addressocusNode.value);
                      },
                    ),
          
                    SizedBox(height: height * 0.01,),
          
                    TextFormField(
                      keyboardType: TextInputType.streetAddress,
                      controller: customerViewModel.addressController.value,
                      focusNode: customerViewModel.addressocusNode.value,
                      //  validator: (value) {
                      //   if(value!.isEmpty){
                      //     Utils.snackBar("Address", "Please Enter your Password");
                      //   }
                      // },
                      decoration: InputDecoration(
                        isDense: true,
                        labelText: "Address",
                        hintText: 'Address',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)
                        ),
                        prefixIcon: const Icon(
                          Icons.location_on_outlined,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  
                  ],
                ),
              ),
      
              SizedBox(height: height * 0.01,),

              Obx(() {
                switch(productViewModel.rxRequestStatus.value) {
                  case Status.LOADING:
                    return Center(child: CircularProgressIndicator());

                  case Status.ERROR:
                    return Text("Error");

                  case Status.COMPLETED:
                  // return Text("Successfull");
                    return Container(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey, width: 1)
                      ),
                      child: DropdownButton(
                        isExpanded: true,
                        underline: SizedBox(),
                        hint: Text("Select Products"),
                        value: selectedItem,
                        onChanged: (value) {
                          setState(() {
                            selectedItem = value as String?;
                            //selectedItemId = value as int?;
                          });
                        },
                        items: productViewModel.productList.value.data!.map((product) {
                          if (kDebugMode) {
                            print("Selected item id ${product.id}");
                          }
                          return DropdownMenuItem(
                            value: product.name,
                            child: Text(product.name.toString()),
                          );
                        }).toList(),
                        
                      ),
                    );
                }
              }),

              SizedBox(height: height * 0.01,),
            
      
              const Text("Products"),
      
              SizedBox(height: height * 0.2,),
      
              Obx(() {
                return Text(locationController.longitude.value);
              }),
      
              Obx(() {
                return Text(locationController.latitude.value);
              }),

              

              ],
          ),
        ),
      ),
      floatingActionButtonLocation:
        FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          height: 50,
          margin: const EdgeInsets.all(10),
          child: RoundButton(
            title: "Save Customer",
            loading: customerViewModel.loading.value,
            buttonColor: Colors.blueAccent.shade200,
            height: 50,
            onPress: (){
              if(_formKey.currentState!.validate()){

                 Map data = {
                  "name": customerViewModel.nameController.value.text,
                  "mobile": customerViewModel.phoneController.value.text,
                  "email": customerViewModel.emailController.value.text,
                  "address": customerViewModel.addressController.value.text,
                  "lat": locationController.latitude.value,
                  "long": locationController.longitude.value,
                  "area_id": "1",
                  "priority_id": "1",
                  "business_cat_id": "1",
                  'product_id': ["1","2"],
                  "date": "2023-03-20"
                };
                customerViewModel.addCustomerApi(data);
              }
            },
            textColor: AppColor.whiteColor,
          ),
        ),
    );
  }
}