import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/fetch_country_reponse.dart';

abstract class FetchCountryRepository {
  Future<Either<Failure, FetchCountryResponse>> fetchCountry(
      String country, String languageId);
}
