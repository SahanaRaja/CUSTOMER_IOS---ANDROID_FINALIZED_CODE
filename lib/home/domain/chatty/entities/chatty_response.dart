// ignore_for_file: non_constant_identifier_names, camel_case_types, prefer_const_constructors_in_immutables

import 'package:equatable/equatable.dart';

class cHattyResponse extends Equatable {
  final String? SNO;
  final String? QUESTION_NAME2;
  final String? QUESTION_SUB_NO;
  final String? QUESTION_NAME1;
  final String? QUESTION_NO;
 

  cHattyResponse(this.SNO, this.QUESTION_NAME2, this.QUESTION_SUB_NO,
      this.QUESTION_NAME1, this.QUESTION_NO);

  @override
  List<Object> get props => [
        SNO!,
        QUESTION_NAME2!,
        QUESTION_SUB_NO!,
        QUESTION_NAME1!,
        QUESTION_NO!,
      ];
}
