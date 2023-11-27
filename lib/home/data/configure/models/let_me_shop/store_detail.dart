import 'dart:convert';

import 'package:equatable/equatable.dart';

class StoreDetail extends Equatable {
  final String? sharedSecret;
  final String? shopId;
  final String? mobileNumber;
  final String? timeZoneId;
  final String? shopName;
  final String? longitude;
  final String? convPercent;
  final String? isArFlag;
  final int? rank;
  final String? shopOpenTime;
  final String? email;
  final String? deliveryType;
  final String? account;
  final String? deliveryCharge;
  final String? shopType;
  final String? shopCloseTime;
  final String? maximumOrderAmount;
  final String? imageUrl;
  final String? distance;
  final String? landlineNumber;
  final double? singleBagFee;
  final String? zipcode;
  final String? rebatePassword;
  final String? rankDisplay;
  final String? minimumOrderAmount;
  final double? noOfReview;
  final String? city;
  final int? rating;
  final String? maxConvenienceCharge;
  final String? province;
  final String? latitude;
  final String? address1;
  final String? address2;
  final String? merchantId;

  final int? productavailability;
  final double? lowestprice;
  
  final String? deliveryspeed;
 

 const StoreDetail(
      {this.sharedSecret,
      this.shopId,
      this.mobileNumber,
      this.timeZoneId,
      this.shopName,
      this.longitude,
      this.convPercent,
      this.isArFlag,
      this.rank,
      this.shopOpenTime,
      this.email,
      this.deliveryType,
      this.account,
      this.deliveryCharge,
      this.shopType,
      this.shopCloseTime,
      this.maximumOrderAmount,
      this.imageUrl,
      this.distance,
      this.landlineNumber,
      this.singleBagFee,
      this.zipcode,
      this.rebatePassword,
      this.rankDisplay,
      this.minimumOrderAmount,
      this.noOfReview,
      this.city,
      this.rating,
      this.maxConvenienceCharge,
      this.province,
      this.latitude,
      this.address1,
      this.address2,
      this.merchantId,
      this.productavailability,
      this.lowestprice,
      this.deliveryspeed});

  factory StoreDetail.fromMap(Map<String, dynamic> data) => StoreDetail(
      sharedSecret: data['SHARED_SECRET'] as String?,
      shopId: data['SHOP_ID'] as String?,
      mobileNumber: data['MOBILE_NUMBER'] as String?,
      timeZoneId: data['timeZoneID'] as String?,
      shopName: data['SHOP_NAME'] as String?,
      longitude: data['LONGITUDE'] as String?,
      convPercent: data['CONV_PERCENT'] as String?,
      isArFlag: data['IS_AR_FLAG'] as String?,
      rank: data['RANK'] as int?,
      shopOpenTime: data['SHOP_OPEN_TIME'] as String?,
      email: data['EMAIL'] as String?,
      deliveryType: data['DELIVERY_TYPE'] as String?,
      account: data['ACCOUNT'] as String?,
      deliveryCharge: data['DELIVERY_CHARGE'] as String?,
      shopType: data['SHOP_TYPE'] as String?,
      shopCloseTime: data['SHOP_CLOSE_TIME'] as String?,
      maximumOrderAmount: data['maximum_order_amount'] as String?,
      imageUrl: data['IMAGE_URL'] as String?,
      distance: data['DISTANCE'] as String?,
      landlineNumber: data['LANDLINE_NUMBER'] as String?,
      singleBagFee: (data['SINGLE_BAG_FEE'] as num?)?.toDouble(),
      zipcode: data['ZIPCODE'] as String?,
      rebatePassword: data['REBATE_PASSWORD'] as String?,
      rankDisplay: data['RANK_DISPLAY'] as String?,
      minimumOrderAmount: data['minimum_order_amount'] as String?,
      noOfReview: (data['NO_OF_REVIEW'] as num?)?.toDouble(),
      city: data['CITY'] as String?,
      rating: data['RATING'] as int?,
      maxConvenienceCharge: data['MAX_CONVENIENCE_CHARGE'] as String?,
      province: data['PROVINCE'] as String?,
      latitude: data['LATITUDE'] as String?,
      address1: data['ADDRESS_1'] as String?,
      address2: data['ADDRESS_2'] as String?,
      merchantId: data['MERCHANT_ID'] as String?,
      productavailability: data['PRODUCT_AVAILABILITY'] as int?,
      lowestprice: (data['LOWEST_PRICE'] as num?)?.toDouble(),
      deliveryspeed: data['DELIVERY_SPEED'] ?? '');

  Map<String, dynamic> toMap() => {
        'SHARED_SECRET': sharedSecret,
        'SHOP_ID': shopId,
        'MOBILE_NUMBER': mobileNumber,
        'timeZoneID': timeZoneId,
        'SHOP_NAME': shopName,
        'LONGITUDE': longitude,
        'CONV_PERCENT': convPercent,
        'IS_AR_FLAG': isArFlag,
        'RANK': rank,
        'SHOP_OPEN_TIME': shopOpenTime,
        'EMAIL': email,
        'DELIVERY_TYPE': deliveryType,
        'ACCOUNT': account,
        'DELIVERY_CHARGE': deliveryCharge,
        'SHOP_TYPE': shopType,
        'SHOP_CLOSE_TIME': shopCloseTime,
        'maximum_order_amount': maximumOrderAmount,
        'IMAGE_URL': imageUrl,
        'DISTANCE': distance,
        'LANDLINE_NUMBER': landlineNumber,
        'SINGLE_BAG_FEE': singleBagFee,
        'ZIPCODE': zipcode,
        'REBATE_PASSWORD': rebatePassword,
        'RANK_DISPLAY': rankDisplay,
        'minimum_order_amount': minimumOrderAmount,
        'NO_OF_REVIEW': noOfReview,
        'CITY': city,
        'RATING': rating,
        'MAX_CONVENIENCE_CHARGE': maxConvenienceCharge,
        'PROVINCE': province,
        'LATITUDE': latitude,
        'ADDRESS_1': address1,
        'ADDRESS_2': address2,
        'MERCHANT_ID': merchantId,
        'PRODUCT_AVAILABILITY': productavailability,
        'LOWEST_PRICE': lowestprice,
        'DELIVERY_SPEED': deliveryspeed
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [StoreDetail].
  factory StoreDetail.fromJson(String data) {
    return StoreDetail.fromMap(json.decode(data) as Map<String, dynamic>);
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
      sharedSecret,
      shopId,
      mobileNumber,
      timeZoneId,
      shopName,
      longitude,
      convPercent,
      isArFlag,
      rank,
      shopOpenTime,
      email,
      deliveryType,
      account,
      deliveryCharge,
      shopType,
      shopCloseTime,
      maximumOrderAmount,
      imageUrl,
      distance,
      landlineNumber,
      singleBagFee,
      zipcode,
      rebatePassword,
      rankDisplay,
      minimumOrderAmount,
      noOfReview,
      city,
      rating,
      maxConvenienceCharge,
      province,
      latitude,
      address1,
      address2,
      merchantId,
      productavailability,
      lowestprice,
      deliveryspeed
    ];
  }
}
