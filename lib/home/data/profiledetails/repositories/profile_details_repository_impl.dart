import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../domain/profiledetails/entities/profile_details.dart';
import '../../../domain/profiledetails/repositories/profile_details_repository.dart';
import '../datasources/profile_details_remote_data_sources.dart';

class ProfileDetailsRepositoryImpl extends ProfileDetailsRepository {
  // final NetworkInfo? networkInfo;
  InternetConnectionChecker connectionChecker = InternetConnectionChecker();

  @override
  Future<Either<Failure, ProfileDetails>> fetchProfileDetails( String languageId) async {
    // if(SHOW_DEBUGGING)print(userName);
    try {
      // if(SHOW_DEBUGGING)print('FetchProfileDetailsBlock Called Repo Implementation');
      ProfileDetails? profileDetails;
      //if (await connectionChecker.hasConnection) {
        profileDetails = await ProfileDetailsRemoteDataSourceImpl()
            .fetchProfileDetails( languageId);
      //}
      // profileDetails = await ProfileDetailsRemoteDataSourceImpl()
      //     .fetchProfileDetails(shopId, languageId);
      //  else if (userType == OPERATOR) {
      //   // profileDetails = await ProfileDetailsRemoteDataSourceImpl()
      //   //     .fetchProfileDetails(shopId, userType: userType);
      //   profileDetails = await ProfileDetailsLocalDataSourceImpl()
      //       .fetchProfileDetails(shopId, userName, userType);
      // }

      return Right(profileDetails);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ProfileDetails>> updateProfileDetails(
      String salutations,
      String country,
      String city,
      String dob,
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
    try {
      // if (SHOW_DEBUGGING)
      //   print('UpdateProfileDetailsBlock Called Repo Implementation');

      ProfileDetails? profileDetails;
      // if (await connectionChecker.hasConnection && userType == MANAGER) {
      profileDetails = await ProfileDetailsRemoteDataSourceImpl()
          .updateProfileDetails(
              salutations,
              country,
              city,
              dob,
              lastName,
              email,
              firstName,
              mobile,
              state,
              addr1,
              addr2,
              postal,
              userName,
              languageId);
      // } else {
      //   profileDetails = await ProfileDetailsRemoteDataSourceImpl()
      //       .updateProfileDetails(
      //           salutations,
      //           country,
      //           city,
      //           dob,
      //           lastName,
      //           email,
      //           firstName,
      //           state,
      //           shopId,
      //           mobNo1,
      //           mobNo2,
      //           mobNo3,
      //           addr1,
      //           addr2,
      //           postal,
      //           userType,
      //           type,
      //           userName,
      //           password);
      // }

      return Right(profileDetails);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> updateProfilePicture(
      File picture) async {
    try {
      // if (SHOW_DEBUGGING)
      //   print('UpdateProfilePictureBlock Called Repo Implementation');
      bool? profileDetails;
      // if (await connectionChecker.hasConnection ) {
      profileDetails = await ProfileDetailsRemoteDataSourceImpl()
          .updateProfilePicture(picture);
      // } else {
      //   profileDetails = await ProfileDetailsRemoteDataSourceImpl()
      //       .updateProfilePicture(shopId, picture,
      //           userName: userName, userType: userType, accessType: accessType);
      // }

      return Right(profileDetails);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
