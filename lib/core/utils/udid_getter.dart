// ignore_for_file: avoid_print

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:flutter_udid/flutter_udid.dart';

import '../error/failures.dart';
import '../helpers/SharedPreference/prefs.dart';

class UDIDGetter {
  static Future<Either<Failure, String>> getUDIDofDevice() async {
    String udid = "";
    try {
      udid = await FlutterUdid.udid;
      Prefs.setUdid(udid);
      return Right(udid);
    } on PlatformException {
      udid = 'Failed to get UDID.';
      // if(SHOW_DEBUGGING)
      print(udid);
      return Left(UDIDError(udid));
    }
  }
}

class UDIDError extends Failure {
  final String message;

  UDIDError(this.message);
}
