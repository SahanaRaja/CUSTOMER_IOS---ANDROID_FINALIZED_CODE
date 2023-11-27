import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../entity/pos_user_detail_response.dart';

abstract class DownloadPosUserDataRepository {
  Future<Either<Failure, PosUserDetailsResponse>> downloadPosUsersData(
      String token, String type, String shopId);
}
