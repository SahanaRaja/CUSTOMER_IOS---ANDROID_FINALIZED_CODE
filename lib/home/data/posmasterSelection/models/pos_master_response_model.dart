// ignore_for_file: annotate_overrides, overridden_fields

import '../../../domain/posmasterSelection/entities/pos_master_reponse.dart';

class PosMasterSelectionDetailsResponseModel
    extends ListPosMasterSelectionResponse {
  final List<PayModelSelectionResponseModel>? payMode;

  final List<LanguageSelectionResponseModel>? languages;
  final List<VerticalMasterSelectionResponseModel>? verticalMaster;
  final List? salutation;
  final List<CountrySelectionResponseModel>? country;
  final String? copyrights;

  const PosMasterSelectionDetailsResponseModel({
    // this.countryflag,
    this.country,
    this.salutation,
    this.payMode,
    this.verticalMaster,
    this.languages,
    this.copyrights
  });

  factory PosMasterSelectionDetailsResponseModel.fromJson(
      Map<String, dynamic> json) {
    var status = json["status"];
    var tagObjsJson = status['PAYMODE'];
    var verticalMaster = status['VERTICAL_MASTER'];
    var country = status['COUNTRY'];
    var labguageObjJson = status['LANGUAGE'];
    var copyrights = status['COPYRIGHT_TEXT'];

    List<CountrySelectionResponseModel>? countrytags = country
        ?.map<CountrySelectionResponseModel>(
            (tagJson) => CountrySelectionResponseModel.fromJson(tagJson))
        .toList();
    List<PayModelSelectionResponseModel>? tags = tagObjsJson
        ?.map<PayModelSelectionResponseModel>(
            (tagJson) => PayModelSelectionResponseModel.fromJson(tagJson))
        .toList();
    List<VerticalMasterSelectionResponseModel>? tags1 = verticalMaster
        ?.map<VerticalMasterSelectionResponseModel>(
            (tagJson) => VerticalMasterSelectionResponseModel.fromJson(tagJson))
        .toList();

    List<LanguageSelectionResponseModel>? languagesTag = labguageObjJson
        ?.map<LanguageSelectionResponseModel>(
            (tagJson) => LanguageSelectionResponseModel.fromJson(tagJson))
        .toList();
    return PosMasterSelectionDetailsResponseModel(
        // countryflag: status["Country_flag"] ?? '',
        payMode: tags,
        verticalMaster: tags1,
        salutation: status['SALUTATIONS'],
        country: countrytags,
        languages: languagesTag);
  }

  Map<String, dynamic> toJson() => {
        // "Country_flag": countryflag ?? '',
        "PAYMODE": payMode ?? [],
        "VERTICAL_MASTER": verticalMaster ?? [],
        "SALUTATIONS": salutation ?? [],
        "COUNTRY": country ?? [], "LANGUAGE": languages ?? []
      };
  @override
  List<Object> get props => [payMode!, verticalMaster!, salutation!, country!];
}

class PayModelSelectionResponseModel extends PayModelSelectionResponse {
  final String payDescription;
  final String payCode;
  final String payImagepath;
  final String payActiveStatus;


  const PayModelSelectionResponseModel({
    required this.payDescription,
    required this.payCode,
    required this.payImagepath,
    required this.payActiveStatus
  }) : super(
          payDescription: '',
          payCode: '',
          payImagepath: '',
          payActiveStatus: '',
        );

  factory PayModelSelectionResponseModel.fromJson(Map<String, dynamic> json) {
    return PayModelSelectionResponseModel(
      payDescription: json['Pay_Description'] ?? '',
      payCode: json['Pay_Code'] ?? '',
      payImagepath: json['Pay_Imagepath'] ?? '',
      payActiveStatus: json['Pay_Active_Status'] ?? ''
    );
  }

  @override
  List<Object?> get props => [
        payDescription,
        payCode,
        payImagepath,
        payActiveStatus
      ];
}

class LanguageSelectionResponseModel extends LanguageSelectionResponse {
  final String languageId;
  final String languageName;

  const LanguageSelectionResponseModel({
    required this.languageId,
    required this.languageName,
  }) : super(
          languageId: '',
          languageName: '',
        );

  factory LanguageSelectionResponseModel.fromJson(Map<String, dynamic> json) {
    return LanguageSelectionResponseModel(
      languageId: json['Language_Id'] ?? '',
      languageName: json['Language_Name'] ?? '',
    );
  }

  @override
  List<Object?> get props => [
        languageId,
        languageName,
      ];
}

class VerticalMasterSelectionResponseModel
    extends VerticalMasterSelectionResponse {
  final String verticalID;
  final String verticalName;

  const VerticalMasterSelectionResponseModel({
    required this.verticalID,
    required this.verticalName,
  }) : super(
          verticalID: '',
          verticalName: '',
        );

  factory VerticalMasterSelectionResponseModel.fromJson(
      Map<String, dynamic> json) {
    return VerticalMasterSelectionResponseModel(
      verticalID: json['Vertical_Id'] ?? '',
      verticalName: json['Vertical_Name'] ?? '',
    );
  }

  @override
  List<Object?> get props => [
        verticalID,
        verticalName,
      ];
}

class CountrySelectionResponseModel extends CountrySelectionResponse {
  final String currencycode;
  final String countrycode;
  final String countryName;
  final String countryFlag;
  final String postalCode;
  const CountrySelectionResponseModel({
    required this.currencycode,
    required this.countrycode,
    required this.countryName,
    required this.countryFlag,
    required this.postalCode,
  }) : super(
          currencycode: '',
          countrycode: '',
          countryName: '',
          countryFlag: '',
          postalCode: '',
        );

  factory CountrySelectionResponseModel.fromJson(Map<String, dynamic> json) {
    return CountrySelectionResponseModel(
      currencycode: json['Currency_code'] ?? '',
      countrycode: json['Country_Code'] ?? '',
      countryName: json['Country_Name'] ?? '',
      countryFlag: json['Country_flag'] ?? '',
      postalCode: json['Postal_Code_Format'] ?? '',
    );
  }

  @override
  List<Object?> get props =>
      [currencycode, countrycode, countryName, countryFlag, postalCode];
}
