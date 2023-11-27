// ignore_for_file: avoid_print, camel_case_types, override_on_non_overriding_member

import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../../../../core/error/exceptions.dart';
import '../../../../../core/error/failures.dart';
import '../../../domain/chatty/entities/chatty_response.dart';
import '../../../domain/chatty/repositories/chatty_repository.dart';
import '../datasources/chatty_remote_data_source.dart';
import '../models/chatty_response_model.dart';

class cHattyRepositoryImpl implements cHattyRepository {
  @override
  Future<Either<Failure, List<cHattyResponseModel>>> cHatty() async {
    InternetConnectionChecker connectionChecker = InternetConnectionChecker();

    try {
      print('Fetch Chatty Block Called Repo Implementation');
      List<cHattyResponseModel> chattyList = [];
      if (await connectionChecker.hasConnection) {
        chattyList = await cHattyRemoteDataSourceImpl().checkcHatty();
      }
      return Right(chattyList);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<cHattyResponse>>> fetchChatty() {
    // TODO: implement fetchCity
    throw UnimplementedError();
  }
}
