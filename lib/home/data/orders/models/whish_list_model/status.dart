import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'fav_product.dart';

class Status extends Equatable {
  final List<FavProduct>? favProduct;
  final String? message;
  final int? result;

  const Status({this.favProduct, this.message, this.result});

  factory Status.fromMap(Map<String, dynamic> data) => Status(
        favProduct: (data['FavProduct'] as List<dynamic>?)
            ?.map((e) => FavProduct.fromMap(e as Map<String, dynamic>))
            .toList(),
        message: data['Message'] as String?,
        result: data['Result'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'FavProduct': favProduct?.map((e) => e.toMap()).toList(),
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
  List<Object?> get props => [favProduct, message, result];
}
