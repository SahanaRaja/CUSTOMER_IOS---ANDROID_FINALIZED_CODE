// ignore_for_file: unused_field, non_constant_identifier_names, avoid_types_as_parameter_names, prefer_const_constructors, unused_local_variable

import 'package:customer_assist/home/presentation/controllers/configure_controller.dart';
import 'package:customer_assist/home/presentation/controllers/guest_fetchCountry_controller.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/controllers/options_controller.dart';
import 'package:customer_assist/home/presentation/controllers/owner_data_controller.dart';
import 'package:customer_assist/home/presentation/controllers/view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/app_constants.dart';
import '../../../../core/app_style.dart';
import '../../controllers/keyboard_controller.dart';
import '../keyboard/alpha_capital_letters.dart';
import '../keyboard/alpha_small_letters.dart';
import '../keyboard/numeral_special_char.dart';

class AddAddressTab extends StatefulWidget {
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

  const AddAddressTab({
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
  _AddAddressTabState createState() => _AddAddressTabState();
}

class _AddAddressTabState extends State<AddAddressTab> {
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

  @override
  void initState() {
    print(addressController.fetchAddressResponse);

    
    
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
        addressController.fetchAddressResponse[0].locality!;
    widget.cityController.text =
        addressController.fetchAddressResponse[0].city!;
    widget.stateController.text =
       addressController.fetchAddressResponse[0].state!;
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
      keyboardController.controllersetupforguest = "postalcode";
      _scrollController.animateTo(_scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
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

    return SizedBox(
        height: GetPlatform.isAndroid
            ? (widget.actualHeight - 40) - (widget.actualHeight / 16.5) * 2 - 88
            : (widget.actualHeight - MediaQuery.of(context).padding.bottom) -
                (widget.actualHeight / 16.5) * 2 -
                70,
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
                                      color: Color.fromARGB(255, 247, 244, 244),
                                      width: 0.5,
                                    ),
                                    top: BorderSide(
                                      color: Colors.grey[400]!,
                                      width: 1,
                                    ),
                                  ),
                                ),
                                height:
                                    MediaQuery.of(context).size.height * 0.061),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: SizedBox(
                            height: 950,
                            child: ListView(
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30.0),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: GetPlatform.isAndroid
                                              ? (widget.actualHeight - 40) /
                                                  18.1
                                              : (actualHeight -
                                                      MediaQuery.of(context)
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
                                                              color:
                                                                  Colors.white,
                                                              border:
                                                                  Border.all(),
                                                              boxShadow: const [
                                                                BoxShadow(
                                                                    color: Colors
                                                                        .grey,
                                                                    spreadRadius:
                                                                        1,
                                                                    blurRadius:
                                                                        1,
                                                                    offset:
                                                                        Offset(
                                                                            4,
                                                                            4))
                                                              ]),
                                                          child: Center(
                                                            child: Icon(
                                                              Icons.done,
                                                              color: viewController
                                                                          .addressbookselectedbuildingtype ==
                                                                      'H'
                                                                  ? Colors.green
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
                                                      style: const TextStyle(
                                                          fontSize: 20),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    InkWell(
                                                      onTap: (() {
                                                        setState(() {
                                                          office = !office;
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
                                                              color:
                                                                  Colors.white,
                                                              border:
                                                                  Border.all(),
                                                              boxShadow: const [
                                                                BoxShadow(
                                                                    color: Colors
                                                                        .grey,
                                                                    spreadRadius:
                                                                        1,
                                                                    blurRadius:
                                                                        1,
                                                                    offset:
                                                                        Offset(
                                                                            4,
                                                                            4))
                                                              ]),
                                                          child: Center(
                                                            child: Icon(
                                                              Icons.done,
                                                              color: viewController
                                                                          .addressbookselectedbuildingtype ==
                                                                      'A'
                                                                  ? Colors.green
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
                                                      style: const TextStyle(
                                                          fontSize: 20),
                                                    ),
                                                  ],
                                                ),
                                              ]),
                                        ),

                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.061,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              sizedBoxText(languageController
                                                      .languageResponse
                                                      .value
                                                      .firstName ??
                                                  ''),
                                              const Padding(
                                                padding:
                                                    EdgeInsets.only(right: 2),
                                                child: Text('*',
                                                    style: TextStyle(
                                                        fontSize: 21,
                                                        color: Colors.red)),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 3.0),
                                                child: sizedBoxController(
                                                    widget.firstController,
                                                    _focussFirst,
                                                    _isFocuseFirst),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.061,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              sizedBoxText(languageController
                                                      .languageResponse
                                                      .value
                                                      .lastName ??
                                                  ''),
                                              const Padding(
                                                padding:
                                                    EdgeInsets.only(right: 2),
                                                child: Text('*',
                                                    style: TextStyle(
                                                        fontSize: 21,
                                                        color: Colors.red)),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
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
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.061,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              sizedBoxText(languageController
                                                      .languageResponse
                                                      .value
                                                      .addressFirst ??
                                                  ''),
                                              const Padding(
                                                padding:
                                                    EdgeInsets.only(right: 2),
                                                child: Text('*',
                                                    style: TextStyle(
                                                        fontSize: 21,
                                                        color: Colors.red)),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 3.0),
                                                child: sizedBoxController(
                                                    widget.addr1Controller,
                                                    _focussAdr1,
                                                    _isFocuseAddr1),
                                              ),
                                            ],
                                          ),
                                        ),
                                        
                                             SizedBox(
                                                height: MediaQuery.of(context)
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
                                                                .addressSecond ??
                                                            ''),
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 3.0),
                                                      child: sizedBoxController(
                                                          widget
                                                              .addr2Controller,
                                                          _focussAdr2,
                                                          _isFocuseAddr2),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                         
                                        SizedBox(
                                                height: MediaQuery.of(context)
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
                                                                .location ??
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
                                                            .locationController,
                                                        _focussLocation,
                                                        _isFocuseLocation,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            
                                           SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                   0.061,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    sizedBoxText('${languageController
                                                                .languageResponse
                                                                .value
                                                                .mobileNumber ??
                                                            ''} 1'),
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
                                                      width: 5,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 3.0),
                                                      //      child: sizedBoxController(
                                                      // widget
                                                      //     .mobileController2,
                                                      // _focusMobile2,
                                                      // _isFocuseMobile2),

