import 'package:customer_assist/home/data/currencyCalulator/models/CurrencyCode.dart';
import 'package:customer_assist/home/data/currencyCalulator/models/CurrencyPrice.dart';
import 'package:customer_assist/home/data/currencyCalulator/repositories/FetchCurrencyDetailsRepository.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import '../../../core/error/failures.dart';

class FetchCurrencyController extends GetxController {
  var currencyCodeModel = CurrencyCode().obs;
  var priceDetails = CurrencyPrice().obs;
  var error = ''.obs;

  Future fetchCurrencyCodeDetails() async {
    Either<Failure, CurrencyCode> failureOrSuccessMessage =
        await FetchCurrencyDetailsRepositoryImpl().fetchCurrencyCodeDetails();
    _eitherErrorOrSuccessStateCurrencyCode(failureOrSuccessMessage);
  }

  _eitherErrorOrSuccessStateCurrencyCode(
    Either<Failure, CurrencyCode> failureOrSuccessMessage,
  ) async {
    failureOrSuccessMessage.fold(
      (l) {
        error.value = 'Something went wrong. Please try again later.';
      },
      (r) {
        currencyCodeModel.value = r;
        update();
      },
    );
  }

  Future fetchCurrencyPriceDetails(
      String fromCurrency, String toCurrency) async {
    Either<Failure, CurrencyPrice> failureOrSuccessMessage =
        await FetchCurrencyDetailsRepositoryImpl()
            .fetchCurrencyPriceDetails(fromCurrency, toCurrency);
    _eitherErrorOrSuccessStateCurrencyPrice(failureOrSuccessMessage);
  }

  _eitherErrorOrSuccessStateCurrencyPrice(
    Either<Failure, CurrencyPrice> failureOrSuccessMessage,
  ) async {
    failureOrSuccessMessage.fold(
      (l) {
        error.value = 'Something went wrong. Please try again later.';
      },
      (r) {
        priceDetails.value = r;
        update();
      },
    );
  }
}
