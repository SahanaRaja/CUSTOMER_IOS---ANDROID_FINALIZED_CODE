import 'package:customer_assist/home/domain/fetchcity/entities/fetchAreaentity/fetch_area_response.dart';
import 'package:customer_assist/home/domain/fetchcity/entities/fetchCityentity/fetch_ctiy_reponse.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';

abstract class FetchCityRepository {
  Future<Either<Failure, List<FetchCityResponse>>> fetchCity();
  Future<Either<Failure, List<FetchAreaResponse>>> fetchArea();
}
