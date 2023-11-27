import 'dart:convert';

import 'package:customer_assist/home/data/shopcoupon/models/shopping_products_model/Res_Item.dart';
import 'package:customer_assist/home/data/shopcoupon/models/shopping_products_model/banner.dart';
import 'package:equatable/equatable.dart';


class ResStatus extends Equatable {
  final String? favouritesDisplayName;
  final String? message;
  final List<dynamic>? favourites;
  final List<ResItem>? items;
  final List<Banners> banner;
  final int? result;

  const ResStatus({
    this.favouritesDisplayName,
    this.message,
    this.favourites,
    this.items,
   required this.banner,
    this.result,
  });

  factory ResStatus.fromMap(Map<String, dynamic> data) => ResStatus(
        favouritesDisplayName: data['favourites_display_name'] as String?,
        message: data['Message'] as String?,
        favourites: data['favourites'] as List<dynamic>?,
        items: (data['ITEMS'] as List<dynamic>?)
            ?.map((e) => ResItem.fromMap(e as Map<String, dynamic>))
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
  /// Parses the string and returns the resulting Json object as [ResStatus].
  factory ResStatus.fromJson(String data) {
    return ResStatus.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ResStatus] to a JSON string.
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
