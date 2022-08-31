// To parse this JSON data, do
//
//     final orderResponse = orderResponseFromJson(jsonString);

import 'dart:convert';

OrderResponse orderResponseFromJson(String str) =>
    OrderResponse.fromJson(json.decode(str));

String orderResponseToJson(OrderResponse data) => json.encode(data.toJson());

class OrderResponse {
  OrderResponse({
     required this.data,
    this.message,
    this.status,
  });


  List<Data> data;
  var message;
  var status;

  factory OrderResponse.fromJson(Map<String, dynamic> json) => OrderResponse(
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
        "status": status,
      };
}

class Data {
  Data({
    this.id,
    this.companyId,
    this.warehouseId,
    this.customerId,
    this.deliveryManId,
    this.timeSlotId,
    this.couponId,
    this.date,
    this.deliveryDate,
    this.orderNo,
    this.orderSource,
    this.paymentType,
    this.paymentMethod,
    this.paymentTnxNo,
    this.paymentStatus,
    this.totalQuantity,
    this.subtotal,
    this.totalVatAmount,
    this.shippingCost,
    this.extraShippingCostId,
    this.extraShippingCostAmount,
    this.shippingCostDiscountId,
    this.shippingCostDiscountAmount,
    this.totalShippingCost,
    this.totalDiscountAmount,
    this.couponDiscountAmount,
    this.pointUsed,
    this.pointAmount,
    this.walletAmount,
    this.grandTotal,
    this.totalWeight,
    this.paidAmount,
    this.dueAmount,
    this.changeAmount,
    this.rounding,
    this.currentStatus,
    this.dueCollectedBy,
    this.dueCollectedAt,
    this.isCourierAssigned,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.draftSource,
    this.status,
    this.totalProduct,
    required this.orderStatus,
    required this.orderDetails,
    required this.customer,
    required this.orderCustomerInfo,
  });

