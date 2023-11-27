// ignore_for_file: overridden_fields

import '../../domain/entity/pos_user_detail_response.dart';

class PosUserDetailsResponseModel extends PosUserDetailsResponse {
  @override
  final PosUserDetailsModel? status;

  const PosUserDetailsResponseModel({this.status})
      : super(
            status: const PosUserDetails(
                message: "", posUsersDetails: <PosUsersModel>[], result: 0));

  factory PosUserDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    return PosUserDetailsResponseModel(
      status: PosUserDetailsModel.fromJson(json['status']),
    );
  }

  @override
  List<Object> get props => [status!];
}

class PosUserDetailsModel extends PosUserDetails {
  @override
  final String message;
  @override
  final List<PosUsersModel> posUsersDetails;
  @override
  final int result;

  PosUserDetailsModel(
      {required this.message,
      required this.posUsersDetails,
      required this.result})
      : super(message: "", posUsersDetails: <PosUsersModel>[], result: 0);

  factory PosUserDetailsModel.fromJson(Map<String, dynamic> json) {
    var tagObjsJson = json['POS_USER_DETAILS'];
    List<PosUsersModel>? tags = tagObjsJson
        ?.map<PosUsersModel>((tagJson) => PosUsersModel.fromJson(tagJson))
        .toList();
    return PosUserDetailsModel(
        message: json['Message'],
        posUsersDetails: tags!,
        result: json['Result']);
  }

  @override
  List<Object?> get props => [message, posUsersDetails, result];
}

class PosUsersModel extends PosUsers {
  @override
  final String udStateName;
  @override
  final String udDeviceId;
  @override
  final String udTitle;
  @override
  final String udImagePath;
  @override
  final String udUserPassword;
  @override
  final String udMobileNo;
  @override
  final String udEmailId;
  @override
  final String udUserAssignedType;
  @override
  final String udFirstName;
  @override
  final String udUserType;
  @override
  final int udFlagStatus;
  @override
  final String udLastName;
  @override
  final String udDob;
  @override
  final String udShopId;
  @override
  final String udCountryName;
  @override
  final String udCreatedDate;
  @override
  final String udVerticalId;
  @override
  final int udUserCode;
  @override
  final String udUserName;
  @override
  final String udaddr1;
  @override
  final String udaddr2;
  @override
  final String udzipCode;
  @override
  final int udAccessType;

  const PosUsersModel({
    required this.udStateName,
    required this.udTitle,
    required this.udImagePath,
    required this.udMobileNo,
    required this.udFirstName,
    required this.udFlagStatus,
    required this.udLastName,
    required this.udDob,
    required this.udShopId,
    required this.udCountryName,
    required this.udCreatedDate,
    required this.udDeviceId,
    required this.udUserPassword,
    required this.udEmailId,
    required this.udUserAssignedType,
    required this.udUserType,
    required this.udVerticalId,
    required this.udUserCode,
    required this.udUserName,
    required this.udAccessType,
    required this.udaddr1,
    required this.udaddr2,
    required this.udzipCode,
  }) : super(
          udStateName: '',
          udDeviceId: '',
          udTitle: '',
          udImagePath: '',
          udUserPassword: '',
          udMobileNo: '',
          udEmailId: '',
          udUserAssignedType: '',
          udUserType: '',
          udFirstName: '',
          udVerticalId: '',
          udFlagStatus: 0,
          udLastName: '',
          udDob: '',
          udShopId: '',
          udCountryName: '',
          udCreatedDate: '',
          udUserCode: 0,
          udUserName: '',
          udAccessType: 0,
          udaddr1: '',
          udaddr2: '',
          udzipCode: '',
        );

  factory PosUsersModel.fromJson(Map<String, dynamic> json) {
    return PosUsersModel(
      udStateName: json['UD_STATE_NAME'] ?? '',
      udDeviceId: json['UD_DEVICE_ID'] ?? '',
      udTitle: json['UD_TITLE'] ?? '',
      udImagePath: json['UD_IMAGE_PATH'] ?? '',
      udUserPassword: json['UD_USER_PASSWORD'] ?? '',
      udMobileNo: json['UD_MOBILE_NO'] ?? '',
      udEmailId: json['UD_EMAIL_ID'] ?? '',
      udUserAssignedType: json['UD_USER_ASSIGNED_TYPE'] ?? '',
      udUserType: json['UD_USER_TYPE'] ?? '',
      udFirstName: json['UD_FIRST_NAME'] ?? '',
      udVerticalId: json['UD_VERTICAL_ID'] ?? '',
      udFlagStatus: json['UD_FLAG_STATUS'] ?? 0,
      udLastName: json['UD_LAST_NAME'] ?? '',
      udDob: json['UD_DOB'] ?? '',
      udShopId: json['UD_SHOP_ID'] ?? '',
      udCountryName: json['UD_COUNTRY_NAME'] ?? '',
      udCreatedDate: json['UD_CREATED_DATE'] ?? '',
      udUserCode: json['UD_USER_CODE'] ?? 0,
      udUserName: json['UD_USER_NAME'] ?? 0,
      udAccessType: json['UD_ACCESS_TYPE_ID'] ?? 0,
      udaddr1: json['UD_ADDRESS1'] ?? 0,
      udaddr2: json['UD_ADDRESS2'] ?? 0,
      udzipCode: json['UD_ZIP_CODE'] ?? 0,
    );
  }

  @override
  List<Object?> get props => [
        udDeviceId,
        udUserPassword,
        udEmailId,
        udUserAssignedType,
        udUserType,
        udVerticalId,
        udUserCode,
        udUserName,
        udCountryName,
        udCreatedDate,
        udDob,
        udFlagStatus,
        udImagePath,
        udLastName,
        udFirstName,
        udStateName,
        udShopId,
        udTitle,
        udAccessType,
        udaddr1,
        udaddr2,
        udzipCode
      ];
}
