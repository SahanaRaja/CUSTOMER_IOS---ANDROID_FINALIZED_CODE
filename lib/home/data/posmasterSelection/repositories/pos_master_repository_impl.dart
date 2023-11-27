import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/error/failures.dart';
import '../../../domain/posmasterSelection/repositories/pos_master_repository.dart';
import '../datasources/pos_master_selection_remote_data_source.dart';
import '../models/pos_master_response_model.dart';

class PosMasterSelectionRepositoryImpl implements PosMasterSelectionRepository {
  @override
  Future<Either<Failure, PosMasterSelectionDetailsResponseModel>>
      posSelctionInfo() async {
    InternetConnectionChecker connectionChecker = InternetConnectionChecker();

    try {
      print('PosMaster Block Called Repo Implementation');
      PosMasterSelectionDetailsResponseModel posSelectionResponse =
          const PosMasterSelectionDetailsResponseModel();
      if (await connectionChecker.hasConnection) {
        posSelectionResponse = await PosMasterSelectionRemoteDataSourceImpl()
            .checkPosMasterSelection();
      }
      return Right(posSelectionResponse);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
