import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'session.dart';
import 'status.dart';

class PendingOrderModels extends Equatable {
  final Session? session;
  final Status? status;

  const PendingOrderModels({this.session, this.status});

  factory PendingOrderModels.fromMap(Map<String, dynamic> data) {
    return PendingOrderModels(
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
  /// Parses the string and returns the resulting Json object as [PendingOrderModels].
  factory PendingOrderModels.fromJson(String data) {
    return PendingOrderModels.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PendingOrderModels] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [session, status];
}
