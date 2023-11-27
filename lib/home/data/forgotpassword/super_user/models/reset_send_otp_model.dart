import '../../../../domain/forgotpassword/super_user/entities/reset_send_otp.dart';

class ResetPasswordOTPModel extends ResetPasswordOTP {
  @override
  final String? message;
  @override
  final int? result;
  @override
  final String? shopid;

  const ResetPasswordOTPModel({this.message, this.result,this.shopid})
      : super(message: '', shopid: '',result: 0);

  factory ResetPasswordOTPModel.fromJson(Map<String, dynamic> json) {
    var tagObjsJson = json['status'];
    return ResetPasswordOTPModel(
      message: tagObjsJson['Message'] ?? '',
      result: tagObjsJson['Result'] ?? 0,
      shopid: tagObjsJson['ShopId']?? ''
    );
  }

  @override
  List<Object?> get props => [message, result,shopid];
}
