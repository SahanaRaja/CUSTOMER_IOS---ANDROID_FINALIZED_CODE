import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../data/posmasterSelection/models/pos_master_response_model.dart';

abstract class PosMasterSelectionRepository {
  Future<Either<Failure, PosMasterSelectionDetailsResponseModel>>
      posSelctionInfo();
}
