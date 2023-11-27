import 'dart:convert';

import 'package:equatable/equatable.dart';

class Mainmenu extends Equatable {
  final String? typeName;
  final String? displayName;
  final int? serialNo;
  final String? typeId;

  const Mainmenu({
    this.typeName,
    this.displayName,
    this.serialNo,
    this.typeId,
  });

  factory Mainmenu.fromMap(Map<String, dynamic> data) => Mainmenu(
        typeName: data['Type_Name'] as String?,
        displayName: data['Display_Name'] as String?,
        serialNo: data['Serial_No'] as int?,
        typeId: data['Type_id'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'Type_Name': typeName,
        'Display_Name': displayName,
        'Serial_No': serialNo,
        'Type_id': typeId,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Mainmenu].
  factory Mainmenu.fromJson(String data) {
    return Mainmenu.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Mainmenu] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [typeName, displayName, serialNo, typeId];
}
