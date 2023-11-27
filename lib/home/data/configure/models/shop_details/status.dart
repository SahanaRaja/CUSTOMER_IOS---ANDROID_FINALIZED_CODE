import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'mainmenu.dart';

class Status extends Equatable {
  final String? vertical;
  final String? message;
  final List<Mainmenu>? mainmenu;
  final int? result;

  const Status({this.vertical, this.message, this.mainmenu, this.result});

  factory Status.fromMap(Map<String, dynamic> data) => Status(
        vertical: data['Vertical'] as String?,
        message: data['Message'] as String?,
        mainmenu: (data['Mainmenu'] as List<dynamic>?)
            ?.map((e) => Mainmenu.fromMap(e as Map<String, dynamic>))
            .toList(),
        result: data['Result'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'Vertical': vertical,
        'Message': message,
        'Mainmenu': mainmenu?.map((e) => e.toMap()).toList(),
        'Result': result,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Status].
  factory Status.fromJson(String data) {
    return Status.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Status] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [vertical, message, mainmenu, result];
}
