import 'dart:convert';

import 'package:equatable/equatable.dart';

class Status extends Equatable {
  final String? message;
  final int? shopreferenceid;
  final int? result;

  const Status({this.message, this.shopreferenceid, this.result});

  factory Status.fromMap(Map<String, dynamic> data) => Status(
        message: data['Message'] as String?,
        shopreferenceid: data['SHOPREFERENCEID'] as int?,
        result: data['Result'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'Message': message,
        'SHOPREFERENCEID': shopreferenceid,
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
  List<Object?> get props => [message, shopreferenceid, result];
}
