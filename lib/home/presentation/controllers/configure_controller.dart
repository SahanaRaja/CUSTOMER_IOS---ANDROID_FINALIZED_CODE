import 'dart:convert';

import 'package:customer_assist/core/app_urls.dart';
import 'package:customer_assist/core/helpers/SharedPreference/prefs.dart';
import 'package:customer_assist/home/data/configure/models/configure_data_model/configure_data_model.dart';
import 'package:customer_assist/home/data/configure/models/delivery_time_model/delivery_slot.dart';
import 'package:customer_assist/home/data/configure/models/delivery_time_model/delivery_time_model.dart';
import 'package:customer_assist/home/data/configure/models/delivery_time_model/express_delivery.dart';
import 'package:customer_assist/home/data/configure/models/delivery_time_model/normal_delivery.dart';
import 'package:customer_assist/home/data/configure/models/let_me_shop/store_detail.dart';
import 'package:customer_assist/home/data/configure/models/shop_details/mainmenu.dart';
import 'package:customer_assist/home/data/configure/models/shop_details/shop_details.dart';
import 'package:customer_assist/home/data/forgotpassword/super_user/models/reset_send_otp_model.dart';
import 'package:customer_assist/home/presentation/controllers/header_controller.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/controllers/options_controller.dart';
import 'package:customer_assist/home/presentation/controllers/shop_controller.dart';
import 'package:customer_assist/home/presentation/controllers/view_controller.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/app_constants.dart';
import '../../../core/error/failures.dart';
import '../../data/configure/models/configure_data_model/status.dart';
import '../../data/configure/models/delivery_address_model/delivery_address_model.dart';
import '../../data/configure/models/delivery_address_model/deliveryaddress.dart';
import '../../data/configure/models/let_me_shop/let_me_shop.dart';
import '../../data/configure/repositories/configure_data_repository_impl.dart';
import 'keyboard_controller.dart';
import 'loading_controller.dart';

class ConfigureController extends GetxController {
  ViewController viewController = Get.put(ViewController());
  LoadingController loadingController = Get.put(LoadingController());
  OptionsController optionsController = Get.put(OptionsController());
  HeaderController headerController = Get.put(HeaderController());
  KeyboardController keyboardController = Get.find();
  var languageController = Get.put(LanguageController());
  ShopController shopController = Get.put(ShopController());
  var fetchdetails = const StatusResponse().obs;
  List<Deliveryaddress> deliveryAddress = <Deliveryaddress>[].obs;
  List<Mainmenu> shopDetails = <Mainmenu>[].obs;
  var deliverySlot = const DeliverySlot().obs;
  List<StoreDetail> letmeShopDetails = <StoreDetail>[].obs;
  List<NormalDelivery> normalDelivery = <NormalDelivery>[].obs;
  List<ExpressDelivery> expressDelivery = <ExpressDelivery>[].obs;
  //added by sahana for subheader name
  var subheaderResponse = ''.obs;
  var shopname = ''.obs;
  dynamic amount = {Prefs.orderAmount}.obs;
  var subthirdheaderResponse = ''.obs;
  var error = ''.obs;
  var browsePicker = <BrowseMethod>[].obs;

  void fetchDetails(String languageId) async {
    loadingController.setLoading(true);

    Either<Failure, ConfigureDataModel> failureOrSuccessMessage =
        await ConfigureDataRepositoryImpl().fetchDetails(languageId);
    loadingController.setLoading(false);

    _eitherErrorOrSuccessState(failureOrSuccessMessage);
  }

  void fetchDetailsGuest(String languageId) async {
    loadingController.setLoading(true);

    Either<Failure, ConfigureDataModel> failureOrSuccessMessage =
        await ConfigureDataRepositoryImpl().fetchDetails(languageId);
    loadingController.setLoading(false);

    _eitherErrorOrSuccessStateGuest(failureOrSuccessMessage);
  }

  void fetchShopType(String languageId) async {
    loadingController.setLoading(true);

    Either<Failure, ShopDetails> failureOrSuccessMessage =
        await ConfigureDataRepositoryImpl().fetchShopType(languageId);
    loadingController.setLoading(false);

    _eitherErrorOrSuccessStateShopType(failureOrSuccessMessage);
  }

