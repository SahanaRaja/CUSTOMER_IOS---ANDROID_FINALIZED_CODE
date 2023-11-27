import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:customer_assist/core/helpers/SharedPreference/prefs.dart';
import 'package:customer_assist/home/presentation/controllers/city_controller.dart';
import 'package:customer_assist/home/presentation/controllers/configure_controller.dart';
import 'package:customer_assist/home/presentation/controllers/keyboard_controller.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/controllers/owner_data_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/app_constants.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/utils/udid_getter.dart';
import '../../../../database/database.dart';
import '../../controllers/fetch_country_controller.dart';
import '../../controllers/header_controller.dart';
import '../../controllers/options_controller.dart';
import '../../controllers/splash_controller.dart';
import '../../controllers/view_controller.dart';

class DisplayArea extends StatefulWidget {
  // final Size bottomLeft;
  final String content;
  final String heading;
  // final String icon;

  const DisplayArea({
    Key? key,
    required this.content,
    required this.heading,
  }) : super(key: key);
  @override
  _DisplayAreaState createState() => _DisplayAreaState();
}

class _DisplayAreaState extends State<DisplayArea> {
  ViewController viewController = Get.find();
  var languageController = Get.put(LanguageController());
  OptionsController optionsController = Get.find();
  HeaderController headerController = Get.find();
  OptionsController optionController = Get.find();
  KeyboardController keyboardController = Get.find();
  FetchCityController cityController = Get.find();
  ConfigureController configureController = Get.find();
  AddressController addressController = Get.find();
  var fetchCountryController = Get.put(FetchCountryController());
  var splashController = Get.put(SplashController());
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
      getLocation();
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
    if (widget.content ==
        'As a Guest User you can browse the products that are available at shops in selected retail vertical in specific country and in a specified area') {
      Timer(const Duration(seconds: 5), () {
        viewController.setView('');

        if (optionController.optionsKey.value == GUEST) {
          headerController.setTimeChange();

          optionsController.setSetState();
          headerController.setSubHeaderLabel(
              languageController.languageResponse.value.selectCity ?? '');
          optionsController.optionIndexSetter(3);
          cityController.fetchCityLogin();
          keyboardController.setPicker("guestCity");
        }
      });
    } else if (widget.content ==
        'You have selected India. The registered shops in a geographical area will be displayed. Pick up a geographical area in India by tapping on the Select City ICON') {
      Timer(const Duration(seconds: 5), () {
        //viewController.setView('');

        if (optionController.optionsKey.value == GUEST) {
          headerController.setTimeChange();

          optionsController.setSetState();
          headerController.setSubHeaderLabel(
              languageController.languageResponse.value.selectCity ?? '');
          optionsController.optionIndexSetter(3);
          cityController.fetchCityLogin();
          keyboardController.setPicker("guestCity");
        }
      });
    } else if (widget.content == 'Vertical Updated Successfully') {
      //Timer(const Duration(seconds: 5), () {
        // viewController.setView('');
      //   if (optionController.optionsKey.value.toString() == '') {
      //     headerController.setTimeChange();

      //     viewController.setView(DIRECTICONACCESS);
      //     headerController.setSubHeaderLabel('Retail Resonance');
      //     optionController.setSetState();
      //     optionController.showImages();
      //     optionController.getBlankOptions();
      //     optionController.setOptionList(DIRECTACCESS);
      //     optionsController.changeVerticalIcons(
      //         addressController
      //             .retailResponse[optionsController.vertical].base64Imageid
      //             .toString(),
      //         2);
      //   } else if (optionController.optionsKey.value == GUEST) {
      //     // headerController.setTimeChange();
      //     headerController.setSubHeaderLabel(
      //         languageController.languageResponse.value.selectCountry ?? '');
      //     optionController.showShadow();
      //     optionController.setSetState();
      //     optionController.optionIndexSetter(2);
      //     keyboardController.setPicker('guestCountry');
      //   } else if (optionController.optionsKey.value == CONFIGURE) {
      //     // headerController
      //     //        .setTimeChange();
      //     Prefs.superUserLoggedIn.then((value) async {
      //       if (value) {
      //         headerController.setSubHeaderLabel(
      //             languageController.languageResponse.value.currentSettings ??
      //                 ''
      //             // 'Current Settings'
      //             );

      //         if (optionController.shoppingMode.value == '0' ||
      //                 await Prefs.shoppingMode == '0'
      //             //     ||
      //             // await Prefs
      //             //         .shoppingMode ==
      //             //     ''
      //             ) {
      //           optionController.getShopFromHomeList(addressController
      //               .retailResponse[optionsController.vertical].base64Imageid!
      //               .toString());
      //         } else {
      //           optionController.getShopatStore(addressController
      //               .retailResponse[optionsController.vertical].base64Imageid!
      //               .toString());
      //         }
      //         configureController
      //             .fetchDetails(languageController.languagenum.toString());
      //         keyboardController.setKeypad('');
      //         keyboardController.setPicker('');
      //         optionController.setSetState();

      //         optionController.setOptionList(CONFIGURE);
      //         checkCountry();

      //         // controller
      //         //     .optionIndexSetter(-1);

      //         optionController.setSetState();
      //       } else {
      //         viewController.setView(ERROR);
      //         viewController.setErrorMessage(
      //           languageController
      //                   .languageResponse.value.updateYourConfigureDetails ??
      //               '',
      //         );
      //       }
      //     });

      //     optionController.setSetState();
      //     optionsController.hideShadow();
      //     keyboardController.setKeypad("");
      //   }
      // });
    } else if (widget.content == 'Shop Updated Successfully.') {
      Timer(const Duration(seconds: 5), () {
        viewController.setView('');
        if (optionController.optionsKey.value == GUEST) {
          Prefs.setSuperUserShopId(true);
          // headerController.setTimeChange();
          headerController.setSubHeaderLabel(
              languageController.languageResponse.value.browseMethod ?? '');
          optionController.showShadow();
          optionController.setSetState();
          optionController.optionIndexSetter(0);
          optionController.setOptionList(BROWSE);
          optionController.getBrowseOptions();
        } else {
          //             headerController
          //  .setTimeChange();
          Prefs.superUserLoggedIn.then((value) async {
            if (value) {
              headerController.setSubHeaderLabel(
                  languageController.languageResponse.value.currentSettings ??
                      ''
                  // 'Current Settings'
                  );

              if (optionController.shoppingMode.value == '0' ||
                      await Prefs.shoppingMode == '0'
                  //      ||
                  // await Prefs
                  //         .shoppingMode ==
                  //     ''
                  ) {
                optionController.getShopFromHomeList(addressController
                    .retailResponse[optionsController.vertical].base64Imageid!
                    .toString());
              } else {
                optionController.getShopatStore(addressController
                    .retailResponse[optionsController.vertical].base64Imageid!
                    .toString());
              }
              configureController
                  .fetchDetails(languageController.languagenum.toString());
              keyboardController.setKeypad('');
              keyboardController.setPicker('');
              optionController.setSetState();

              optionController.setOptionList(CONFIGURE);
              checkCountry();

              // controller
              //     .optionIndexSetter(-1);

              optionController.setSetState();
            } else {
              viewController.setView(ERROR);
              viewController.setErrorMessage(
                languageController
                        .languageResponse.value.updateYourConfigureDetails ??
                    '',
              );
            }
          });

          optionController.setSetState();
          optionsController.hideShadow();
          keyboardController.setKeypad("");
        }
      });
    } else if (widget.content ==
        'Kindly update the shop in guest, then only you can browse.') {
      Timer(const Duration(seconds: 5), () {
        optionsController.changeVerticalRestaurent(
            addressController
                .retailResponse[optionsController.vertical].base64Imageid
                .toString(),
            1);
        headerController.setHeaderLabel('USER');
        headerController.setSubHeaderLabel('Guest User');

        optionsController.setOptionList(GUEST);
        optionsController.optionIndexSetter(0);
        optionsController.setSetState();
        viewController.setUserOption(GUEST);
        viewController.setView(INFO);
        viewController.setInfoMessage(
            'As a Guest User you can browse the products that are available at shops in selected retail vertical in specific country and in a specified area');
        optionsController.hideShadow();
        keyboardController.setKeypad('');
        keyboardController.setPicker('');
        keyboardController.setEdit(false);
        optionsController.guestImageList(addressController
            .retailResponse[optionsController.vertical].base64Imageid!
            .toString());
        (addressController.retailResponse[optionsController.vertical]
                        .base64Imageid ==
                    27 ||
                addressController.retailResponse[optionsController.vertical]
                        .base64Imageid ==
                    29)
            ? optionsController.changeVerticalRestaurent('202', 4)
            : optionsController.changeVerticalRestaurent('322', 4);
        // optionsController.guestImageList();
        addressController
            .fetchVertical(languageController.languagenum.toString());
      });
    } else if (widget.content ==
        'The current Retail Vertical is “GROCERY”. If you want to change it you may do so through the Retail Vertical Picker. If you do not wish to change you may skip it by tapping DONE') {
      Timer(const Duration(seconds: 5), () {
        // viewController.setView('');
      });
    } else if (widget.content ==
        languageController.languageResponse.value
            .youHaveClickedOnADDICONTapOnRegisterNewICON) {
      Timer(const Duration(seconds: 5), () {
        viewController.setPreviousView();
      });
    } else if (widget.content ==
        'please login first to add this product to your WishList') {
      Timer(const Duration(seconds: 5), () {
        viewController.setPreviousView();
      });
    } else if (widget.content ==
        languageController.languageResponse.value.ChnagePwdInfo) {
      Timer(const Duration(seconds: 5), () {
        viewController.setPreviousView();
      });
    } else if (widget.content == 'Registration Successful') {
      Timer(const Duration(seconds: 5), () {
        viewController.setView('');
        //if (optionController.optionsKey.value == '') {
        // optionsController.getClientOptions();
        viewController.setView(CLIENTLOGIN);
        //added by saha
        // optionsController.setOptionList(CLIENT);
        // headerController.subHeaderLabel(LOGIN);
        // optionsController.optionIndexSetter(1);
        // optionsController.setSetState();
        //}
      });
    } else if (widget.content ==
        'You can select a country of operation through this picker. Once the country you require comes into view window            (in yellow)you can select the country by tapping on DONE') {
      Timer(const Duration(seconds: 5), () {
        viewController.setView('');
      });
    } else if (widget.content ==
        'You have selected India as the country, You may now select the time zone appropriate to the country selected. When the required time zone comes into view window tap DONE to select the required time zone') {
      Timer(const Duration(seconds: 5), () {
        viewController.setView('');
      });
    } else if (widget.content ==
        'You tried to add an Item to the shopping cart.As a Guest User you can only browse.You can buy a product only as a register user.We invite to registered yourself as a Member of the great community of "Retail Resonance - Customer" Application') {
      Timer(const Duration(seconds: 5), () {
        viewController.setView('');
        getLocation();
        // optionsController.setOptionList(REGISTERNEW);
        //  optionsController.getRegister();
        viewController.setView(MOBILENUMBER);
        // optionController.optionIndexSetter(1);
        // optionController.setSetState();
        // headerController.setSubHeaderLabel('Provide Mobile Number');
      });
    } else if (widget.content == 'You have successfully reset your Password') {
      Timer(const Duration(seconds: 5), () {
        viewController.setView('');
        viewController.setView(CLIENTLOGIN);
        // optionController.optionIndexSetter(1);
        // optionController.setSetState();
        // headerController.setSubHeaderLabel(
        //     languageController.languageResponse.value.login ?? '');
      });
    } else if (widget.heading == 'SUCCESS!!') {
      Timer(const Duration(seconds: 5), () {
        // viewController.setView('');
        if (optionController.optionsKey.value == CLIENT) {
          viewController.setView(INFO);
          viewController.setInfoMessage(
              'The following screen indicate the Current  Settings (as per last order). You can change any of the settings  if you so desire. Tap on CUR.SETTINGS ICON and change desired parameters');
          optionController.optionIndexSetter(2);
          optionController.setSetState();
          headerController.setSubHeaderLabel('Current Settings');
        } else if (optionController.optionsKey.value == CONFIGURE) {
          headerController.setTimeChange();
          Prefs.superUserLoggedIn.then((value) async {
            if (value) {
              headerController.setSubHeaderLabel(
                  languageController.languageResponse.value.currentSettings ??
                      ''
                  // 'Current Settings'
                  );

              if (optionController.shoppingMode.value == '0' ||
                      await Prefs.shoppingMode == '0'
                  //     ||
                  // await Prefs
                  //         .shoppingMode ==
                  //     ''
                  ) {
                optionController.getShopFromHomeList(addressController
                    .retailResponse[optionsController.vertical].base64Imageid!
                    .toString());
              } else {
                optionController.getShopatStore(addressController
                    .retailResponse[optionsController.vertical].base64Imageid!
                    .toString());
              }
              configureController
                  .fetchDetails(languageController.languagenum.toString());
              keyboardController.setKeypad('');
              keyboardController.setPicker('');
              optionController.setSetState();

              optionController.setOptionList(CONFIGURE);
              checkCountry();

              // controller
              //     .optionIndexSetter(-1);

              optionController.setSetState();
            } else {
              viewController.setView(ERROR);
              viewController.setErrorMessage(
                languageController
                        .languageResponse.value.updateYourConfigureDetails ??
                    '',
              );
            }
          });

          optionController.setSetState();
          optionsController.hideShadow();
          keyboardController.setKeypad("");
        } else if (optionController.optionsKey.value == ADDRESSBOOK) {
          // if (viewController.viewKey.value !=
          //                             CONFIGURE) {

          configureController.fetchCustomerDeliveryAddress(
              languageController.languagenum.toString());
          viewController.setView('');
          //  optionController.optionIndexSetter(0);
          //       optionController.setSetState();
          //       headerController.setSubHeaderLabel(languageController.languageResponse.value.addressBook??'');
          //       //viewController.setView(CHANGEDELIVERYADDRESS);
          //       optionController.setOptionList(ADDRESSBOOK);
          //       optionController.getAddressBook();
          // }
        }
      });
    } else if (widget.content ==
        languageController.languageResponse.value.logOutConformation) {
      Timer(const Duration(seconds: 5), () {
        viewController.setView('');
      });
    }
    //  else if(widget.content == 'The following screen indicate the Current  Settings (as per last order). You can change any of the settings  if you so desire. Tap on CUR.SETTINGS ICON and change desired parameters'){
    //    Timer(const Duration(seconds: 10), () {
    // viewController.setView('');

