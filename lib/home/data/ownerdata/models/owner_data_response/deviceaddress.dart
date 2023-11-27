import 'dart:convert';

import 'package:equatable/equatable.dart';

class Deviceaddress extends Equatable {
  final String? mobileNumber;
  final String? addressType;
  final String? state;
  final String? lastName;
  final String? areaCode;
  final String? firstName;
  final String? locality;
  final String? city;
  final String? country;
  final String? postalCode;
  final String? deviceId;
  final String? address1;
  final String? address2;
  final String? countryCode;

  const Deviceaddress({
    this.mobileNumber,
    this.addressType,
    this.state,
    this.lastName,
    this.areaCode,
    this.firstName,
    this.locality,
    this.city,
    this.country,
    this.postalCode,
    this.deviceId,
    this.address1,
    this.address2,
    this.countryCode,
  });

  factory Deviceaddress.fromMap(Map<String, dynamic> data) => Deviceaddress(
        mobileNumber: data['MOBILE_NUMBER'] as String?,
        addressType: data['ADDRESS_TYPE'] as String?,
        state: data['STATE'] as String?,
        lastName: data['LAST_NAME'] as String?,
        areaCode: data['AREA_CODE'] as String?,
        firstName: data['FIRST_NAME'] as String?,
        locality: data['LOCALITY'] as String?,
        city: data['CITY'] as String?,
        country: data['COUNTRY'] as String?,
        postalCode: data['POSTAL_CODE'] as String?,
        deviceId: data['DEVICE_ID'] as String?,
        address1: data['ADDRESS_1'] as String?,
        address2: data['ADDRESS_2'] as String?,
        countryCode: data['COUNTRY_CODE'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'MOBILE_NUMBER': mobileNumber,
        'ADDRESS_TYPE': addressType,
        'STATE': state,
        'LAST_NAME': lastName,
        'AREA_CODE': areaCode,
        'FIRST_NAME': firstName,
        'LOCALITY': locality,
        'CITY': city,
        'COUNTRY': country,
        'POSTAL_CODE': postalCode,
        'DEVICE_ID': deviceId,
        'ADDRESS_1': address1,
        'ADDRESS_2': address2,
        'COUNTRY_CODE': countryCode,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Deviceaddress].
  factory Deviceaddress.fromJson(String data) {
    return Deviceaddress.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Deviceaddress] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      mobileNumber,
      addressType,
      state,
      lastName,
      areaCode,
      firstName,
      locality,
      city,
      country,
      postalCode,
      deviceId,
      address1,
      address2,
      countryCode,
    ];
  }
}
