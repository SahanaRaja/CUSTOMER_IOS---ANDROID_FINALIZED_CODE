import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'session.dart';
import 'status.dart';

class ConfigureDataModel extends Equatable {
  final Session? session;
  final StatusResponse? status;

  const ConfigureDataModel({this.session, this.status});

  factory ConfigureDataModel.fromMap(Map<String, dynamic> data) {
    return ConfigureDataModel(
      session: data['session'] == null
          ? null
          : Session.fromMap(data['session'] as Map<String, dynamic>),
      status: data['status'] == null
          ? null
          : StatusResponse.fromMap(data['status'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'session': session?.toMap(),
        'status': status?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ConfigureDataModel].
  factory ConfigureDataModel.fromJson(String data) {
    return ConfigureDataModel.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ConfigureDataModel] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [session, status];
}
