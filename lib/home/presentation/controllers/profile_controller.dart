import 'dart:io';

import 'package:customer_assist/home/data/configure/datasources/configure_data_remote_data_source.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/controllers/view_controller.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../core/app_constants.dart';
import '../../../core/error/failures.dart';
import '../../data/profiledetails/repositories/profile_details_repository_impl.dart';
import '../../domain/profiledetails/entities/profile_details.dart';
import 'loading_controller.dart';

class ProfileController extends GetxController {
  ViewController viewController = Get.find();
  LoadingController loadingController = Get.find();
  var languageController = Get.put(LanguageController());

  var profileResponse = const ProfileDetails().obs;
  var error = ''.obs;
  var profileheight = true.obs;
  int i = 0;

  setProfileHeight(bool profileheight) {
    this.profileheight.value = profileheight;
    update();
  }

 void profilefetch(
      String languageId) async {
    loadingController.setLoading(true);

    Either<Failure, ProfileDetails> failureOrSuccessMessage =
        await ProfileDetailsRepositoryImpl()
            .fetchProfileDetails(languageId);
    loadingController.setLoading(false);
    _eitherErrorOrSuccessState(failureOrSuccessMessage);
  }

  void profileUpdate(
      String salutations,
      String country,
      String dob,
      String city,
      String lastName,
      String email,
      String firstName,
      String state,
      String mobile,
      // String mobNo1,
      // String mobNo2,
      // String mobNo3,
      String addr1,
      String addr2,
      String postal,
      String userName,
      String languageId) async {
    loadingController.setLoading(true);

    Either<Failure, ProfileDetails> failureOrSuccessMessage =
        await ProfileDetailsRepositoryImpl().updateProfileDetails(
            salutations,
            country,
            dob,
            city,
            lastName,
            email,
            firstName,
            state,
            mobile,
            addr1,
            addr2,
            postal,
            userName,
            languageId);
    loadingController.setLoading(false);

    _eitherErrorOrSuccessStateupdate(failureOrSuccessMessage);
  }

  void profilePicUpdate(File picture) async {
    loadingController.setLoading(true);

    Either<Failure, bool> failureOrSuccessMessage =
        await ProfileDetailsRepositoryImpl().updateProfilePicture(
      picture,
    );
    loadingController.setLoading(false);

    _eitherErrorOrSuccessStateupdateprofile(failureOrSuccessMessage);
  }

   _eitherErrorOrSuccessStateupdateprofile(
      failureOrSuccessMessage,) async {
    failureOrSuccessMessage.fold(
      (l) {
        error.value = languageController.languageResponse.value.error ?? '';
        viewController.setErrorMessage(
            languageController.languageResponse.value.somethingWentWrong ?? '');
        viewController.setView(ERROR);
      },
      (r) {
         viewController.setView(INFO);
        viewController.setInfoMessage(
           'Profile Picture Updated Successfully');
      },
    );
  }

  _eitherErrorOrSuccessStateupdate(
    Either<Failure, ProfileDetails> failureOrSuccessMessage,
  ) async {
    failureOrSuccessMessage.fold(
      (l) {
        error.value = languageController.languageResponse.value.error ?? '';
        viewController.setErrorMessage(
            languageController.languageResponse.value.somethingWentWrong ?? '');
        viewController.setView(ERROR);
      },
      (r) {
        profileResponse.value = r;
        // if (i <= 1) {
        //   viewController.setView("");

        //   viewController.setView(CLIENTPROFILE);
        // }
        // i = i + 1;
       if (optionsController.optionsKey.value != GUEST) {
        viewController.setView(INFO);
        viewController.setInfoMessage(
            languageController.languageResponse.value.profileUpdated ?? '');
        }
        update();
      },
    );
  }

  _eitherErrorOrSuccessState(
    Either<Failure, ProfileDetails> failureOrSuccessMessage,
  ) async {
    failureOrSuccessMessage.fold(
      (l) {
        error.value = languageController.languageResponse.value.error ?? '';
        viewController.setErrorMessage(
            languageController.languageResponse.value.somethingWentWrong ?? '');
        viewController.setView(ERROR);
      },
      (r) {
        profileResponse.value = r;
        if (i <= 1) {
           viewController.setView("");

          viewController.setView(CLIENTPROFILE);
          //update();
        }
       i = i + 1;
        // viewController.setView(INFO);
        // viewController.setInfoMessage(
        //     languageController.languageResponse.value.profileUpdated ?? '');
        update();
      },
    );
  }
}
