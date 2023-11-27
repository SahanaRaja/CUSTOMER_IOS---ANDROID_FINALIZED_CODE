import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'session.dart';
import 'status.dart';

class ZipCodeResponse extends Equatable {
  final Session? session;
  final Status? status;

  const ZipCodeResponse({this.session, this.status});

  factory ZipCodeResponse.fromMap(Map<String, dynamic> data) {
    return ZipCodeResponse(
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
  /// Parses the string and returns the resulting Json object as [MobileResponse].
  factory ZipCodeResponse.fromJson(String data) {
    return ZipCodeResponse.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [MobileResponse] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [session, status];
}
