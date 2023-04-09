// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  ProfileModel({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  bool? status;
  String? message;
  int? code;
  Data? data;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        status: json["status"],
        message: json["message"],
        code: json["code"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "code": code,
        "data": data?.toJson(),
      };
}

class Data {
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
    this.month,
    this.year,
    this.target,
    this.recovery,
    this.status,
  });

  int? id;
  String? name;
  dynamic email;
  String? phone;
  String? role;
  String? designation;
  String? division;
  String? district;
  List<Area>? area;
  String? avatar;
  String? nid;
  String? month;
  String? year;
  int? target;
  int? recovery;
  int? status;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        role: json["role"],
        designation: json["designation"],
        division: json["division"],
        district: json["district"],
        area: json["area"] == null
            ? []
            : List<Area>.from(json["area"]!.map((x) => Area.fromJson(x))),
        avatar: json["avatar"],
        nid: json["nid"],
        month: json["month"],
        year: json["year"],
        target: json["target"],
        recovery: json["recovery"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "role": role,
        "designation": designation,
        "division": division,
        "district": district,
        "area": area == null
            ? []
            : List<dynamic>.from(area!.map((x) => x.toJson())),
        "avatar": avatar,
        "nid": nid,
        "month": month,
        "year": year,
        "target": target,
        "recovery": recovery,
        "status": status,
      };
}

class Area {
  Area({
    this.id,
    this.name,
    this.pivot,
  });

  int? id;
  String? name;
  Pivot? pivot;

  factory Area.fromJson(Map<String, dynamic> json) => Area(
        id: json["id"],
        name: json["name"],
        pivot: json["pivot"] == null ? null : Pivot.fromJson(json["pivot"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "pivot": pivot?.toJson(),
      };
}

class Pivot {
  Pivot({
    this.userId,
    this.areaId,
  });

  int? userId;
  int? areaId;

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        userId: json["user_id"],
        areaId: json["area_id"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "area_id": areaId,
      };
}