                                                      child: sizedBoxController(
                                                          widget
                                                              .mobileController2,
                                                          _focusMobile2,
                                                          _isFocuseMobile2),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.061,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              sizedBoxText(languageController
                                                      .languageResponse
                                                      .value
                                                      .postalCode ??
                                                  ''),
                                              const Padding(
                                                padding:
                                                    EdgeInsets.only(right: 2),
                                                child: Text('*',
                                                    style: TextStyle(
                                                        fontSize: 21,
                                                        color: Colors.red)),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 3.0),
                                                child: sizedBoxController(
                                                    widget.postalController,
                                                    _focussPostal,
                                                    _isFocusePostal),
                                              ),
                                            ],
                                          ),
                                        ),
                                        //  ?
                                         SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.061,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              sizedBoxText(languageController
                                                      .languageResponse
                                                      .value
                                                      .city ??
                                                  ''),
                                              const Padding(
                                                padding:
                                                    EdgeInsets.only(right: 2),
                                                child: Text('*',
                                                    style: TextStyle(
                                                        fontSize: 21,
                                                        color: Colors.red)),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 3.0),
                                                child: sizedBoxController2(
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
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.061,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              sizedBoxText(languageController
                                                      .languageResponse
                                                      .value
                                                      .state ??
                                                  ''),
                                              const Padding(
                                                padding:
                                                    EdgeInsets.only(right: 2),
                                                child: Text('*',
                                                    style: TextStyle(
                                                        fontSize: 21,
                                                        color: Colors.red)),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 3.0),
                                                child: sizedBoxController2(
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
        ));
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
      width: GetPlatform.isAndroid ? 220 : 215,
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

            // if (keyboardController.symbols == true) {
            //   if (keyboardController.editProfile.value == true) {
            //     viewController.setView(ERROR);
            //     viewController.setErrorMessage('');
            //   }
            // }
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
      width: GetPlatform.isAndroid ? 220 : 215,
      child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            (widget.postalController == Null)
            ? ''
            : value!,
            style: const TextStyle(
              fontSize: 21,
            ),
          )),
    );
  }
}
