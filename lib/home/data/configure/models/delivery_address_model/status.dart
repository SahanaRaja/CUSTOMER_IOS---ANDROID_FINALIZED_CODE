import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'defaultaddress.dart';
import 'deliveryaddress.dart';

class Status extends Equatable {
  final List<Defaultaddress>? defaultaddress;
  final String? message;
  final List<Deliveryaddress>? deliveryaddress;
  final int? result;

  const Status({
    this.defaultaddress,
    this.message,
    this.deliveryaddress,
    this.result,
  });

  factory Status.fromMap(Map<String, dynamic> data) => Status(
        defaultaddress: (data['defaultaddress'] as List<dynamic>?)
            ?.map((e) => Defaultaddress.fromMap(e as Map<String, dynamic>))
            .toList(),
        message: data['Message'] as String?,
        deliveryaddress: (data['deliveryaddress'] as List<dynamic>?)
            ?.map((e) => Deliveryaddress.fromMap(e as Map<String, dynamic>))
            .toList(),
        result: data['Result'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'defaultaddress': defaultaddress?.map((e) => e.toMap()).toList(),
        'Message': message,
        'deliveryaddress': deliveryaddress?.map((e) => e.toMap()).toList(),
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

  Status copyWith({
    List<Defaultaddress>? defaultaddress,
    String? message,
    List<Deliveryaddress>? deliveryaddress,
    int? result,
  }) {
    return Status(
      defaultaddress: defaultaddress ?? this.defaultaddress,
      message: message ?? this.message,
      deliveryaddress: deliveryaddress ?? this.deliveryaddress,
      result: result ?? this.result,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      defaultaddress,
      message,
      deliveryaddress,
      result,
    ];
  }
}
