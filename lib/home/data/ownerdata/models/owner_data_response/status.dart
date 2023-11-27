import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'deviceaddress.dart';

class Status extends Equatable {
  final String? message;
  final List<Deviceaddress>? deviceaddress;
  final int? result;

  const Status({this.message, this.deviceaddress, this.result});

  factory Status.fromMap(Map<String, dynamic> data) => Status(
        message: data['Message'] as String?,
        deviceaddress: (data['Deviceaddress'] as List<dynamic>?)
            ?.map((e) => Deviceaddress.fromMap(e as Map<String, dynamic>))
            .toList(),
        result: data['Result'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'Message': message,
        'Deviceaddress': deviceaddress?.map((e) => e.toMap()).toList(),
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
  List<Object?> get props => [message, deviceaddress, result];
}
