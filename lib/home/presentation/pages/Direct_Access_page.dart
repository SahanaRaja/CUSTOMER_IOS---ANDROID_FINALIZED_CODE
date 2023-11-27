import 'package:customer_assist/core/app_constants.dart';
import 'package:customer_assist/home/presentation/controllers/chatty_controller.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/first_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../../../core/helpers/SharedPreference/prefs.dart';
import '../../../core/utils/udid_getter.dart';
import '../controllers/city_controller.dart';
import '../controllers/configure_controller.dart';
import '../controllers/fetch_country_controller.dart';
import '../controllers/guest_fetchCountry_controller.dart';
import '../controllers/header_controller.dart';
import '../controllers/keyboard_controller.dart';
import '../controllers/language_controller.dart';
import '../controllers/options_controller.dart';
import '../controllers/order_controller.dart';
import '../controllers/owner_data_controller.dart';
import '../controllers/profile_controller.dart';
import '../controllers/reset_controller.dart';
import '../controllers/shop_controller.dart';
import '../controllers/splash_controller.dart';
import '../controllers/view_controller.dart';

class DirectIconAccess extends StatefulWidget {
  final double actualHeight;
  const DirectIconAccess({
    Key? key,
    required this.actualHeight,
  }) : super(key: key);

  @override
  State<DirectIconAccess> createState() => _DirectIconAccessState();
}

class _DirectIconAccessState extends State<DirectIconAccess> {
  HeaderController headerController = Get.find();
  OptionsController optionsController = Get.find();
  ViewController viewController = Get.find();
  KeyboardController keyboardController = Get.find();
  var addressController = Get.put(AddressController());
  var languageController = Get.put(LanguageController());
  var orderController = Get.put(OrderController());
  var fetchCountryController = Get.put(FetchCountryController());
  var splashController = Get.put(SplashController());
  var forggetController = Get.put(ResetController());
  var configureController = Get.put(ConfigureController());
  var shopController = Get.put(ShopController());
  var profileController = Get.put(ProfileController());
  var guestCountryController = Get.put(GuestFetchCountryController());
  FetchCityController cityController = Get.find();
  var chattyController = Get.put(ChattyController());

