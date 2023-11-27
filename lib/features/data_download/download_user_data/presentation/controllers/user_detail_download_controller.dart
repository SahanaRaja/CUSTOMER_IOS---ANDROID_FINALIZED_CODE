import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../../../core/error/failures.dart';
import '../../data/repositories/download_users_data_repo_impl.dart';
import '../../domain/entity/pos_user_detail_response.dart';

class UserDetailDownloadController extends GetxController {
  var userData = const PosUserDetailsResponse().obs;
  var loading = false.obs;
  var error = ''.obs;

  fetchUsers(String token, String type, String shopId) async {
    loading.value = true;
    Either<Failure, PosUserDetailsResponse> failureOrSuccessMessage =
        await DownloadPosUserRepositoryImpl()
            .downloadPosUsersData(token, type, shopId);
    loading.value = false;
    _eitherErrorOrSuccessState(failureOrSuccessMessage);
  }

  _eitherErrorOrSuccessState(
      Either<Failure, PosUserDetailsResponse> failureOrSuccessMessage) async {
    failureOrSuccessMessage.fold(
      (l) {
        error.value = 'Assets download failed';
      },
      (r) {
        userData.value = r;
        print(r);
      },
    );
  }
}
