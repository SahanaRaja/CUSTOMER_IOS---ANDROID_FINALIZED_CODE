import 'dart:convert';

import 'package:equatable/equatable.dart';

class Defaultaddress extends Equatable {
  final String? salutations;
  final String? zipcode;
  final String? lastName;
  final String? email;
  final String? customerAddressId;
  final String? firstName;
  final String? country;
  final String? city;
  final String? defaultFlag;
  final String? contactNo1;
  final String? contactNo2;
  final String? address1;
  final String? provience;
  final String? contactNo3;
  final String? buildingType;
  final String? address2;

  const Defaultaddress({
    this.salutations,
    this.zipcode,
    this.lastName,
    this.email,
    this.customerAddressId,
    this.firstName,
    this.country,
    this.city,
    this.defaultFlag,
    this.contactNo1,
    this.contactNo2,
    this.address1,
    this.provience,
    this.contactNo3,
    this.buildingType,
    this.address2,
  });

  factory Defaultaddress.fromMap(Map<String, dynamic> data) {
    return Defaultaddress(
      salutations: data['SALUTATIONS'] as String?,
      zipcode: data['ZIPCODE'] as String?,
      lastName: data['LAST_NAME'] as String?,
      email: data['EMAIL'] as String?,
      customerAddressId: data['Customer_Address_Id'] as String?,
      firstName: data['FIRST_NAME'] as String?,
      country: data['COUNTRY'] as String?,
      city: data['CITY'] as String?,
      defaultFlag: data['DEFAULT_FLAG'] as String?,
      contactNo1: data['CONTACT_NO_1'] as String?,
      contactNo2: data['CONTACT_NO_2'] as String?,
      address1: data['ADDRESS_1'] as String?,
      provience: data['PROVIENCE'] as String?,
      contactNo3: data['CONTACT_NO_3'] as String?,
      buildingType: data['BUILDING_TYPE'] as String?,
      address2: data['ADDRESS_2'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'SALUTATIONS': salutations,
        'ZIPCODE': zipcode,
        'LAST_NAME': lastName,
        'EMAIL': email,
        'Customer_Address_Id': customerAddressId,
        'FIRST_NAME': firstName,
        'COUNTRY': country,
        'CITY': city,
        'DEFAULT_FLAG': defaultFlag,
        'CONTACT_NO_1': contactNo1,
        'CONTACT_NO_2': contactNo2,
        'ADDRESS_1': address1,
        'PROVIENCE': provience,
        'CONTACT_NO_3': contactNo3,
        'BUILDING_TYPE': buildingType,
        'ADDRESS_2': address2,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Defaultaddress].
  factory Defaultaddress.fromJson(String data) {
    return Defaultaddress.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Defaultaddress] to a JSON string.
  String toJson() => json.encode(toMap());

  Defaultaddress copyWith({
    String? salutations,
    String? zipcode,
    String? lastName,
    String? email,
    String? customerAddressId,
    String? firstName,
    String? country,
    String? city,
    String? defaultFlag,
    String? contactNo1,
    String? contactNo2,
    String? address1,
    String? provience,
    String? contactNo3,
    String? buildingType,
    String? address2,
  }) {
    return Defaultaddress(
      salutations: salutations ?? this.salutations,
      zipcode: zipcode ?? this.zipcode,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      customerAddressId: customerAddressId ?? this.customerAddressId,
      firstName: firstName ?? this.firstName,
      country: country ?? this.country,
      city: city ?? this.city,
      defaultFlag: defaultFlag ?? this.defaultFlag,
      contactNo1: contactNo1 ?? this.contactNo1,
      contactNo2: contactNo2 ?? this.contactNo2,
      address1: address1 ?? this.address1,
      provience: provience ?? this.provience,
      contactNo3: contactNo3 ?? this.contactNo3,
      buildingType: buildingType ?? this.buildingType,
      address2: address2 ?? this.address2,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      salutations,
      zipcode,
      lastName,
      email,
      customerAddressId,
      firstName,
      country,
      city,
      defaultFlag,
      contactNo1,
      contactNo2,
      address1,
      provience,
      contactNo3,
      buildingType,
      address2,
    ];
  }
}
