import 'package:equatable/equatable.dart';

class PosMasterSelectionDetailsResponse extends Equatable {
  final ListPosMasterSelectionResponse? status;

  const PosMasterSelectionDetailsResponse({this.status});

  @override
  List<Object> get props => [status!];
}

class ListPosMasterSelectionResponse extends Equatable {
  final List<PayModelSelectionResponse>? payMode;
  final List<VerticalMasterSelectionResponse>? verticalMaster;
  final List? salutation;

  const ListPosMasterSelectionResponse(
      {this.payMode, this.verticalMaster, this.salutation});

  @override
  List<Object?> get props => [payMode!, verticalMaster!, salutation!];
}

class PayModelSelectionResponse extends Equatable {
  final String payDescription;
  final String payCode;

  const PayModelSelectionResponse({
    required this.payDescription,
    required this.payCode, required String payImagepath, required String payActiveStatus,
  });

  @override
  List<Object?> get props => [payDescription, payCode];
}

class VerticalMasterSelectionResponse extends Equatable {
  final String verticalID;
  final String verticalName;

  const VerticalMasterSelectionResponse({
    required this.verticalID,
    required this.verticalName,
  });

  @override
  List<Object?> get props => [verticalID, verticalName];
}

class LanguageSelectionResponse extends Equatable {
  final String languageId;
  final String languageName;

  const LanguageSelectionResponse({
    required this.languageId,
    required this.languageName,
  });

  @override
  List<Object?> get props => [languageId, languageName];
}

class CountrySelectionResponse extends Equatable {
  final String currencycode;
  final String countrycode;
  final String countryName;
  final String countryFlag;
  final String postalCode;

  const CountrySelectionResponse({
    required this.currencycode,
    required this.countrycode,
    required this.countryName,
    required this.countryFlag,
    required this.postalCode,
  });

  @override
  List<Object?> get props =>
      [currencycode, countrycode, countryName, countryFlag, postalCode];
}
