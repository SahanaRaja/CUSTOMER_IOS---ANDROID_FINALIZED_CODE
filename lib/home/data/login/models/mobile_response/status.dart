import 'dart:convert';

import 'package:equatable/equatable.dart';

class Status extends Equatable {
  final String? message3;
  final String? message;
  final String? message2;
  final int? result;

  const Status({this.message3, this.message, this.message2, this.result});

  factory Status.fromMap(Map<String, dynamic> data) => Status(
        message3: data['Message3'] as String?,
        message: data['Message'] as String?,
        message2: data['Message2'] as String?,
        result: data['Result'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'Message3': message3,
        'Message': message,
        'Message2': message2,
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
  List<Object?> get props => [message3, message, message2, result];
}
