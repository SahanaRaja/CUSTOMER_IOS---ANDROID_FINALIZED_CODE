import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'session.dart';
import 'status.dart';

class DeliveryAddressModel extends Equatable {
  final Session? session;
  final Status? status;

  const DeliveryAddressModel({this.session, this.status});

  factory DeliveryAddressModel.fromMap(Map<String, dynamic> data) {
    return DeliveryAddressModel(
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
  /// Parses the string and returns the resulting Json object as [DeliveryAddressModel].
  factory DeliveryAddressModel.fromJson(String data) {
    return DeliveryAddressModel.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [DeliveryAddressModel] to a JSON string.
  String toJson() => json.encode(toMap());

  DeliveryAddressModel copyWith({
    Session? session,
    Status? status,
  }) {
    return DeliveryAddressModel(
      session: session ?? this.session,
      status: status ?? this.status,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [session, status];
}
