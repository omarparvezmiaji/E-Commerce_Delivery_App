// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    required this.data,
    required this.message,
    required this.status,
  });

  Data data;
  String message;
  int status;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
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
    this.apiToken,
    this.passwordResetToken,
    this.employeeFullId,
    this.deviceToken,
    required this.customer,
  });

  var id;
  var companyId;
  dynamic warehouseId;
  var type;
  var name;
  dynamic username;
  var email;
  var phone;
  dynamic socialProvider;
  dynamic emailVerifiedAt;
  dynamic image;
  var status;
  dynamic apiToken;
  dynamic passwordResetToken;
  dynamic employeeFullId;
  dynamic deviceToken;
  Customer customer;

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
    apiToken: json["api_token"],
    passwordResetToken: json["password_reset_token"],
    employeeFullId: json["employee_full_id"],
    deviceToken: json["device_token"],
    customer: Customer.fromJson(json["customer"]),
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
    "api_token": apiToken,
    "password_reset_token": passwordResetToken,
    "employee_full_id": employeeFullId,
    "device_token": deviceToken,
    "customer": customer.toJson(),
  };
}

class Customer {
  Customer({
    this.id,
    this.name,
    this.mobile,
    this.email,
    this.address,
    this.openingBalance,
    this.currentBalance,
    this.accountId,
    this.companyId,
    this.createdBy,
    this.updatedBy,
    this.previousDue,
    this.userId,
    this.customerTypeId,
    this.warehouseId,
    this.registerFrom,
    this.gender,
    this.isDefault,
    this.country,
    this.districtId,
    this.areaId,
    this.zipCode,
    this.status,
    this.point,
    this.wallet,
    this.district,
    this.area,
  });

  var id;
  var name;
  var mobile;
  var email;
  var address;
  var openingBalance;
  var currentBalance;
  var accountId;
  var companyId;
  var createdBy;
  dynamic updatedBy;
  var previousDue;
  var userId;
  dynamic customerTypeId;
  dynamic warehouseId;
  dynamic registerFrom;
  dynamic gender;
  var isDefault;
  var country;
  var districtId;
  var areaId;
  var zipCode;
  var status;
  var point;
  var wallet;
  var district;
  var area;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    id: json["id"],
    name: json["name"],
    mobile: json["mobile"],
    email: json["email"],
    address: json["address"],
    openingBalance: json["opening_balance"],
    currentBalance: json["current_balance"],
    accountId: json["account_id"],
    companyId: json["company_id"],
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
    previousDue: json["previous_due"],
    userId: json["user_id"],
    customerTypeId: json["customer_type_id"],
    warehouseId: json["warehouse_id"],
    registerFrom: json["register_from"],
    gender: json["gender"],
    isDefault: json["is_default"],
    country: json["country"],
    districtId: json["district_id"],
    areaId: json["area_id"],
    zipCode: json["zip_code"],
    status: json["status"],
    point: json["point"],
    wallet: json["wallet"],
    district: Area.fromJson(json["district"]),
    area: Area.fromJson(json["area"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "mobile": mobile,
    "email": email,
    "address": address,
    "opening_balance": openingBalance,
    "current_balance": currentBalance,
    "account_id": accountId,
    "company_id": companyId,
    "created_by": createdBy,
    "updated_by": updatedBy,
    "previous_due": previousDue,
    "user_id": userId,
    "customer_type_id": customerTypeId,
    "warehouse_id": warehouseId,
    "register_from": registerFrom,
    "gender": gender,
    "is_default": isDefault,
    "country": country,
    "district_id": districtId,
    "area_id": areaId,
    "zip_code": zipCode,
    "status": status,
    "point": point,
    "wallet": wallet,
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
