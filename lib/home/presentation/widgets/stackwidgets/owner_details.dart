// ignore_for_file: unused_field, non_constant_identifier_names, avoid_types_as_parameter_names, prefer_const_constructors, unused_local_variable, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, must_be_immutable

import 'package:customer_assist/core/app_colors.dart';
import 'package:customer_assist/core/helpers/SharedPreference/prefs.dart';
import 'package:customer_assist/home/presentation/controllers/configure_controller.dart';
import 'package:customer_assist/home/presentation/controllers/guest_fetchCountry_controller.dart';
import 'package:customer_assist/home/presentation/controllers/header_controller.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/controllers/options_controller.dart';
import 'package:customer_assist/home/presentation/controllers/owner_data_controller.dart';
import 'package:customer_assist/home/presentation/controllers/view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/app_constants.dart';
import '../../../../core/app_style.dart';
import '../../controllers/keyboard_controller.dart';
import '../keyboard/alpha_capital_letters.dart';
import '../keyboard/alpha_small_letters.dart';
import '../keyboard/numeral_special_char.dart';

class MobileOwnDataTab extends StatefulWidget {
  final TextEditingController mainController;
  final TextEditingController firstController;
  final TextEditingController lastController;
  final TextEditingController addr1Controller;
  final TextEditingController addr2Controller;
  final TextEditingController locationController;
  final TextEditingController cityController;
  final TextEditingController stateController;
  final TextEditingController localityController;
  final TextEditingController countryController;
  final TextEditingController postalController;
  final TextEditingController mobileController;
  final TextEditingController mobileController1;
  final TextEditingController mobileController2;

  final TextEditingController areaCodeController;
  final double actualHeight;

  const MobileOwnDataTab({
    Key? key,
    required this.mainController,
    required this.actualHeight,
    required this.firstController,
    required this.lastController,
    required this.addr1Controller,
    required this.addr2Controller,
    required this.locationController,
    required this.cityController,
    required this.stateController,
    required this.localityController,
    required this.countryController,
    required this.postalController,
    required this.mobileController,
    required this.mobileController1,
    required this.mobileController2,
    required this.areaCodeController,
  }) : super(key: key);

  @override
  _MobileOwnDataTabState createState() => _MobileOwnDataTabState();
}

class _MobileOwnDataTabState extends State<MobileOwnDataTab> {
  final FocusNode _focuss = FocusNode();
  final FocusNode _focussFirst = FocusNode();
  final FocusNode _focussLast = FocusNode();
  final FocusNode _focussCity = FocusNode();
  final FocusNode _focussMail = FocusNode();
  final FocusNode _focussMob = FocusNode();
  final FocusNode _focussCountry = FocusNode();
  final FocusNode _focussPostal = FocusNode();
  final FocusNode _focussState = FocusNode();
  final FocusNode _focussAdr1 = FocusNode();
  final FocusNode _focussAdr2 = FocusNode();
  final FocusNode _focussLocation = FocusNode();
  final FocusNode _focussareaCode = FocusNode();
  final FocusNode _focusMobile = FocusNode();
  final FocusNode _focusMobile1 = FocusNode();
  final FocusNode _focusMobile2 = FocusNode();

  bool _isFocuse = false;
  bool _isFocuseFirst = false;
  bool _isFocuseLast = false;
  bool _isFocuseLocation = false;
  bool _isFocuseCity = false;
  bool _isFocuseState = false;
  bool _isFocuseCountry = false;
  bool _isFocusePostal = false;
  bool _isFocuseAddr1 = false;
  bool _isFocuseAddr2 = false;
  bool _isFocuseMobile = false;
  bool _isFocuseMobile1 = false;
  bool _isFocuseMobile2 = false;

  bool _isFocuseAreaCode = false;
  bool home = false;
  bool office = false;
  KeyboardController keyboardController = Get.find();
  AddressController addressController = Get.find();
  ConfigureController configureController = Get.find();
  ViewController viewController = Get.find();
  OptionsController optionsController = Get.find();
  double actualHeight = 0;
  var languageController = Get.put(LanguageController());
  final ScrollController _scrollController = ScrollController();
  GuestFetchCountryController guestfetchciuntryController = Get.find();
  var guestfetchcountryController = Get.put(GuestFetchCountryController());
  HeaderController headerController = Get.find();

  // var GuestCountryController = Get.put(GuestFetchCountryController());
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastNAme = TextEditingController();
  final TextEditingController mobile = TextEditingController();
  final TextEditingController country = TextEditingController();
  final TextEditingController locality = TextEditingController();
  final TextEditingController area = TextEditingController();
  final TextEditingController add1 = TextEditingController();
  final TextEditingController add2 = TextEditingController();
  final TextEditingController postalCode = TextEditingController();

