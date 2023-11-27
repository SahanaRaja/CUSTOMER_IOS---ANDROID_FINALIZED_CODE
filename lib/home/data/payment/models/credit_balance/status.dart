import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'credit.dart';

class Status extends Equatable {
  final List<Credit>? credits;
  final String? message;
  final int? result;

  const Status({this.credits, this.message, this.result});

  factory Status.fromMap(Map<String, dynamic> data) => Status(
        credits: (data['Credits'] as List<dynamic>?)
            ?.map((e) => Credit.fromMap(e as Map<String, dynamic>))
            .toList(),
        message: data['Message'] as String?,
        result: data['Result'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'Credits': credits?.map((e) => e.toMap()).toList(),
        'Message': message,
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
  List<Object?> get props => [credits, message, result];
}
