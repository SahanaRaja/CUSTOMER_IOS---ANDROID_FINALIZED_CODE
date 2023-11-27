import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'item.dart';

class StoreDetailModel extends Equatable {
  final String? currency;
  final String? availability;
  final String? shopId;
  final double? quality;
  final String? shopName;
  final String? zipcode;
  final List<Item>? items;
  final int? cost;
  final String? distance;
  final String? imageUrl;
    final String? speed;

  const StoreDetailModel({
    this.currency,
    this.availability,
    this.shopId,
    this.quality,
    this.shopName,
    this.zipcode,
    this.items,
    this.cost,
    this.distance,
    this.imageUrl,
    this.speed,
  });

  factory StoreDetailModel.fromMap(Map<String, dynamic> data) =>
      StoreDetailModel(
        currency: data['CURRENCY'] as String?,
        availability: data['Availability'] as String?,
        shopId: data['SHOP_ID'] as String?,
        quality: (data['Quality'] as num?)?.toDouble(),
        shopName: data['SHOP_NAME'] as String?,
        zipcode: data['ZIPCODE'] as String?,
        items: (data['Items'] as List<dynamic>?)
            ?.map((e) => Item.fromMap(e as Map<String, dynamic>))
            .toList(),
        cost: data['Cost'] as int?,
        distance: data['Distance'] as String?,
        imageUrl: data['IMAGE_URL'] as String?,
         speed: data['DeliverySpeed'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'CURRENCY': currency,
        'Availability': availability,
        'SHOP_ID': shopId,
        'Quality': quality,
        'SHOP_NAME': shopName,
        'ZIPCODE': zipcode,
        'Items': items?.map((e) => e.toMap()).toList(),
        'Cost': cost,
        'Distance': distance,
        'IMAGE_URL': imageUrl,
        'DeliverySpeed': speed,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [StoreDetail].
  factory StoreDetailModel.fromJson(String data) {
    return StoreDetailModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [StoreDetail] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      currency,
      availability,
      shopId,
      quality,
      shopName,
      zipcode,
      items,
      cost,
      distance,
      imageUrl,
      speed
    ];
  }
}
