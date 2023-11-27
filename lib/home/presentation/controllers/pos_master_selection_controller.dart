import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/controllers/view_controller.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import '../../../core/error/failures.dart';
import '../../data/posmasterSelection/models/pos_master_response_model.dart';
import '../../data/posmasterSelection/repositories/pos_master_repository_impl.dart';

import 'options_controller.dart';

class PosMasterSelectionController extends GetxController {
  ViewController viewController = Get.find();
  OptionsController optionController = Get.find();
  var payModeResponse = <PayModelSelectionResponseModel>[].obs;
  var verticalResponse = <VerticalMasterSelectionResponseModel>[].obs;
  var salutation = [].obs;
  var countryCode = <CountrySelectionResponseModel>[].obs;
  var loading = false.obs;
  var error = ''.obs;
  var LanguageResponse = <LanguageSelectionResponseModel>[].obs;
  var languageController = Get.put(LanguageController());

  void posMasterSelection() async {
    loading.value = true;
    Either<Failure, PosMasterSelectionDetailsResponseModel>
        failureOrSuccessMessage =
        await PosMasterSelectionRepositoryImpl().posSelctionInfo();
    loading.value = false;
    _eitherErrorOrSuccessState(failureOrSuccessMessage);
  }

  _eitherErrorOrSuccessState(
    Either<Failure, PosMasterSelectionDetailsResponseModel>
        failureOrSuccessMessage,
  ) async {
    failureOrSuccessMessage.fold(
      (l) {
        error.value =
            languageController.languageResponse.value.loginFailed ?? '';
      },
      (r) {
        print(r);
        print(r.payMode);
        print(r.verticalMaster);
        payModeResponse.value = r.payMode!;
        verticalResponse.value = r.verticalMaster!;
        LanguageResponse.value = r.languages!;
        salutation.value = r.salutation!;
        countryCode.value = r.country!;

        print(r.payMode);
      },
    );
  }
}
