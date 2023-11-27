import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'store_detail.dart';

class Stores extends Equatable {
  final List<StoreDetailModel>? storeDetails;

  const Stores({this.storeDetails});

  factory Stores.fromMap(Map<String, dynamic> data) => Stores(
        storeDetails: (data['STORE_DETAILS'] as List<dynamic>?)
            ?.map((e) => StoreDetailModel.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'STORE_DETAILS': storeDetails?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Stores].
  factory Stores.fromJson(String data) {
    return Stores.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Stores] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [storeDetails];
}
