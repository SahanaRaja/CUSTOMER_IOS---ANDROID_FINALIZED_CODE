import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'session.dart';
import 'status.dart';

class ImageResponseModel extends Equatable {
  final Session? session;
  final Status? status;

  const ImageResponseModel({this.session, this.status});

  factory ImageResponseModel.fromMap(Map<String, dynamic> data) {
    return ImageResponseModel(
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
  /// Parses the string and returns the resulting Json object as [ImageResponseModel].
  factory ImageResponseModel.fromJson(String data) {
    return ImageResponseModel.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ImageResponseModel] to a JSON string.
  String toJson() => json.encode(toMap());

  ImageResponseModel copyWith({
    Session? session,
    Status? status,
  }) {
    return ImageResponseModel(
      session: session ?? this.session,
      status: status ?? this.status,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [session, status];
}
