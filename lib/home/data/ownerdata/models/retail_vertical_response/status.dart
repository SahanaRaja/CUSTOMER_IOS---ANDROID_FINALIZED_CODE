import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'permission.dart';

class Status extends Equatable {
  final List<Permission>? permission;
  final int? base64UpImageid;
  final String? message;
  final int? base64DownImageid;
  final int? base64UpImageidInactive;
  final String? error;
  final String? verticalHead;
  final String? registeredUser;
  final int? base64DownImageidInactive;
  final String? verticalHeadDesc;
  final int? result;

  const Status({
    this.permission,
    this.base64UpImageid,
    this.message,
    this.base64DownImageid,
    this.base64UpImageidInactive,
    this.error,
    this.verticalHead,
    this.registeredUser,
    this.base64DownImageidInactive,
    this.verticalHeadDesc,
    this.result,
  });

  factory Status.fromMap(Map<String, dynamic> data) => Status(
        permission: (data['PERMISSION'] as List<dynamic>?)
            ?.map((e) => Permission.fromMap(e as Map<String, dynamic>))
            .toList(),
        base64UpImageid: data['Base64_Up_imageid'] as int?,
        message: data['Message'] as String?,
        base64DownImageid: data['Base64_Down_imageid'] as int?,
        base64UpImageidInactive: data['Base64_Up_imageid_inactive'] as int?,
        error: data['Error'] as String?,
        verticalHead: data['Vertical_Head'] as String?,
        registeredUser: data['Registered_User'] as String?,
        base64DownImageidInactive: data['Base64_Down_imageid_inactive'] as int?,
        verticalHeadDesc: data['Vertical_Head_Desc'] as String?,
        result: data['Result'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'PERMISSION': permission?.map((e) => e.toMap()).toList(),
        'Base64_Up_imageid': base64UpImageid,
        'Message': message,
        'Base64_Down_imageid': base64DownImageid,
        'Base64_Up_imageid_inactive': base64UpImageidInactive,
        'Error': error,
        'Vertical_Head': verticalHead,
        'Registered_User': registeredUser,
        'Base64_Down_imageid_inactive': base64DownImageidInactive,
        'Vertical_Head_Desc': verticalHeadDesc,
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
  List<Object?> get props {
    return [
      permission,
      base64UpImageid,
      message,
      base64DownImageid,
      base64UpImageidInactive,
      error,
      verticalHead,
      registeredUser,
      base64DownImageidInactive,
      verticalHeadDesc,
      result,
    ];
  }
}
