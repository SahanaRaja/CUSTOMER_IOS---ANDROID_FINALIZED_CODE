import 'dart:convert';

import 'package:equatable/equatable.dart';

class Orders extends Equatable {
  final String? deliveryType;
  final int? noOfQty;
  final int? cancelledStatus;
  final String? shopId;
  final String? deliveryDate;
  final String? deliveryCode;
  final int? noOfItems;
  final String? orderDate;
  final String? orderStatus;
  final String? shopName;
  final String? orderAmount;
  final String? deliveryTime;
  final String? orderId;
  final String? shopImage;

  const Orders({
    this.deliveryType,
    this.noOfQty,
    this.cancelledStatus,
    this.shopId,
    this.deliveryDate,
    this.deliveryCode,
    this.noOfItems,
    this.orderDate,
    this.orderStatus,
    this.shopName,
    this.orderAmount,
    this.deliveryTime,
    this.orderId,
    this.shopImage,
  });

  factory Orders.fromMap(Map<String, dynamic> data) => Orders(
        deliveryType: data['Delivery_Type'] as String?,
        noOfQty: data['no_of_qty'] as int?,
        cancelledStatus: data['cancelled_status'] as int?,
        shopId: data['SHOP_ID'] as String?,
        deliveryDate: data['Delivery_Date'] as String?,
        deliveryCode: data['DeliveryCode'] as String?,
        noOfItems: data['no_of_items'] as int?,
        orderDate: data['order_date'] as String?,
        orderStatus: data['order_status'] as String?,
        shopName: data['SHOP_name'] as String?,
        orderAmount: data['order_amount'] as String?,
        deliveryTime: data['Delivery_Time'] as String?,
        orderId: data['order_id'] as String?,
        shopImage: data['Shop_Image'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'Delivery_Type': deliveryType,
        'no_of_qty': noOfQty,
        'cancelled_status': cancelledStatus,
        'SHOP_ID': shopId,
        'Delivery_Date': deliveryDate,
        'DeliveryCode': deliveryCode,
        'no_of_items': noOfItems,
        'order_date': orderDate,
        'order_status': orderStatus,
        'SHOP_name': shopName,
        'order_amount': orderAmount,
        'Delivery_Time': deliveryTime,
        'order_id': orderId,
        'Shop_Image': shopImage,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Order].
  factory Orders.fromJson(String data) {
    return Orders.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Order] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      deliveryType,
      noOfQty,
      cancelledStatus,
      shopId,
      deliveryDate,
      deliveryCode,
      noOfItems,
      orderDate,
      orderStatus,
      shopName,
      orderAmount,
      deliveryTime,
      orderId,
      shopImage,
    ];
  }
}
