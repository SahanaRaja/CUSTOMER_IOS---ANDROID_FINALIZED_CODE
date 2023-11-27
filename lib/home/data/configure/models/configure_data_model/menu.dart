import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'sub_menu.dart';

class Menu extends Equatable {
  final int? menuDisplayId;
  final int? base64ActionImageid;
  final int? menuId;
  final List<SubMenu>? subMenu;
  final String? isArrow;
  final int? menuEnable;
  final String? menuAction;

  const Menu({
    this.menuDisplayId,
    this.base64ActionImageid,
    this.menuId,
    this.subMenu,
    this.isArrow,
    this.menuEnable,
    this.menuAction,
  });

  factory Menu.fromMap(Map<String, dynamic> data) => Menu(
        menuDisplayId: data['Menu_Display_id'] as int?,
        base64ActionImageid: data['Base64_Action_imageid'] as int?,
        menuId: data['Menu_Id'] as int?,
        subMenu: (data['Sub_Menu'] as List<dynamic>?)
            ?.map((e) => SubMenu.fromMap(e as Map<String, dynamic>))
            .toList(),
        isArrow: data['Is_Arrow'] as String?,
        menuEnable: data['Menu_Enable'] as int?,
        menuAction: data['Menu_Action'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'Menu_Display_id': menuDisplayId,
        'Base64_Action_imageid': base64ActionImageid,
        'Menu_Id': menuId,
        'Sub_Menu': subMenu?.map((e) => e.toMap()).toList(),
        'Is_Arrow': isArrow,
        'Menu_Enable': menuEnable,
        'Menu_Action': menuAction,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Menu].
  factory Menu.fromJson(String data) {
    return Menu.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Menu] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      menuDisplayId,
      base64ActionImageid,
      menuId,
      subMenu,
      isArrow,
      menuEnable,
      menuAction,
    ];
  }
}
