import 'dart:convert';

import 'package:equatable/equatable.dart';

class Credit extends Equatable {
  final int? creditLimit;
  final String? sharedSecret;
  final String? creditPeriod;
  final String? shopName;
  final List<dynamic>? dueData;
  final String? shopId;
  final String? rebatePassword;
  final double? creditUsed;
  final String? account;
  final String? sslMerchantId;
  final String? currency;
  final String? merchantId;
  final double? balanceCredit;

  const Credit({
    this.creditLimit,
    this.sharedSecret,
    this.creditPeriod,
    this.shopName,
    this.dueData,
    this.shopId,
    this.rebatePassword,
    this.creditUsed,
    this.account,
    this.sslMerchantId,
    this.currency,
    this.merchantId,
    this.balanceCredit,
  });

  factory Credit.fromMap(Map<String, dynamic> data) => Credit(
        creditLimit: data['Credit_Limit'] as int?,
        sharedSecret: data['SHARED_SECRET'] as String?,
        creditPeriod: data['Credit_Period'] as String?,
        shopName: data['Shop_Name'] as String?,
        dueData: data['Due_Data'] as List<dynamic>?,
        shopId: data['Shop_Id'] as String?,
        rebatePassword: data['REBATE_PASSWORD'] as String?,
        creditUsed: (data['Credit_Used'] as num?)?.toDouble(),
        account: data['ACCOUNT'] as String?,
        sslMerchantId: data['SSL_MERCHANT_ID'] as String?,
        currency: data['Currency'] as String?,
        merchantId: data['MERCHANT_ID'] as String?,
        balanceCredit: (data['Balance_Credit'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        'Credit_Limit': creditLimit,
        'SHARED_SECRET': sharedSecret,
        'Credit_Period': creditPeriod,
        'Shop_Name': shopName,
        'Due_Data': dueData,
        'Shop_Id': shopId,
        'REBATE_PASSWORD': rebatePassword,
        'Credit_Used': creditUsed,
        'ACCOUNT': account,
        'SSL_MERCHANT_ID': sslMerchantId,
        'Currency': currency,
        'MERCHANT_ID': merchantId,
        'Balance_Credit': balanceCredit,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Credit].
  factory Credit.fromJson(String data) {
    return Credit.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Credit] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      creditLimit,
      sharedSecret,
      creditPeriod,
      shopName,
      dueData,
      shopId,
      rebatePassword,
      creditUsed,
      account,
      sslMerchantId,
      currency,
      merchantId,
      balanceCredit,
    ];
  }
}
