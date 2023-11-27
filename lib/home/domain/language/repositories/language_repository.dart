import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/language_response.dart';

abstract class LanguageRepository {
  Future<Either<Failure, LanguageResponse>> fetchLanguageDetails(
      int languageNum);
}
