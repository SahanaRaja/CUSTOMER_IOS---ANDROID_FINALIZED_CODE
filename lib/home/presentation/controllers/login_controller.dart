import 'package:customer_assist/home/data/forgotpassword/super_user/models/reset_send_otp_model.dart';
import 'package:customer_assist/home/data/login/models/mobile_response/mobile_response.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/controllers/view_controller.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../core/app_constants.dart';
import '../../../core/error/failures.dart';
import '../../../core/helpers/SharedPreference/prefs.dart';
import '../../../features/data_download/download_user_data/presentation/controllers/user_detail_download_controller.dart';
import '../../data/login/repositories/login_repository_impl.dart';
import '../../domain/login/entities/login_reponse.dart';
import 'header_controller.dart';
import 'keyboard_controller.dart';
import 'loading_controller.dart';
import 'options_controller.dart';
import 'owner_data_controller.dart';

class LoginController extends GetxController {
  ViewController viewController = Get.find();
  OptionsController optionController = Get.find();
  KeyboardController keyboardController = Get.put(KeyboardController());
  LoadingController loadingController = Get.find();
  HeaderController headerController = Get.find();
  AddressController ownerController = Get.find();
  var languageController = Get.put(LanguageController());
  var userDetailDownloadController = Get.put(UserDetailDownloadController());
  var loginResponse = const LoginResponse().obs;
  var mobileResponse = const MobileResponse().obs;
  var mobileOTPResponse = const ResetPasswordOTPModel().obs;
  var error = ''.obs;
  var shopID = '';

  void login(String email, String password, String languageId) async {
    loadingController.setLoading(true);

    Either<Failure, LoginResponse> failureOrSuccessMessage =
        await LoginRepositoryImpl().checkUserLogin(email, password, languageId);
    loadingController.setLoading(false);

    _eitherErrorOrSuccessState(failureOrSuccessMessage, email);
  }

  void mobileLogin(String mobile, String languageId) async {
    loadingController.setLoading(true);

    Either<Failure, MobileResponse> failureOrSuccessMessage =
        await LoginRepositoryImpl().checkMobile(mobile, languageId);
    loadingController.setLoading(false);

    _eitherErrorOrSuccessStateMobile(failureOrSuccessMessage, mobile);
  }

  void mobileOTP(String mobile, String otp, String languageId) async {
    loadingController.setLoading(true);

    Either<Failure, ResetPasswordOTPModel> failureOrSuccessMessage =
        await LoginRepositoryImpl().mobileOtpVerify(mobile, otp, languageId);
    loadingController.setLoading(false);

    _eitherErrorOrSuccessStateMobileOtpVerify(
      failureOrSuccessMessage,
    );
  }

  _eitherErrorOrSuccessState(
      Either<Failure, LoginResponse> failureOrSuccessMessage,
      String email) async {
    failureOrSuccessMessage.fold(
      (l) {
        error.value =
            languageController.languageResponse.value.loginFailed ?? '';
        // viewController.setView(ERROR);
        // viewController.setErrorMessage(l.obs!);
      },
      (r) async {
        // print(r);
        loginResponse.value = r;
        // userDetailDownloadController.fetchUsers(
        //     r.tokenNo!, 'A', await Prefs.shopId);
        if (r.result == 1) {
          viewController.setView(WELCOME);
          viewController.setSuccessMessage(r.message!);
          optionController.optionIndexSetter(0);
          optionController.getclientLogout();
          optionController.hideShadow();
          headerController.setSubHeaderLabel(
              languageController.languageResponse.value.welcome ?? '');
          Prefs.setSuperUserLoggedIn(true);
          Prefs.setSuperUserEmailId(email);
          Prefs.setCustomerId(r.customerId!);
          keyboardController.user.value.text = '';
          keyboardController.pass.value.text = '';
        } else {
          viewController.setView(ERROR);
          viewController.setErrorMessage(r.message!);
        }
      },
    );
  }

