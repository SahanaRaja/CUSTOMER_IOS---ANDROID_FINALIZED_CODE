// ignore_for_file: overridden_fields, annotate_overrides

import '../../../domain/profiledetails/entities/profile_details.dart';

class ProfileDetailsModel extends ProfileDetails {
  final String salutations;
  final String country;
  final String city;
  final String message;
  final String dob;
  final String state;
  final String profilePicture;
  final String lastName;
  final String email;
  final String firstName;
  final int result;
  final String addr1;
  final String addr2;
  final String zipCode;
  final String mobile;
  final String mob1;
  final String mob2;
  final String mob3;

  const ProfileDetailsModel({
    required this.salutations,
    required this.country,
    required this.city,
    required this.message,
    required this.dob,
    required this.state,
    required this.profilePicture,
    required this.lastName,
    required this.email,
    required this.firstName,
    required this.result,
    required this.mobile,
    required this.addr1,
    required this.addr2,
    required this.zipCode,
    required this.mob1,
    required this.mob2,
    required this.mob3,
  }) : super(
            salutations: "",
            country: "",
            city: "",
            message: "",
            dob: "",
            state: "",
            profilePicture: "",
            lastName: "",
            email: "",
            firstName: "",
            result: 0,
            addr1: '',
            addr2: '',
            zipCode: '',
            mobile: '');

  factory ProfileDetailsModel.fromJson(Map<String, dynamic> json) {
    var tagObjsJson = json['status'];
    return ProfileDetailsModel(
        salutations: tagObjsJson['SALUTATIONS'] ?? '',
        country: tagObjsJson['COUNTRY'] ?? '',
        city: tagObjsJson['CITY'] ?? '',
        message: tagObjsJson['Message'] ?? '',
        dob: tagObjsJson['DOB'] ?? '',
        state: tagObjsJson['STATE'] ?? '',
        profilePicture: tagObjsJson['IMAGE_url'] ?? '',
        lastName: tagObjsJson['LAST_NAME'] ?? '',
        email: tagObjsJson['EMAIL'] ?? '',
        firstName: tagObjsJson['FIRST_NAME'] ?? '',
        addr1: tagObjsJson['ADDRESS_1'] ?? '',
        result: tagObjsJson['Result'] ?? 0,
        addr2: tagObjsJson['ADDRESS_2'] ?? '',
        zipCode: tagObjsJson['ZIPCODE'] ?? '',
        mob1: tagObjsJson['MOBILE_NO_1'] ?? '',
        mob2: tagObjsJson['MOBILE_NO_1'] ?? '',
        mob3: tagObjsJson['MOBILE_NO_3'] ?? '',
        mobile: tagObjsJson['ALTERNATE_CONTACT_NO_3'] ?? '');
  }
  @override
  List<Object?> get props => [
        salutations,
        country,
        city,
        message,
        dob,
        state,
        profilePicture,
        lastName,
        email,
        firstName,
        result,
        addr1,
        addr2,
        zipCode,
        mob1,
        mob2,
        mob3
      ];
}
