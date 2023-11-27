import 'dart:convert';

import 'package:equatable/equatable.dart';

class TipsValue extends Equatable {
  final String? value;
  final String? name;

  const TipsValue({this.value, this.name});

  factory TipsValue.fromMap(Map<String, dynamic> data) => TipsValue(
        value: data['Value'] as String?,
        name: data['Name'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'Value': value,
        'Name': name,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [TipsValue].
  factory TipsValue.fromJson(String data) {
    return TipsValue.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [TipsValue] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [value, name];
}
