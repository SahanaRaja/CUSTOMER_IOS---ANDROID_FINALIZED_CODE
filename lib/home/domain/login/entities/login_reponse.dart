import 'package:equatable/equatable.dart';

class LoginResponse extends Equatable {
  final String? tokenNo;
  final String? message;
  final String? customerId;
  final String? deviceId;
  final String? firstName;
  final String? pwdActivated;
  final String? creditUsed;
  final int? result;

  const LoginResponse(
      {this.tokenNo,
      this.message,
      this.customerId,
      this.deviceId,
      this.firstName,
      this.pwdActivated,
      this.creditUsed,
      this.result});

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
