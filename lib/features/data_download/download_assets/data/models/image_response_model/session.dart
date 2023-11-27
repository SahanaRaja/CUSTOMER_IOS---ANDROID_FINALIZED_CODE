import 'dart:convert';

import 'package:equatable/equatable.dart';

class Session extends Equatable {
  final String? sessionMessage;
  final int? sessionResult;

  const Session({this.sessionMessage, this.sessionResult});

  factory Session.fromMap(Map<String, dynamic> data) => Session(
        sessionMessage: data['SessionMessage'] as String?,
        sessionResult: data['SessionResult'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'SessionMessage': sessionMessage,
        'SessionResult': sessionResult,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Session].
  factory Session.fromJson(String data) {
    return Session.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Session] to a JSON string.
  String toJson() => json.encode(toMap());

  Session copyWith({
    String? sessionMessage,
    int? sessionResult,
  }) {
    return Session(
      sessionMessage: sessionMessage ?? this.sessionMessage,
      sessionResult: sessionResult ?? this.sessionResult,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [sessionMessage, sessionResult];
}
