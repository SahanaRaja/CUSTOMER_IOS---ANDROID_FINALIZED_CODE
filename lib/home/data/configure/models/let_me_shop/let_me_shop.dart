import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'session.dart';
import 'status.dart';

class LetMeShop extends Equatable {
  final Session? session;
  final Status? status;

  const LetMeShop({this.session, this.status});

  factory LetMeShop.fromMap(Map<String, dynamic> data) => LetMeShop(
        session: data['session'] == null
            ? null
            : Session.fromMap(data['session'] as Map<String, dynamic>),
        status: data['status'] == null
            ? null
            : Status.fromMap(data['status'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'session': session?.toMap(),
        'status': status?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [LetMeShop].
  factory LetMeShop.fromJson(String data) {
    return LetMeShop.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [LetMeShop] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [session, status];
}

class LetMeShopGuest extends Equatable {
  final Session? session;
  final Status? status;

  const LetMeShopGuest({this.session, this.status});

  factory LetMeShopGuest.fromMap(Map<String, dynamic> data) => LetMeShopGuest(
        session: data['session'] == null
            ? null
            : Session.fromMap(data['session'] as Map<String, dynamic>),
        status: data['status'] == null
            ? null
            : Status.fromMap(data['status'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'session': session?.toMap(),
        'status': status?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [LetMeShop].
  factory LetMeShopGuest.fromJson(String data) {
    return LetMeShopGuest.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [LetMeShop] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [session, status];
}
