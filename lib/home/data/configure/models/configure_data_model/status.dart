import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'menu.dart';

class StatusResponse extends Equatable {
  final String? salutations;
  final String? message;
  final String? zipcode;
  final String? addressType;
  final String? lastName;
  final String? email;
  final String? firstName;
  final int? result;
  final String? locality;
  final String? defaultFlag;
  final String? country;
  final String? city;
  final String? contactNo1;
  final String? contactNo2;
  final List<Menu>? menu;
  final String? address1;
  final String? provience;
  final String? contactNo3;
  final String? buildingType;
  final String? address2;

  const StatusResponse({
    this.salutations,
    this.message,
    this.zipcode,
    this.addressType,
    this.lastName,
    this.email,
    this.firstName,
    this.result,
    this.locality,
    this.defaultFlag,
    this.country,
    this.city,
    this.contactNo1,
    this.contactNo2,
    this.menu,
    this.address1,
    this.provience,
    this.contactNo3,
    this.buildingType,
    this.address2,
  });

  factory StatusResponse.fromMap(Map<String, dynamic> data) => StatusResponse(
        salutations: data['SALUTATIONS'] as String?,
        message: data['Message'] as String?,
        zipcode: data['ZIPCODE'] as String?,
        addressType: data['ADDRESS_TYPE'] as String?,
        lastName: data['LAST_NAME'] as String?,
        email: data['EMAIL'] as String?,
        firstName: data['FIRST_NAME'] as String?,
        result: data['Result'] as int?,
        locality: data['LOCALITY'] as String?,
        defaultFlag: data['DEFAULT_FLAG'] as String?,
        country: data['COUNTRY'] as String?,
        city: data['CITY'] as String?,
        contactNo1: data['CONTACT_NO_1'] as String?,
        contactNo2: data['CONTACT_NO_2'] as String?,
        menu: (data['Menu'] as List<dynamic>?)
            ?.map((e) => Menu.fromMap(e as Map<String, dynamic>))
            .toList(),
        address1: data['ADDRESS_1'] as String?,
        provience: data['PROVIENCE'] as String?,
        contactNo3: data['CONTACT_NO_3'] as String?,
        buildingType: data['BUILDING_TYPE'] as String?,
        address2: data['ADDRESS_2'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'SALUTATIONS': salutations,
        'Message': message,
        'ZIPCODE': zipcode,
        'ADDRESS_TYPE': addressType,
        'LAST_NAME': lastName,
        'EMAIL': email,
        'FIRST_NAME': firstName,
        'Result': result,
        'LOCALITY': locality,
        'DEFAULT_FLAG': defaultFlag,
        'COUNTRY': country,
        'CITY': city,
        'CONTACT_NO_1': contactNo1,
        'CONTACT_NO_2': contactNo2,
        'Menu': menu?.map((e) => e.toMap()).toList(),
        'ADDRESS_1': address1,
        'PROVIENCE': provience,
        'CONTACT_NO_3': contactNo3,
        'BUILDING_TYPE': buildingType,
        'ADDRESS_2': address2,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Status].
  factory StatusResponse.fromJson(String data) {
    return StatusResponse.fromMap(json.decode(data) as Map<String, dynamic>);
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
      salutations,
      message,
      zipcode,
      addressType,
      lastName,
      email,
      firstName,
      result,
      locality,
      defaultFlag,
      country,
      city,
      contactNo1,
      contactNo2,
      menu,
      address1,
      provience,
      contactNo3,
      buildingType,
      address2,
    ];
  }
}