  void letMeShop(String shopType, String languageId) async {
    loadingController.setLoading(true);

    Either<Failure, LetMeShop> failureOrSuccessMessage =
        await ConfigureDataRepositoryImpl().letMeShop(shopType, languageId);
    loadingController.setLoading(false);

    _eitherErrorOrSuccessStateShopDetails(failureOrSuccessMessage);
  }

  void letMeShopGuest(String shopType, String languageId) async {
    loadingController.setLoading(true);

    Either<Failure, LetMeShop> failureOrSuccessMessage =
        await ConfigureDataRepositoryImpl()
            .letMeShopGuest(shopType, languageId);
    loadingController.setLoading(false);

    _eitherErrorOrSuccessStateShopDetailsGuest(failureOrSuccessMessage);
  }

  void updateShop(String shopID, String languageId) async {
    loadingController.setLoading(true);

    Either<Failure, ResetPasswordOTPModel> failureOrSuccessMessage =
        await ConfigureDataRepositoryImpl().updateShop(shopID, languageId);
    loadingController.setLoading(false);

    _eitherErrorOrSuccessStateShopID(failureOrSuccessMessage);
  }

  void fetchDeliveryTime(String languageId) async {
    loadingController.setLoading(true);

    Either<Failure, DeliveryTimeModel> failureOrSuccessMessage =
        await ConfigureDataRepositoryImpl().fetchDeliveryTime(languageId);
    loadingController.setLoading(false);

    _eitherErrorOrSuccessStateDeliveryTime(failureOrSuccessMessage);
  }

  void updateDeliveryTime(String time, String languageId) async {
    loadingController.setLoading(true);

    Either<Failure, ResetPasswordOTPModel> failureOrSuccessMessage =
        await ConfigureDataRepositoryImpl()
            .updateDeliveryTime(time, languageId);
    loadingController.setLoading(false);

    _eitherErrorOrSuccessStateUpdateDeliveryTime(failureOrSuccessMessage);
  }

  void shoppingMode(
      String homestore, String delivery, String languageId) async {
    loadingController.setLoading(true);

    Either<Failure, ResetPasswordOTPModel> failureOrSuccessMessage =
        await ConfigureDataRepositoryImpl()
            .shoppingMode(homestore, delivery, languageId);
    loadingController.setLoading(false);

    _eitherErrorOrSuccessStateShoppingMode(failureOrSuccessMessage);
  }

  void fetchCustomerDeliveryAddress(String languageId) async {
    loadingController.setLoading(true);

    Either<Failure, DeliveryAddressModel> failureOrSuccessMessage =
        await ConfigureDataRepositoryImpl()
            .fetchCustomerDeliveryAddress(languageId);
    loadingController.setLoading(false);

    _eitherErrorOrSuccessStateAddress(failureOrSuccessMessage);
  }

  void updateCustomerDeliveryAddress(
      String salutation,
      String customerAddrId,
      String status,
      String firstName,
      String lastName,
      String addr1,
      String addr2,
      String country,
      String locality,
      String state,
      String city,
      String addressType,
      String type,
      String languageId,
      String mobile1,
      String mobile2,
      String mobile3,
      String postalcode) async {
    //loadingController.setLoading(true);

    Either<Failure, ResetPasswordOTPModel> failureOrSuccessMessage =
        await ConfigureDataRepositoryImpl().updateCustomerDeliveryAddress(
            salutation,
            customerAddrId,
            status,
            firstName,
            lastName,
            addr1,
            addr2,
            country,
            locality,
            state,
            city,
            addressType,
            type,
            languageId,
            mobile1,
            mobile2,
            mobile3,
            postalcode);
    // loadingController.setLoading(false);

    _eitherErrorOrSuccessStateAddressUpdate(failureOrSuccessMessage);
  }

  _eitherErrorOrSuccessStateGuest(
    Either<Failure, ConfigureDataModel> failureOrSuccessMessage,
  ) async {
    failureOrSuccessMessage.fold(
      (l) {
        viewController.setView(ERROR);
      },
      (r) {
        if (r.status!.result == 1) {
          print(r);
          viewController.setView(CHOOSESTOREPAGE);
          fetchdetails.value = r.status!;
          // Prefs.setShopId(r.status!.menu![3].subMenu![0].shopId!);
        } else {
          viewController.setView(ERROR);
          viewController.setErrorMessage(r.status!.message!);
        }
      },
    );
  }

