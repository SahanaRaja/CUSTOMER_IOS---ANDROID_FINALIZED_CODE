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

class FirstTimeUserController extends GetxController {
  ViewController viewController = Get.find();
  OptionsController optionController = Get.find();
  LoadingController loadingController = Get.find();
  var languageController = Get.put(LanguageController());
  var userDetailDownloadController = Get.put(UserDetailDownloadController());
  var otpsentResponse = const ResetPasswordOTP().obs;
  var loading = false.obs;
  var error = ''.obs;

  void sentOTPUser(String userName, String userType, String languageId) async {
    loadingController.setLoading(true);

    Either<Failure, ResetPasswordOTP> failureOrSuccessMessage =
        await CreateUserRepositoryImpl()
            .sendOTP(userName, userType, languageId);
    loadingController.setLoading(false);

    _eitherErrorOrSuccessState(failureOrSuccessMessage, userName, 'sent');
  }

  void sentOTPUserVerify(
      String userName, String otp, String userType, String languageId) async {
    loadingController.setLoading(true);

    Either<Failure, ResetPasswordOTP> failureOrSuccessMessage =
        await CreateUserRepositoryImpl()
            .sendOTPVerify(userName, otp, userType, languageId);
    loadingController.setLoading(false);

    _eitherErrorOrSuccessState(failureOrSuccessMessage, userName, 'verify');
  }

  void addUser(String userName, String emailId, String password,
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
            optionController.optionIndexSetter(4);
             optionController.setSetState();

          }
        } else {
          otpsentResponse.value = r;
          viewController.setView(ERROR);
          viewController.setErrorMessage('Mail ID already Exists.If you are previously registered Login. Else choose another Mail ID Continue..');
          //r.message!
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
        print(l);
        error.value =
            languageController.languageResponse.value.otpNotSentFailed ?? '';
        // viewController.setView(SUPERLOGINFAILURE);
      },
      (r) {
        print(r);
        if (r.result == 1) {
          otpsentResponse.value = r;
          viewController.setView(FIRSTUSERLOGINSUCESS);
          viewController.setView(SUCCESS);
          viewController.setSuccessMessage(r.message!);
        } else {
          otpsentResponse.value = r;
          viewController.setView(ERROR);
          viewController.setErrorMessage(r.message!);
        }
      },
    );
  }
}
