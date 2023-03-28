class ProfileModel {
  bool? status;
  String? message;
  int? code;
  Data? data;

  ProfileModel({this.status, this.message, this.code, this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    code = json['code'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? role;
  String? designation;
  String? division;
  String? district;
  List<Area>? area;
  String? avatar;
  String? nid;
  String? target;
  int? status;

  Data({
      this.id,
      this.name,
      this.email,
      this.phone,
      this.role,
      this.designation,
      this.division,
      this.district,
      this.area,
      this.avatar,
      this.nid,
      this.target,
      this.status});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    role = json['role'];
    designation = json['designation'];
    division = json['division'];
    district = json['district'];
    if (json['area'] != null) {
      area = <Area>[];
      json['area'].forEach((v) {
        area!.add(new Area.fromJson(v));
      });
    }
    avatar = json['avatar'];
    nid = json['nid'];
    target = json['target'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['role'] = this.role;
    data['designation'] = this.designation;
    data['division'] = this.division;
    data['district'] = this.district;
    if (this.area != null) {
      data['area'] = this.area!.map((v) => v.toJson()).toList();
    }
    data['avatar'] = this.avatar;
    data['nid'] = this.nid;
    data['target'] = this.target;
    data['status'] = this.status;
    return data;
  }
}

class Area {
  int? id;
  String? name;
  Pivot? pivot;

  Area({this.id, this.name, this.pivot});

  Area.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? userId;
  int? areaId;

  Pivot({this.userId, this.areaId});

  Pivot.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    areaId = json['area_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['area_id'] = this.areaId;
    return data;
  }
}
