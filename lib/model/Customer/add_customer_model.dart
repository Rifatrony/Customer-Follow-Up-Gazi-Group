class AddCustomerModel {
  String? name;
  String? mobile;
  String? email;
  String? address;
  String? lat;
  String? long;
  String? areaId;
  String? priorityId;
  String? businessCatId;
  List<String>? productId;
  String? date;

  AddCustomerModel(
      {this.name,
      this.mobile,
      this.email,
      this.address,
      this.lat,
      this.long,
      this.areaId,
      this.priorityId,
      this.businessCatId,
      this.productId,
      this.date});

  AddCustomerModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    mobile = json['mobile'];
    email = json['email'];
    address = json['address'];
    lat = json['lat'];
    long = json['long'];
    areaId = json['area_id'];
    priorityId = json['priority_id'];
    businessCatId = json['business_cat_id'];
    productId = json['product_id'].cast<String>();
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['address'] = this.address;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['area_id'] = this.areaId;
    data['priority_id'] = this.priorityId;
    data['business_cat_id'] = this.businessCatId;
    data['product_id'] = this.productId;
    data['date'] = this.date;
    return data;
  }
}
