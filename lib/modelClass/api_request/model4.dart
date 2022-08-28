// class DeliveryManResponse {
//   Data? data;
//   String? message;
//   int? status;
//
//   DeliveryManResponse({this.data, this.message, this.status});
//
//   DeliveryManResponse.fromJson(Map<String, dynamic> json) {
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//
//     message = json['message'];
//     status = json['status'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     data['message'] = this.message;
//     data['status'] = this.status;
//     return data;
//   }
// }
//
// class Data {
//   String? token;
//   User? user;
//
//   Data({this.token, this.user});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     token = json['token'];
//     user = json['user'] != null ? new User.fromJson(json['user']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['token'] = this.token;
//     if (this.user != null) {
//       data['user'] = this.user!.toJson();
//     }
//     return data;
//   }
// }
//
// class User {
//   int? id;
//   Null? companyId;
//   Null? warehouseId;
//   String? type;
//   String? name;
//   Null? username;
//   String? email;
//   String? phone;
//   Null? socialProvider;
//   Null? emailVerifiedAt;
//   Null? image;
//   int? status;
//   String? createdAt;
//   String? updatedAt;
//   Null? apiToken;
//   Null? passwordResetToken;
//   Null? employeeFullId;
//   Null? deviceToken;
//   DeliveryMan? deliveryMan;
//
//   User(
//       {this.id,
//         this.companyId,
//         this.warehouseId,
//         this.type,
//         this.name,
//         this.username,
//         this.email,
//         this.phone,
//         this.socialProvider,
//         this.emailVerifiedAt,
//         this.image,
//         this.status,
//         this.createdAt,
//         this.updatedAt,
//         this.apiToken,
//         this.passwordResetToken,
//         this.employeeFullId,
//         this.deviceToken,
//         this.deliveryMan});
//
//   User.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     companyId = json['company_id'];
//     warehouseId = json['warehouse_id'];
//     type = json['type'];
//     name = json['name'];
//     username = json['username'];
//     email = json['email'];
//     phone = json['phone'];
//     socialProvider = json['social_provider'];
//     emailVerifiedAt = json['email_verified_at'];
//     image = json['image'];
//     status = json['status'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     apiToken = json['api_token'];
//     passwordResetToken = json['password_reset_token'];
//     employeeFullId = json['employee_full_id'];
//     deviceToken = json['device_token'];
//     deliveryMan = json['delivery_man'] != null
//         ? new DeliveryMan.fromJson(json['delivery_man'])
//         : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['company_id'] = this.companyId;
//     data['warehouse_id'] = this.warehouseId;
//     data['type'] = this.type;
//     data['name'] = this.name;
//     data['username'] = this.username;
//     data['email'] = this.email;
//     data['phone'] = this.phone;
//     data['social_provider'] = this.socialProvider;
//     data['email_verified_at'] = this.emailVerifiedAt;
//     data['image'] = this.image;
//     data['status'] = this.status;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['api_token'] = this.apiToken;
//     data['password_reset_token'] = this.passwordResetToken;
//     data['employee_full_id'] = this.employeeFullId;
//     data['device_token'] = this.deviceToken;
//     if (this.deliveryMan != null) {
//       data['delivery_man'] = this.deliveryMan!.toJson();
//     }
//     return data;
//   }
// }
//
// class DeliveryMan {
//   int? id;
//   int? userId;
//   int? districtId;
//   int? areaId;
//   String? deliveryType;
//   String? name;
//   String? phone;
//   String? email;
//   String? address;
//   int? status;
//   int? createdBy;
//   Null? updatedBy;
//   String? createdAt;
//   String? updatedAt;
//   District? district;
//   District? area;
//
//   DeliveryMan(
//       {this.id,
//         this.userId,
//         this.districtId,
//         this.areaId,
//         this.deliveryType,
//         this.name,
//         this.phone,
//         this.email,
//         this.address,
//         this.status,
//         this.createdBy,
//         this.updatedBy,
//         this.createdAt,
//         this.updatedAt,
//         this.district,
//         this.area});
//
//   DeliveryMan.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     userId = json['user_id'];
//     districtId = json['district_id'];
//     areaId = json['area_id'];
//     deliveryType = json['delivery_type'];
//     name = json['name'];
//     phone = json['phone'];
//     email = json['email'];
//     address = json['address'];
//     status = json['status'];
//     createdBy = json['created_by'];
//     updatedBy = json['updated_by'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     district = json['district'] != null
//         ? new District.fromJson(json['district'])
//         : null;
//     area = json['area'] != null ? new District.fromJson(json['area']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['user_id'] = this.userId;
//     data['district_id'] = this.districtId;
//     data['area_id'] = this.areaId;
//     data['delivery_type'] = this.deliveryType;
//     data['name'] = this.name;
//     data['phone'] = this.phone;
//     data['email'] = this.email;
//     data['address'] = this.address;
//     data['status'] = this.status;
//     data['created_by'] = this.createdBy;
//     data['updated_by'] = this.updatedBy;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     if (this.district != null) {
//       data['district'] = this.district!.toJson();
//     }
//     if (this.area != null) {
//       data['area'] = this.area!.toJson();
//     }
//     return data;
//   }
// }
//
// class District {
//   int? id;
//   String? name;
//
//   District({this.id, this.name});
//
//   District.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     return data;
//   }
// }
