import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/profile_details.dart';

abstract class ProfileDetailsRepository {
  Future<Either<Failure, ProfileDetails>> fetchProfileDetails(
       String languageId);
  Future<Either<Failure, ProfileDetails>> updateProfileDetails(
      String salutations,
      String country,
      String dob,
      String city,
      String lastName,
      String email,
      String firstName,
      String state,
      String mobile,
      // String shopId,
      // String mobNo1,
      // String mobNo2,
      // String mobNo3,
      String addr1,
      String addr2,
      String postal,
      String userName,
      String languageId);
  Future<Either<Failure, bool>> updateProfilePicture(File picture);
}