    // });

    //  }
    else if (widget.content ==
        'You can use the same App to shop at store and pay for the material without having to stand in Cashiers Queue. When you enter the shop the shop name will be automatically populated') {
      Timer(const Duration(seconds: 10), () {
        viewController.setView(SHOPLIST);
        optionController.optionIndexSetter(1);
        optionController.setSetState();
        headerController.setSubHeaderLabel('Shopping List');
        headerController.setThirdHeaderLabel('Category');
      });
    } else if (widget.content ==
        'The following screens provide a DEMO of the power of Augmented Reality and the Immersive Experience it provides. As merchants sign in , the same will be available as part of the respective Application.') {
      Timer(const Duration(seconds: 10), () {
        viewController.setView(PICKER);
        keyboardController.setPicker('Jewellary');
        headerController.setSubHeaderLabel('Jewellary');
        // optionController.optionIndexSetter(3);
        optionController.setSetState();
      });
    } else if (widget.content ==
        'Mail ID already Exists.If you are previously registered Login. Else choose another Mail ID Continue..') {
      Timer(const Duration(seconds: 10), () {
        viewController.setView(FIRSTTIME);
        optionController.optionIndexSetter(3);
        optionController.setSetState();
        headerController.setSubHeaderLabel('Provide Mail ID');
      });
    } else if (widget.content ==
        'Kindly update the shop in client, then only you can shop.') {
      Timer(const Duration(seconds: 5), () {
        Prefs.superUserLoggedIn.then((value) async {
          if (value) {
            headerController.setSubHeaderLabel(
                languageController.languageResponse.value.currentSettings ?? ''
                // 'Current Settings'
                );

            if (optionController.shoppingMode.value == '0' ||
                    await Prefs.shoppingMode == '0'
                //     ||
                // await Prefs
                //         .shoppingMode ==
                //     ''
                ) {
              optionController.getShopFromHomeList(addressController
                  .retailResponse[optionsController.vertical].base64Imageid!
                  .toString());
            } else {
              optionController.getShopatStore(addressController
                  .retailResponse[optionsController.vertical].base64Imageid!
                  .toString());
            }
            configureController
                .fetchDetails(languageController.languagenum.toString());
            keyboardController.setKeypad('');
            keyboardController.setPicker('');
            optionController.setSetState();

            optionController.setOptionList(CONFIGURE);
            checkCountry();

            // controller
            //     .optionIndexSetter(-1);

            optionController.setSetState();
          } else {
            viewController.setView(ERROR);
            viewController.setErrorMessage(
              languageController
                      .languageResponse.value.updateYourConfigureDetails ??
                  '',
            );
          }
        });
      });
    } else if (widget.content ==
        languageController.languageResponse.value.theLocationServicesAreUsed) {
      Timer(const Duration(seconds: 10), () {
        viewController.setPreviousView();
        //getLocation();
      });
    } else if (widget.content ==
        'You are already logged in to an account,Kindly log out that account,So that you can able to Register a new account.') {
      Timer(const Duration(seconds: 5), () {
        // optionsController.getClientOptions();
        viewController.setView(CAUTION);
        // headerController.subHeaderLabel(
        //     languageController.languageResponse.value.logout ?? ''
        //     //LOGOUT
        //     );
        // keyboardController.setKeypad('');
        // optionsController.getclientLogout();
        // optionsController.setState();
        // optionsController.setOptionList(CLIENT);
        // headerController.subHeaderLabel(LOGOUT);
        // optionsController.optionIndexSetter(1);
        // optionsController.setSetState();
      });
    }

