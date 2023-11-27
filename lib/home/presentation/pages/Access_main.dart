// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, prefer_const_constructors_in_immutables

import 'package:customer_assist/core/helpers/SharedPreference/prefs.dart';
import 'package:customer_assist/home/data/configure/datasources/configure_data_remote_data_source.dart';
import 'package:customer_assist/home/presentation/controllers/fetch_country_controller.dart';
import 'package:customer_assist/home/presentation/controllers/guest_fetchCountry_controller.dart';
import 'package:customer_assist/home/presentation/controllers/header_controller.dart';
import 'package:customer_assist/home/presentation/controllers/keyboard_controller.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/controllers/owner_data_controller.dart';
import 'package:customer_assist/home/presentation/controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../../../../core/app_constants.dart';
import '../../../core/utils/udid_getter.dart';
import '../controllers/configure_controller.dart';
// import '../../controllers/header_controller.dart';
// import 'manager_access.dart';

class MainAccess extends StatefulWidget {
  double actualHeight;
  MainAccess({
    Key? key,
    required this.actualHeight,
  }) : super(key: key);

  @override
  State<MainAccess> createState() => _MainAccessState();
}

class _MainAccessState extends State<MainAccess> {
  var headerController = Get.put(HeaderController());
  var keyboardController = Get.put(KeyboardController());
  var languageController = Get.put(LanguageController());
  var fetchCountryController = Get.put(FetchCountryController());
  var splashController = Get.put(SplashController());
  var GuestCountryController = Get.put(GuestFetchCountryController());
  var addressController = Get.put(AddressController());
   var configureController = Get.put(ConfigureController());

  bool permissionGranted = false;
  late Position position;
  var udid;
  var countryFlag;
  double actualHeight = 0;

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

   // print(serviceEnabled);
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error(
        languageController
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
     // getLocation();
      viewController.setView(ERROR);
      viewController.setErrorMessage(languageController
              .languageResponse.value.theLocationServicesAreUsed ??
          '');
      

      // return Future.error(
      //     languageController.languageResponse.value.locationDeniedError ?? '');
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
    // print("***************************************" +
    //     position.latitude.toString());
    // print("***************************************" +
    //     position.longitude.toString());
    // print(placemarks);
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
      //print(udid);
      return UDIDError(udid);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            height: GetPlatform.isAndroid
                ? (widget.actualHeight - 40) / 1.37
                // 18.1
                : (widget.actualHeight -
                        MediaQuery.of(context).padding.bottom) /
                    17.9 *
                    14.1,
            // height: MediaQuery.of(context).size.height * 0.70,
            width: double.infinity,
            color: Colors.white,
            child: _hexaimages(),
          ),
        ),
      ],
    );
  }

  _hexaimages() {
    return Stack(
      children: [
        Positioned(
          // top: 155,
          top: 260,
          left: 0,
          right: 200,
          child: Container(
            // color: Colors.amber,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Prefs.superUserLoggedIn.then((value) {
                      if (value) {

                      } else {
                        optionsController.changeVerticalRestaurent(
                            addressController
                                .retailResponse[optionsController.vertical]
                                .base64Imageid
                                .toString(),
                            1);
                        //headerController.setHeaderLabel('USER');
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
                            ? optionsController.changeVerticalRestaurent(
                                '202', 4)
                            : optionsController.changeVerticalRestaurent(
                                '322', 4);
                        // optionsController.guestImageList();
                        addressController.fetchVertical(
                            languageController.languagenum.toString());
                      }
                    });

                    // Handle onTap for image 1;
                    print(' Image 1 is tapped...! ');
                  },
                  child: Container(
                      height: 100, width: 120, child: optionsController.guest),
                ),
                SizedBox(height: 10.0),
                GestureDetector(
                  onTap: () {
                    print(' Image 2 is tapped...! ');
                  },
                  child: Container(
                      height: 100,
                      width: 120,
                      child: optionsController.retailvertical),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          // top: 100,
          top: 205,
          // 85,
          left: 0,
          right: 0,
          child: Container(
            // color: Colors.red,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Prefs.superUserLoggedIn.then((value) {
                      if (value) {
                        viewController.setView(INFO);
                        viewController.setInfoMessage(
                            'You are already logged in to an account,Kindly log out that account,So that you can able to Register a new account.');
                      } else {
                        getLocation();
                        optionsController.setSetState();
                        optionsController.setOptionList(REGISTERNEW);
                        optionsController.getRegister();
                        //optionsController.getBrowseList();
                        viewController.setView(MOBILENUMBER);

                        headerController
                            .setSubHeaderLabel('Provide Mobile Number');

                        optionsController.optionIndexSetter(1);
                      }
                    });

                    // Handle onTap for image 3
                    print(' Image 3 is tapped...! ');
                  },
                  child: Container(
                      height: 100,
                      width: 120,
                      child: optionsController.registeraccess),
                ),
                SizedBox(height: 10.0),
                GestureDetector(
                  onTap: () {
                    // Handle onTap for image 4
                    print(' Image 4 is tapped...! ');
                  },
                  child: Container(
                      height: 100,
                      width: 120,
                      child: optionsController.countryaccess),
                ),
                SizedBox(height: 10.0),
                GestureDetector(
                  onTap: () {
                   
                        viewController.setView(ADDONSACCESS);
                        headerController
                            .setSubHeaderLabel('Direct Access - Add-Ons');
                     
                    // Handle onTap for image 5
                    print(' Image 5 is tapped...! ');
                  },
                  child: Container(
                      height: 100, width: 120, child: optionsController.addons),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 260,
          left: 199,
          right: 0,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: ()async {
                    Prefs.superUserLoggedIn.then((value)async {
                      if (value) {

                      }else{
                        print(await Prefs.shopId);
                      if(await Prefs.shopId == ''){
                         viewController.setView(INFO);
                         viewController.setInfoMessage('Kindly update the shop in guest, then only you can browse.');
                         

                      }else{
                         viewController.setView('');
                        // Handle onTap for image 6
                        headerController.setSubHeaderLabel('Browse');
                        optionsController.setOptionList(BROWSE);
                        optionsController.getBrowseOptions();
                        optionsController.setSetState();
                        optionsController.optionIndexSetter(0);

                        print('Image 6 is tapped...! ');

                      }
                      }
                      });
                      
                       

                      
                       
                      
                  },
                  child: Container(
                      height: 100, width: 120, child: optionsController.browse),
                ),
                SizedBox(height: 10.0),
                GestureDetector(
                  onTap: () {
                    Prefs.superUserLoggedIn.then((value) {
                      if (value) {
                        viewController.setView(CLIENTLOGOUT);
                        headerController
                            .setSubHeaderLabel('Direct Access - Client');
                            configureController.fetchCustomerDeliveryAddress(
                            languageController.languagenum.toString());
                      } else {
                        viewController.setView(CLIENTACCESS);
                        headerController
                            .setSubHeaderLabel('Direct Access - Client');
                      }
                    });

                    // Handle onTap for image 7
                    print(' Image 7 is tapped...! ');
                  },
                  child: Container(
                      height: 100, width: 120, child: optionsController.client),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
