import 'package:dartz/dartz.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/error/failures.dart';
import '../../domain/entity/pos_user_detail_response.dart';
import '../../domain/repositories/download_pos_users_data_repository.dart';
import '../datasources/download_users_remote_data.dart';

class DownloadPosUserRepositoryImpl implements DownloadPosUserDataRepository {
  @override
  Future<Either<Failure, PosUserDetailsResponse>> downloadPosUsersData(
      String token, String type, String shopId) async {
    try {
      PosUserDetailsResponse posUserDetailsResponse =
          await DownloadPosUserRemoteDataSourceImpl()
              .downloadUsersData(token, type, shopId);
      return Right(posUserDetailsResponse);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
