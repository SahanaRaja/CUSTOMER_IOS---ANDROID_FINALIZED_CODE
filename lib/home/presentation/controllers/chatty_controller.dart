// ignore_for_file: invalid_use_of_protected_member, non_constant_identifier_names

import 'package:customer_assist/home/presentation/controllers/view_controller.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../core/app_constants.dart';
import '../../../core/error/failures.dart';

import '../../data/chatty/repositories/chatty_repository_impl.dart';
import '../../domain/chatty/entities/chatty_response.dart';
import 'language_controller.dart';
import 'loading_controller.dart';

class ChattyController extends GetxController {
  ViewController viewController = Get.put(ViewController());
  LoadingController loadingController = Get.put(LoadingController());
  var languageController = Get.put(LanguageController());
  var error = ''.obs;
  var CHattyResponse = <cHattyResponse>[].obs;

  void fetchChattyLogin() async {
    loadingController.setLoading(true);

    Either<Failure, List<cHattyResponse>> failureOrSuccessMessage =
        await cHattyRepositoryImpl().cHatty();
    loadingController.setLoading(false);

    _eitherErrorOrSuccessState(failureOrSuccessMessage);
  }

  _eitherErrorOrSuccessState(
    Either<Failure, List<cHattyResponse>> failureOrSuccessMessage,
  ) async {
    failureOrSuccessMessage.fold(
      (l) {
        error.value = 'Failed to fetch Chatty';
        viewController.setView(ERROR);
      },
      (r) {
        CHattyResponse.value = r;
        print('chatty${CHattyResponse.value}');
      },
    );
  }
}
