// ignore_for_file: unused_element

import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/controllers/view_controller.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../core/app_constants.dart';
import '../../../core/error/failures.dart';
import '../../../features/data_download/download_user_data/presentation/controllers/user_detail_download_controller.dart';
import '../../data/createuser/repositories/create_user_repository_impl.dart';
import '../../domain/forgotpassword/super_user/entities/reset_send_otp.dart';
import 'loading_controller.dart';
import 'options_controller.dart';

class DeviceCheckController extends GetxController {
  ViewController viewController = Get.find();
  OptionsController optionController = Get.find();
  LoadingController loadingController = Get.find();
  var userDetailDownloadController = Get.put(UserDetailDownloadController());
  var languageController = Get.put(LanguageController());
  var otpsentResponse = const ResetPasswordOTP().obs;
  var loading = false.obs;
  var error = ''.obs;

  void sentOTPVerify(
      String userName, String otp, String userType, String languageId) async {
    loadingController.setLoading(true);

    Either<Failure, ResetPasswordOTP> failureOrSuccessMessage =
        await CreateUserRepositoryImpl()
            .sendOTPVerify(userName, otp, userType, languageId);
    loadingController.setLoading(false);

    _eitherErrorOrSuccessState(failureOrSuccessMessage, userName, 'verify');
  }

  void mobilecheck(String userName, String emailId, String password,
      String userType, int type, String languageId) async {
    loadingController.setLoading(true);

    Either<Failure, ResetPasswordOTP> failureOrSuccessMessage =
        await CreateUserRepositoryImpl()
            .addUser(userName, emailId, password, userType, type, languageId);
    loadingController.setLoading(false);

    _eitherErrorOrSuccessaddUserState(
        failureOrSuccessMessage, userType, userName);
  }

  _eitherErrorOrSuccessState(
      Either<Failure, ResetPasswordOTP> failureOrSuccessMessage,
      String userName,
      String operation,
      {String? userType}) async {
    failureOrSuccessMessage.fold(
      (l) {
        error.value =
            languageController.languageResponse.value.otpNotSentFailed ?? '';
      },
      (r) {
        if (r.result == 1) {
          otpsentResponse.value = r;
          if (operation == 'sent') {
          } else {
            viewController.setView(NEWUSEROTPVERIFIED);
          }
        } else {
          otpsentResponse.value = r;
          viewController.setView(ERROR);
          viewController.setErrorMessage(r.message!);
        }
      },
    );
  }

  _eitherErrorOrSuccessaddUserState(
      Either<Failure, ResetPasswordOTP> failureOrSuccessMessage,
      String userType,
      String userName) async {
    failureOrSuccessMessage.fold(
      (l) {
        error.value =
            languageController.languageResponse.value.otpNotSentFailed ?? '';
        // viewController.setView(SUPERLOGINFAILURE);
      },
      (r) {
        if (r.result == 1) {
          otpsentResponse.value = r;
          viewController.setView(FIRSTUSERLOGINSUCESS);
        } else {
          otpsentResponse.value = r;
        }
      },
    );
  }
}
