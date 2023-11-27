import 'dart:convert';

import 'package:equatable/equatable.dart';

class Permission extends Equatable {
  final String? val;
  final int? base64Imageid;
  final int? vtype;
  final int? selectedVertical;
  final int? id;
  final int? base64SelectedImageid;
  final String? status;
  final String? verticalPath;
  

  const Permission({
    this.val,
    this.base64Imageid,
    this.vtype,
    this.selectedVertical,
    this.id,
    this.base64SelectedImageid,
    this.status,
    this.verticalPath
  });

  factory Permission.fromMap(Map<String, dynamic> data) => Permission(
        val: data['val'] as String?,
        base64Imageid: data['Base64_imageid'] as int?,
        vtype: data['vtype'] as int?,
        selectedVertical: data['selected_vertical'] as int?,
        id: data['Id'] as int?,
        base64SelectedImageid: data['Base64_selected_imageid'] as int?,
        status: data['status'] as String?,
        verticalPath: data['verticalimagepath'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'val': val,
        'Base64_imageid': base64Imageid,
        'vtype': vtype,
        'selected_vertical': selectedVertical,
        'Id': id,
        'Base64_selected_imageid': base64SelectedImageid,
        'status': status,
        'verticalimagepath':verticalPath
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Permission].
  factory Permission.fromJson(String data) {
    return Permission.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Permission] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      val,
      base64Imageid,
      vtype,
      selectedVertical,
      id,
      base64SelectedImageid,
      status,
      verticalPath
    ];
  }
}
