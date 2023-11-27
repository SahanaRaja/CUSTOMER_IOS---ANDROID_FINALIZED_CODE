import 'dart:convert';

import 'package:customer_assist/home/data/shopcoupon/models/shopping_products_model/Res_Status.dart';
import 'package:equatable/equatable.dart';

import 'session.dart';

class RestaurantProductsModel extends Equatable {
  final Session? session;
  final ResStatus? status;

  const RestaurantProductsModel({this.session, this.status});

  factory RestaurantProductsModel.fromMap(Map<String, dynamic> data) {
    return RestaurantProductsModel(
      session: data['session'] == null
          ? null
          : Session.fromMap(data['session'] as Map<String, dynamic>),
      status: data['status'] == null
          ? null
          : ResStatus.fromMap(data['status'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'session': session?.toMap(),
        'status': status?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [RestaurantProductsModel].
  factory RestaurantProductsModel.fromJson(String data) {
    return RestaurantProductsModel.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [RestaurantProductsModel] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [session, status];
}
