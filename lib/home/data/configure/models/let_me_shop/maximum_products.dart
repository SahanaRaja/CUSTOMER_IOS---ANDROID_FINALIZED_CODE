import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'store_detail.dart';

class MaximumProducts extends Equatable {
  final List<StoreDetail>? storeDetails;

  const MaximumProducts({this.storeDetails});

  factory MaximumProducts.fromMap(Map<String, dynamic> data) {
    return MaximumProducts(
      storeDetails: (data['STORE_DETAILS'] as List<dynamic>?)
          ?.map((e) => StoreDetail.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() => {
        'STORE_DETAILS': storeDetails?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [MaximumProducts].
  factory MaximumProducts.fromJson(String data) {
    return MaximumProducts.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [MaximumProducts] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [storeDetails];
}
