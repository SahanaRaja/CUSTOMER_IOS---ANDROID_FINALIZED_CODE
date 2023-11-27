import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'tips_value.dart';

class Status extends Equatable {
  final String? tipsPercentage;
  final int? maxConvenienceCharge;
  final String? message;
  final List<TipsValue>? tipsValue;
  final String? subscriptionAvailability;
  final String? tipsAmount;
  final double? maxConveniencePercentage;
  final int? result;

  const Status({
    this.tipsPercentage,
    this.maxConvenienceCharge,
    this.message,
    this.tipsValue,
    this.subscriptionAvailability,
    this.tipsAmount,
    this.maxConveniencePercentage,
    this.result,
  });

  factory Status.fromMap(Map<String, dynamic> data) => Status(
        tipsPercentage: data['tips_percentage'] as String?,
        maxConvenienceCharge: data['max_convenience_charge'] as int?,
        message: data['Message'] as String?,
        tipsValue: (data['tips_value'] as List<dynamic>?)
            ?.map((e) => TipsValue.fromMap(e as Map<String, dynamic>))
            .toList(),
        subscriptionAvailability: data['subscription_availability'] as String?,
        tipsAmount: data['tips_amount'] as String?,
        maxConveniencePercentage:
            (data['max_convenience_percentage'] as num?)?.toDouble(),
        result: data['Result'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'tips_percentage': tipsPercentage,
        'max_convenience_charge': maxConvenienceCharge,
        'Message': message,
        'tips_value': tipsValue?.map((e) => e.toMap()).toList(),
        'subscription_availability': subscriptionAvailability,
        'tips_amount': tipsAmount,
        'max_convenience_percentage': maxConveniencePercentage,
        'Result': result,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Status].
  factory Status.fromJson(String data) {
    return Status.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Status] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      tipsPercentage,
      maxConvenienceCharge,
      message,
      tipsValue,
      subscriptionAvailability,
      tipsAmount,
      maxConveniencePercentage,
      result,
    ];
  }
}
