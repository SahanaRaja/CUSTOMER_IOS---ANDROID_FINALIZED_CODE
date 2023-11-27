import 'package:customer_assist/home/data/fetchcity/repositories/fetch_city_repository_impl.dart';
import 'package:customer_assist/home/domain/fetchcity/entities/fetchAreaentity/fetch_area_response.dart';
import 'package:customer_assist/home/domain/fetchcity/entities/fetchCityentity/fetch_ctiy_reponse.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/controllers/view_controller.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../core/app_constants.dart';
import '../../../core/error/failures.dart';

import 'loading_controller.dart';

class FetchCityController extends GetxController {
  ViewController viewController = Get.put(ViewController());
  LoadingController loadingController = Get.put(LoadingController());
  var languageController = Get.put(LanguageController());
  var fetchcityResponse = <FetchCityResponse>[].obs;
  var fetchAreaResponse = <FetchAreaResponse>[].obs;

  var error = ''.obs;

  void fetchCityLogin() async {
    loadingController.setLoading(true);

    Either<Failure, List<FetchCityResponse>> failureOrSuccessMessage =
        await FetchCityRepositoryImpl().fetchCity();
    loadingController.setLoading(false);

    _eitherErrorOrSuccessState(failureOrSuccessMessage);
  }

  _eitherErrorOrSuccessState(
    Either<Failure, List<FetchCityResponse>> failureOrSuccessMessage,
  ) async {
    failureOrSuccessMessage.fold(
      (l) {
        error.value = 'Failed to fetch city';
        viewController.setView(ERROR);
      },
      (r) {
        fetchcityResponse.value = r;
        print('city${fetchcityResponse.value}');
      },
    );
  }

  void fetchAreaLogin() async {
    loadingController.setLoading(true);

    Either<Failure, List<FetchAreaResponse>> failureOrSuccessMessage =
        await FetchCityRepositoryImpl().fetchArea();
    loadingController.setLoading(false);

    _eitherErrorOrSuccessArea(failureOrSuccessMessage);
  }

  _eitherErrorOrSuccessArea(
    Either<Failure, List<FetchAreaResponse>> failureOrSuccessMessage,
  ) async {
    failureOrSuccessMessage.fold(
      (l) {
        error.value = 'Failed to fetch city';
        viewController.setView(ERROR);
      },
      (r) {
        fetchAreaResponse.value = r;
        print('area${fetchAreaResponse.value}');
      },
    );
  }
}
