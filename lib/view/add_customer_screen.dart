import 'package:flutter/material.dart';
import 'package:follow_up_customer/data/response/status.dart';
import 'package:follow_up_customer/model/Business/product_model.dart';
import 'package:follow_up_customer/model/Customer/add_customer_model.dart';
import 'package:follow_up_customer/res/Colors/appColor.dart';
import 'package:follow_up_customer/res/components/round_button.dart';
import 'package:follow_up_customer/utils/utils.dart';
import 'package:follow_up_customer/view_model/controller/business_controller/business_category_view_model.dart';
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
  final businessController = Get.put(BusinesssCategoryViewModel());

  final _formKey = GlobalKey<FormState>();

  double height = Get.height;

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
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Add new Customer",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 0.05,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller: customerViewModel.nameController.value,
                      focusNode: customerViewModel.nameFocusNode.value,
                      validator: (value) {
                        if (value!.isEmpty) {
                          Utils.snackBar("Name", "Name Required");
                        }
                      },
                      decoration: InputDecoration(
                        isDense: true,
                        labelText: "Name",
                        hintText: 'Name',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        prefixIcon: const Icon(
                          Icons.person_outline,
                          color: Colors.black,
                        ),
                      ),
                      onFieldSubmitted: (value) {
                        Utils.fieldFocusChange(
                            context,
                            customerViewModel.nameFocusNode.value,
                            customerViewModel.phoneFocusNode.value);
                      },
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    TextFormField(
                      controller: customerViewModel.phoneController.value,
                      keyboardType: TextInputType.number,
                      focusNode: customerViewModel.phoneFocusNode.value,
                      validator: (value) {
                        if (value!.isEmpty) {
                          Utils.snackBar("Phone Number Required",
                              "Please Enter your email");
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
                            context,
                            customerViewModel.phoneFocusNode.value,
                            customerViewModel.emailFocusNode.value);
                      },
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    TextFormField(
                      controller: customerViewModel.emailController.value,
                      keyboardType: TextInputType.emailAddress,
                      focusNode: customerViewModel.emailFocusNode.value,
                      decoration: InputDecoration(
                        isDense: true,
                        labelText: "Email",
                        hintText: 'Email',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        prefixIcon: const Icon(
                          Icons.lock_outline,
                          color: Colors.black,
                        ),
                      ),
                      onFieldSubmitted: (value) {
                        Utils.fieldFocusChange(
                            context,
                            customerViewModel.emailFocusNode.value,
                            customerViewModel.addressocusNode.value);
                      },
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
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
                            borderRadius: BorderRadius.circular(12)),
                        prefixIcon: const Icon(
                          Icons.location_on_outlined,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Obx(() {
                return businessController.loading.value
                    ? Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(16)),
                        child: const Center(child: Text("Loading")),
                      )
                    : Container(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey, width: 1)),
                        child: DropdownButton(
                          isExpanded: true,
                          underline: const SizedBox(),
                          hint: const Text("Select Product"),
                          value: businessController.selectedCategory,
                          items: businessController.business.value.data!
                              .map((business) => DropdownMenuItem(
                                    child: new Text(
                                      business.name.toString(),
                                    ),
                                    value: business,
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              businessController.selectedCategory = value;
                            });
                          },
                        ),
                      );
              }),
              SizedBox(
                height: height * 0.01,
              ),
              Obx(() {
                return productViewModel.loading.value
                    ? Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(16)),
                        child: const Center(child: Text("Loading")),
                      )
                    : Container(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey, width: 1)),
                        child: DropdownButton(
                          isExpanded: true,
                          underline: const SizedBox(),
                          hint: const Text("Select Product"),
                          value: productViewModel.selectedProduct,
                          items: productViewModel.productList.value.data!
                              .where((product) =>
                                  product.businessCatId ==
                                  businessController.selectedCategory?.id)
                              .map((product) => DropdownMenuItem(
                                    value: product,
                                    child: Text(
                                      product.name.toString(),
                                    ),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              productViewModel.selectedProduct = value;
                            });
                          },
                        ),
                      );
              }),
              SizedBox(
                height: height * 0.01,
              ),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Obx(
        () => Container(
          height: 50,
          margin: const EdgeInsets.all(10),
          child: RoundButton(
            title: "Save Customer",
            loading: customerViewModel.loading.value,
            buttonColor: Colors.blueAccent.shade200,
            height: 50,
            onPress: () {
              if (_formKey.currentState!.validate()) {
                Map data = {
                  "name": customerViewModel.nameController.value.text,
                  "mobile": customerViewModel.phoneController.value.text,
                  "email": customerViewModel.emailController.value.text,
                  "address": customerViewModel.addressController.value.text,
                  "lat": locationController.latitude.value,
                  "long": locationController.longitude.value,
                  "area_id": "1",
                  "priority_id": "1",
                  "business_cat_id": businessController.selectedCategory!.id,
                  'product_id': ["1", "2"],
                };
                customerViewModel.addCustomerApi(data);
              }
            },
            textColor: AppColor.whiteColor,
          ),
        ),
      ),
    );
  }
}
