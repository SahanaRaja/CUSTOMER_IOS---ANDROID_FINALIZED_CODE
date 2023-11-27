import 'dart:convert';

import 'package:equatable/equatable.dart';

class Offer extends Equatable {
  final String? os;
  final String? companyId;
  final String? promoName;
  final int? discountValue;
  final String? promoCode;
  final String? discountType;
  final String? promoTopImage;
  final String? promoBottomImage;
  final String? companyName;
  final String? validTo;
  final int? minimumBillAmount;
  final String? couponNo;
  final String? offerImage;
  final String? promoCenterImage;

  const Offer({
    this.os,
    this.companyId,
    this.promoName,
    this.discountValue,
    this.promoCode,
    this.discountType,
    this.promoTopImage,
    this.promoBottomImage,
    this.companyName,
    this.validTo,
    this.minimumBillAmount,
    this.couponNo,
    this.offerImage,
    this.promoCenterImage,
  });

  factory Offer.fromMap(Map<String, dynamic> data) => Offer(
        os: data['os'] as String?,
        companyId: data['company_id'] as String?,
        promoName: data['promo_name'] as String?,
        discountValue: data['discount_value'] as int?,
        promoCode: data['promo_code'] as String?,
        discountType: data['discount_type'] as String?,
        promoTopImage: data['promo_top_image'] as String?,
        promoBottomImage: data['promo_bottom_image'] as String?,
        companyName: data['company_name'] as String?,
        validTo: data['valid_to'] as String?,
        minimumBillAmount: data['minimum_bill_amount'] as int?,
        couponNo: data['coupon_no'] as String?,
        offerImage: data['offer_image'] as String?,
        promoCenterImage: data['promo_center_image'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'os': os,
        'company_id': companyId,
        'promo_name': promoName,
        'discount_value': discountValue,
        'promo_code': promoCode,
        'discount_type': discountType,
        'promo_top_image': promoTopImage,
        'promo_bottom_image': promoBottomImage,
        'company_name': companyName,
        'valid_to': validTo,
        'minimum_bill_amount': minimumBillAmount,
        'coupon_no': couponNo,
        'offer_image': offerImage,
        'promo_center_image': promoCenterImage,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Offer].
  factory Offer.fromJson(String data) {
    return Offer.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Offer] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      os,
      companyId,
      promoName,
      discountValue,
      promoCode,
      discountType,
      promoTopImage,
      promoBottomImage,
      companyName,
      validTo,
      minimumBillAmount,
      couponNo,
      offerImage,
      promoCenterImage,
    ];
  }
}
