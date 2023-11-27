import 'package:customer_assist/core/error/exceptions.dart';
import 'package:customer_assist/core/error/failures.dart';
import 'package:customer_assist/home/data/currencyCalulator/datasources/FetchCurrencyDetailsRemoteDataImpl.dart';
import 'package:customer_assist/home/data/currencyCalulator/models/CurrencyCode.dart';
import 'package:customer_assist/home/data/currencyCalulator/models/CurrencyPrice.dart';
import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class FetchCurrencyDetailsRepository {
  Future<Either<Failure, CurrencyCode>> fetchCurrencyCodeDetails();

  Future<Either<Failure, dynamic>> fetchCurrencyPriceDetails(
      String fromCurrency, String toCurrency);
}

abstract class FetchCurrencyRateRepository {}

class FetchCurrencyDetailsRepositoryImpl
    extends FetchCurrencyDetailsRepository {
  InternetConnectionChecker connectionChecker = InternetConnectionChecker();

  @override
  Future<Either<Failure, CurrencyCode>> fetchCurrencyCodeDetails() async {
    try {
      CurrencyCode? currencyCode;
      if (await connectionChecker.hasConnection) {
        currencyCode = await FetchCurrencyDetailsRemoteDataImpl()
            .fetchCurrencyCodeDetails();
      } else {
        currencyCode = await FetchCurrencyDetailsRemoteDataImpl()
            .fetchCurrencyCodeDetails();
      }
      return Right(currencyCode);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, CurrencyPrice>> fetchCurrencyPriceDetails(
      String fromCurrency, String toCurrency) async {
    try {
      CurrencyPrice currencyPrice;
      if (await connectionChecker.hasConnection) {
        currencyPrice = await FetchCurrencyDetailsRemoteDataImpl()
            .fetchCurrencyPriceDetails(fromCurrency, toCurrency);
      } else {
        currencyPrice = await FetchCurrencyDetailsRemoteDataImpl()
            .fetchCurrencyPriceDetails(fromCurrency, toCurrency);
      }
      return Right(currencyPrice);
    } on AuthenticationError {
      return Left(AuthenticationFailure());
    } on TokenExpiredException {
      return Left(TokenExpiredFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
