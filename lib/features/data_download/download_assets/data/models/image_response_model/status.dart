import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'base64_image.dart';

class Status extends Equatable {
  final int? totalrecords;
  final String? message;
  final List<Base64Image>? base64Image;
  final int? result;

  const Status({
    this.totalrecords,
    this.message,
    this.base64Image,
    this.result,
  });

  factory Status.fromMap(Map<String, dynamic> data) => Status(
        totalrecords: data['Totalrecords'] as int?,
        message: data['Message'] as String?,
        base64Image: (data['Base64Image'] as List<dynamic>?)
            ?.map((e) => Base64Image.fromMap(e as Map<String, dynamic>))
            .toList(),
        result: data['Result'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'Totalrecords': totalrecords,
        'Message': message,
        'Base64Image': base64Image?.map((e) => e.toMap()).toList(),
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
    int? totalrecords,
    String? message,
    List<Base64Image>? base64Image,
    int? result,
  }) {
    return Status(
      totalrecords: totalrecords ?? this.totalrecords,
      message: message ?? this.message,
      base64Image: base64Image ?? this.base64Image,
      result: result ?? this.result,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [totalrecords, message, base64Image, result];
}
