// ignore_for_file: annotate_overrides, overridden_fields, non_constant_identifier_names, camel_case_types

import '../../../domain/chatty/entities/chatty_response.dart';

class cHattyResponseModel extends cHattyResponse {
  final String? SNO;
  final String? QUESTION_NAME2;
  final String? QUESTION_SUB_NO;
  final String? QUESTION_NAME1;
  final String? QUESTION_NO;

  cHattyResponseModel({
    this.SNO,
    this.QUESTION_NAME2,
    this.QUESTION_SUB_NO,
    this.QUESTION_NAME1,
    this.QUESTION_NO,
  }) : super('', '', '', '', '');

  factory cHattyResponseModel.fromJson(Map<String, dynamic> json) {
    var status = json;
    return cHattyResponseModel(
      SNO: status["SNO"] ?? "",
      QUESTION_NAME2: status["QUESTION_NAME2"] ?? '',
      QUESTION_SUB_NO: status["QUESTION_SUB_NO"] ?? '',
      QUESTION_NAME1: status["QUESTION_NAME1"] ?? '',
      QUESTION_NO: status["QUESTION_NO"] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        "SNO": SNO ?? '',
        "QUESTION_NAME2": QUESTION_NAME2 ?? '',
        "QUESTION_SUB_NO": QUESTION_SUB_NO ?? '',
        "QUESTION_NAME1": QUESTION_NAME1 ?? '',
        "QUESTION_NO": QUESTION_NO ?? '',
      };
  @override
  List<Object> get props => [
        SNO!,
        QUESTION_NAME2!,
        QUESTION_SUB_NO!,
        QUESTION_NAME1!,
        QUESTION_NO!,
      ];
}