    SizeConfig().init(context);
    return 
    Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
        color: Colors.white,
      ),
      height: Platform.isAndroid
          ? SizeConfig.availableHeight / 3.9
          : SizeConfig.availableHeight / 3.78,
      width: 102.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 45,
            // width: SizeConfig.screenWidth - 100,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.subHeaderContainer,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                widget.heading == 'Information' ||
                        widget.heading == 'INFO' ||
                        widget.heading == 'SUCCESS!!'
                    ? getHeaderLogo('Info')
                    : widget.heading == 'ERROR'
                        ? getHeaderLogo('Alert White BG')
                        : Container(),
                AutoSizeText(
                  widget.heading,
                  style: const TextStyle(fontSize: 22),
                  maxFontSize: 30,
                ),
                GestureDetector(
                  onTap: () {
                    print(widget.content);
                    if (widget.content == 'Please Login first ' ||
                        widget.content ==
                            'Please log in to view and update you profile details' ||
                        widget.content ==
                            'Please Login first before attempting to view and or edit the Business Information' ||
                        widget.content == 'Please log in to Change Password' ||
                        widget.content ==
                            'Please Enter the mail ID to proceed further!') {
                      // optionsController.optionIndexSetter(1);

                      // headerController.subHeaderLabel(LOGIN);
                      optionsController.setSetState();
                      if (viewController.useroption.value == CLIENT) {
                        viewController.setPreviousView(view: CLIENTLOGIN);
                      }
                    } else if (viewController.viewKey.value ==
                        SUCCESSMERCHANT) {
                    } else if (widget.content ==
                        "There are no pages visited earlier by the ${viewController.useroption.value}") {
                      viewController.setView('');
                      headerController.setSubHeaderLabel(
                          languageController.languageResponse.value.users ??
                              '');
                    } else if (widget.content == 'Registration Successful') {
                      //if (viewController.useroption.value == CLIENT) {
                      // optionsController.getClientOptions();
                      viewController.setView(CLIENTLOGIN);
                      //added by saha
                      // optionsController.setOptionList(CLIENT);
                      // headerController.subHeaderLabel(LOGIN);
                      // optionsController.optionIndexSetter(1);
                      // optionsController.setSetState();
                      // }
                    } else if (widget.content ==
                        'WELCOME  Have a nice shopping day!') {
                      viewController.setView(OWNERDETAILS);
                    } else if (widget.heading == 'Welcome') {
                      viewController.setView(OWNERDETAILS);
                     
                    } 
                    // else if (widget.heading == 'SUCCESS!!') {
                    //   viewController.setView(OWNERDETAILS);
                    //   // if (optionController.optionsKey.value == CLIENT) {
                    //   //   viewController.setView(INFO);
                    //   //   viewController.setInfoMessage(
                    //   //       'The following screen indicate the Current  Settings (as per last order). You can change any of the settings  if you so desire. Tap on CUR.SETTINGS ICON and change desired parameters');
                    //   // }
                    //   if (optionController.optionsKey.value == ADDRESSBOOK) {
                    //     viewController.setView('');
                    //     //  optionsController.optionIndexSetter(0);
                    //     // optionsController.setSetState();
                    //     headerController.setSubHeaderLabel('Address Book');
                    //     configureController.fetchCustomerDeliveryAddress(
                    //         languageController.languagenum.toString());

                    //     // keyboardController.addProfile.value = true;
                    //     // keyboardController.editProfile.value = false;
                    //     // viewController.setView(CHANGEDELIVERYADDRESS);
                    //     // optionsController.setOptionList(ADDRESSBOOK);
                    //     // optionsController.getAddressBook();
                    //     // // }
                    //   }
                   // } 
                    else if (widget.content ==
                        'Vertical Updated Successfully') {
                       viewController.setView('');
                      // if (optionController.optionsKey.value == GUEST) {
                      //   headerController.setTimeChange();

                      //   headerController.setSubHeaderLabel('Select Country'
                      //       //languageController .languageResponse.value.selectCountry ??''
                      //       );
                      //   optionController.showShadow();
                      //   optionController.setSetState();
                      //   optionController.optionIndexSetter(2);
                      //   keyboardController.setPicker('guestCountry');
                      // } else if (optionController.optionsKey.value == '') {
                      //   setState(() {
                      //     viewController.setView(DIRECTICONACCESS);
                      //     headerController
                      //         .setSubHeaderLabel('Retail Resonance');
                      //     optionController.setSetState();
                      //     optionController.showImages();
                      //     optionController.getBlankOptions();
                      //     optionController.setOptionList(DIRECTACCESS);
                      //   });
                      // } else if (optionController.optionsKey.value ==
                      //     CONFIGURE) {
                      //   headerController.setTimeChange();
                      //   Prefs.superUserLoggedIn.then((value) async {
                      //     if (value) {
                      //       headerController.setSubHeaderLabel(
                      //           languageController.languageResponse.value
                      //                   .currentSettings ??
                      //               ''
                      //           // 'Current Settings'
                      //           );

                      //       if (optionController.shoppingMode.value == '1' ||
                      //               await Prefs.shoppingMode == '1'
                      //           //      ||
                      //           // await Prefs
                      //           //         .shoppingMode ==
                      //           //     ''
                      //           ) {
                      //         optionController.getShopFromHomeList(
                      //             addressController
                      //                 .retailResponse[
                      //                     optionsController.vertical]
                      //                 .base64Imageid!
                      //                 .toString());
                      //       } else {
                      //         optionController.getShopatStore(addressController
                      //             .retailResponse[optionsController.vertical]
                      //             .base64Imageid!
                      //             .toString());
                      //       }
                      //       configureController.fetchDetails(
                      //           languageController.languagenum.toString());
                      //       keyboardController.setKeypad('');
                      //       keyboardController.setPicker('');
                      //       optionController.setSetState();

                      //       optionController.setOptionList(CONFIGURE);
                      //       checkCountry();

                      //       // controller
                      //       //     .optionIndexSetter(-1);

                      //       optionController.setSetState();
                      //     } else {
                      //       viewController.setView(ERROR);
                      //       viewController.setErrorMessage(
                      //         languageController.languageResponse.value
                      //                 .updateYourConfigureDetails ??
                      //             '',
                      //       );
                      //     }
                      //   });
                      //   // controller
                      //   //     .setOptionList(CONFIGURE);
                      //   // checkCountry();
                      //   // viewController
                      //   //     .setUserOption(CONFIGURE);

                      //   optionController.setSetState();
                      //   optionsController.hideShadow();
                      //   keyboardController.setKeypad("");
                      // }
                    } else if (widget.content == 'Shop Updated Successfully.') {
                      viewController.setView('');
                      if (optionController.optionsKey.value == GUEST) {
                        headerController.setTimeChange();
                        headerController.setSubHeaderLabel('Browse Method'
                            // languageController
                            //       .languageResponse
                            //       .value
                            //       .browseMethod ??''
                            );

                        optionController.showShadow();
                        optionController.setSetState();
                        optionController.optionIndexSetter(5);
                        configureController.getData();
                        keyboardController.setPicker('BrowseMethod');
                      }
                    } else if (widget.content ==
                        'Please login to view and update your Address') {
                      viewController.setPreviousView();
                    } else if (widget.content ==
                        'Please login to view and update your Configure Details') {
                      viewController.setPreviousView();
                    } else if (widget.content ==
                        'Please login to view and update your Shop details') {
                      viewController.setPreviousView();
                    } else if (widget.content ==
                        'Please login to change your Shopping mode') {
                      viewController.setView('');
                    } else if (widget.content ==
                        'Please login to view User Settings') {
                      viewController.setView('');
                    } else if (widget.content ==
                        'Please login to view change your password') {
                      viewController.setView('');
                    } else if (widget.content ==
                        'Please login to access the Additional Review features') {
                      viewController.setView('');
                    } else if (widget.content ==
                        'Please login to access the calculator features') {
                      viewController.setView('');
                    } else if (widget.content ==
                        'Please login to view Support features') {
                      viewController.setView('');
                    } else if (widget.content ==
                        'Please login to view Terms & Conditions features') {
                      viewController.setView('');
                    } else if (widget.content ==
                        'AR experience feature will be coming soon!') {
                      viewController.setView('');
                    } else if (widget.content ==
                        'Market place feature will be coming soon!') {
                      viewController.setView('');
                    } else if (widget.content ==
                        'You have successfully reset your password') {
                      viewController.setView('');
                    } else if (widget.content ==
                        'Your profile has been updated successfully.') {
                      viewController.setView('');
                    } else if (widget.content ==
                        'As a Guest User you can browse the products that are available at shops in selected retail vertical in specific country and in a specified area') {
                      viewController.setView('');
                      if (optionController.optionsKey.value == GUEST) {
                        headerController.setTimeChange();

                        optionsController.setSetState();
                        headerController.setSubHeaderLabel(languageController
                                .languageResponse.value.selectCity ??
                            '');
                        optionsController.optionIndexSetter(3);
                        cityController.fetchCityLogin();
                        keyboardController.setPicker("guestCity");
                      }
                    } else if (widget.content ==
                        'The current Retail Vertical is “GROCERY”. If you want to change it you may do so through the Retail Vertical Picker. If you do not wish to change you may skip it by tapping DONE') {
                      viewController.setView('');
                    } else if (widget.content ==
                        languageController.languageResponse.value
                            .youHaveClickedOnADDICONTapOnRegisterNewICON) {
                      viewController.setPreviousView();
                    } else if (widget.content ==
                        'You tried to add an Item to the shopping cart.As a Guest User you can only browse.You can buy a product only as a register user.We invite to registered yourself as a Member of the great community of "Retail Resonance - Customer" Application') {
                      getLocation();
                      viewController.setView(MOBILENUMBER);
                      // optionController.optionIndexSetter(1);
                      // optionController.setSetState();
                      // headerController.setSubHeaderLabel('Provide Mobile Number');
                      // optionsController.setOptionList(REGISTERNEW);
                      // optionsController.getRegister();
                    } else if (widget.content ==
                        'You have successfully reset your Password') {
                      viewController.setView(CLIENTLOGIN);
                      // optionController.optionIndexSetter(1);
                      // optionController.setSetState();
                      // headerController.setSubHeaderLabel(LOGIN);
                    } else if (widget.content ==
                        'You can use the same App to shop at store and pay for the material without having to stand in Cashiers Queue. When you enter the shop the shop name will be automatically populated') {
                      viewController.setView(SHOPLIST);
                      optionController.optionIndexSetter(1);
                      optionController.setSetState();
                      headerController.setSubHeaderLabel('Shopping List');
                      headerController.setThirdHeaderLabel('Category');
                    } else if (widget.content ==
                        'Mail ID already Exists.If you are previously registered Login. Else choose another Mail ID Continue..') {
                      viewController.setView(FIRSTTIME);
                      optionController.optionIndexSetter(3);
                      optionController.setSetState();
                      headerController.setSubHeaderLabel('Provide Mail ID');
                    } else if (widget.content ==
                        'Kindly update the shop in guest, then only you can browse.') {
                      optionsController.changeVerticalRestaurent(
                          addressController
                              .retailResponse[optionsController.vertical]
                              .base64Imageid
                              .toString(),
                          1);
                      headerController.setHeaderLabel('USER');
                      headerController.setSubHeaderLabel('Guest User');

                      optionsController.setOptionList(GUEST);
                      optionsController.optionIndexSetter(0);
                      optionsController.setSetState();
                      viewController.setUserOption(GUEST);
                      viewController.setView(INFO);
                      viewController.setInfoMessage(
                          'As a Guest User you can browse the products that are available at shops in selected retail vertical in specific country and in a specified area');
                      optionsController.hideShadow();
                      keyboardController.setKeypad('');
                      keyboardController.setPicker('');
                      keyboardController.setEdit(false);
                      optionsController.guestImageList(addressController
                          .retailResponse[optionsController.vertical]
                          .base64Imageid!
                          .toString());
                      (addressController
                                      .retailResponse[
                                          optionsController.vertical]
                                      .base64Imageid ==
                                  27 ||
                              addressController
                                      .retailResponse[
                                          optionsController.vertical]
                                      .base64Imageid ==
                                  29)
                          ? optionsController.changeVerticalRestaurent('202', 4)
                          : optionsController.changeVerticalRestaurent(
                              '322', 4);
                      // optionsController.guestImageList();
                      addressController.fetchVertical(
                          languageController.languagenum.toString());
                    } else if (widget.content ==
                        'You are already logged in to an account,Kindly log out that account,So that you can able to Register a new account.') {
                      // optionsController.getClientOptions();
                      viewController.setView(CAUTION);
                      // headerController.subHeaderLabel(
                      //     languageController.languageResponse.value.logout ?? ''
                      //     //LOGOUT
                      //     );
                      keyboardController.setKeypad('');
                     
                    } else if(widget.content == 'Device Address Successfully Updated'){
                      viewController.setView(EMPTYPAGE);
                        configureController.fetchCustomerDeliveryAddress(
                            languageController.languagenum.toString());
                    }
                    else {
                      viewController.setPreviousView();

                      //viewController.setView('');
                    }
                  },
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/close.png'),
                          fit: BoxFit.fill),
                    ),
                  ),
                )
                // getImagenBase64(closeIcon),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                color: Colors.white,
                height: 300,
                width: 400,
                child: Center(
                  child: AutoSizeText(
                    widget.content,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getHeaderLogo(String iconName) => FutureBuilder<String>(
        future: getSingleImage(iconName),
        builder: (builder, imageSnapShot) {
          if (imageSnapShot.hasData) {
            return Image.memory(
              base64Decode(imageSnapShot.data!),
              fit: BoxFit.fill,
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      );

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
