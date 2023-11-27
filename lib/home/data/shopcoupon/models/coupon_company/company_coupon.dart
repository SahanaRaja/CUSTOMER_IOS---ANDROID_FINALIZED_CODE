import 'dart:convert';

import 'package:equatable/equatable.dart';

class CompanyCoupon extends Equatable {
  final String? companyName;
  final String? promoName;
  final String? companyUrl;
  final String? promoId;
  final String? companyId;
  final String? companyVerticalId;

  const CompanyCoupon({
    this.companyName,
    this.promoName,
    this.companyUrl,
    this.promoId,
    this.companyId,
    this.companyVerticalId,
  });

  factory CompanyCoupon.fromMap(Map<String, dynamic> data) => CompanyCoupon(
        companyName: data['COMPANY_NAME'] as String?,
        promoName: data['PROMO_NAME'] as String?,
        companyUrl: data['COMPANY_URL'] as String?,
        promoId: data['PROMO_ID'] as String?,
        companyId: data['COMPANY_ID'] as String?,
        companyVerticalId: data['COMPANY_VERTICAL_ID'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'COMPANY_NAME': companyName,
        'PROMO_NAME': promoName,
        'COMPANY_URL': companyUrl,
        'PROMO_ID': promoId,
        'COMPANY_ID': companyId,
        'COMPANY_VERTICAL_ID': companyVerticalId,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CompanyCoupon].
  factory CompanyCoupon.fromJson(String data) {
    return CompanyCoupon.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CompanyCoupon] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      companyName,
      promoName,
      companyUrl,
      promoId,
      companyId,
      companyVerticalId,
    ];
  }
}
