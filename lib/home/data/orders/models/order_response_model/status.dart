import 'dart:convert';

import 'package:equatable/equatable.dart';

class Status extends Equatable {
  final int? orderId;
  final String? message;
  final String? deliveryCode;
  final int? result;

  const Status({
    this.orderId,
    this.message,
    this.deliveryCode,
    this.result,
  });

  factory Status.fromMap(Map<String, dynamic> data) => Status(
        orderId: data['Order_id'] as int?,
        message: data['Message'] as String?,
        deliveryCode: data['DeliveryCode'] as String?,
        result: data['Result'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'Order_id': orderId,
        'Message': message,
        'DeliveryCode': deliveryCode,
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
  List<Object?> get props => [orderId, message, deliveryCode, result];
}
