import 'dart:convert';

import 'package:customer_assist/home/data/orders/models/share_model/session.dart';
import 'package:customer_assist/home/data/orders/models/share_model/share.dart';
import 'package:equatable/equatable.dart';

//import 'session.dart';
//import 'status.dart';

class ShareModel extends Equatable {
  final Session? session;
  final Statuss? status;

  const ShareModel({this.session, this.status});

  factory ShareModel.fromMap(Map<String, dynamic> data) {
    return ShareModel(
      session: data['session'] == null
          ? null
          : Session.fromMap(data['session'] as Map<String, dynamic>),
      status: data['status'] == null
          ? null
          : Statuss.fromMap(data['status'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'session': session?.toMap(),
        'status': status?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [StoreReviewModel].
  factory ShareModel.fromJson(String data) {
    return ShareModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [StoreReviewModel] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [session, status];
}
