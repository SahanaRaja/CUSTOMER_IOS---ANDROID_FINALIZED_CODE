import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'session.dart';
import 'status.dart';

class CreditBalance extends Equatable {
  final Session? session;
  final Status? status;

  const CreditBalance({this.session, this.status});

  factory CreditBalance.fromMap(Map<String, dynamic> data) => CreditBalance(
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
  /// Parses the string and returns the resulting Json object as [CreditBalance].
  factory CreditBalance.fromJson(String data) {
    return CreditBalance.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CreditBalance] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [session, status];
}