  String? storedMailCode;
  String? storedMobileCode;
  @override
  void initState() {
    getStoredMailCode().then((value) {
      setState(() {
        storedMailCode = value;
      });
    });
    getStoredMobileCode().then((value) {
      setState(() {
        storedMobileCode = value;
      });
    });
    print(addressController.fetchAddressResponse);

    if (viewController.viewKey.value == OWNERDETAILS) {
      if (addressController.fetchAddressResponse.isNotEmpty) {
        initializeValues();
      }
    } else if (viewController.viewKey.value == EDITADDRESS) {
      widget.mainController.text = '';
      widget.firstController.text = configureController
          .deliveryAddress[viewController.addressbookselectedindex].firstName!;
      widget.lastController.text = configureController
          .deliveryAddress[viewController.addressbookselectedindex].lastName!;
      widget.addr1Controller.text = configureController
          .deliveryAddress[viewController.addressbookselectedindex].address1!;
      widget.addr2Controller.text = configureController
          .deliveryAddress[viewController.addressbookselectedindex].address2!;
      widget.locationController.text = configureController
          .deliveryAddress[viewController.addressbookselectedindex].location!;
      widget.cityController.text = configureController
          .deliveryAddress[viewController.addressbookselectedindex].city!;
      widget.stateController.text = configureController
          .deliveryAddress[viewController.addressbookselectedindex].provience!;
      widget.localityController.text = configureController
          .deliveryAddress[viewController.addressbookselectedindex].location!;
      widget.countryController.text = configureController
          .deliveryAddress[viewController.addressbookselectedindex].country!;
      widget.postalController.text = configureController
          .deliveryAddress[viewController.addressbookselectedindex].zipcode!;
      widget.mobileController.text = configureController
          .deliveryAddress[viewController.addressbookselectedindex].contactNo1!;
      widget.mobileController1.text = configureController
          .deliveryAddress[viewController.addressbookselectedindex].contactNo2!;
      widget.mobileController2.text = configureController
          .deliveryAddress[viewController.addressbookselectedindex].contactNo3!;
      widget.areaCodeController.text = '';
    } else if (viewController.viewKey.value == ADDADDRESS) {
      widget.mainController.text = '';
      widget.firstController.text = '';
      widget.lastController.text = '';
      widget.addr1Controller.text = '';
      widget.addr2Controller.text = '';
      widget.locationController.text = '';
      widget.cityController.text = '';
      widget.stateController.text = '';
      widget.localityController.text = '';
      widget.countryController.text = '';
      widget.postalController.text = '';
      widget.mobileController.text = '';
      widget.mobileController1.text = '';
      widget.mobileController2.text = '';
      widget.areaCodeController.text = '';
    }

    super.initState();
  }

  void initializeValues() {
    print(guestfetchciuntryController.zipcodeResponse);
    print(addressController.fetchAddressResponse[0].firstName!);
    widget.firstController.text =
        addressController.fetchAddressResponse[0].firstName!;
    widget.lastController.text =
        addressController.fetchAddressResponse[0].lastName!;
    widget.addr1Controller.text =
        addressController.fetchAddressResponse[0].address1!;
    widget.addr2Controller.text =
        addressController.fetchAddressResponse[0].address2!;
    widget.locationController.text =
        guestfetchciuntryController.zipcodeResponse.value.status!.aRea ?? '';
    widget.cityController.text =
        guestfetchciuntryController.zipcodeResponse.value.status!.cITY ?? '';
    widget.stateController.text =
        guestfetchciuntryController.zipcodeResponse.value.status!.pROVIENCE ??
            '';
    widget.postalController.text =
        addressController.fetchAddressResponse[0].postalCode!;
    if (addressController.fetchAddressResponse[0].addressType == '1') {
      home = true;
      office = false;
    } else {
      home = false;
      office = true;
    }
  }

