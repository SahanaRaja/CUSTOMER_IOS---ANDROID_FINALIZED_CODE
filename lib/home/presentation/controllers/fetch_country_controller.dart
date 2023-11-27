import 'package:customer_assist/home/presentation/controllers/keyboard_controller.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/controllers/view_controller.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../core/app_constants.dart';
import '../../../core/error/failures.dart';
import '../../../core/helpers/SharedPreference/prefs.dart';
import '../../data/fetchcountry/repositories/fetch_country_repository_impl.dart';
import '../../domain/fetchcountry/entities/fetch_country_reponse.dart';
import 'loading_controller.dart';

class FetchCountryController extends GetxController {
  ViewController viewController = Get.put(ViewController());
  LoadingController loadingController = Get.put(LoadingController());
  var languageController = Get.put(LanguageController());
  var keyboardController = Get.put(KeyboardController());
  var fetchcountryResponse = const FetchCountryResponse().obs;
  var error = ''.obs;

  void fetchCountryLogin(String country, String languageId) async {
    loadingController.setLoading(true);

    Either<Failure, FetchCountryResponse> failureOrSuccessMessage =
        await FetchCountryRepositoryImpl().fetchCountry(country, languageId);
    loadingController.setLoading(false);

    _eitherErrorOrSuccessState(failureOrSuccessMessage);
  }

  _eitherErrorOrSuccessState(
    Either<Failure, FetchCountryResponse> failureOrSuccessMessage,
  ) async {
    failureOrSuccessMessage.fold(
      (l) {
        error.value =
            languageController.languageResponse.value.loginFailed ?? '';
        viewController.setView(ERROR);
      },
      (r) {
        print(r);
        //added by sofiya
        // if (optionsController.optionsKey.value == GUEST) {
        //   keyboardController.setPicker("guestCity");
        // }
        fetchcountryResponse.value = r;
        viewController.setflag(SPLASH);
        Prefs.setPhoneCode(r.phone_code!);
      },
    );
  }
}
