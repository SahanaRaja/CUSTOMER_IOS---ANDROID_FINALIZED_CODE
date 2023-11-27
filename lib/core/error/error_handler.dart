// ignore_for_file: unused_import

import 'package:flutter/material.dart';

import '../app_constants.dart';
import 'failures.dart';

class ErrorHandler {
  static handleError(BuildContext context, Failure failure) {
    switch (failure.runtimeType) {
      case TokenExpiredFailure:
        // Navigator.pushReplacement(
        //     context,
        //     MaterialPageRoute(
        //         builder: (BuildContext ctx) => AadharOnboardScreen()));
        break;
      case ServerFailure:
        // showSnackbar(context, SERVER_FAILURE_MESSAGE);
        break;
      default:
        // showSnackbar(context, UNEXPECTED_ERROR);
        break;
    }
  }
}

void showSnackbar(BuildContext context, String message) {
  final snackBar = SnackBar(
    duration: const Duration(seconds: 2),
    content: Text(
      message,
      style: const TextStyle(color: Colors.white),
      textAlign: TextAlign.left,
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