  _eitherErrorOrSuccessState(
    Either<Failure, ConfigureDataModel> failureOrSuccessMessage,
  ) async {
    failureOrSuccessMessage.fold(
      (l) {
        viewController.setView(ERROR);
      },
      (r) {
        if (r.status!.result == 1) {
          print(r);
           //viewController.setView(OWNERDETAILS);
          // viewController.setView(CONFIGURE);
          fetchdetails.value = r.status!;
          // Prefs.setShopId(r.status!.menu![3].subMenu![0].shopId!);
        } else {
          viewController.setView(ERROR);
          viewController.setErrorMessage(r.status!.message!);
        }
      },
    );
  }

  void _eitherErrorOrSuccessStateShoppingMode(
      Either<Failure, ResetPasswordOTPModel> failureOrSuccessMessage) {
    failureOrSuccessMessage.fold(
      (l) {
        viewController.setView(ERROR);
      },
      (r) {
        if (r.result == 1) {
          // viewController.setView(SUCCESS);
          // viewController.setSuccessMessage(r.message!);
        } else {
          viewController.setView(ERROR);
          viewController.setErrorMessage(r.message!);
        }
      },
    );
  }

  void _eitherErrorOrSuccessStateAddress(
      Either<Failure, DeliveryAddressModel> failureOrSuccessMessage) {
    failureOrSuccessMessage.fold(
      (l) {
        viewController.setView(ERROR);
      },
      (r) {
        if (r.status!.result == 1) {
          deliveryAddress = r.status!.deliveryaddress!;

          // viewController.setView(CHANGEDELIVERYADDRESS);
          // optionsController.setOptionList(ADDRESSBOOK);
          // optionsController.getAddressBook();
          // optionsController.optionIndexSetter(0);
          // optionsController.setSetState();
        } else {
          viewController.setView(ERROR);
          viewController.setErrorMessage(r.status!.message!);
        }
      },
    );
  }

  void _eitherErrorOrSuccessStateShopType(
      Either<Failure, ShopDetails> failureOrSuccessMessage) {
    failureOrSuccessMessage.fold(
      (l) {
        viewController.setView(ERROR);
      },
      (r) {
        if (r.status!.result == 1) {
          shopDetails = r.status!.mainmenu!;
          //optionsController.optionIndexSetter();
          optionsController.setSetState();
          headerController.subHeaderLabel(
              languageController.languageResponse.value.selectStore);
          viewController.setView(INFO);
          viewController.setInfoMessage(
              'The current shop is set as the shop in which you placed orders previously. In case you wish to change the shop you may tap on the Store ICON and change the store.'
              //languageController.languageResponse.value.changeStore ?? ''
              );
        } else {
          viewController.setView(ERROR);
          viewController.setErrorMessage(r.status!.message!);
        }
      },
    );
  }

  void _eitherErrorOrSuccessStateAddressUpdate(
      Either<Failure, ResetPasswordOTPModel> failureOrSuccessMessage) {
    failureOrSuccessMessage.fold(
      (l) {
        viewController.setView(ERROR);
      },
      (r) {
        if (r.result == 1) {
          viewController.setView(SUCCESS);
          viewController.setSuccessMessage(r.message!);
          fetchCustomerDeliveryAddress(
              languageController.languagenum.toString());
        } else {
          viewController.setView(ERROR);
          viewController.setErrorMessage(r.message!);
        }
      },
    );
  }

  void _eitherErrorOrSuccessStateShopDetailsGuest(
      Either<Failure, LetMeShop> failureOrSuccessMessage) {
    failureOrSuccessMessage.fold(
      (l) {
        viewController.setView(ERROR);
      },
      (r) {
        if (r.status!.result! == 1) {
          letmeShopDetails =
              r.status!.outletDetails!.maximumProducts!.storeDetails!;
          viewController.setView(STOREDETAILPAGE);
          Prefs.setSuperUserShopId(true);
        } else {
          viewController.setView(ERROR);
          viewController.setErrorMessage(r.status!.message!);
        }
      },
    );
  }

