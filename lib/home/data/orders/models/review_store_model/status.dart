import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'service_model.dart';

class Status extends Equatable {
  final List<ServiceModel>? serviceModel;
  final String? serviceType;
  final String? serviceDescription;
  final String? serviceRemarks;
  final String? autoRenew;
  final String? message;
  final String? subscriptionDescription;
  final String? currency;
  final String? subscriptionType;
  final int? result;

  const Status({
    this.serviceModel,
    this.serviceType,
    this.serviceDescription,
    this.serviceRemarks,
    this.autoRenew,
    this.message,
    this.subscriptionDescription,
    this.currency,
    this.subscriptionType,
    this.result,
  });

  factory Status.fromMap(Map<String, dynamic> data) => Status(
        serviceModel: (data['service_model'] as List<dynamic>?)
            ?.map((e) => ServiceModel.fromMap(e as Map<String, dynamic>))
            .toList(),
        serviceType: data['service_type'] as String?,
        serviceDescription: data['service_description'] as String?,
        serviceRemarks: data['service_remarks'] as String?,
        autoRenew: data['auto_renew'] as String?,
        message: data['Message'] as String?,
        subscriptionDescription: data['subscription_description'] as String?,
        currency: data['currency'] as String?,
        subscriptionType: data['subscription_type'] as String?,
        result: data['Result'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'service_model': serviceModel?.map((e) => e.toMap()).toList(),
        'service_type': serviceType,
        'service_description': serviceDescription,
        'service_remarks': serviceRemarks,
        'auto_renew': autoRenew,
        'Message': message,
        'subscription_description': subscriptionDescription,
        'currency': currency,
        'subscription_type': subscriptionType,
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
      serviceModel,
      serviceType,
      serviceDescription,
      serviceRemarks,
      autoRenew,
      message,
      subscriptionDescription,
      currency,
      subscriptionType,
      result,
    ];
  }
}
