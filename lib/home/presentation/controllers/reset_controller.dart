import 'package:customer_assist/home/presentation/controllers/header_controller.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/controllers/view_controller.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../core/app_constants.dart';
import '../../../core/error/failures.dart';
import '../../data/forgotpassword/super_user/repositories/forgotpassword_repository_impl.dart';
import '../../domain/forgotpassword/super_user/entities/reset_send_otp.dart';
import 'loading_controller.dart';
import 'options_controller.dart';

class ResetController extends GetxController {
  ViewController viewController = Get.find();
  OptionsController optionController = Get.find();
  LoadingController loadingController = Get.find();
  var languageController = Get.put(LanguageController());
  HeaderController headerController = Get.find();
  // var userDetailDownloadController = Get.put(UserDetailDownloadController());
  var response = const ResetPasswordOTP().obs;
  var error = ''.obs;
   //var otpsentResponse = const ResetPasswordOTP().obs;

  void sentOTP(String userName, String type, String languageId) async {
    Either<Failure, ResetPasswordOTP> failureOrSuccessMessage =
        await ForgotPasswordRepositoryImpl()
            .sendOTP(userName, type, languageId);

    _eitherErrorOrSuccessState(failureOrSuccessMessage, type, "Sent");
  }

  void sentOTPVerify(String userName, String otp, String newPassword,
      String type, String accessType, String languageId) async {
    Either<Failure, ResetPasswordOTP> failureOrSuccessMessage =
        await ForgotPasswordRepositoryImpl()
            .sendOTPVerify(userName, otp, newPassword ,type, languageId);

    _eitherErrorOrSuccessState(failureOrSuccessMessage, type, 'Verify');
  }
  void fpUpdate(String userName, String otp, String newPassword,
      String type, String accessType, String languageId) async {
    Either<Failure, ResetPasswordOTP> failureOrSuccessMessage =
        await ForgotPasswordRepositoryImpl()
            .sendOTPVerify(userName, otp, newPassword ,type, languageId);

    _eitherErrorOrSuccessState(failureOrSuccessMessage, type, 'Update');
  }

  void sendOTPPasswordUpdate(
     String userName,
      String otp,
      String verticalId,
      String type,
      String languageId,
      String password,
      String oldpassword,
      String userType,
      String accessType) async {
    // print(userType);
    loadingController.setLoading(true);

    Either<Failure, ResetPasswordOTP> failureOrSuccessMessage =
        await ForgotPasswordRepositoryImpl().sendOTPPasswordUpdate(
            userName, password, oldpassword, verticalId, type, languageId);
    loadingController.setLoading(false);

    _eitherErrorOrSuccessState(failureOrSuccessMessage, type, "Update");
  }
  

  _eitherErrorOrSuccessState(
      Either<Failure, ResetPasswordOTP> failureOrSuccessMessage,
      String userType,
      String operation) async {
    failureOrSuccessMessage.fold(
      (l) {
        error.value =
            languageController.languageResponse.value.otpNotSent ?? '';
        viewController.setView(OTPFAILURE);
      },
      
      (r) {
       print(response);
        response.value = r;
        if (userType == 'cp') {
          print("<<<<<<<<<<<<<<<<<<>$operation");
          if (operation == "Sent") {
            
            if (r.result == 0) {
              viewController.setErrorMessage(r.message!);
              viewController.setView(ERROR);
            }
          } else if (operation == "Verify") {
           
            if (r.result == 0) {
              viewController.setErrorMessage(r.message!);
              viewController.setView(ERROR);
            } else {
              viewController.setView(CLIENTOTPVERIFIED);
              optionController.optionIndexSetter(3);
            }
          } else if (operation == 'Update') {

            viewController.setSuccessMessage(r.message!);
            viewController.setView(SUCCESS);
            
          }
        } else if (userType == 'fp') {
          if (operation == "Sent") {
            if (r.result == 0) {
              viewController.setErrorMessage(r.message!);
              viewController.setView(ERROR);
            }
          }
           else if (operation == "Verify") {
            print("VERIFY");
            viewController.setView(CLIENTFPOTPVERIFIED);
            headerController.setSubHeaderLabel('Reset Password');
            

            print(viewController.viewKey.value);
          } 
          else if (operation == 'Update') {
            print('Update');
            if (r.result == 1) {
              viewController.setSuccessMessage(r.message!);
              viewController.setView(SUCCESS);
             
            } else {
              viewController.setErrorMessage(r.message!);
              viewController.setView(ERROR);
            }
          }
        }
      },
    );
  }
}