  void _eitherErrorOrSuccessStateShopDetails(
      Either<Failure, LetMeShop> failureOrSuccessMessage) {
    failureOrSuccessMessage.fold(
      (l) {
        viewController.setView(ERROR);
      },
      (r) {
        if (r.status!.result! == 1) {
          letmeShopDetails =
              r.status!.outletDetails!.maximumProducts!.storeDetails!;
          viewController.setView(STOREDETAILPAGE);
        } else {
          viewController.setView(ERROR);
          viewController.setErrorMessage(r.status!.message!);
        }
      },
    );
  }

  void _eitherErrorOrSuccessStateShopID(
      Either<Failure, ResetPasswordOTPModel> failureOrSuccessMessage) {
    failureOrSuccessMessage.fold(
      (l) {
        viewController.setView(ERROR);
      },
      (r) {
        if (r.result! == 1) {
          viewController.setView(SUCCESS);
          viewController.setSuccessMessage('Shop Updated Successfully.');
          Prefs.setSuperUserShopId(true);
          //addedbysofiya
          // if (optionsController.outlet ==
          //     '41' ||
          // optionsController.outlet ==
          //     '202') {
          //   shopController.downloadShoppingProduct(
          //       languageController.languagenum.toString());
          // } else {
          shopController.downloadRestaurantProduct(
              languageController.languagenum.toString());
          // }
        } else {
          viewController.setView(ERROR);
          viewController.setErrorMessage(r.message!);
        }
      },
    );
  }

  void _eitherErrorOrSuccessStateDeliveryTime(
      Either<Failure, DeliveryTimeModel> failureOrSuccessMessage) {
    failureOrSuccessMessage.fold(
      (l) {
        viewController.setView(ERROR);
      },
      (r) {
        if (r.status!.result! == 1) {
          deliverySlot.value = r.status!.deliverySlot!;
          normalDelivery = r.status!.deliverySlot!.normalDelivery!;
          expressDelivery = r.status!.deliverySlot!.expressDelivery!;
          viewController.setView(DELIVERYTIMEPAGE);
          headerController.setSubHeaderLabel(
             // languageController.languageResponse.value.deliveryTime ??
               'Choose delivery Time');
        } else {
          viewController.setView(ERROR);
          viewController.setErrorMessage(r.status!.message!);
        }
      },
    );
  }

  void _eitherErrorOrSuccessStateUpdateDeliveryTime(
      Either<Failure, ResetPasswordOTPModel> failureOrSuccessMessage) {
    failureOrSuccessMessage.fold(
      (l) {
        viewController.setView(ERROR);
      },
      (r) {
        if (r.result! == 1) {
          // viewController.setView(SUCCESS);
          // viewController.setSuccessMessage(r.message!);
        } else {
          viewController.setView(ERROR);
          viewController.setErrorMessage(r.message!);
        }
      },
    );
  }

  getData() async {
    String jsonRequestBody;
    // if (optionsController.optionsKey.value == GUEST) {
    jsonRequestBody = '{"CUSTOMER_ID":"0"}';
    // } else {
    //   jsonRequestBody = '{"CUSTOMER_ID":"${await Prefs.customerID}"}';
    // }
    // Map<String, String> headers = {
    //   "Content-type": "application/json",
    //   "TokenNo": CLIENTTOKEN
    // };
    var prefs = await SharedPreferences.getInstance();
    String? tokenNos = prefs.getString("TokenNo");
    String NEWTOKEN = tokenNos ?? "";
    Map<String, String> headers = {
      "Content-type": "application/json",
      "TokenNo": NEWTOKEN
      //  TOKEN
    };
    final response = await http.post(
      Uri.parse(BROWSEMETHODPICKER),
      headers: headers,
      body: jsonRequestBody,
    );
    print('BROWSE_PICKERequest$jsonRequestBody');
    print('BROWSE_PICKEResonse${response.body}');
    var jsonData = jsonDecode(response.body);
    print(jsonData['status']['Result']);
    if (jsonData['status']['Result'] == 1) {
      browsePicker.value =
          (jsonData['status']['BROWSE_PICKER'] as List<dynamic>)
              .map((d) => BrowseMethod.fromJson(d))
              .toList();
      update();
    } else {}
    print(browsePicker.length);
  }
}

class BrowseMethod {
  String? val;
  String? id;

  BrowseMethod({this.val, this.id});

  factory BrowseMethod.fromJson(Map<String, dynamic> json) {
    return BrowseMethod(
      val: json['val'],
      id: json['Id'],
    );
  }
}