  var id;
  var companyId;
  var warehouseId;
  var customerId;
  var deliveryManId;
  dynamic timeSlotId;
  dynamic couponId;
  var date;
  var deliveryDate;
  var orderNo;
  var orderSource;
  var paymentType;
  var paymentMethod;
  var paymentTnxNo;
  var paymentStatus;
  var totalQuantity;
  var subtotal;
  var totalVatAmount;
  var shippingCost;
  dynamic extraShippingCostId;
  var extraShippingCostAmount;
  var shippingCostDiscountId;
  var shippingCostDiscountAmount;
  var totalShippingCost;
  var totalDiscountAmount;
  var couponDiscountAmount;
  var pointUsed;
  var pointAmount;
  var walletAmount;
  var grandTotal;
  var totalWeight;
  var paidAmount;
  var dueAmount;
  var changeAmount;
  var rounding;
  var currentStatus;
  dynamic dueCollectedBy;
  dynamic dueCollectedAt;
  var isCourierAssigned;
  dynamic createdBy;
  var updatedBy;
  var createdAt;
  var updatedAt;
  dynamic draftSource;
  var status;
  var totalProduct;
  List<OrderStatus> orderStatus;
  List<OrderDetail> orderDetails;
  Customer customer;
  OrderCustomerInfo orderCustomerInfo;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        companyId: json["company_id"],
        warehouseId: json["warehouse_id"],
        customerId: json["customer_id"],
        deliveryManId: json["delivery_man_id"],
        timeSlotId: json["time_slot_id"],
        couponId: json["coupon_id"],
        date: DateTime.parse(json["date"]),
        deliveryDate: DateTime.parse(json["delivery_date"]),
        orderNo: json["order_no"],
        orderSource: json["order_source"],
        paymentType: json["payment_type"],
        paymentMethod: json["payment_method"],
        paymentTnxNo: json["payment_tnx_no"],
        paymentStatus: json["payment_status"],
        totalQuantity: json["total_quantity"],
        subtotal: json["subtotal"],
        totalVatAmount: json["total_vat_amount"],
        shippingCost: json["shipping_cost"],
        extraShippingCostId: json["extra_shipping_cost_id"],
        extraShippingCostAmount: json["extra_shipping_cost_amount"],
        shippingCostDiscountId: json["shipping_cost_discount_id"],
        shippingCostDiscountAmount: json["shipping_cost_discount_amount"],
        totalShippingCost: json["total_shipping_cost"],
        totalDiscountAmount: json["total_discount_amount"],
        couponDiscountAmount: json["coupon_discount_amount"],
        pointUsed: json["point_used"],
        pointAmount: json["point_amount"],
        walletAmount: json["wallet_amount"],
        grandTotal: json["grand_total"],
        totalWeight: json["total_weight"],
        paidAmount: json["paid_amount"],
        dueAmount: json["due_amount"],
        changeAmount: json["change_amount"],
        rounding: json["rounding"],
        currentStatus: json["current_status"],
        dueCollectedBy: json["due_collected_by"],
        dueCollectedAt: json["due_collected_at"],
        isCourierAssigned: json["is_courier_assigned"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        draftSource: json["draft_source"],
        status: json["status"],
        totalProduct: json["total_product"],
        orderStatus: List<OrderStatus>.from(
            json["order_status"].map((x) => OrderStatus.fromJson(x))),
        orderDetails: List<OrderDetail>.from(
            json["order_details"].map((x) => OrderDetail.fromJson(x))),
        customer: Customer.fromJson(json["customer"]),
        orderCustomerInfo:
            OrderCustomerInfo.fromJson(json["order_customer_info"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "company_id": companyId,
        "warehouse_id": warehouseId,
        "customer_id": customerId,
        "delivery_man_id": deliveryManId,
        "time_slot_id": timeSlotId,
        "coupon_id": couponId,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "delivery_date":
            "${deliveryDate.year.toString().padLeft(4, '0')}-${deliveryDate.month.toString().padLeft(2, '0')}-${deliveryDate.day.toString().padLeft(2, '0')}",
        "order_no": orderNo,
        "order_source": orderSource,
        "payment_type": paymentType,
        "payment_method": paymentMethod,
        "payment_tnx_no": paymentTnxNo,
        "payment_status": paymentStatus,
        "total_quantity": totalQuantity,
        "subtotal": subtotal,
        "total_vat_amount": totalVatAmount,
        "shipping_cost": shippingCost,
        "extra_shipping_cost_id": extraShippingCostId,
        "extra_shipping_cost_amount": extraShippingCostAmount,
        "shipping_cost_discount_id": shippingCostDiscountId,
        "shipping_cost_discount_amount": shippingCostDiscountAmount,
        "total_shipping_cost": totalShippingCost,
        "total_discount_amount": totalDiscountAmount,
        "coupon_discount_amount": couponDiscountAmount,
        "point_used": pointUsed,
        "point_amount": pointAmount,
        "wallet_amount": walletAmount,
        "grand_total": grandTotal,
        "total_weight": totalWeight,
        "paid_amount": paidAmount,
        "due_amount": dueAmount,
        "change_amount": changeAmount,
        "rounding": rounding,
        "current_status": currentStatus,
        "due_collected_by": dueCollectedBy,
        "due_collected_at": dueCollectedAt,
        "is_courier_assigned": isCourierAssigned,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "draft_source": draftSource,
        "status": status,
        "total_product": totalProduct,
        "order_status": List<dynamic>.from(orderStatus.map((x) => x.toJson())),
        "order_details":
            List<dynamic>.from(orderDetails.map((x) => x.toJson())),
        "customer": customer.toJson(),
        "order_customer_info": orderCustomerInfo.toJson(),
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
    this.createdAt,
    this.updatedAt,
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
  var createdAt;
  var updatedAt;
  var userId;
  dynamic customerTypeId;
  dynamic warehouseId;
  dynamic registerFrom;
  dynamic gender;
  var isDefault;
  var country;
  var districtId;
  var areaId;
  dynamic zipCode;
  var status;
  var point;
  var wallet;

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
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
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
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
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
      };
}

class OrderCustomerInfo {
  OrderCustomerInfo({
    this.id,
    this.orderId,
    this.name,
    this.phone,
    this.email,
    this.country,
    this.address,
    this.areaId,
    this.districtId,
    this.zipCode,
    this.orderNote,
    required this.shipToDifferentAddress,
    this.receiverName,
    this.receiverPhone,
    this.receiverEmail,
    this.receiverCountry,
    this.receiverAddress,
    this.receiverAreaId,
    this.receiverDistrictId,
    this.receiverZipCode,
    this.receiverOrderNote,
    this.createdAt,
    this.updatedAt,
  });

  var id;
  var orderId;
  var name;
  var phone;
  var email;
  var country;
  var address;
  var areaId;
  var districtId;
  dynamic zipCode;
  dynamic orderNote;
  ShipToDifferentAddress? shipToDifferentAddress;
  dynamic receiverName;
  dynamic receiverPhone;
  dynamic receiverEmail;
  var receiverCountry;
  dynamic receiverAddress;
  var receiverAreaId;
  var receiverDistrictId;
  dynamic receiverZipCode;
  dynamic receiverOrderNote;
  var createdAt;
  var updatedAt;

  factory OrderCustomerInfo.fromJson(Map<String, dynamic> json) =>
      OrderCustomerInfo(
        id: json["id"],
        orderId: json["order_id"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        country: json["country"],
        address: json["address"],
        areaId: json["area_id"],
        districtId: json["district_id"],
        zipCode: json["zip_code"],
        orderNote: json["order_note"],
        shipToDifferentAddress:
            shipToDifferentAddressValues.map[json["ship_to_different_address"]],
        receiverName: json["receiver_name"],
        receiverPhone: json["receiver_phone"],
        receiverEmail: json["receiver_email"],
        receiverCountry: json["receiver_country"],
        receiverAddress: json["receiver_address"],
        receiverAreaId: json["receiver_area_id"],
        receiverDistrictId: json["receiver_district_id"],
        receiverZipCode: json["receiver_zip_code"],
        receiverOrderNote: json["receiver_order_note"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "order_id": orderId,
        "name": name,
        "phone": phone,
        "email": email,
        "country": country,
        "address": address,
        "area_id": areaId,
        "district_id": districtId,
        "zip_code": zipCode,
        "order_note": orderNote,
        "ship_to_different_address":
            shipToDifferentAddressValues.reverse![shipToDifferentAddress],
        "receiver_name": receiverName,
        "receiver_phone": receiverPhone,
        "receiver_email": receiverEmail,
        "receiver_country": receiverCountry,
        "receiver_address": receiverAddress,
        "receiver_area_id": receiverAreaId,
        "receiver_district_id": receiverDistrictId,
        "receiver_zip_code": receiverZipCode,
        "receiver_order_note": receiverOrderNote,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

enum ShipToDifferentAddress { NO }

final shipToDifferentAddressValues =
    EnumValues({"No": ShipToDifferentAddress.NO});

class OrderDetail {
  OrderDetail({
    this.id,
    this.orderId,
    this.productId,
    this.productVariationId,
    this.measurementTitle,
    this.measurementSku,
    this.measurementValue,
    this.purchasePrice,
    this.salePrice,
    this.quantity,
    this.vatPercent,
    this.vatAmount,
    this.discountPercent,
    this.discountAmount,
    this.totalCost,
    this.totalAmount,
    this.weight,
    this.existInReturn,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    required this.product,
  });

  var id;
  var orderId;
  var productId;
  dynamic productVariationId;
  var measurementTitle;
  var measurementSku;
  var measurementValue;
  var purchasePrice;
  var salePrice;
  var quantity;
  var vatPercent;
  var vatAmount;
  var discountPercent;
  var discountAmount;
  var totalCost;
  var totalAmount;
  var weight;
  var existInReturn;
  dynamic updatedBy;
  var createdAt;
  var updatedAt;
  Product product;

  factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
        id: json["id"],
        orderId: json["order_id"],
        productId: json["product_id"],
        productVariationId: json["product_variation_id"],
        measurementTitle: json["measurement_title"] == null
            ? null
            : json["measurement_title"],
        measurementSku:
            json["measurement_sku"] == null ? null : json["measurement_sku"],
        measurementValue: json["measurement_value"],
        purchasePrice: json["purchase_price"],
        salePrice: json["sale_price"],
        quantity: json["quantity"],
        vatPercent: json["vat_percent"],
        vatAmount: json["vat_amount"],
        discountPercent: json["discount_percent"],
        discountAmount: json["discount_amount"],
        totalCost: json["total_cost"],
        totalAmount: json["total_amount"],
        weight: json["weight"],
        existInReturn: json["exist_in_return"],
        updatedBy: json["updated_by"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        product: Product.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "order_id": orderId,
        "product_id": productId,
        "product_variation_id": productVariationId,
        "measurement_title": measurementTitle == null ? null : measurementTitle,
        "measurement_sku": measurementSku == null ? null : measurementSku,
        "measurement_value": measurementValue,
        "purchase_price": purchasePrice,
        "sale_price": salePrice,
        "quantity": quantity,
        "vat_percent": vatPercent,
        "vat_amount": vatAmount,
        "discount_percent": discountPercent,
        "discount_amount": discountAmount,
        "total_cost": totalCost,
        "total_amount": totalAmount,
        "weight": weight,
        "exist_in_return": existInReturn,
        "updated_by": updatedBy,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "product": product.toJson(),
      };
}

class Product {
  Product({
    this.id,
    this.productTypeId,
    this.categoryId,
    this.brandId,
    this.unitMeasureId,
    this.supplierId,
    this.countryId,
    this.name,
    this.slug,
    this.code,
    this.purchasePrice,
    this.wholesalePrice,
    this.salePrice,
    this.weight,
    this.alertQuantity,
    this.maximumOrderQuantity,
    required this.image,
    this.thumbnailImage,
    this.videoLink,
    this.isVariation,
    this.isRefundable,
    this.manufactureBarcode,
    this.manufactureModelNo,
    this.estShippingDays,
    this.barcode,
    this.vat,
    this.vatType,
    this.sku,
    this.subText,
    this.avgRating,
    this.totalRatingUser,
    this.status,
    this.shortDescription,
    this.stockVisible,
    this.description,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.subTextVisible,
    required this.category,
    required this.unitMeasure,
    this.brand,
    required this.productImages,
    required this.productMeasurements,
    required this.productVariations,
    required this.productTags,
    required this.productReviews,
    this.discount,
  });

  var id;
  var productTypeId;
  var categoryId;
  dynamic brandId;
  var unitMeasureId;
  dynamic supplierId;
  var countryId;
  var name;
  var slug;
  var code;
  var purchasePrice;
  var wholesalePrice;
  var salePrice;
  var weight;
  var alertQuantity;
  var maximumOrderQuantity;
  Image? image;
  var thumbnailImage;
  dynamic videoLink;
  ShipToDifferentAddress? isVariation;
  ShipToDifferentAddress? isRefundable;
  dynamic manufactureBarcode;
  dynamic manufactureModelNo;
  dynamic estShippingDays;
  var barcode;
  var vat;
  VatType? vatType;
  var sku;
  var subText;
  var avgRating;
  var totalRatingUser;
  var status;
  dynamic shortDescription;
  var stockVisible;
  var description;
  var createdBy;
  var updatedBy;
  var createdAt;
  var updatedAt;
  var subTextVisible;
  Category category;
  UnitMeasure unitMeasure;
  dynamic brand;
  List<dynamic> productImages;
  List<ProductMeasurement> productMeasurements;
  List<dynamic> productVariations;
  List<dynamic> productTags;
  List<dynamic> productReviews;
  dynamic discount;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        productTypeId: json["product_type_id"],
        categoryId: json["category_id"],
        brandId: json["brand_id"],
        unitMeasureId: json["unit_measure_id"],
        supplierId: json["supplier_id"],
        countryId: json["country_id"],
        name: json["name"],
        slug: json["slug"],
        code: json["code"],
        purchasePrice: json["purchase_price"],
        wholesalePrice: json["wholesale_price"],
        salePrice: json["sale_price"],
        weight: json["weight"],
        alertQuantity: json["alert_quantity"],
        maximumOrderQuantity: json["maximum_order_quantity"],
        image: imageValues.map[json["image"]],
        thumbnailImage: json["thumbnail_image"],
        videoLink: json["video_link"],
        isVariation: shipToDifferentAddressValues.map[json["is_variation"]],
        isRefundable: shipToDifferentAddressValues.map[json["is_refundable"]],
        manufactureBarcode: json["manufacture_barcode"],
        manufactureModelNo: json["manufacture_model_no"],
        estShippingDays: json["est_shipping_days"],
        barcode: json["barcode"],
        vat: json["vat"],
        vatType: vatTypeValues.map[json["vat_type"]],
        sku: json["sku"],
        subText: json["sub_text"] == null ? null : json["sub_text"],
        avgRating: json["avg_rating"],
        totalRatingUser: json["total_rating_user"],
        status: json["status"],
        shortDescription: json["short_description"],
        stockVisible: json["stock_visible"],
        description: json["description"] == null ? null : json["description"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        subTextVisible: json["sub_text_visible"],
        category: Category.fromJson(json["category"]),
        unitMeasure: UnitMeasure.fromJson(json["unit_measure"]),
        brand: json["brand"],
        productImages: List<dynamic>.from(json["product_images"].map((x) => x)),
        productMeasurements: List<ProductMeasurement>.from(
            json["product_measurements"]
                .map((x) => ProductMeasurement.fromJson(x))),
        productVariations:
            List<dynamic>.from(json["product_variations"].map((x) => x)),
        productTags: List<dynamic>.from(json["product_tags"].map((x) => x)),
        productReviews:
            List<dynamic>.from(json["product_reviews"].map((x) => x)),
        discount: json["discount"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_type_id": productTypeId,
        "category_id": categoryId,
        "brand_id": brandId,
        "unit_measure_id": unitMeasureId,
        "supplier_id": supplierId,
        "country_id": countryId,
        "name": name,
        "slug": slug,
        "code": code,
        "purchase_price": purchasePrice,
        "wholesale_price": wholesalePrice,
        "sale_price": salePrice,
        "weight": weight,
        "alert_quantity": alertQuantity,
        "maximum_order_quantity": maximumOrderQuantity,
        "image": imageValues.reverse![image],
        "thumbnail_image": thumbnailImage,
        "video_link": videoLink,
        "is_variation": shipToDifferentAddressValues.reverse![isVariation],
        "is_refundable": shipToDifferentAddressValues.reverse![isRefundable],
        "manufacture_barcode": manufactureBarcode,
        "manufacture_model_no": manufactureModelNo,
        "est_shipping_days": estShippingDays,
        "barcode": barcode,
        "vat": vat,
        "vat_type": vatTypeValues.reverse![vatType],
        "sku": sku,
        "sub_text": subText == null ? null : subText,
        "avg_rating": avgRating,
        "total_rating_user": totalRatingUser,
        "status": status,
        "short_description": shortDescription,
        "stock_visible": stockVisible,
        "description": description == null ? null : description,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "sub_text_visible": subTextVisible,
        "category": category.toJson(),
        "unit_measure": unitMeasure.toJson(),
        "brand": brand,
        "product_images": List<dynamic>.from(productImages.map((x) => x)),
        "product_measurements":
            List<dynamic>.from(productMeasurements.map((x) => x.toJson())),
        "product_variations":
            List<dynamic>.from(productVariations.map((x) => x)),
        "product_tags": List<dynamic>.from(productTags.map((x) => x)),
        "product_reviews": List<dynamic>.from(productReviews.map((x) => x)),
        "discount": discount,
      };
}

class Category {
  Category({
    this.id,
    this.parentId,
    this.name,
    this.slug,
    required this.parentCategories,
  });

  var id;
  dynamic parentId;
  var name;
  var slug;
  List<dynamic> parentCategories;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        parentId: json["parent_id"],
        name: json["name"],
        slug: json["slug"],
        parentCategories:
            List<dynamic>.from(json["parent_categories"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "parent_id": parentId,
        "name": name,
        "slug": slug,
        "parent_categories": List<dynamic>.from(parentCategories.map((x) => x)),
      };
}

enum Image {
  ASSETS_IMAGES_PRODUCT_2022_MAY_16532928996362813_JPEG,
  DEFAULT_IMG_JPG,
  ASSETS_IMAGES_PRODUCT_2022_MAY_16531968913113209_WEBP
}

final imageValues = EnumValues({
  "./assets/images/product/2022/May/1653196891-3113209.webp":
      Image.ASSETS_IMAGES_PRODUCT_2022_MAY_16531968913113209_WEBP,
  "./assets/images/product/2022/May/1653292899-6362813.jpeg":
      Image.ASSETS_IMAGES_PRODUCT_2022_MAY_16532928996362813_JPEG,
  "default-img.jpg": Image.DEFAULT_IMG_JPG
});

class ProductMeasurement {
  ProductMeasurement({
    this.id,
    this.productId,
    this.title,
    this.value,
    this.sku,
  });

 var id;
 var productId;
  var title;
  var value;
  var sku;

  factory ProductMeasurement.fromJson(Map<String, dynamic> json) =>
      ProductMeasurement(
        id: json["id"],
        productId: json["product_id"],
        title: json["title"],
        value: json["value"],
        sku: json["sku"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "title": title,
        "value": value,
        "sku": sku,
      };
}

class UnitMeasure {
  UnitMeasure({
    this.id,
    this.name,
  });

  var id;
  var name;

  factory UnitMeasure.fromJson(Map<String, dynamic> json) => UnitMeasure(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

enum VatType { PERCENTAGE }

final vatTypeValues = EnumValues({"Percentage": VatType.PERCENTAGE});

class OrderStatus {
  OrderStatus({
    this.id,
    this.orderId,
    this.statusId,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    required this.status,
  });

  var id;
  var orderId;
  var statusId;
  var createdBy;
  var updatedBy;
  var createdAt;
  var updatedAt;
  Status status;

  factory OrderStatus.fromJson(Map<String, dynamic> json) => OrderStatus(
        id: json["id"],
        orderId: json["order_id"],
        statusId: json["status_id"],
        createdBy: json["created_by"] == null ? null : json["created_by"],
        updatedBy: json["updated_by"] == null ? null : json["updated_by"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        status: Status.fromJson(json["status"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "order_id": orderId,
        "status_id": statusId,
        "created_by": createdBy == null ? null : createdBy,
        "updated_by": updatedBy == null ? null : updatedBy,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "status": status.toJson(),
      };
}

class Status {
  Status({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  var id;
  var name;
  var createdAt;
  var updatedAt;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        id: json["id"],
        name: json["name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(  this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
