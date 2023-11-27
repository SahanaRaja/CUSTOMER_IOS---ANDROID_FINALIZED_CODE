// ignore_for_file: avoid_print

import 'package:dartz/dartz.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/error/failures.dart';
import '../../domain/repositories/download_assets_repository.dart';
import '../datasources/download_assets_data_source.dart';
import '../models/image_response_model/image_response_model.dart';

class DownloadAssetsRepositoryImpl implements DownloadAssetsRepository {
  @override
  Future<Either<Failure, ImageResponseModel>> downloadAssets(
      String type, String shopId) async {
    try {
      print('LoginBlock Called Repo Implementation');
      ImageResponseModel loginResponse =
          await DownloadAssetsImpl().downloadAssetsDataSource(type, shopId);

      return Right(loginResponse);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
