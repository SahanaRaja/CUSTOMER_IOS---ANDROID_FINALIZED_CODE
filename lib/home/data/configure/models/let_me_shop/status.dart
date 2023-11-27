import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'outlet_details.dart';

class Status extends Equatable {
  final double? deliveryLatitude;
  final String? verticalName;
  final String? message;
  final OutletDetails? outletDetails;
  final double? deliveryLongitude;
  final int? result;

  const Status({
    this.deliveryLatitude,
    this.verticalName,
    this.message,
    this.outletDetails,
    this.deliveryLongitude,
    this.result,
  });

  factory Status.fromMap(Map<String, dynamic> data) => Status(
        deliveryLatitude: (data['DELIVERY_LATITUDE'] as num?)?.toDouble(),
        verticalName: data['vertical_name'] as String?,
        message: data['Message'] as String?,
        outletDetails: data['OUTLET_DETAILS'] == null
            ? null
            : OutletDetails.fromMap(
                data['OUTLET_DETAILS'] as Map<String, dynamic>),
        deliveryLongitude: (data['DELIVERY_LONGITUDE'] as num?)?.toDouble(),
        result: data['Result'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'DELIVERY_LATITUDE': deliveryLatitude,
        'vertical_name': verticalName,
        'Message': message,
        'OUTLET_DETAILS': outletDetails?.toMap(),
        'DELIVERY_LONGITUDE': deliveryLongitude,
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
      deliveryLatitude,
      verticalName,
      message,
      outletDetails,
      deliveryLongitude,
      result,
    ];
  }
}
