import 'dart:convert';

import 'package:equatable/equatable.dart';

class Statuss extends Equatable {
 final String? message;
 final String? deviceId;
 final String? description;
 final String? url;
 final int? result;

  const Statuss({
    this.message,
    this.deviceId,
    this.description,
    this.url,
    this.result,
  });

  factory Statuss.fromMap(Map<String, dynamic> data) => Statuss(
        message: data['Message'] as String?,
        deviceId: data['Device_Id'] as String?,
        description: data['description'] as String?,
        url: data['Url'] as String?,
        result: data['Result'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'Message': message,
        'Device_Id': deviceId,
        'description': description,
        'Url': url,
        'Result': result,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ReviewDesc].
  factory Statuss.fromJson(String data) {
    return Statuss.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ReviewDesc] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      message,
      deviceId,
      description,
      url,
      result
    ];
  }
}
