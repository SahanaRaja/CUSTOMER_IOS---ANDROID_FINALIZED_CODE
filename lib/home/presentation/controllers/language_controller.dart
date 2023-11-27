import 'package:customer_assist/home/presentation/controllers/view_controller.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../core/error/failures.dart';
import '../../data/language/repository/language_repository_impl.dart';
import '../../domain/language/entities/language_response.dart';

class LanguageController extends GetxController {
  var viewController = Get.put(ViewController());
  var languageResponse = const LanguageResponse().obs;
  var loading = false.obs;
  var error = ''.obs;
  var languagenum = 1;

  languagefetch({languageNum}) async {
    if (languageNum != null) {
      languagenum = languageNum;
    }
    loading.value = true;
    Either<Failure, LanguageResponse> failureOrSuccessMessage =
        await LanguageDetailRepositoryImpl().fetchLanguageDetails(languagenum);
    loading.value = false;
    _eitherErrorOrSuccessFetchState(failureOrSuccessMessage, "installer");
  }

  void _eitherErrorOrSuccessFetchState(
      Either<Failure, LanguageResponse> failureOrSuccessMessage,
      String userType) {
    failureOrSuccessMessage.fold(
      (l) {
        error.value = languageResponse.value.error ?? '';
      },
      (r) {
        // if (r.result == 0) {
        //   viewController.setView(ERROR);
        //   viewController.setErrorMessage(r.message!);
        // }
        languageResponse.value = r;
        update();
      },
    );
  }
}
