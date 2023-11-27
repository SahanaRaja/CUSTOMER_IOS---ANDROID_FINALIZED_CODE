import 'package:equatable/equatable.dart';

class ResetPasswordOTP extends Equatable {
  final String? message;
  final int? result;
  final String? shopid;

  const ResetPasswordOTP({this.message, this.result,this.shopid});

  @override
  List<Object?> get props => [message, result,shopid];
}
