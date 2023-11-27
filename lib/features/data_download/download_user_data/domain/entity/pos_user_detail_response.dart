import 'package:equatable/equatable.dart';

class PosUserDetailsResponse extends Equatable {
  final PosUserDetails? status;

  const PosUserDetailsResponse({this.status});

  @override
  List<Object> get props => [status!];
}

class PosUserDetails extends Equatable {
  final String message;
  final List<PosUsers> posUsersDetails;
  final int result;

  const PosUserDetails(
      {required this.message,
      required this.posUsersDetails,
      required this.result});

  @override
  List<Object?> get props => [message, posUsersDetails, result];
}

class PosUsers extends Equatable {
  final String udStateName;
  final String udDeviceId;
  final String udTitle;
  final String udImagePath;
  final String udUserPassword;
  final String udMobileNo;
  final String udEmailId;
  final String udUserAssignedType;
  final String udFirstName;
  final String udUserType;
  final int udFlagStatus;
  final String udLastName;
  final String udDob;
  final String udShopId;
  final String udCountryName;
  final String udCreatedDate;
  final String udVerticalId;
  final int udUserCode;
  final String udUserName;

  final int udAccessType;
  final String udaddr1;
  final String udaddr2;
  final String udzipCode;

  const PosUsers(
      {required this.udStateName,
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
      required this.udzipCode});

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
