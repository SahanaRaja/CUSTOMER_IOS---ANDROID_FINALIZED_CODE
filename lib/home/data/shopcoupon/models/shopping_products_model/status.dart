import 'dart:convert';

import 'package:customer_assist/home/data/shopcoupon/models/shopping_products_model/banner.dart';
import 'package:equatable/equatable.dart';

import 'item.dart';

class Status extends Equatable {
  final String? favouritesDisplayName;
  final String? message;
  final List<dynamic>? favourites;
  final List<Item>? items;
  final List<Banners> banner;
  final int? result;

  const Status({
    this.favouritesDisplayName,
    this.message,
    this.favourites,
    this.items,
    required this.banner,
    this.result,
  });

  factory Status.fromMap(Map<String, dynamic> data) => Status(
        favouritesDisplayName: data['favourites_display_name'] as String?,
        message: data['Message'] as String?,
        favourites: data['favourites'] as List<dynamic>?,
        items: (data['ITEMS'] as List<dynamic>?)
            ?.map((e) => Item.fromMap(e as Map<String, dynamic>))
            .toList(),
        banner: (data['banners']) == null
            ? (data['banners'])
                ?.map((e) => Banners.fromMap(e as Map<String, dynamic>))
                .toList()
            : [],
        result: data['Result'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'favourites_display_name': favouritesDisplayName,
        'Message': message,
        'favourites': favourites,
        'ITEMS': items?.map((e) => e.toMap()).toList(),
        'banners': banner.map((e) => e.toMap()).toList(),
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
  List<Object?> get props {
    return [
      favouritesDisplayName,
      message,
      favourites,
      items,
      banner,
      result,
    ];
  }
}
