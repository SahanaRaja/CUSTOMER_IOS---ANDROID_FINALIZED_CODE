import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/controllers/loading_controller.dart';
import 'package:customer_assist/home/presentation/controllers/view_controller.dart';
import 'package:customer_assist/home/presentation/pages/welcome%20screen.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../core/app_constants.dart';
import '../../../core/error/failures.dart';
import '../../data/fetchsplash/models/fetch_splash_response_model.dart';
import '../../data/fetchsplash/repositories/fetch_splash_repository_impl.dart';
import '../pages/home_page.dart';

class SplashController extends GetxController {
  ViewController viewController = Get.find();
  LoadingController loadingController = Get.put(LoadingController());
  var languageController = Get.put(LanguageController());
  // OptionsController optionController = Get.find();
  // var userDetailDownloadController = Get.put(UserDetailDownloadController());
  var splashResponse = <FetchSplashModel>[].obs;
  var splashResponseInit = <FetchSplashModel>[].obs;
  var error = ''.obs;

  void fetchSplashData(String country, String datetime, String deviceID,
      String languageId) async {
    loadingController.setLoading(true);
    Either<Failure, FetchSplashResponseModel> failureOrSuccessMessage =
        await FetchSplashRepositoryImpl()
            .fetchSplash(country, datetime, deviceID, languageId);
    loadingController.setLoading(false);

    _eitherErrorOrSuccessState(failureOrSuccessMessage);
  }

  void fetchSplashDataInit() async {
    loadingController.setLoading(true);

    Either<Failure, FetchSplashResponseModel> failureOrSuccessMessage =
        await FetchSplashRepositoryImpl()
            .fetchSplashInit(languageController.languagenum.toString());
    loadingController.setLoading(false);

    _eitherErrorOrSuccessStateInit(failureOrSuccessMessage);
  }

  _eitherErrorOrSuccessState(
      Either<Failure, FetchSplashResponseModel> failureOrSuccessMessage) async {
    failureOrSuccessMessage.fold(
      (l) {
        error.value =
            languageController.languageResponse.value.loginFailed ?? '';
        viewController.setView(SUPERLOGINFAILURE);
      },
      (r) async {
        print(r.splash);
        splashResponse.value = r.splash!;
      },
    );
  }

  _eitherErrorOrSuccessStateInit(
      Either<Failure, FetchSplashResponseModel> failureOrSuccessMessage) async {
    failureOrSuccessMessage.fold(
      (l) {
        error.value =
            languageController.languageResponse.value.loginFailed ?? '';
        viewController.setView(ERROR);
      },
      (r) {
        print("splash image${r.splash![0].logo}");
        splashResponseInit.value = r.splash!;
        Get.off(() => const WelcomScreen());
      },
    );
  }
}
