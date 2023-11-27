import 'dart:convert';

import 'package:equatable/equatable.dart';

class Status extends Equatable {
 Map<String, String> arb;
  // final String? arb;
  final String? tokenNo;
  final String? message;
  final int? result;

   Status({required this.arb, this.tokenNo, this.message, this.result});

  factory Status.fromMap(Map<String, dynamic> data) => Status(
        message: data['Message'] as String?,
        result: data['Result'] as int?,
        // arb: data['ARB'] as String?,
        arb: Map<String, String>.from(data['ARB']),
        tokenNo: data['TokenNo'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'Message': message,
        'Result': result,
        'ARB': arb,
        'TokenNo': tokenNo,
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
  List<Object?> get props => [message, result, arb, tokenNo];
}
