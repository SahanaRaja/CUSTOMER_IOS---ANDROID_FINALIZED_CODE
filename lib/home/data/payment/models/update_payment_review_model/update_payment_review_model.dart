import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'session.dart';
import 'status.dart';

class UpdatePaymentReviewModel extends Equatable {
  final Session? session;
  final Status? status;

  const UpdatePaymentReviewModel({this.session, this.status});

  factory UpdatePaymentReviewModel.fromMap(Map<String, dynamic> data) {
    return UpdatePaymentReviewModel(
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
  /// Parses the string and returns the resulting Json object as [UpdatePaymentReviewModel].
  factory UpdatePaymentReviewModel.fromJson(String data) {
    return UpdatePaymentReviewModel.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [UpdatePaymentReviewModel] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [session, status];
}
