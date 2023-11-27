// ignore_for_file: annotate_overrides, overridden_fields

import '../../../domain/login/entities/login_reponse.dart';

class LoginResponseModel extends LoginResponse {
  final String? tokenNo;
  final String? message;
  final String? customerId;
  final String? deviceId;
  final String? firstName;
  final String? pwdActivated;
  final String? creditUsed;
  final int? result;

  const LoginResponseModel(
      {this.tokenNo,
      this.message,
      this.customerId,
      this.deviceId,
      this.firstName,
      this.pwdActivated,
      this.creditUsed,
      this.result});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    var status = json["status"];
    return LoginResponseModel(
      tokenNo: status["TokenNo"] ?? "",
      customerId: status["Customer_Id"] ?? 0,
      message: status["Message"] ?? "",
      deviceId: status["Device_id"] ?? "",
      firstName: status["FIRST_NAME"] ?? "",
      pwdActivated: status["PwdActivated"] ?? "",
      creditUsed: status["CreditUsed"] ?? "",
      result: status["Result"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "TokenNo": tokenNo ?? '',
        "Customer_Id": customerId ?? '',
        "Message": message ?? '',
        "Device_id": deviceId ?? '',
        "FIRST_NAME": firstName ?? '',
        "PwdActivated": pwdActivated ?? '',
        "CreditUsed": creditUsed ?? '',
        "Result": result ?? ''
      };
  @override
  List<Object> get props => [
        tokenNo!,
        customerId!,
        message!,
        deviceId!,
        firstName!,
        pwdActivated!,
        creditUsed!,
        result!
      ];
}
