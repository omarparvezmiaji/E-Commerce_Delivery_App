// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

loginResponse loginResponseFromJson(String str) => loginResponse.fromJson(json.decode(str));

String loginResponseToJson(loginResponse data) => json.encode(data.toJson());

class loginResponse {
  loginResponse({
    required this.data,
    this.message,
    this.status,
  });

  Data data;
  var message;
  var status;

  factory loginResponse.fromJson(Map<String, dynamic> json) => loginResponse(
    data: Data.fromJson(json["data"]),
    message: json["message"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "message": message,
    "status": status,
  };
}

class Data {
  Data({
    this.token,
    required this.user,
  });

  var token;
  User user;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    token: json["token"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "user": user.toJson(),
  };
}

class User {
  User({
    this.id,
    this.companyId,
    this.warehouseId,
    this.type,
    this.name,
    this.username,
    this.email,
    this.phone,
    this.socialProvider,
    this.emailVerifiedAt,
    this.image,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.apiToken,
    this.passwordResetToken,
    this.employeeFullId,
    this.deviceToken,
    required this.deliveryMan,
  });

  var id;
  var companyId;
  var warehouseId;
  var type;
  var name;
  var username;
  var email;
  var phone;
  var socialProvider;
  var emailVerifiedAt;
  var image;
  var status;
  var createdAt;
  var updatedAt;
  var apiToken;
  var passwordResetToken;
  var employeeFullId;
  var deviceToken;
  DeliveryMan deliveryMan;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    companyId: json["company_id"],
    warehouseId: json["warehouse_id"],
    type: json["type"],
    name: json["name"],
    username: json["username"],
    email: json["email"],
    phone: json["phone"],
    socialProvider: json["social_provider"],
    emailVerifiedAt: json["email_verified_at"],
    image: json["image"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    apiToken: json["api_token"],
    passwordResetToken: json["password_reset_token"],
    employeeFullId: json["employee_full_id"],
    deviceToken: json["device_token"],
    deliveryMan: DeliveryMan.fromJson(json["delivery_man"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "company_id": companyId,
    "warehouse_id": warehouseId,
    "type": type,
    "name": name,
    "username": username,
    "email": email,
    "phone": phone,
    "social_provider": socialProvider,
    "email_verified_at": emailVerifiedAt,
    "image": image,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "api_token": apiToken,
    "password_reset_token": passwordResetToken,
    "employee_full_id": employeeFullId,
    "device_token": deviceToken,
    "delivery_man": deliveryMan.toJson(),
  };
}

class DeliveryMan {
  DeliveryMan({
    this.id,
    this.userId,
    this.districtId,
    this.areaId,
    this.deliveryType,
    this.name,
    this.phone,
    this.email,
    this.address,
    this.status,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    required this.district,
    required this.area,
  });

  var id;
  var userId;
  var districtId;
  var areaId;
  var deliveryType;
  var name;
  var phone;
  var email;
  var address;
  var status;
  var createdBy;
  var updatedBy;
  var createdAt;
  var updatedAt;
  Area district;
  Area area;

  factory DeliveryMan.fromJson(Map<String, dynamic> json) => DeliveryMan(
    id: json["id"],
    userId: json["user_id"],
    districtId: json["district_id"],
    areaId: json["area_id"],
    deliveryType: json["delivery_type"],
    name: json["name"],
    phone: json["phone"],
    email: json["email"],
    address: json["address"],
    status: json["status"],
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    district: Area.fromJson(json["district"]),
    area: Area.fromJson(json["area"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "district_id": districtId,
    "area_id": areaId,
    "delivery_type": deliveryType,
    "name": name,
    "phone": phone,
    "email": email,
    "address": address,
    "status": status,
    "created_by": createdBy,
    "updated_by": updatedBy,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "district": district.toJson(),
    "area": area.toJson(),
  };
}

class Area {
  Area({
    this.id,
    this.name,
  });

  var id;
  var name;

  factory Area.fromJson(Map<String, dynamic> json) => Area(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
