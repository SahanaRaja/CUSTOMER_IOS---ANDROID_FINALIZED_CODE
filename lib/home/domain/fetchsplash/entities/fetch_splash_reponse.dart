// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';

class FetchSplashDetailsResponse extends Equatable {
  final FetchSplashDetails? status;

  const FetchSplashDetailsResponse({this.status});

  @override
  List<Object> get props => [status!];
}

class FetchSplashDetails extends Equatable {
  // final String? countryflag;
  final String? message;
  final String? registered_User;
  final int? customer_Id;
  final String? country_Name;
  final String? firstTime_User;
  final List<FetchSplash>? splash;
  final int? result;

  const FetchSplashDetails({
    // this.countryflag,
    this.message,
    this.registered_User,
    this.customer_Id,
    this.country_Name,
    this.firstTime_User,
    this.splash,
    this.result,
  });

  @override
  List<Object?> get props => [
        // countryflag!,
        registered_User!,
        message!,
        customer_Id!,
        country_Name!,
        firstTime_User!,
        result!,
        splash
      ];
}

class FetchSplash extends Equatable {
  final String lapseTime;

  final String title;
  final int id;
  final String logo;
  final String logo_text;

  const FetchSplash({
    required this.lapseTime,
    required this.title,
    required this.id,
    required this.logo,
    required this.logo_text,
  });

  @override
  List<Object?> get props => [
        lapseTime,
        title,
        id,
        logo,
        logo_text,
      ];
}
