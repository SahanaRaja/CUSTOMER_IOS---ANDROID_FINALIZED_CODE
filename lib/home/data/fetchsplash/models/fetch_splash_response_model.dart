// ignore_for_file: annotate_overrides, overridden_fields, non_constant_identifier_names, prefer_typing_uninitialized_variables

// import 'package:registration_assist/features/home/domain/fetchcountry/entities/fetch_country_reponse.dart';

import '../../../domain/fetchsplash/entities/fetch_splash_reponse.dart';

class FetchSplashResponseModel extends FetchSplashDetails {
  // final String? countryflag;
  final String? message;
  final String? registered_User;
  final int? customer_Id;
  final String? country_Name;
  final String? firstTime_User;
  final List<FetchSplashModel>? splash;
  final int? result;

  const FetchSplashResponseModel(
      {
      // this.countryflag,
      this.message,
      this.registered_User,
      this.customer_Id,
      this.country_Name,
      this.firstTime_User,
      this.splash,
      this.result});

  factory FetchSplashResponseModel.fromJson(Map<String, dynamic> json) {
    var status = json["status"];
    var tagObjsJson = status['splash'];
    List<FetchSplashModel>? tags = tagObjsJson
        ?.map<FetchSplashModel>((tagJson) => FetchSplashModel.fromJson(tagJson))
        .toList();
    return FetchSplashResponseModel(
      // countryflag: status["Country_flag"] ?? '',
      registered_User: status["Registered_User"] ?? '',
      message: status["Message"] ?? "",
      customer_Id: status["Customer_Id"] ?? 0,
      country_Name: status["Country_Name"] ?? "",
      firstTime_User: status["FirstTime_User"] ?? "",
      result: status["Result"] ?? 0,
      splash: tags!,
    );
  }

  Map<String, dynamic> toJson() => {
        // "Country_flag": countryflag ?? '',
        "Registered_User": registered_User ?? '',
        "Message": message ?? '',
        "Customer_Id": customer_Id ?? 0,
        "Country_Name": country_Name ?? '',
        "FirstTime_User": firstTime_User ?? '',
        "Result": result ?? '',
        "splash": splash
      };
  @override
  List<Object> get props => [
        // countryflag!,
        registered_User!,
        message!,
        customer_Id!,
        country_Name!,
        firstTime_User!,
        result!,
        splash!
      ];
}

class FetchSplashModel extends FetchSplash {
  final String lapseTime;
  final String title;
  final int id;
  final String logo;
  final String logo_text;

  static var obs;

  const FetchSplashModel({
    required this.lapseTime,
    required this.title,
    required this.id,
    required this.logo,
    required this.logo_text,
  }) : super(
          lapseTime: '',
          title: '',
          id: 0,
          logo: '',
          logo_text: '',
        );

  factory FetchSplashModel.fromJson(Map<String, dynamic> json) {
    return FetchSplashModel(
      lapseTime: json['Lapse_Time'] ?? '',
      title: json['Title'] ?? '',
      id: json['Id'] ?? 0,
      logo: json['Logo'] ?? '',
      logo_text: json['Logo_Text'] ?? '',
    );
  }

  @override
  List<Object?> get props => [
        lapseTime,
        title,
        id,
        logo,
        logo_text,
      ];
}
