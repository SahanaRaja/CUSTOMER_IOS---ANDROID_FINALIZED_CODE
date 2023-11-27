import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/controllers/owner_data_controller.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/helpers/SharedPreference/prefs.dart';
import '../../../../../home/presentation/controllers/options_controller.dart';
import '../../../../../home/presentation/controllers/splash_controller.dart';
import '../../../../../home/presentation/controllers/view_controller.dart';

import '../../data/models/image_response_model/image_response_model.dart';
import '../../data/repositories/download_assets_repository_impl.dart';

class AssetsDownloadController extends GetxController {
  var assetsData = const ImageResponseModel().obs;
  var loading = false.obs;
  var error = ''.obs;
  var viewController = Get.put(ViewController());
  var splashController = Get.put(SplashController());
  var optionController = Get.put(OptionsController());
  var ownerController = Get.put(AddressController());
  var languageController = Get.put(LanguageController());
  var shopID = '';
  @override
  void onInit() {
    fetchAssets();
    super.onInit();
  }

  fetchAssets() async {
    Prefs.shopId.then((value) => shopID = value);
    loading.value = true;
    Either<Failure, ImageResponseModel> failureOrSuccessMessage =
        await DownloadAssetsRepositoryImpl().downloadAssets("A", '86');
    _eitherErrorOrSuccessState(failureOrSuccessMessage);
  }

  _eitherErrorOrSuccessState(
      Either<Failure, ImageResponseModel> failureOrSuccessMessage) async {
    failureOrSuccessMessage.fold(
      (l) {
        error.value = 'Assets download failed';
      },
      (r) async {
        assetsData.value = r;
        loading.value = false;
        Prefs.setDownloadedAssets(true);
        ownerController.fetchAddress(await Prefs.mobile, await Prefs.postalCode,
            languageController.languagenum.toString());
        optionController.initImage();
        splashController.fetchSplashDataInit();
      },
    );
  }
}