  _eitherErrorOrSuccessStateMobile(
      Either<Failure, MobileResponse> failureOrSuccessMessage,
      String mobile) async {
    failureOrSuccessMessage.fold(
      (l) {
        error.value =
            languageController.languageResponse.value.loginFailed ?? '';
        // viewController.setView(ERROR);
        // viewController.setErrorMessage(l.obs!);
      },
      (r) async {
        // print(r);
        mobileResponse.value = r;
        // userDetailDownloadController.fetchUsers(
        //     r.tokenNo!, 'A', await Prefs.shopId);
        if (r.status!.result == 1) {
          Prefs.setMobile(mobile);
          viewController.setView(MOBILEOTP);
          headerController.setSubHeaderLabel(
              languageController.languageResponse.value.verifyMobileNumber ??
                  '');
        } else {
          if (r.status!.message! ==
              'Device Id Already  Exists. If you are previously registered Login. Else choose another device id') {
            // viewController.setView(SPLASH);
            viewController.setView(ERROR);
            viewController.setErrorMessage(r.status!.message!);
            Prefs.setMobile(mobile);
            print(mobile);
          } else {
            viewController.setView(ERROR);
            viewController.setErrorMessage(r.status!.message!);
          }
        }
      },
    );
  }

  _eitherErrorOrSuccessStateMobileOtpVerify(
    Either<Failure, ResetPasswordOTPModel> failureOrSuccessMessage,
  ) async {
    failureOrSuccessMessage.fold(
       (l) {
        error.value = 'failed';
        // viewController.setView(SUPERLOGINFAILURE);
      },
      (r) {
        if (r.result == 1) {
          viewController.setView(FIRSTTIME);
          // optionController.optionIndexSetter(3);
          // updateAddressResponse.value = r;
          // //viewController.setView(FIRSTUSERLOGINSUCESS);
          // optionController.showImages();
          // optionController.showShadow();
          // optionController.setOptionList(REGISTERNEW);
          // keyboardController.setKeypad('');
          // headerController.setSubHeaderLabel(
          //     //languageController.languageResponse.value.provideMailId ??
          //     'Set Up Mail Id');
          // menuController.deActiveMenu();

          Prefs.setcheckLogin(true);
        } else {
          viewController.setView(ERROR);
          viewController.setErrorMessage(r.message!);
        }
      },
     /* (l) {
        error.value =
            languageController.languageResponse.value.loginFailed ?? '';
        // viewController.setView(ERROR);
        // viewController.setErrorMessage(l.obs!);
      },
      (r) async {
        // print(r);
        mobileOTPResponse.value = r;
        // userDetailDownloadController.fetchUsers(
        //     r.tokenNo!, 'A', await Prefs.shopId);
        if (r.result == 1) {
          // headerController.setHeaderLabel(
          //     languageController.languageResponse.value.client ?? '');
          // getOptionClient(optionsController, index);
          // optionController.setOptionList(CLIENT);
          // viewController.setUserOption(CLIENT);
           optionController.setOptionList(REGISTERNEW);
           //added by saha
           headerController.setTimeChange();
         //viewController.setUserOption(REGISTERNEW);

          Prefs.superUserLoggedIn.then((value) {
            if (value) {
              viewController.setView(CAUTION);
              headerController.subHeaderLabel(LOGOUT);
              keyboardController.setEdit(false);
              optionController.getclientLogout();
              optionController.setState();
            } else {
              viewController.setView(OWNERDETAILS);
              optionController.optionIndexSetter(2);
              optionController.setSetState();
               //added by saha
              headerController.setTimeChange();
              headerController.setSubHeaderLabel(
                  //languageController.languageResponse.value.mobileOwnerDetails ?? 
                  'User Data');
              keyboardController.setEdit(false);
              
              
            }
          });

          
        } else {
          viewController.setView(ERROR);
          viewController.setErrorMessage(r.message!);
        }
      },*/
    );
  }
}
