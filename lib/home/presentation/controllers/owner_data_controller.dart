import 'package:customer_assist/core/helpers/SharedPreference/prefs.dart';
import 'package:customer_assist/home/data/forgotpassword/super_user/models/reset_send_otp_model.dart';
import 'package:customer_assist/home/data/ownerdata/models/owner_data_response/deviceaddress.dart';
import 'package:customer_assist/home/data/ownerdata/models/owner_data_response/owner_data_response.dart';
import 'package:customer_assist/home/data/ownerdata/models/retail_vertical_response/retail_vertical_response.dart';
import 'package:customer_assist/home/presentation/controllers/header_controller.dart';
import 'package:customer_assist/home/presentation/controllers/keyboard_controller.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/controllers/menu_controller.dart';
import 'package:customer_assist/home/presentation/controllers/view_controller.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../core/app_constants.dart';
import '../../../core/error/failures.dart';
import '../../../features/data_download/download_user_data/presentation/controllers/user_detail_download_controller.dart';
import '../../data/ownerdata/models/retail_vertical_response/permission.dart';
import '../../data/ownerdata/repositories/owner_data_repository_impl.dart';
import '../../domain/forgotpassword/super_user/entities/reset_send_otp.dart';
import 'loading_controller.dart';
import 'options_controller.dart';

class AddressController extends GetxController {
  var viewController = Get.put(ViewController());
  var optionController = Get.put(OptionsController());
  var loadingController = Get.put(LoadingController());
  var keyboardController = Get.put(KeyboardController());
  var headerController = Get.put(HeaderController());
  var menuController = Get.put(MenuOptionController());
  var languageController = Get.put(LanguageController());
  var userDetailDownloadController = Get.put(UserDetailDownloadController());
  var updateAddressResponse = const ResetPasswordOTP().obs;
  List<Permission> retailResponse = [];
  List<Deviceaddress> fetchAddressResponse = [];
  var loading = false.obs;
  var error = ''.obs;

  void fetchVertical(String languageId) async {
    //addedbysofi
    loadingController.setLoading(true);

    Either<Failure, RetailVerticalResponse> failureOrSuccessMessage =
        await OwnerDataRepositoryImpl().fetchVertical(languageId);
    loadingController.setLoading(false);

    _eitherErrorOrSuccessStateVertical(failureOrSuccessMessage);
  }

  void updateVertical(int verticalId, String languageId) async {
    loadingController.setLoading(true);

    Either<Failure, ResetPasswordOTP> failureOrSuccessMessage =
        await OwnerDataRepositoryImpl().updateVertical(verticalId, languageId);
     loadingController.setLoading(false);

    _eitherErrorOrSuccessStateVerticalUpdate(failureOrSuccessMessage);
  }

  void fetchAddress(String mobile, String postalCode, String languageId) async {
    // loadingController.setLoading(true);

    Either<Failure, OwnerDataResponse> failureOrSuccessMessage =
        await OwnerDataRepositoryImpl()
            .fetchAddress(mobile, postalCode, languageId);
    // loadingController.setLoading(false);

    _eitherErrorOrSuccessState(failureOrSuccessMessage);
  }

  void updateAddress(
      String mobile,
      String firstName,
      String lastName,
      String areaCode,
      String mobileNo,
      String addr1,
      String addr2,
      String type,
      String defaultflag,
      String locality,
      String postalCode,
      String state,
      String city,
      String country,
      String languageId) async {
    loadingController.setLoading(true);

    Either<Failure, ResetPasswordOTPModel> failureOrSuccessMessage =
        await OwnerDataRepositoryImpl().updateAddress(
            mobile,
            lastName,
            firstName,
            areaCode,
            mobileNo,
            addr1,
            addr2,
            type,
            defaultflag,
            locality,
            postalCode,
            state,
            city,
            country,
            languageId);
    loadingController.setLoading(false);

    _eitherErrorOrSuccessaddUserState(failureOrSuccessMessage);
  }

  _eitherErrorOrSuccessState(
    Either<Failure, OwnerDataResponse> failureOrSuccessMessage,
  ) async {
    failureOrSuccessMessage.fold(
      (l) {
        error.value = 'failed';
      },
      (r) {
        if (r.status!.result == 1) {
          fetchAddressResponse = r.status!.deviceaddress!;
        } else {
          // viewController.setView(ERROR);
          // viewController.setErrorMessage(r.status!.message!);
        }
      },
    );
  }

  _eitherErrorOrSuccessaddUserState(
    Either<Failure, ResetPasswordOTPModel> failureOrSuccessMessage,
  ) async {
    failureOrSuccessMessage.fold(
      (l) {
        error.value = 'failed';
        // viewController.setView(SUPERLOGINFAILURE);
      },
      (r) {
        if (r.result == 1) {
          // viewController.setView(FIRSTTIME);
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
             updateAddressResponse.value = r;
          viewController.setView(SUCCESS);
          viewController.setSuccessMessage('Device Address Successfully Updated');
          
          Prefs.setcheckLogin(true);
        } else {
          viewController.setView(ERROR);
          viewController.setErrorMessage(r.message!);
        }
      },
    );
  }

  void _eitherErrorOrSuccessStateVertical(
      Either<Failure, RetailVerticalResponse> failureOrSuccessMessage) {
    failureOrSuccessMessage.fold(
      (l) {
        error.value = 'failed';
        // viewController.setView(SUPERLOGINFAILURE);
      },
      (r) {
        if (r.status!.result == 1) {
          retailResponse = r.status!.permission!;
        } else {
          viewController.setView(ERROR);
          viewController.setErrorMessage(r.status!.message!);
        }
      },
    );
  }

  void _eitherErrorOrSuccessStateVerticalUpdate(
      Either<Failure, ResetPasswordOTP> failureOrSuccessMessage) {
    failureOrSuccessMessage.fold(
      (l) {
        error.value = 'failed';
        // viewController.setView(SUPERLOGINFAILURE);
      },
      (r) {
        if (r.result == 1) {
         Prefs.setShopId(r.shopid!.toString());
         //print(Prefs.verticalId);
         // viewController.setView('');
          //viewController.setSuccessMessage('Vertical Updated Successfully');
        } else {
          viewController.setView(ERROR);
          viewController.setErrorMessage(r.message!);
        }
      },
    );
  }
}
