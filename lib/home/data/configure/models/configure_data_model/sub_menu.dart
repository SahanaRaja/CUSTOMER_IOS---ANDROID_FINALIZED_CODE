import 'dart:convert';

import 'package:equatable/equatable.dart';

class SubMenu extends Equatable {
  final int? base64Imageid;
  final int? innerid;
  final String? value;
  final String? shopId;
  final String? name;
  final int? status;

  const SubMenu({
    this.base64Imageid,
    this.innerid,
    this.value,
    this.shopId,
    this.name,
    this.status,
  });

  factory SubMenu.fromMap(Map<String, dynamic> data) => SubMenu(
        base64Imageid: data['Base64_imageid'] as int?,
        innerid: data['Innerid'] as int?,
        value: data['Value'] as String?,
        shopId: data['Shop_Id'] as String?,
        name: data['Name'] as String?,
        status: data['status'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'Base64_imageid': base64Imageid,
        'Innerid': innerid,
        'Value': value,
        'Shop_Id': shopId,
        'Name': name,
        'status': status,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SubMenu].
  factory SubMenu.fromJson(String data) {
    return SubMenu.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SubMenu] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      base64Imageid,
      innerid,
      value,
      shopId,
      name,
      status,
    ];
  }
}
