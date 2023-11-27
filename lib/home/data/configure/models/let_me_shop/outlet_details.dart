import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'cheapest_prices.dart';
import 'fastest_delivery.dart';
import 'maximum_products.dart';
import 'nearest_shop.dart';

class OutletDetails extends Equatable {
  final MaximumProducts? maximumProducts;
  final CheapestPrices? cheapestPrices;
  final NearestShop? nearestShop;
  final FastestDelivery? fastestDelivery;

  const OutletDetails({
    this.maximumProducts,
    this.cheapestPrices,
    this.nearestShop,
    this.fastestDelivery,
  });

  factory OutletDetails.fromMap(Map<String, dynamic> data) => OutletDetails(
        maximumProducts: data['Maximum_Products'] == null
            ? null
            : MaximumProducts.fromMap(
                data['Maximum_Products'] as Map<String, dynamic>),
        // cheapestPrices: data['Cheapest_Prices'] == null
        // ? null
        //     : CheapestPrices.fromMap(
        //         data['Cheapest_Prices'] as Map<String, dynamic>),
        // nearestShop: data['Nearest_Shop'] == null
        //     ? null
        //     : NearestShop.fromMap(data['Nearest_Shop'] as Map<String, dynamic>),
        // fastestDelivery: data['Fastest_Delivery'] == null
        //     ? null
        //     : FastestDelivery.fromMap(
        //         data['Fastest_Delivery'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'Maximum_Products': maximumProducts?.toMap(),
        // 'Cheapest_Prices': cheapestPrices?.toMap(),
        // 'Nearest_Shop': nearestShop?.toMap(),
        // 'Fastest_Delivery': fastestDelivery?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [OutletDetails].
  factory OutletDetails.fromJson(String data) {
    return OutletDetails.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [OutletDetails] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      maximumProducts,
      cheapestPrices,
      nearestShop,
      fastestDelivery,
    ];
  }
}