  @override
  void didChangeDependencies() {
    actualHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    _focussFirst.addListener(() {
      keyboardController.controllerSetup(widget.firstController);
      keyboardController.setKeypad(CAPITALKEYBOARD);
      widget.firstController.selection = TextSelection.fromPosition(
          TextPosition(offset: widget.firstController.text.length));

      if (_focussFirst.hasFocus) {
        setState(() {
          _isFocuse = false;
          _isFocuseFirst = true;
          _isFocuseLast = false;
          _isFocuseLocation = false;
          _isFocuseCity = false;
          _isFocuseState = false;
          _isFocuseCountry = false;
          _isFocusePostal = false;
          _isFocuseAddr1 = false;
          _isFocuseAddr2 = false;
          _isFocuseMobile = false;
          _isFocuseAreaCode = false;
          _isFocuseMobile1 = false;
          _isFocuseMobile2 = false;
        });
      }
    });
    _focussLast.addListener(() {
      keyboardController.controllerSetup(widget.lastController);
      keyboardController.setKeypad(CAPITALKEYBOARD);

      if (_focussLast.hasFocus) {
        setState(() {
          _isFocuse = false;
          _isFocuseFirst = false;
          _isFocuseLast = true;
          _isFocuseLocation = false;
          _isFocuseCity = false;
          _isFocuseState = false;
          _isFocuseCountry = false;
          _isFocusePostal = false;
          _isFocuseAddr1 = false;
          _isFocuseAddr2 = false;
          _isFocuseMobile = false;
          _isFocuseAreaCode = false;
          _isFocuseMobile1 = false;
          _isFocuseMobile2 = false;
        });
      }
    });
    _focussCity.addListener(() {
      keyboardController.controllerSetup(widget.cityController);
      // guestfetchcountryController.fetchzipcode(
      //     keyboardController.currentController.value.text
      //  );
      _scrollController.animateTo(_scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300), curve: Curves.easeInOut);

      if (_focussCity.hasFocus) {
        setState(() {
          _isFocuse = false;
          _isFocuseFirst = false;
          _isFocuseLast = false;
          _isFocuseLocation = false;
          _isFocuseCity = true;
          _isFocuseState = false;
          _isFocuseCountry = false;
          _isFocusePostal = false;
          _isFocuseAddr1 = false;
          _isFocuseAddr2 = false;
          _isFocuseMobile = false;
          _isFocuseAreaCode = false;
          _isFocuseMobile1 = false;
          _isFocuseMobile2 = false;
        });
      }
    });
    _focussMail.addListener(() {
      keyboardController.controllerSetup(widget.mainController);
      // guestfetchcountryController.fetchzipcode(
      //     keyboardController.currentController.value.text
      //  );
      if (_focussMail.hasFocus) {
        setState(() {
          _isFocuse = false;
          _isFocuseFirst = false;
          _isFocuseLast = false;
          _isFocuseLocation = false;
          _isFocuseCity = true;
          _isFocuseState = false;
          _isFocuseCountry = false;
          _isFocusePostal = false;
          _isFocuseAddr1 = false;
          _isFocuseAddr2 = false;
          _isFocuseMobile = false;
          _isFocuseAreaCode = false;
          _isFocuseMobile1 = false;
          _isFocuseMobile2 = false;
        });
      }
    });
    _focussMob.addListener(() {
      keyboardController.controllerSetup(widget.mobileController);
      keyboardController.setKeypad(SYMBOLSKEYBOARD);

      if (_focussMob.hasFocus) {
        setState(() {
          _isFocuse = false;
          _isFocuseFirst = false;
          _isFocuseLast = false;
          _isFocuseLocation = false;
          _isFocuseCity = false;
          _isFocuseState = false;
          _isFocuseCountry = false;
          _isFocusePostal = false;
          _isFocuseAddr1 = false;
          _isFocuseAddr2 = false;
          _isFocuseMobile = true;
          _isFocuseAreaCode = false;
          _isFocuseMobile1 = false;
          _isFocuseMobile2 = false;
        });
      }
    });
    _focusMobile1.addListener(() {
      keyboardController.controllerSetup(widget.mobileController1);
      keyboardController.setKeypad(SYMBOLSKEYBOARD);

      if (_focusMobile1.hasFocus) {
        setState(() {
          _isFocuse = false;
          _isFocuseFirst = false;
          _isFocuseLast = false;
          _isFocuseLocation = false;
          _isFocuseCity = false;
          _isFocuseState = false;
          _isFocuseCountry = false;
          _isFocusePostal = false;
          _isFocuseAddr1 = false;
          _isFocuseAddr2 = false;
          _isFocuseMobile = false;
          _isFocuseAreaCode = false;
          _isFocuseMobile1 = true;
          _isFocuseMobile2 = false;
        });
      }
    });
    _focusMobile2.addListener(() {
      keyboardController.controllerSetup(widget.mobileController2);
      keyboardController.setKeypad(SYMBOLSKEYBOARD);
      _scrollController.animateTo(_scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300), curve: Curves.easeInOut);

      if (_focusMobile2.hasFocus) {
        setState(() {
          _isFocuse = false;
          _isFocuseFirst = false;
          _isFocuseLast = false;
          _isFocuseLocation = false;
          _isFocuseCity = false;
          _isFocuseState = false;
          _isFocuseCountry = false;
          _isFocusePostal = false;
          _isFocuseAddr1 = false;
          _isFocuseAddr2 = false;
          _isFocuseMobile = false;
          _isFocuseAreaCode = false;
          _isFocuseMobile1 = false;
          _isFocuseMobile2 = true;
        });
      }
    });

    _focussCountry.addListener(() {
      keyboardController.controllerSetup(widget.countryController);

      if (_focussCountry.hasFocus) {
        setState(() {
          _isFocuse = false;
          _isFocuseFirst = false;
          _isFocuseLast = false;
          _isFocuseLocation = false;
          _isFocuseCity = false;
          _isFocuseState = false;
          _isFocuseCountry = true;
          _isFocusePostal = false;
          _isFocuseAddr1 = false;
          _isFocuseAddr2 = false;
          _isFocuseMobile = false;
          _isFocuseAreaCode = false;
          _isFocuseMobile1 = false;
          _isFocuseMobile2 = false;
        });
      }
    });
    _focussPostal.addListener(() {
      keyboardController.controllerSetup(widget.postalController);
      keyboardController.setKeypad(SYMBOLSKEYBOARD);
      keyboardController.controllersetupforguest = "zipcode";
      _scrollController.animateTo(_scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
      guestfetchcountryController
          .fetchzipcode(keyboardController.currentController.value.text);
      if (_focussPostal.hasFocus) {
        setState(() {
          _isFocuse = false;
          _isFocuseFirst = false;
          _isFocuseLast = false;
          _isFocuseLocation = false;
          _isFocuseCity = false;
          _isFocuseState = false;
          _isFocuseCountry = false;
          _isFocusePostal = true;
          _isFocuseAddr1 = false;
          _isFocuseAddr2 = false;
          _isFocuseMobile = false;
          _isFocuseAreaCode = false;
          _isFocuseMobile1 = false;
          _isFocuseMobile2 = false;
        });
      }
    });
    _focussState.addListener(() {
      keyboardController.controllerSetup(widget.stateController);
      _scrollController.animateTo(_scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300), curve: Curves.easeInOut);

      if (_focussState.hasFocus) {
        setState(() {
          _isFocuse = false;
          _isFocuseFirst = false;
          _isFocuseLast = false;
          _isFocuseLocation = false;
          _isFocuseCity = false;
          _isFocuseState = true;
          _isFocuseCountry = false;
          _isFocusePostal = false;
          _isFocuseAddr1 = false;
          _isFocuseAddr2 = false;
          _isFocuseMobile = false;
          _isFocuseAreaCode = false;
        });
      }
    });
    _focussAdr1.addListener(() {
      keyboardController.controllerSetup(widget.addr1Controller);
      keyboardController.setKeypad(CAPITALKEYBOARD);

      if (_focussAdr1.hasFocus) {
        setState(() {
          _isFocuse = false;
          _isFocuseFirst = false;
          _isFocuseLast = false;
          _isFocuseLocation = false;
          _isFocuseCity = false;
          _isFocuseState = false;
          _isFocuseCountry = false;
          _isFocusePostal = false;
          _isFocuseAddr1 = true;
          _isFocuseAddr2 = false;
          _isFocuseMobile = false;
          _isFocuseAreaCode = false;
          _isFocuseMobile1 = false;
          _isFocuseMobile2 = false;
        });
      }
    });
    _focussAdr2.addListener(() {
      keyboardController.controllerSetup(widget.addr2Controller);
      keyboardController.setKeypad(CAPITALKEYBOARD);
      // guestfetchcountryController.fetchzipcode(
      //     keyboardController.currentController.value.text
      //  );

      if (_focussAdr2.hasFocus) {
        setState(() {
          _isFocuse = false;
          _isFocuseFirst = false;
          _isFocuseLast = false;
          _isFocuseLocation = false;
          _isFocuseCity = false;
          _isFocuseState = false;
          _isFocuseCountry = false;
          _isFocusePostal = false;
          _isFocuseAddr1 = false;
          _isFocuseAddr2 = true;
          _isFocuseMobile = false;
          _isFocuseAreaCode = false;
        });
      }
    });
    _focussLocation.addListener(() {
      keyboardController.controllerSetup(widget.locationController);
      keyboardController.setKeypad(CAPITALKEYBOARD);
      guestfetchcountryController
          .fetchzipcode(keyboardController.currentController.value.text);

      if (_focussLocation.hasFocus) {
        setState(() {
          _isFocuse = false;
          _isFocuseFirst = false;
          _isFocuseLast = false;
          _isFocuseLocation = true;
          _isFocuseCity = false;
          _isFocuseState = false;
          _isFocuseCountry = false;
          _isFocusePostal = false;
          _isFocuseAddr1 = false;
          _isFocuseAddr2 = false;
          _isFocuseAreaCode = false;
          _isFocuseMobile = false;
        });
      }
    });
    _focussareaCode.addListener(() {
      keyboardController.controllerSetup(widget.areaCodeController);

      _scrollController.animateTo(_scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300), curve: Curves.easeInOut);

      if (_focussareaCode.hasFocus) {
        setState(() {
          _isFocuse = false;
          _isFocuseFirst = false;
          _isFocuseLast = false;
          _isFocuseLocation = false;
          _isFocuseCity = false;
          _isFocuseState = false;
          _isFocuseCountry = false;
          _isFocusePostal = false;
          _isFocuseAddr1 = false;
          _isFocuseAddr2 = false;
          _isFocuseMobile = false;
          _isFocuseAreaCode = true;
        });
      }
    });

    var lineGap =
        (widget.actualHeight - MediaQuery.of(context).padding.bottom) /
            (GetPlatform.isAndroid ? 18.0 : 17.0);

    return Padding(
       padding: GetPlatform.isAndroid
         ?const EdgeInsets.only(top: 5)
         :const EdgeInsets.only(),
      child: Column(
        children: [
          Container(
           height: MediaQuery.of(context).size.height * 0.043,
              width: MediaQuery.of(context).size.width * 0.99,
              color: AppColors.subHeaderContainer,
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    if (viewController.viewKey.value == OWNERDETAILS) {
                      viewController.setView(CLIENTLOGIN);
                      headerController.setSubHeaderLabel('Log In');
                    } else if (viewController.viewKey.value == ADDADDRESS ||
                        viewController.viewKey.value == EDITADDRESS) {
                      viewController.setView(CHANGEDELIVERYADDRESS);
                    }
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    child: RotatedBox(
                        quarterTurns: DateTime.june,
                        child: optionsController.backNew),
                  ),
                ),
                SizedBox(
                  width: 110,
                ),
                Text(
                  viewController.viewKey.value == OWNERDETAILS
                 ? "Registration Data"
                 :  viewController.viewKey.value == ADDADDRESS
                ? "Add New Address"
                : "Edit Address",
                  // languageController.languageResponse.value.users ?? '',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  height: 55,
                  width: 75,
                ),
                InkWell(
                  onTap: () async {
                    Prefs.setUserCity(
                      guestfetchcountryController
                          .zipcodeResponse.value.status!.cITY
                          .toString(),
                    );

                    Prefs.setUserState(
                      guestfetchcountryController
                          .zipcodeResponse.value.status!.pROVIENCE
                          .toString(),
                    );
                    addressController.updateAddress(
                        await Prefs.mobile,
                        // firstName.text,
                        widget.firstController.text,
                        widget.lastController.text,
                        widget.localityController.text,
                        // widget.mobileController.text,
                        mobile.text,
                        widget.addr1Controller.text,
                        widget.addr2Controller.text,
                        // area.text,
                        // mobile.text,
                        // add1.text,
                        // add2.text,
                        '1',
                        'y',
                        guestfetchcountryController
                            .zipcodeResponse.value.status!.aRea
                            .toString(),
                        // postalCode.text,
                        widget.postalController.text,
                        guestfetchcountryController
                            .zipcodeResponse.value.status!.pROVIENCE
                            .toString(),
                        guestfetchcountryController
                            .zipcodeResponse.value.status!.cITY
                            .toString(),
                        // country.text,
                        widget.countryController.text,
                        languageController.languagenum.toString());

                    print("hello..?");
                  },
                  child: Container(
                    // color: Color.fromARGB(255, 200, 13, 13),
                    height: 40,
                    width: 40,
                    child: optionsController.save,
                  ),
                ),
                Container(
                  height: 5,
                  width: 15,
                ),
              ],
            ),
          ),
          SizedBox(
              height: GetPlatform.isAndroid
                  ? (widget.actualHeight - 40) -
                      (widget.actualHeight / 16.5) * 2 -
                      13
                  : (widget.actualHeight -
                          MediaQuery.of(context).padding.bottom) -
                      (widget.actualHeight / 16.5) * 2 -
                      16,
              child: GetX<AddressController>(
                init: (addressController),
                initState: (_) {},
                builder: (controller) {
                  return Stack(
                    children: [
                      ListView(
                        controller: _scrollController,
                        children: [
                          Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              Column(
                                children: List.generate(
                                  15,
                                  (index) => Container(
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: Color.fromARGB(
                                                255, 247, 244, 244),
                                            width: 0.5,
                                          ),
                                          top: BorderSide(
                                            color: Colors.grey[400]!,
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                      height: GetPlatform.isAndroid
                                          ? MediaQuery.of(context).size.height *
                                              0.062
                                          : MediaQuery.of(context).size.height *
                                              0.061),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: SizedBox(
                                  height: 950,
                                  child: ListView(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 30.0),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: GetPlatform.isAndroid
                                                    ? (widget.actualHeight -
                                                            40) /
                                                        18.1
                                                    : (actualHeight -
                                                            MediaQuery.of(
                                                                    context)
                                                                .padding
                                                                .bottom) /
                                                        15,
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          InkWell(
                                                            onTap: (() {
                                                              setState(() {
                                                                home = !home;
                                                                office = false;
                                                                viewController
                                                                        .addressbookselectedbuildingtype =
                                                                    'H';
                                                              });
                                                            }),
                                                            child: Container(
                                                                height: 30,
                                                                width: 30,
                                                                decoration: BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                    border: Border
                                                                        .all(),
                                                                    boxShadow: const [
                                                                      BoxShadow(
                                                                          color: Colors
                                                                              .grey,
                                                                          spreadRadius:
                                                                              1,
                                                                          blurRadius:
                                                                              1,
                                                                          offset: Offset(
                                                                              4,
                                                                              4))
                                                                    ]),
                                                                child: Center(
                                                                  child: Icon(
                                                                    Icons.done,
                                                                    color: viewController
                                                                                .addressbookselectedbuildingtype ==
                                                                            'H'
                                                                        ? Colors
                                                                            .green
                                                                        : Colors
                                                                            .white,
                                                                    size: 25,
                                                                  ),
                                                                )),
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            languageController
                                                                    .languageResponse
                                                                    .value
                                                                    .home ??
                                                                '',
                                                            style:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        20),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          InkWell(
                                                            onTap: (() {
                                                              setState(() {
                                                                office =
                                                                    !office;
                                                                home = false;
                                                                viewController
                                                                        .addressbookselectedbuildingtype =
                                                                    'A';
                                                              });
                                                            }),
                                                            child: Container(
                                                                height: 30,
                                                                width: 30,
                                                                decoration: BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                    border: Border
                                                                        .all(),
                                                                    boxShadow: const [
                                                                      BoxShadow(
                                                                          color: Colors
                                                                              .grey,
                                                                          spreadRadius:
                                                                              1,
                                                                          blurRadius:
                                                                              1,
                                                                          offset: Offset(
                                                                              4,
                                                                              4))
                                                                    ]),
                                                                child: Center(
                                                                  child: Icon(
                                                                    Icons.done,
                                                                    color: viewController
                                                                                .addressbookselectedbuildingtype ==
                                                                            'A'
                                                                        ? Colors
                                                                            .green
                                                                        : Colors
                                                                            .white,
                                                                    size: 25,
                                                                  ),
                                                                )),
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            languageController
                                                                    .languageResponse
                                                                    .value
                                                                    .office ??
                                                                '',
                                                            style:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        20),
                                                          ),
                                                        ],
                                                      ),
                                                    ]),
                                              ),

                                              SizedBox(
                                                height: GetPlatform.isAndroid
                                                    ? MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        0.070
                                                    : MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        0.061,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    sizedBoxText(
                                                        languageController
                                                                .languageResponse
                                                                .value
                                                                .firstName ??
                                                            ''),
                                                    const Padding(
                                                      padding: EdgeInsets.only(
                                                          right: 2),
                                                      child: Text('*',
                                                          style: TextStyle(
                                                              fontSize: 21,
                                                              color:
                                                                  Colors.red)),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 3.0),
                                                      child: sizedBoxController(
                                                          widget
                                                              .firstController,
                                                          _focussFirst,
                                                          _isFocuseFirst),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: GetPlatform.isAndroid
                                                    ? MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        0.062
                                                    : MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        0.061,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    sizedBoxText(
                                                        languageController
                                                                .languageResponse
                                                                .value
                                                                .lastName ??
                                                            ''),
                                                    const Padding(
                                                      padding: EdgeInsets.only(
                                                          right: 2),
                                                      child: Text('*',
                                                          style: TextStyle(
                                                              fontSize: 21,
                                                              color:
                                                                  Colors.red)),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 3.0),
                                                      child: sizedBoxController(
                                                          widget.lastController,
                                                          _focussLast,
                                                          _isFocuseLast),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: GetPlatform.isAndroid
                                                    ? MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        0.062
                                                    : MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        0.061,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    sizedBoxText(
                                                        languageController
                                                                .languageResponse
                                                                .value
                                                                .addressFirst ??
                                                            ''),
                                                    const Padding(
                                                      padding: EdgeInsets.only(
                                                          right: 2),
                                                      child: Text('*',
                                                          style: TextStyle(
                                                              fontSize: 21,
                                                              color:
                                                                  Colors.red)),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 3.0),
                                                      child: sizedBoxController(
                                                          widget
                                                              .addr1Controller,
                                                          _focussAdr1,
                                                          _isFocuseAddr1),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              (viewController.viewKey.value ==
                                                          ADDADDRESS ||
                                                      viewController
                                                              .viewKey.value ==
                                                          EDITADDRESS ||
                                                      viewController
                                                              .viewKey.value ==
                                                          OWNERDETAILS)
                                                  ? SizedBox(
                                                      height: GetPlatform
                                                              .isAndroid
                                                          ? MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.062
                                                          : MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.061,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          sizedBoxText(
                                                              languageController
                                                                      .languageResponse
                                                                      .value
                                                                      .addressSecond ??
                                                                  ''),
                                                          const SizedBox(
                                                            width: 20,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    top: 3.0),
                                                            child: sizedBoxController(
                                                                widget
                                                                    .addr2Controller,
                                                                _focussAdr2,
                                                                _isFocuseAddr2),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  : Container(),
                                              // Container(),
                                              (viewController.viewKey.value ==
                                                          ADDADDRESS ||
                                                      viewController
                                                              .viewKey.value ==
                                                          EDITADDRESS)
                                                  ? SizedBox(
                                                      height: GetPlatform
                                                              .isAndroid
                                                          ? MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.062
                                                          : MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.061,
                                                      //height: lineGap,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          sizedBoxText(
                                                              '${languageController.languageResponse.value.mobileNumber ?? ''} 1'),
                                                          const Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    right: 2),
                                                            child: Text('*',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        21,
                                                                    color: Colors
                                                                        .red)),
                                                          ),
                                                          const SizedBox(
                                                            width: 5,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    top: 3.0),
                                                            //      child: sizedBoxController(
                                                            // widget
                                                            //     .mobileController1,
                                                            // _focusMobile1,
                                                            // _isFocuseMobile1),

                                                            child: sizedBoxController(
                                                                widget
                                                                    .mobileController,
                                                                _focussMob,
                                                                _isFocuseMobile),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  : Container(),

                                              // (viewController.viewKey.value ==
                                              //             ADDADDRESS ||
                                              //         viewController.viewKey.value ==
                                              //             EDITADDRESS)
                                              //     ? SizedBox(
                                              //        height: MediaQuery.of(context)
                                              //                   .size
                                              //                   .height *
                                              //               0.061,
                                              //         //height: lineGap,
                                              //         child: Row(
                                              //           mainAxisAlignment:
                                              //               MainAxisAlignment.end,
                                              //           children: [
                                              //             sizedBoxText((languageController
                                              //                         .languageResponse
                                              //                         .value
                                              //                         .mobileNumber ??
                                              //                     '') +
                                              //                 ' 2'),
                                              //             const SizedBox(
                                              //               width: 15,
                                              //             ),
                                              //             Padding(
                                              //               padding:
                                              //                   const EdgeInsets.only(
                                              //                       top: 3.0),
                                              //                   //      child: sizedBoxController(
                                              //                   // widget.mobileController,
                                              //                   // _focussMob,
                                              //                   // _isFocuseMobile),
                                              //               child: sizedBoxController(
                                              //                   widget
                                              //                       .mobileController2,
                                              //                   _focusMobile2,
                                              //                   _isFocuseMobile2),
                                              //             )
                                              //           ],
                                              //         ),
                                              //       )
                                              //     : Container(),
                                              SizedBox(
                                                height: GetPlatform.isAndroid
                                                    ? MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        0.062
                                                    : MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        0.061,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    sizedBoxText(
                                                        languageController
                                                                .languageResponse
                                                                .value
                                                                .postalCode ??
                                                            ''),
                                                    const Padding(
                                                      padding: EdgeInsets.only(
                                                          right: 2),
                                                      child: Text('*',
                                                          style: TextStyle(
                                                              fontSize: 21,
                                                              color:
                                                                  Colors.red)),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 3.0),
                                                      child: sizedBoxController(
                                                          widget
                                                              .postalController,
                                                          _focussPostal,
                                                          _isFocusePostal),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              (viewController.viewKey.value ==
                                                          ADDADDRESS ||
                                                      viewController
                                                              .viewKey.value ==
                                                          EDITADDRESS ||
                                                      viewController
                                                              .viewKey.value ==
                                                          OWNERDETAILS)
                                                  ? SizedBox(
                                                      height: GetPlatform
                                                              .isAndroid
                                                          ? MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.062
                                                          : MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.061,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          sizedBoxText(
                                                              languageController
                                                                      .languageResponse
                                                                      .value
                                                                      .location ??
                                                                  ''),
                                                          const Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    right: 2),
                                                            child: Text('*',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        21,
                                                                    color: Colors
                                                                        .red)),
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    top: 3.0),
                                                            child:
                                                                sizedBoxController2(
                                                              context,
                                                              guestfetchciuntryController
                                                                  .zipcodeResponse
                                                                  .value
                                                                  .status!
                                                                  .aRea
                                                                  .toString(),
                                                            ),
                                                            // child: sizedBoxController(
                                                            //   widget
                                                            //       .locationController,
                                                            //   _focussLocation,
                                                            //   _isFocuseLocation,
                                                            // ),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  : Container(),
                                              //  ?
                                              SizedBox(
                                                height: GetPlatform.isAndroid
                                                    ? MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        0.062
                                                    : MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        0.061,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    sizedBoxText(
                                                        languageController
                                                                .languageResponse
                                                                .value
                                                                .city ??
                                                            ''),
                                                    const Padding(
                                                      padding: EdgeInsets.only(
                                                          right: 2),
                                                      child: Text('*',
                                                          style: TextStyle(
                                                              fontSize: 21,
                                                              color:
                                                                  Colors.red)),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 3.0),
                                                      child:
                                                          sizedBoxController2(
                                                        context,
                                                        guestfetchciuntryController
                                                            .zipcodeResponse
                                                            .value
                                                            .status!
                                                            .cITY
                                                            .toString(),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),

                                              SizedBox(
                                                height: GetPlatform.isAndroid
                                                    ? MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        0.062
                                                    : MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        0.061,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    sizedBoxText(
                                                        languageController
                                                                .languageResponse
                                                                .value
                                                                .state ??
                                                            ''),
                                                    const Padding(
                                                      padding: EdgeInsets.only(
                                                          right: 2),
                                                      child: Text('*',
                                                          style: TextStyle(
                                                              fontSize: 21,
                                                              color:
                                                                  Colors.red)),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 3.0),
                                                      child:
                                                          sizedBoxController2(
                                                        context,
                                                        guestfetchciuntryController
                                                            .zipcodeResponse
                                                            .value
                                                            .status!
                                                            .pROVIENCE
                                                            .toString(),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              (viewController.viewKey.value ==
                                                          EDITADDRESS ||
                                                      viewController
                                                              .viewKey.value ==
                                                          OWNERDETAILS)
                                                  ? SizedBox(
                                                      height: GetPlatform
                                                              .isAndroid
                                                          ? MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.062
                                                          : MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.061,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          sizedBoxText(
                                                              'Mobile'),
                                                          const SizedBox(
                                                            width: 20,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    top: 3.0),
                                                            child:
                                                                sizedBoxController2(
                                                              context,
                                                              storedMobileCode ??
                                                                  '',
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  : Container(),
                                              SizedBox(
                                                height: GetPlatform.isAndroid
                                                    ? MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        0.062
                                                    : MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        0.061,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 3.0),
                                                      child:
                                                          sizedBoxController3(
                                                        context,
                                                        storedMailCode ?? '',
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      GetX<KeyboardController>(
                        init: KeyboardController(),
                        initState: (_) {},
                        builder: (controller) {
                          return Positioned(
                              bottom: 0,
                              child: Container(
                                height: 310,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/keypad_patchs/keypad_base.png'),
                                      fit: BoxFit.fill),
                                ),
                                child: keyboardWidget(context, controller),
                              ));
                        },
                      ),
                    ],
                  );
                },
              )),
        ],
      ),
    );
  }

  sizedBoxText(String text) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(text, style: normalTextStyle),
        ),
      ),
    );
  }

  keyboardWidget(BuildContext context, KeyboardController controller) {
    if (controller.changekeypad.value == SYMBOLSKEYBOARD) {
      return NumeralSpecialChar(
        actualHeight: widget.actualHeight,
        context: context,
        onValueChanged: (String) {},
        size: const Size(100, 200),
      );
    } else if (controller.changekeypad.value == CAPITALKEYBOARD) {
      return AlphaCapitalLetters(
        actualHeight: widget.actualHeight,
        context: context,
        onValueChanged: (String) {},
        size: const Size(100, 200),
      );
    } else if (controller.changekeypad.value == SMALLKEYBOARD) {
      return AlphaSmallLetters(
        actualHeight: widget.actualHeight,
        context: context,
        onValueChanged: (String) {},
        size: const Size(100, 200),
      );
    } else {
      Container();
    }
  }

  SizedBox sizedBoxController(controller, FocusNode focus, bool status) {
    return SizedBox(
      width: GetPlatform.isAndroid ? 215 : 215,
      child: TextFormField(
        readOnly: true,
        showCursor: true,
        focusNode: focus,
        onChanged: (value) {
          print("value $value");
        },
        onTap: () {
          if (controller == widget.postalController) {
            keyboardController.setKeypad(SYMBOLSKEYBOARD);
            keyboardController.controllersetupforguest = "zipcode";
            keyboardController.controllerSetup(widget.postalController);

            keyboardController.symbolTrue(false);

            
          } else if (controller == widget.stateController) {
            keyboardController.setKeypad('');
            keyboardController.symbolTrue(false);
          } else if (controller == widget.cityController) {
            keyboardController.setKeypad('');
          } else if (controller == widget.mainController) {
            keyboardController.setKeypad(SMALLKEYBOARD);
            keyboardController.symbolTrue(true);
          } else if (controller == widget.areaCodeController) {
            keyboardController.symbolTrue(true);
            keyboardController.setKeypad(CAPITALKEYBOARD);
          } else if (controller == widget.mobileController) {
            keyboardController.symbolTrue(true);
            keyboardController.setKeypad(SYMBOLSKEYBOARD);
          } else if (controller == widget.mobileController1) {
            keyboardController.symbolTrue(true);
            keyboardController.setKeypad(SYMBOLSKEYBOARD);
          } else if (controller == widget.mobileController2) {
            keyboardController.symbolTrue(true);
            keyboardController.setKeypad(SYMBOLSKEYBOARD);
          } else {
            keyboardController.symbolTrue(true);
            keyboardController.setKeypad(CAPITALKEYBOARD);
            keyboardController.controllerSetup(controller);
            keyboardController.focusSetup(focus, controller);
          }
        },
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          filled: status,
          fillColor: textFieldColor,
        ),
        style: normalTextStyle,
      ),
    );
  }

  SizedBox sizedBoxController2(BuildContext context, String? value) {
    return SizedBox(
      // height: GetPlatform.isAndroid
      //     ? (widget.actualHeight - 40) / 18.1
      //     : (actualHeight - MediaQuery.of(context).padding.bottom) / 17.9,
      width: GetPlatform.isAndroid ? 215 : 215,
      child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            value!,
            style: const TextStyle(
              fontSize: 21,
            ),
          )),
    );
  }

  SizedBox sizedBoxController3(BuildContext context, String? value) {
    return SizedBox(
      width: GetPlatform.isAndroid ? 400 : 400,
      child: Center(
        child: Text(
          value!,
          style: const TextStyle(
            fontSize: 21,
          ),
        ),
      ),
    );
  }

  Future<String?> getStoredMailCode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("mail");
  }

  Future<String?> getStoredMobileCode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("mobile");
  }
}
