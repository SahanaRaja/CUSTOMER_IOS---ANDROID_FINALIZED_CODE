import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'session.dart';
import 'status.dart';

class DeliveryTimeModel extends Equatable {
  final Session? session;
  final Status? status;

  const DeliveryTimeModel({this.session, this.status});

  factory DeliveryTimeModel.fromMap(Map<String, dynamic> data) {
    return DeliveryTimeModel(
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
  /// Parses the string and returns the resulting Json object as [DeliveryTimeModel].
  factory DeliveryTimeModel.fromJson(String data) {
    return DeliveryTimeModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [DeliveryTimeModel] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [session, status];
}
