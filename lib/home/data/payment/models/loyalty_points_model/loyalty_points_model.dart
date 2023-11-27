import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'session.dart';
import 'status.dart';

class LoyaltyPointsModel extends Equatable {
  final Session? session;
  final Status? status;

  const LoyaltyPointsModel({this.session, this.status});

  factory LoyaltyPointsModel.fromMap(Map<String, dynamic> data) {
    return LoyaltyPointsModel(
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
  /// Parses the string and returns the resulting Json object as [LoyaltyPointsModel].
  factory LoyaltyPointsModel.fromJson(String data) {
    return LoyaltyPointsModel.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [LoyaltyPointsModel] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [session, status];
}
