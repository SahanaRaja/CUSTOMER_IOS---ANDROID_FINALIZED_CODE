import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'session.dart';
import 'status.dart';

class ShoppingListDataModel extends Equatable {
  final Session? session;
  final Status? status;

  const ShoppingListDataModel({this.session, this.status});

  factory ShoppingListDataModel.fromMap(Map<String, dynamic> data) {
    return ShoppingListDataModel(
      session: data['session'] == null
          ? null
          : Session.fromMap(data['session'] as Map<String, dynamic>),
      status: data['status'] == null
          ? null
          : Status.fromMap(data['status'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'session': session?.toMap(),
        'status': status?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ShoppingListDataModel].
  factory ShoppingListDataModel.fromJson(String data) {
    return ShoppingListDataModel.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ShoppingListDataModel] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [session, status];
}