  bool? validateCountry;
  bool permissionGranted = false;
  late Position position;
  var udid;
  var countryFlag;
  Future getLocation() async {
    position = await _getGeoLocationPosition();
    getAddressFromLatLong(position);
  }

//GET CURRENT LOCATION//

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    print(serviceEnabled);
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error(languageController
              .languageResponse.value.locationServicesAreDisable ??
          '');
    } else {}
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        await Geolocator.openAppSettings();
        // added by bhava
        getLocation();
        // return Future.error(languageController
        //         .languageResponse.value.LocationPermissionsAreDenied ??
        //     '');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // added by bhava
      //getLocation();
      viewController.setView(ERROR);
      viewController.setErrorMessage(languageController
              .languageResponse.value.theLocationServicesAreUsed ??
          '');
      //languageController.languageResponse.value.locationPermissionError ??
      // 'The location services are used in this application to detect your country details and display the sponsors in your country, show the stores nearby to you to choose the products you want to buy. This provides you important information and rich experience. We therefore strongly recommend you providing location permission to proceed with the application.');

      return Future.error(
          languageController.languageResponse.value.locationDeniedError ?? '');
    }

    if (await Prefs.mobile != '') {}

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> getAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    // Prefs.setLatitude(13.001177);
    // Prefs.setLongitude(80.256493);
    Prefs.setLatitude(position.latitude);
    Prefs.setLongitude(position.longitude);
    print("***************************************${position.latitude}");
    print("***************************************${position.longitude}");
    print(placemarks);
    Placemark place = placemarks[0];
    Prefs.setCountry(place.country!);
    Prefs.setTempCountry(place.country!);
    Prefs.setPostalCode(place.postalCode!);
    print(place.postalCode);
    fetchCountryController.fetchCountryLogin(
        place.country!, languageController.languagenum.toString());
    udid = await getUDIDofDevice();

    splashController.fetchSplashData(place.country!, DateTime.now().toString(),
        udid, languageController.languagenum.toString());
  }

  getUDIDofDevice() async {
    String udid = "";
    try {
      udid = await FlutterUdid.udid;
      Prefs.setUdid(udid);
      return udid;
    } on PlatformException {
      udid = 'Failed to get UDID.';
      print(udid);
      return UDIDError(udid);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            FirstRowWidget(
                actualHeight: widget.actualHeight,
                header: 'Direct Access',
                arrow: false),
            SizedBox(height: MediaQuery.of(context).size.height * 0.002),
            Container(
              height: 1,
              width: double.infinity,
              color: const Color.fromARGB(255, 9, 9, 9),
            ),
            Stack(
              children: [
                GetX<OptionsController>(
                    init: OptionsController(),
                    initState: (_) {},
                    builder: (_) {
                      return Container(
                        // width: GetPlatform.isAndroid
                        //     ? (widget.actualHeight - 40)
                        //     : (widget.actualHeight),
                        // height: GetPlatform.isAndroid
                        //     ? (widget.actualHeight-40 ) * 0.90
                        //     : (widget.actualHeight) * 0.71,
                        // height: 700,
                        // width: 500,
                        color: Colors.white,
                        child: Column(
                          children: [
                            SizedBox(
                                height: GetPlatform.isAndroid
                                    ? (widget.actualHeight - 40) * 0.19
                                    : (widget.actualHeight) * 0.17,
                                width: double.infinity,
                                child: FittedBox(
                                  fit: BoxFit.fill,
                                  child: Image.asset(
                                    'assets/images/add1.jpg',
                                  ),
                                )
                                //color: Color.fromARGB(255, 48, 152, 243),
                                ),
                            Container(
                              height: 1,
                              width: double.infinity,
                              color: const Color.fromARGB(255, 82, 79, 79),
                            ),
                            Container(
                              height: 90,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey[800]!,
                                  width: 0.3,
                                ),
                              )),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: ListView.separated(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: optionsController
                                          .countryDirectAccess.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                            onTap: () {
                                              optionsController
                                                  .optionIndexSetter(index);
                                              if (index == 0) {
                                                viewController.setView('');
                                                keyboardController
                                                    .setPicker('Country');
                                                headerController
                                                    .setSubHeaderLabel(
                                                        'Select Country');
                                                viewController.setView(INFO);
                                                // viewController.setInfoMessage(languageController.languageResponse.value.Youcanselectacountryofoperation ?? '');
                                                viewController.setInfoMessage(
                                                    'You can select a country of operation through this picker. Once the country you require comes into view window            (in yellow)you can select the country by tapping on DONE');
                                                optionsController
                                                    .optionIndexSetter(0);
                                                optionsController
                                                    .getMainOptions();
                                                optionsController.setState();
                                                optionsController.showImages();
                                                optionsController.showShadow();
                                                optionsController
                                                    .setOptionList('');
                                              }
                                              if (index == 1) {
                                                viewController.setView('');
                                                keyboardController
                                                    .setPicker('TimeZone');
                                                headerController
                                                    .setSubHeaderLabel(
                                                        'Select Time Zone');
                                                viewController.setView(INFO);
                                                viewController.setInfoMessage(
                                                    languageController
                                                            .languageResponse
                                                            .value
                                                            .YouhaveselectedIndiaasthecountry ??
                                                        '');
                                                //  viewController.setInfoMessage('You have selected India as the country, You may now select the time zone appropriate to the country selected. When the required time zone comes into view window tap DONE to select the required time zone');
                                                optionsController
                                                    .optionIndexSetter(1);
                                                optionsController
                                                    .getMainOptions();
                                                optionsController.setState();
                                                optionsController
                                                    .setOptionList('');
                                              }
                                              if (index == 2) {
                                                headerController
                                                    .setTimeChange();
                                                keyboardController.setPicker(
                                                    'RetailVertical');
                                                headerController
                                                    .setSubHeaderLabel(
                                                        'Pick Retail Vertical');
                                                optionsController
                                                    .optionIndexSetter(2);
                                                optionsController
                                                    .getMainOptions();
                                                optionsController.setState();
                                                optionsController
                                                    .setOptionList('');
                                                viewController.setView(INFO);
                                                viewController.setInfoMessage(
                                                    //'The current Retail Vertical is “GROCERY”. If you want to change it you may do so through the Retail Vertical Picker. If you do not wish to change you may skip it by tapping DONE');
                                                    languageController
                                                            .languageResponse
                                                            .value
                                                            .theCurrentRetailVertical ??
                                                        '');
                                              }
                                              if (index == 3) {
                                                viewController.setView('');
                                                orderController.fetchShare();
                                                optionsController
                                                    .getReviewSettings();
                                                optionsController
                                                    .setOptionList(REVIEWSTORE);
                                                viewController.setView('');
                                                headerController
                                                    .setSubHeaderLabel(
                                                        'Add-Ons');
                                                optionsController
                                                    .optionIndexSetter(0);
                                              }
                                              if (index == 4) {
                                                headerController
                                                    .setTimeChange();
                                                //added by saha
                                                headerController
                                                    .setSubHeaderLabel(
                                                        languageController
                                                                .languageResponse
                                                                .value
                                                                .userSettings ??
                                                            ''
                                                        //'User Settings'
                                                        );
                                                Prefs.superUserLoggedIn
                                                    .then((value) {
                                                  if (value) {
                                                    profileController
                                                        .profilefetch(
                                                            languageController
                                                                .languagenum
                                                                .toString());
                                                    viewController.setView('');
                                                    optionsController
                                                        .getShopList();
                                                    optionsController
                                                        .setOptionList(
                                                            USERSETTINGS);
                                                    // viewController.setUserOption(
                                                    //     USERSETTINGS);
                                                    optionsController
                                                        .hideShadow();
                                                    optionsController
                                                        .userSettingList();
                                                    keyboardController
                                                        .setKeypad("");
                                                    optionsController
                                                        .optionIndexSetter(-1);
                                                    optionsController
                                                        .setSetState();
                                                  } else {
                                                    //added by saha
                                                    viewController
                                                        .setView(INFO);
                                                    viewController
                                                        .setInfoMessage(
                                                      languageController
                                                              .languageResponse
                                                              .value
                                                              .profileError ??
                                                          '',
                                                    );
                                                  }
                                                });
                                              }
                                            },
                                            child: Container(
                                              width: 70,
                                              margin: const EdgeInsets.only(
                                                  top: 10, bottom: 10, left: 3),
                                              decoration: BoxDecoration(
                                                // color: Colors.black12,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    //color: Colors.black,
                                                    width: 0.5),
                                              ),
                                              child: FittedBox(
                                                fit: BoxFit.fill,
                                                child: iconSize(
                                                    optionsController
                                                            .countryDirectAccess[
                                                        index],
                                                    index),
                                              ),
                                            ));
                                      },
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return const SizedBox(
                                          width: 8,
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 90,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey[800]!,
                                  width: 0.3,
                                ),
                              )),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: ListView.separated(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: optionsController
                                          .guestDirectAccess.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                            onTap: () async {
                                              optionsController
                                                  .optionIndexSetter(index);
                                              if (index == 0) {
                                                Prefs.superUserLoggedIn
                                                    .then((value) {
                                                  if (value) {
                                                  } else {
                                                    optionsController
                                                        .changeVerticalRestaurent(
                                                            addressController
                                                                .retailResponse[
                                                                    optionsController
                                                                        .vertical]
                                                                .base64Imageid
                                                                .toString(),
                                                            1);
                                                    //headerController.setHeaderLabel('USER');
                                                    headerController
                                                        .setSubHeaderLabel(
                                                            'Guest User');

                                                    optionsController
                                                        .setOptionList(GUEST);
                                                    optionsController
                                                        .optionIndexSetter(0);
                                                    optionsController
                                                        .setSetState();
                                                    viewController
                                                        .setUserOption(GUEST);
                                                    viewController
                                                        .setView(INFO);
                                                    viewController.setInfoMessage(
                                                        'As a Guest User you can browse the products that are available at shops in selected retail vertical in specific country and in a specified area');
                                                    optionsController
                                                        .hideShadow();
                                                    keyboardController
                                                        .setKeypad('');
                                                    keyboardController
                                                        .setPicker('');
                                                    keyboardController
                                                        .setEdit(false);
                                                    optionsController.guestImageList(
                                                        addressController
                                                            .retailResponse[
                                                                optionsController
                                                                    .vertical]
                                                            .base64Imageid!
                                                            .toString());
                                                    (addressController
                                                                    .retailResponse[
                                                                        optionsController
                                                                            .vertical]
                                                                    .base64Imageid ==
                                                                27 ||
                                                            addressController
                                                                    .retailResponse[
                                                                        optionsController
                                                                            .vertical]
                                                                    .base64Imageid ==
                                                                29)
                                                        ? optionsController
                                                            .changeVerticalRestaurent(
                                                                '202', 4)
                                                        : optionsController
                                                            .changeVerticalRestaurent(
                                                                '322', 4);
                                                    // optionsController.guestImageList();
                                                    addressController
                                                        .fetchVertical(
                                                            languageController
                                                                .languagenum
                                                                .toString());
                                                    cityController
                                                        .fetchCityLogin();
                                                  }
                                                });
                                              }
                                              if (index == 1) {
                                                Prefs.superUserLoggedIn
                                                    .then((value) async {
                                                  if (value) {
                                                  } else {
                                                    print(await Prefs.shopId);
                                                    if (await Prefs.shopId ==
                                                        '') {
                                                      viewController
                                                          .setView(INFO);
                                                      viewController.setInfoMessage(
                                                          'Kindly update the shop in guest, then only you can browse.');
                                                    } else {
                                                      viewController
                                                          .setView('');
                                                      // Handle onTap for image 6
                                                      headerController
                                                          .setSubHeaderLabel(
                                                              'Browse');
                                                      optionsController
                                                          .setOptionList(
                                                              BROWSE);
                                                      optionsController
                                                          .getBrowseOptions();
                                                      optionsController
                                                          .setSetState();
                                                      optionsController
                                                          .optionIndexSetter(0);

                                                      print(
                                                          'Image 6 is tapped...! ');
                                                    }
                                                  }
                                                });
                                              }
                                              if (index == 2) {
                                                Prefs.superUserLoggedIn
                                                    .then((value) {
                                                  if (value) {
                                                    viewController
                                                        .setView(INFO);
                                                    viewController.setInfoMessage(
                                                        'You are already logged in to an account,Kindly log out that account,So that you can able to Register a new account.');
                                                  } else {
                                                    getLocation();
                                                    optionsController
                                                        .setSetState();
                                                    optionsController
                                                        .setOptionList(
                                                            REGISTERNEW);
                                                    optionsController
                                                        .getRegister();
                                                    //optionsController.getBrowseList();
                                                    viewController
                                                        .setView(MOBILENUMBER);

                                                    headerController
                                                        .setSubHeaderLabel(
                                                            'Provide Mobile Number');

                                                    optionsController
                                                        .optionIndexSetter(1);
                                                    guestCountryController
                                                        .fetchzipcode('');
                                                  }
                                                });
                                              }
                                            },
                                            child: Container(
                                              width: 70,
                                              margin: const EdgeInsets.only(
                                                  top: 10, bottom: 10, left: 3),
                                              decoration: BoxDecoration(
                                                // color: Colors.black12,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    //color: Colors.black,
                                                    width: 0.5),
                                              ),
                                              child: FittedBox(
                                                fit: BoxFit.fill,
                                                child: iconSize(
                                                    optionsController
                                                            .guestDirectAccess[
                                                        index],
                                                    index),
                                              ),
                                            ));
                                      },
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return const SizedBox(
                                          width: 8,
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 90,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey[800]!,
                                  width: 0.3,
                                ),
                              )),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: ListView.separated(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: optionsController
                                          .clientDirectAccess.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                            onTap: () async {
                                              optionsController
                                                  .optionIndexSetter(index);
                                              if (index == 0) {
                                                Prefs.superUserLoggedIn
                                                    .then((value) {
                                                  if (value) {
                                                    optionsController
                                                        .setOptionList(CLIENT);
                                                    optionsController
                                                        .getClientOptions();
                                                    viewController.setView('');
                                                    headerController
                                                        .subHeaderLabel(CLIENT);
                                                    shopController
                                                        .downloadRestaurantProduct(
                                                            languageController
                                                                .languagenum
                                                                .toString());
                                                  } else {
                                                    viewController
                                                        .setView(CLIENTLOGIN);
                                                    //added by saha

                                                    headerController
                                                        .subHeaderLabel(LOGIN);
                                                    optionsController
                                                        .optionIndexSetter(1);
                                                    optionsController
                                                        .setSetState();

                                                    optionsController
                                                        .setOptionList(CLIENT);
                                                    optionsController
                                                        .getClientOptions();
                                                  }
                                                });
                                              }
                                              if (index == 1) {
                                                headerController
                                                    .setTimeChange();
                                                headerController
                                                    .setSubHeaderLabel(
                                                        languageController
                                                                .languageResponse
                                                                .value
                                                                .resetPassword ??
                                                            '');
                                                Prefs.superUserLoggedIn
                                                    .then((value) {
                                                  if (value) {
                                                    viewController.setView(
                                                        ClIENTCHANGEPASSWORD);
                                                    optionsController
                                                        .userSettingList();
                                                    optionsController
                                                        .setOptionList(
                                                            USERSETTINGS);
                                                    optionsController
                                                        .setSetState();
                                                    optionsController
                                                        .optionIndexSetter(2);
                                                    profileController
                                                        .profilefetch(
                                                            languageController
                                                                .languagenum
                                                                .toString());

                                                    //viewController.setView(DELAGENTACCESS);
                                                    headerController
                                                        .setSubHeaderLabel(
                                                            'Change Password');
                                                    keyboardController
                                                        .setEdit(false);

                                                    keyboardController
                                                        .setKeypad(
                                                            SYMBOLSKEYBOARD);
                                                    Prefs.superUserEmailId
                                                        .then((value) => {
                                                              Prefs.verticalId
                                                                  .then(
                                                                      (vertical) {
                                                                forggetController.sentOTP(
                                                                    value,
                                                                    'cp',
                                                                    languageController
                                                                        .languagenum
                                                                        .toString());
                                                              })
                                                            });
                                                  } else {
                                                    viewController
                                                        .setView(INFO);
                                                    viewController
                                                        .setInfoMessage(
                                                      // languageController
                                                      //         .languageResponse
                                                      //         .value
                                                      //         .profileError ??
                                                      'Please login to view and reset your password',
                                                    );
                                                  }
                                                });
                                                optionsController.hideShadow();
                                              }
                                              if (index == 2) {
                                                Prefs.superUserLoggedIn
                                                    .then((value) {
                                                  if (value) {
                                                    optionsController
                                                        .optionIndexSetter(0);
                                                    optionsController
                                                        .setSetState();
                                                    headerController
                                                        .setSubHeaderLabel(
                                                            'Address Book');
                                                    configureController
                                                        .fetchCustomerDeliveryAddress(
                                                            languageController
                                                                .languagenum
                                                                .toString());

                                                    keyboardController
                                                        .addProfile
                                                        .value = true;
                                                    keyboardController
                                                        .editProfile
                                                        .value = false;
                                                    viewController.setView(
                                                        CHANGEDELIVERYADDRESS);
                                                    optionsController
                                                        .setOptionList(
                                                            ADDRESSBOOK);
                                                    optionsController
                                                        .getAddressBook();
                                                  } else {
                                                    viewController
                                                        .setView(INFO);
                                                    viewController
                                                        .setInfoMessage(
                                                      'Please login to view and update your Address',
                                                    );
                                                  }
                                                });
                                              }
                                              if (index == 3) {
                                                Prefs.superUserLoggedIn
                                                    .then((value) async {
                                                  if (value) {
                                                    headerController.setSubHeaderLabel(
                                                        //  languageController
                                                        //           .languageResponse
                                                        //           .value
                                                        //           .currentSettings ??
                                                        //  ''
                                                        'Current Settings');

                                                    if (optionsController
                                                                .shoppingMode
                                                                .value ==
                                                            '0' ||
                                                        await Prefs
                                                                .shoppingMode ==
                                                            '0' ||
                                                        await Prefs
                                                                .shoppingMode ==
                                                            '') {
                                                      optionsController
                                                          .getShopFromHomeList(
                                                              addressController
                                                                  .retailResponse[
                                                                      optionsController
                                                                          .vertical]
                                                                  .base64Imageid!
                                                                  .toString());
                                                    } else {
                                                      optionsController.getShopatStore(
                                                          addressController
                                                              .retailResponse[
                                                                  optionsController
                                                                      .vertical]
                                                              .base64Imageid!
                                                              .toString());
                                                    }
                                                    configureController
                                                        .fetchDetails(
                                                            languageController
                                                                .languagenum
                                                                .toString());
                                                    keyboardController
                                                        .setKeypad('');
                                                    keyboardController
                                                        .setPicker('');
                                                    optionsController
                                                        .setSetState();

                                                    optionsController
                                                        .setOptionList(
                                                            CONFIGURE);
                                                    checkCountry();

                                                    // controller
                                                    //     .optionIndexSetter(-1);

                                                    configureController
                                                        .fetchCustomerDeliveryAddress(
                                                            languageController
                                                                .languagenum
                                                                .toString());
                                                    configureController
                                                        .fetchShopType(
                                                            languageController
                                                                .languagenum
                                                                .toString());
                                                    optionsController
                                                        .setSetState();
                                                  } else {
                                                    viewController
                                                        .setView(INFO);
                                                    viewController
                                                        .setInfoMessage(
                                                      languageController
                                                              .languageResponse
                                                              .value
                                                              .updateYourConfigureDetails ??
                                                          '',
                                                    );
                                                  }
                                                });

                                                optionsController.setSetState();
                                                optionsController.hideShadow();
                                                keyboardController
                                                    .setKeypad("");

                                                // Handle onTap for image 3
                                              }
                                              if (index == 4) {
                                                headerController
                                                    .setTimeChange();
                                                Prefs.superUserLoggedIn
                                                    .then((value) async {
                                                  if (value) {
                                                    print("shop id =====${await Prefs.shopId}");
                                                    print("vertical id =====${await Prefs.verticalId}");
                                                    if (await Prefs.shopId ==
                                                            '' &&
                                                        await Prefs
                                                                .verticalId ==
                                                            '') {
                                                      viewController
                                                          .setView(INFO);
                                                      viewController.setInfoMessage(
                                                          'Kindly update the shop and vertical in Current Settings, then only you can shop.');
                                                    } else {
                                                      if (optionsController
                                                                  .outlet ==
                                                              '202' ||
                                                          optionsController
                                                                  .outlet ==
                                                              '41') {
                                                        Prefs
                                                            .setSuperUserShopId(
                                                                true);
                                                        // shopController
                                                        //     .downloadRestaurantProduct(
                                                        //         languageController
                                                        //             .languagenum
                                                        //             .toString());

                                                        headerController
                                                            .setSubHeaderLabel(
                                                                languageController
                                                                        .languageResponse
                                                                        .value
                                                                        .shop ??
                                                                    '');
                                                        // keyboardController
                                                        //     .setEdit(false);
                                                        viewController
                                                            .setView('');
                                                        optionsController
                                                            .getShopList();
                                                        optionsController
                                                            .setOptionList(
                                                                SHOP);

                                                        // viewController
                                                        //     .setUserOption(SHOP);
                                                        optionsController
                                                            .hideShadow();
                                                        keyboardController
                                                            .setKeypad('');
                                                        keyboardController
                                                            .setPicker('');
                                                        optionsController
                                                            .optionIndexSetter(
                                                                0);
                                                        optionsController
                                                            .setSetState();
                                                        //}
                                                      }
                                                      //}

                                                      else {
                                                        //sofiya..
                                                        if (viewController
                                                                .qrvalue !=
                                                            "") {
                                                          optionsController
                                                              .setSetState();
                                                          headerController
                                                              .setSubHeaderLabel(
                                                                  languageController
                                                                          .languageResponse
                                                                          .value
                                                                          .shop ??
                                                                      '');
                                                          keyboardController
                                                              .setEdit(false);
                                                          optionsController
                                                              .getShopList();
                                                          optionsController
                                                              .setOptionList(
                                                                  SHOP);
                                                          // viewController
                                                          //     .setUserOption(SHOP);
                                                          viewController
                                                              .setView('');
                                                          optionsController
                                                              .hideShadow();
                                                          keyboardController
                                                              .setKeypad("");
                                                          optionsController
                                                              .optionIndexSetter(
                                                                  0);
                                                          optionsController
                                                              .setSetState();
                                                        } else {
                                                          if (configureController
                                                                  .fetchdetails
                                                                  .value
                                                                  .menu![0]
                                                                  .subMenu![0]
                                                                  .value! !=
                                                              'SHOP FROM HOME') {
                                                            viewController
                                                                .setView(
                                                                    RESQRCODE);
                                                          } else {
                                                            optionsController
                                                                .setSetState();
                                                            headerController.setSubHeaderLabel(
                                                                languageController
                                                                        .languageResponse
                                                                        .value
                                                                        .shop ??
                                                                    '');
                                                            keyboardController
                                                                .setEdit(false);
                                                            optionsController
                                                                .getShopList();
                                                            optionsController
                                                                .setOptionList(
                                                                    SHOP);
                                                            // viewController
                                                            //     .setUserOption(SHOP);
                                                            viewController
                                                                .setView('');
                                                            optionsController
                                                                .hideShadow();
                                                            keyboardController
                                                                .setKeypad("");
                                                            optionsController
                                                                .optionIndexSetter(
                                                                    -1);
                                                            optionsController
                                                                .setSetState();
                                                          }
                                                        }
                                                      }
                                                    }
                                                  } else {
                                                    viewController
                                                        .setView(INFO);
                                                    viewController
                                                        .setInfoMessage(
                                                      languageController
                                                              .languageResponse
                                                              .value
                                                              .updateYourShopDetails ??
                                                          '',
                                                    );
                                                  }
                                                });
                                              }
                                              if (index == 5) {
                                                if (optionsController
                                                        .shoppingMode.value ==
                                                    '1') {
                                                  optionsController
                                                      .getShopatStoreOptions();
                                                  optionsController
                                                      .setOptionList(
                                                          SHOPATSTORE);
                                                  headerController
                                                      .setSubHeaderLabel(
                                                          'Shop at Store');
                                                  viewController.setView(INFO);
                                                  viewController.setInfoMessage(
                                                      'You can use the same App to shop at store and pay for the material without having to stand in Cashiers Queue. When you enter the shop the shop name will be automatically populated');

                                                  optionsController
                                                      .optionIndexSetter(0);
                                                  optionsController
                                                      .setSetState();
                                                } else {}
                                              }
                                            },
                                            child: Container(
                                              width: 70,
                                              margin: const EdgeInsets.only(
                                                  top: 10, bottom: 10, left: 3),
                                              decoration: BoxDecoration(
                                                // color: Colors.black12,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    //color: Colors.black,
                                                    width: 0.5),
                                              ),
                                              child: FittedBox(
                                                fit: BoxFit.fill,
                                                child: iconSize(
                                                    optionsController
                                                            .clientDirectAccess[
                                                        index],
                                                    index),
                                              ),
                                            ));
                                      },
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return const SizedBox(
                                          width: 8,
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 90,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey[800]!,
                                  width: 0.3,
                                ),
                              )),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: ListView.separated(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: optionsController
                                          .supportDirectAccess.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                            onTap: () {
                                              optionsController
                                                  .optionIndexSetter(index);
                                              if (index == 0) {
                                                headerController
                                                    .setTimeChange();
                                                headerController
                                                    .setSubHeaderLabel(
                                                        languageController
                                                                .languageResponse
                                                                .value
                                                                .support ??
                                                            ''
                                                        // 'Support'
                                                        );
                                                viewController.setView('');
                                                optionsController
                                                    .setOptionList(SUPPORT);
                                                optionsController.getSupport();
                                                optionsController.setSetState();
                                              }
                                              if (index == 1) {
                                                headerController
                                                    .setTimeChange();
                                                viewController
                                                    .setView(TERMSANDCONDITION);
                                                headerController.setSubHeaderLabel(
                                                    languageController
                                                            .languageResponse
                                                            .value
                                                            .termsAndConditions ??
                                                        ''
                                                    //'Terms and Conditions'
                                                    );
                                                optionsController
                                                    .setOptionList(SUPPORT);
                                                optionsController.getSupport();
                                                optionsController
                                                    .optionIndexSetter(5);
                                                optionsController.setSetState();
                                              }
                                              if (index == 2) {
                                                chattyController
                                                    .fetchChattyLogin();

                                                headerController
                                                    .setSubHeaderLabel(
                                                        'Ask Chatty');
                                                viewController.setView(CHATTY);
                                                optionsController.hideShadow();
                                                keyboardController
                                                    .setKeypad(CAPITALKEYBOARD);
                                                keyboardController
                                                    .setPicker('');
                                                optionsController
                                                    .setOptionList(SUPPORT);
                                                optionsController.getSupport();
                                                optionsController
                                                    .optionIndexSetter(4);
                                                optionsController.setSetState();
                                              }
                                              if (index == 3) {
                                                if (addressController
                                                        .retailResponse[
                                                            optionsController
                                                                .vertical]
                                                        .base64Imageid ==
                                                    29) {
                                                  viewController.setView(INFO);
                                                  viewController.setInfoMessage(
                                                      'The following screens provide a DEMO of the power of Augmented Reality and the Immersive Experience it provides. As merchants sign in , the same will be available as part of the respective Application.');
                                                  headerController
                                                      .setSubHeaderLabel(
                                                          'Augmented Reality');
                                                  optionsController
                                                      .setOptionList(AREXP);
                                                  optionsController
                                                      .getArExperience();
                                                  optionsController
                                                      .setSetState();
                                                  optionsController
                                                      .optionIndexSetter(0);

                                                  shopController
                                                      .downloadRestaurantProduct(
                                                          languageController
                                                              .languagenum
                                                              .toString());
                                                } else {}

                                                // Handle onTap for image 2
                                              }
                                              if (index == 4) {}
                                            },
                                            child: Container(
                                              width: 70,
                                              margin: const EdgeInsets.only(
                                                  top: 10, bottom: 10, left: 3),
                                              decoration: BoxDecoration(
                                                // color: Colors.black12,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    //color: Colors.black,
                                                    width: 0.5),
                                              ),
                                              child: FittedBox(
                                                fit: BoxFit.fill,
                                                child: iconSize(
                                                    optionsController
                                                            .supportDirectAccess[
                                                        index],
                                                    index),
                                              ),
                                            ));
                                      },
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return const SizedBox(
                                          width: 8,
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 1,
                              width: double.infinity,
                              color: const Color.fromARGB(255, 82, 79, 79),
                            ),
                            SizedBox(
                                height: GetPlatform.isAndroid
                                    ? (widget.actualHeight - 40) * 0.183
                                    : (widget.actualHeight) * 0.171,
                                width: double.infinity,
                                child: FittedBox(
                                  fit: BoxFit.fill,
                                  child: Image.asset(
                                    'assets/images/add2.jpg',
                                  ),
                                )
                                // color: Color.fromARGB(255, 48, 152, 243),
                                ),
                          ],
                        ),
                      );
                    })
              ],
            )
          ],
        )
      ],
    );
  }

  SizedBox iconSize(controller, int index) {
    return SizedBox(
      width: 75,
      height: 75,
      child: controller,
    );
  }

  checkCountry() async {
    if (await Prefs.tempCountry != '') {
      if (await Prefs.country != await Prefs.tempCountry) {
        //Country not equal return false
        validateCountry = false;
        return false;
      } else {
        //Country equal return true

        validateCountry = true;
        return true;
      }
      // }
    } else {
      validateCountry = true;

      //Country equal return true
      return true;
    }
  }
}
