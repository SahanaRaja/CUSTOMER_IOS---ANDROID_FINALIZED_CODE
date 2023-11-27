import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'loyalty.dart';

class Status extends Equatable {
  final String? message;
  final List<Loyalty>? loyalty;
  final int? result;

  const Status({this.message, this.loyalty, this.result});

  factory Status.fromMap(Map<String, dynamic> data) => Status(
        message: data['Message'] as String?,
        loyalty: (data['Loyalty'] as List<dynamic>?)
            ?.map((e) => Loyalty.fromMap(e as Map<String, dynamic>))
            .toList(),
        result: data['Result'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'Message': message,
        'Loyalty': loyalty?.map((e) => e.toMap()).toList(),
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
  List<Object?> get props => [message, loyalty, result];
}
