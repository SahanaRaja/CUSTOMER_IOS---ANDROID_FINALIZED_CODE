import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../data/models/image_response_model/image_response_model.dart';

abstract class DownloadAssetsRepository {
  Future<Either<Failure, ImageResponseModel>> downloadAssets(
      String type, String shopId);
}
