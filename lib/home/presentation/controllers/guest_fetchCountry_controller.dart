import 'package:customer_assist/home/data/guestfetchCountry/model2/zipcode.dart';
import 'package:customer_assist/home/data/guestfetchCountry/repository/Guest_fetchcountry_repository_impl.dart';
import 'package:customer_assist/home/domain/guestfetchCountry/entities/Guest_fetchcountry_response.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/controllers/view_controller.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../core/app_constants.dart';
import '../../../core/error/failures.dart';

import '../../data/guestfetchCountry/models/Guest_fetchcountry_response_model.dart';
import '../../data/guestfetchCountry/models/timingResponse.dart';
import 'loading_controller.dart';

class GuestFetchCountryController extends GetxController {
  ViewController viewController = Get.put(ViewController());
  LoadingController loadingController = Get.put(LoadingController());
  var languageController = Get.put(LanguageController());
  var guestfetchcountryResponse = <GuestFetchCountryResponse>[].obs;
  //var timeZone =<TimeZone>[].obs;
  
  var fetchcityResponse = <GuestFetchCountryResponse>[].obs;
  var zipcodeResponse = const ZipCodeResponse().obs;
  var error = ''.obs;

  void guestFetchCountryLogin() async {
    loadingController.setLoading(true);

    Either<Failure,List<GuestFetchCountryResponseModel>>failureOrSuccessMessage =
        await GuestFetchCountryRepositoryImpl().guestfetchCountry();
    loadingController.setLoading(false);

    _eitherErrorOrSuccessState(failureOrSuccessMessage);
  }

  _eitherErrorOrSuccessState(
    Either<Failure,List< GuestFetchCountryResponseModel>> failureOrSuccessMessage,
  ) async {
    failureOrSuccessMessage.fold(
      (l) {
        error.value =
            // 'Failed to fetch country'
            languageController.languageResponse.value.failedToFetchCountry ??
                '';
        viewController.setView(ERROR);
      },
      (r) {
        guestfetchcountryResponse.value = r;
        print('country${guestfetchcountryResponse.value}');
      },
    );
  }


  void fetchzipcode(String postalController) async {
    loadingController.setLoading(true);

    Either<Failure,ZipCodeResponse> failureOrSuccessMessage =
        await GuestFetchCountryRepositoryImpl().checkZipcode(postalController);
    loadingController.setLoading(false);

    _eitherErrorOrSuccessStatezipcode(failureOrSuccessMessage);
  }

  _eitherErrorOrSuccessStatezipcode(
    Either<Failure,ZipCodeResponse> failureOrSuccessMessage,
  ) async {
    failureOrSuccessMessage.fold(
      (l) {
        error.value =
            // 'Failed to fetch country'
            languageController.languageResponse.value.failedToFetchCountry ??
                '';
        viewController.setView(ERROR);
      },
      (r) {
        zipcodeResponse.value = r;
        print('zipcode${zipcodeResponse.value}');
      },
    );
  }
}
