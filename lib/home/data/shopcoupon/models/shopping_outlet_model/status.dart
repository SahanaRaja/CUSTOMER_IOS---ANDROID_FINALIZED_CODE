import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'stores.dart';

class Status extends Equatable {
  final String? message;
  final Stores? stores;
  final int? result;

  const Status({this.message, this.stores, this.result});

  factory Status.fromMap(Map<String, dynamic> data) => Status(
        message: data['Message'] as String?,
        stores: data['Stores'] == null
            ? null
            : Stores.fromMap(data['Stores'] as Map<String, dynamic>),
        result: data['Result'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'Message': message,
        'Stores': stores?.toMap(),
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
  List<Object?> get props => [message, stores, result];
}
