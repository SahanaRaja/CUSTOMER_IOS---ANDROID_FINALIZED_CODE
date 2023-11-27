import 'dart:convert';

import 'package:equatable/equatable.dart';

class PayMethod extends Equatable {
  final String? mode;
  final String? description;
  final int? available;
  final String? code;

  const PayMethod({this.mode, this.description, this.available, this.code});

  factory PayMethod.fromMap(Map<String, dynamic> data) => PayMethod(
        mode: data['Mode'] as String?,
        description: data['description'] as String?,
        available: data['Available'] as int?,
        code: data['Code'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'Mode': mode,
        'description': description,
        'Available': available,
        'Code': code,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PayMethod].
  factory PayMethod.fromJson(String data) {
    return PayMethod.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PayMethod] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [mode, description, available, code];
}
