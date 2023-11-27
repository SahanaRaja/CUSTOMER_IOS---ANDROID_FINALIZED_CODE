import 'dart:convert';

import 'package:equatable/equatable.dart';

class Tax extends Equatable {
  final String? taxkey;
  final int? taxid;
  final double? taxvalue;

  const Tax({this.taxkey, this.taxid, this.taxvalue});

  factory Tax.fromMap(Map<String, dynamic> data) => Tax(
        taxkey: data['TAXKEY'] as String?,
        taxid: data['TAXID'] as int?,
        taxvalue: (data['TAXVALUE'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        'TAXKEY': taxkey,
        'TAXID': taxid,
        'TAXVALUE': taxvalue,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Tax].
  factory Tax.fromJson(String data) {
    return Tax.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Tax] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [taxkey, taxid, taxvalue];
}
