class ProductModel {
  bool? status;
  String? message;
  int? code;
  List<Data>? data;

  ProductModel({this.status, this.message, this.code, this.data});

  ProductModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    code = json['code'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  int? businessCatId;
  String? businessCatName;

  Data({this.id, this.name, this.businessCatId, this.businessCatName});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    businessCatId = json['business_cat_id'];
    businessCatName = json['business_cat_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['business_cat_id'] = this.businessCatId;
    data['business_cat_name'] = this.businessCatName;
    return data;
  }
}
