import 'package:customer_assist/home/data/guestfetchCountry/model2/zipcode.dart';
import 'package:customer_assist/home/data/guestfetchCountry/models/Guest_fetchcountry_response_model.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../data/guestfetchCountry/models/timingResponse.dart';

abstract class GuestFetchCountryRepository {
  Future<Either<Failure,List< GuestFetchCountryResponseModel>>> guestfetchCountry();
  Future<Either<Failure,ZipCodeResponse>> checkZipcode(String postalController);
}
