import 'package:follow_up_customer/model/Business/business_category.dart';
import 'package:follow_up_customer/repositories/business/business_category_repository.dart';
import 'package:get/get.dart';

class BusinesssCategoryViewModel extends GetxController {
  final businessRepository = BusinessRepository();
  final business = BusinesssCategoryModel().obs;
  final loading = true.obs;
  Data? selectedCategory;
  
  @override
  void onInit() {
    super.onInit();
    getBusinessCategory();
  }

  void setLoading(bool value) {
    loading.value = value;
  }

  void setCategory(BusinesssCategoryModel businesssCategoryModel) {
    business.value = businesssCategoryModel;
  }

  void setSelectedCategory(int categoryId) {
    print('Selected category ID: $categoryId');
  }

  Future<void> getBusinessCategory() async {
    try {
      setLoading(true);
      businessRepository.getBusinessCategory().then((value) {
        setLoading(false);
        setCategory(value);
        setSelectedCategory(value as int);
      }).onError((error, stackTrace) {
        setLoading(false);
      });
    } catch (error) {
      setLoading(false);
    }
  }
}


/*  Obx(() {
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
                          value: businessController.selectedCategoryId == 0
                              ? null
                              : businessController.business.value.data!
                                  .firstWhere((d) =>
                                      d.id ==
                                      businessController.selectedCategoryId),
                          hint: const Text('Select a category'),
                          onChanged: (value) {
                            businessController.setSelectedCategory(value!.id!);
                          },
                          items: businessController.business.value.data!
                              .map((data) {
                            return DropdownMenuItem(
                              value: data,
                              child: Text(data.name!),
                            );
                          }).toList(),
                        ),
                      );
              }),*/
