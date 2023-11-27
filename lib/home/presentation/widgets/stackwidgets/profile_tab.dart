// ignore_for_file: non_constant_identifier_names, unrelated_type_equality_checks, must_be_immutable, prefer_typing_uninitialized_variables, invalid_use_of_protected_member, avoid_types_as_parameter_names, prefer_const_constructors

import 'dart:io';

import 'package:customer_assist/core/app_colors.dart';
import 'package:customer_assist/home/presentation/controllers/guest_fetchCountry_controller.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/controllers/options_controller.dart';
import 'package:customer_assist/home/presentation/controllers/owner_data_controller.dart';

import 'package:ensure_visible_when_focused/ensure_visible_when_focused.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/app_constants.dart';
import '../../../../core/utils/size_config.dart';
import '../../../data/posmasterSelection/models/pos_master_response_model.dart';
import '../../controllers/keyboard_controller.dart';
import '../../controllers/pos_master_selection_controller.dart';
import '../../controllers/profile_controller.dart';
import '../../controllers/view_controller.dart';
import '../keyboard/alpha_capital_letters.dart';
import '../keyboard/alpha_small_letters.dart';
import '../keyboard/numeral_special_char.dart';
import 'package:http/http.dart' as http;
//import 'package:path/path.dart';

class ProfileTab extends StatefulWidget {
  final TextEditingController Salutaion;
  final TextEditingController FirstName;
  final TextEditingController LastName;
  final TextEditingController DOB;
  final TextEditingController MailID;
  final TextEditingController Mobile;
  final TextEditingController Postal;
  final TextEditingController Country;
  final TextEditingController Province;
  final TextEditingController City;
  final TextEditingController Add1;
  final TextEditingController Add2;
  final TextEditingController Mail;
  final TextEditingController areaCode;

  final TextEditingController userName;
  final double actualHeight;
  File? imageFile;

  ProfileTab(
      {Key? key,
      required this.actualHeight,
      required this.Salutaion,
      required this.FirstName,
      required this.LastName,
      required this.DOB,
      required this.MailID,
      required this.Mobile,
      required this.Postal,
      required this.Country,
      required this.Province,
      required this.City,
      required this.Add1,
      required this.Mail,
      required this.Add2,
      required this.imageFile,
      required this.areaCode,
      required this.userName})
      : super(key: key);

  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  PosMasterSelectionController posMasterSelectionController = Get.find();

  final picker = ImagePicker();
  var name = 0;
  var shopID = '';
  var dateTime;
  String currentDataTime = '';
  KeyboardController keyboardController = Get.put(KeyboardController());
  var viewController = Get.put(ViewController());
  ProfileController profileController = Get.find();
  final List<bool> _isFocus = List.generate(13, (index) => false);
  final List<FocusNode> _focuss = List.generate(13, (index) => FocusNode());
  ScrollController scrollController = ScrollController();
  var languageController = Get.put(LanguageController());
  TextEditingController FirstName = TextEditingController();
  TextEditingController LastName = TextEditingController();
  TextEditingController Add1 = TextEditingController();
  TextEditingController Add2 = TextEditingController();
  GuestFetchCountryController guestfetchciuntryController = Get.find();
  AddressController addressController = Get.find();
  var guestfetchcountryController = Get.put(GuestFetchCountryController());
  OptionsController optionsController = Get.find();
  List items = [];
  List<CountrySelectionResponseModel> country = [];
  File? pickedImage;
  bool isPicked = false;
  // Future pickImageFromGallery() async {
  //   final pickedFile = await picker.pickImage(
  //     source: ImageSource.gallery,
  //     maxHeight: 675,
  //     maxWidth: 960,
  //   );
  //   setState(() {
  //     widget.imageFile = File(pickedFile!.path);
  //     profileController.profilePicUpdate(widget.imageFile);
  //   });
  //   Navigator.pop(context);
  // }
  Future pickImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        isPicked = true;
        widget.imageFile = File(image.path);
        profileController.profilePicUpdate(
          widget.imageFile!,
        );
      });
    }

    Navigator.pop(context);
  }

  Future pickImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      widget.imageFile = File(pickedFile!.path);
      profileController.profilePicUpdate(widget.imageFile!);
    });
    Navigator.pop(context);
  }

  String? storedMailCode;
  String? storedMobileCode;
  @override
  void initState() {
    super.initState();
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

    items = posMasterSelectionController.salutation.value;
    country = posMasterSelectionController.countryCode.value;

    // keyboardController.setPicker('FIRSTLOAD');
  }

  @override
  Widget build(BuildContext context) {
    _focuss[0].addListener(() {
      keyboardController.controllerSetup(widget.Salutaion);
      keyboardController.setPicker("Salutation");
      if (_focuss[0].hasFocus) {
        setState(() {
          _isFocus[0] = true;
          _isFocus[1] = false;
          _isFocus[2] = false;
          _isFocus[3] = false;
          _isFocus[4] = false;
          _isFocus[5] = false;
          _isFocus[6] = false;
          _isFocus[7] = false;
          _isFocus[8] = false;
          _isFocus[9] = false;
          _isFocus[10] = false;
          _isFocus[11] = false;
          _isFocus[12] = false;
        });
      }
    });
    _focuss[1].addListener(() {
      keyboardController.controllerSetup(widget.FirstName);
      keyboardController.setPicker('');
      keyboardController.setKeypad(CAPITALKEYBOARD);
      if (_focuss[1].hasFocus) {
        setState(() {
          _isFocus[0] = false;
          _isFocus[1] = true;
          _isFocus[2] = false;
          _isFocus[3] = false;
          _isFocus[4] = false;
          _isFocus[5] = false;
          _isFocus[6] = false;
          _isFocus[7] = false;
          _isFocus[8] = false;
          _isFocus[9] = false;
          _isFocus[10] = false;
          _isFocus[11] = false;
          _isFocus[12] = false;
        });
      }
    });
    _focuss[2].addListener(() {
      keyboardController.controllerSetup(widget.LastName);
      keyboardController.setPicker('');
      keyboardController.setKeypad(CAPITALKEYBOARD);

      if (_focuss[2].hasFocus) {
        setState(() {
          _isFocus[0] = false;
          _isFocus[1] = false;
          _isFocus[2] = true;
          _isFocus[3] = false;
          _isFocus[4] = false;
          _isFocus[5] = false;
          _isFocus[6] = false;
          _isFocus[7] = false;
          _isFocus[8] = false;
          _isFocus[9] = false;
          _isFocus[10] = false;
          _isFocus[12] = false;
          _isFocus[11] = false;
        });
      }
    });
    _focuss[3].addListener(() {
      keyboardController.controllerSetup(widget.DOB);
      keyboardController.setPicker("DOB");

      if (_focuss[3].hasFocus) {
        setState(() {
          _isFocus[0] = false;
          _isFocus[1] = false;
          _isFocus[2] = false;
          _isFocus[3] = true;
          _isFocus[4] = false;
          _isFocus[5] = false;
          _isFocus[6] = false;
          _isFocus[7] = false;
          _isFocus[8] = false;
          _isFocus[9] = false;
          _isFocus[10] = false;
          _isFocus[11] = false;
          _isFocus[12] = false;
        });
      }
    });
    _focuss[4].addListener(() {
      keyboardController.controllerSetup(widget.Add1);
      keyboardController.setKeypad(CAPITALKEYBOARD);

      keyboardController.setPicker('');
      scrollController.animateTo(scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);

      if (_focuss[4].hasFocus) {
        setState(() {
          _isFocus[0] = false;
          _isFocus[1] = false;
          _isFocus[2] = false;
          _isFocus[3] = false;
          _isFocus[4] = true;
          _isFocus[5] = false;
          _isFocus[6] = false;
          _isFocus[7] = false;
          _isFocus[8] = false;
          _isFocus[9] = false;
          _isFocus[10] = false;
          _isFocus[11] = false;
          _isFocus[12] = false;
        });
      }
    });
    _focuss[5].addListener(() {
      keyboardController.controllerSetup(widget.Add2);
      keyboardController.setKeypad(CAPITALKEYBOARD);
      keyboardController.setPicker('');
      guestfetchcountryController
          .fetchzipcode(keyboardController.currentController.value.text);
      // scrollController.animateTo(scrollController.position.maxScrollExtent,
      //     duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
      keyboardController.setPicker('');

      if (_focuss[5].hasFocus) {
        setState(() {
          _isFocus[0] = false;
          _isFocus[1] = false;
          _isFocus[2] = false;
          _isFocus[3] = false;
          _isFocus[4] = false;
          _isFocus[5] = true;
          _isFocus[6] = false;
          _isFocus[7] = false;
          _isFocus[8] = false;
          _isFocus[9] = false;
          _isFocus[10] = false;
          _isFocus[11] = false;
          _isFocus[12] = false;
        });
      }
    });
    _focuss[6].addListener(() {
      keyboardController.controllerSetup(widget.City);
      keyboardController.setPicker('');

      if (_focuss[6].hasFocus) {
        setState(() {
          _isFocus[0] = false;
          _isFocus[1] = false;
          _isFocus[2] = false;
          _isFocus[3] = false;
          _isFocus[4] = false;
          _isFocus[5] = false;
          _isFocus[6] = true;
          _isFocus[7] = false;
          _isFocus[8] = false;
          _isFocus[9] = false;
          _isFocus[10] = false;
          _isFocus[11] = false;
          _isFocus[12] = false;
        });
      }
    });
    _focuss[7].addListener(() {
      keyboardController.controllerSetup(widget.Country);
      keyboardController.setPicker('Country');
      if (_focuss[7].hasFocus) {
        setState(() {
          _isFocus[0] = false;
          _isFocus[1] = false;
          _isFocus[2] = false;
          _isFocus[3] = false;
          _isFocus[4] = false;
          _isFocus[5] = false;
          _isFocus[6] = false;
          _isFocus[7] = true;
          _isFocus[8] = false;
          _isFocus[9] = false;
          _isFocus[10] = false;
          _isFocus[12] = false;
          _isFocus[11] = false;
        });
      }
    });
    _focuss[8].addListener(() {
      keyboardController.controllerSetup(widget.Province);

      if (_focuss[8].hasFocus) {
        setState(() {
          _isFocus[0] = false;
          _isFocus[1] = false;
          _isFocus[2] = false;
          _isFocus[3] = false;
          _isFocus[4] = false;
          _isFocus[5] = false;
          _isFocus[6] = false;
          _isFocus[7] = false;
          _isFocus[8] = true;
          _isFocus[9] = false;
          _isFocus[10] = false;
          _isFocus[12] = false;
          _isFocus[11] = false;
        });
      }
    });
    _focuss[9].addListener(() {
      keyboardController.controllerSetup(widget.Postal);
      keyboardController.setKeypad(SYMBOLSKEYBOARD);
      keyboardController.controllersetupforguest = "zipcode";
      scrollController.animateTo(scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
      guestfetchcountryController
          .fetchzipcode(keyboardController.currentController.value.text);

      if (_focuss[9].hasFocus) {
        setState(() {
          _isFocus[0] = false;
          _isFocus[1] = false;
          _isFocus[2] = false;
          _isFocus[3] = false;
          _isFocus[4] = false;
          _isFocus[5] = false;
          _isFocus[6] = false;
          _isFocus[7] = false;
          _isFocus[8] = false;
          _isFocus[9] = true;
          _isFocus[10] = false;
          _isFocus[12] = false;
          _isFocus[11] = false;
        });
      }
    });
    _focuss[10].addListener(() {
      keyboardController.setKeypad(SYMBOLSKEYBOARD);
      keyboardController.controllerSetup(widget.Mobile);
      guestfetchcountryController
          .fetchzipcode(keyboardController.currentController.value.text);
      keyboardController.setPicker('');
      if (_focuss[10].hasFocus) {
        setState(() {
          _isFocus[0] = false;
          _isFocus[1] = false;
          _isFocus[2] = false;
          _isFocus[3] = false;
          _isFocus[4] = false;
          _isFocus[5] = false;
          _isFocus[6] = false;
          _isFocus[7] = false;
          _isFocus[8] = false;
          _isFocus[9] = false;
          _isFocus[10] = true;
          _isFocus[12] = false;
          _isFocus[11] = false;
        });
      }
    });
    _focuss[11].addListener(() {
      keyboardController.controllerSetup(widget.Mail);
      keyboardController.setPicker('');
      keyboardController.setKeypad(CAPITALKEYBOARD);
      scrollController.animateTo(scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);

      if (_focuss[11].hasFocus) {
        setState(() {
          _isFocus[0] = false;
          _isFocus[1] = false;
          _isFocus[2] = false;
          _isFocus[3] = false;
          _isFocus[4] = false;
          _isFocus[5] = false;
          _isFocus[6] = false;
          _isFocus[7] = false;
          _isFocus[8] = false;
          _isFocus[9] = false;
          _isFocus[10] = false;
          _isFocus[11] = true;
          _isFocus[12] = false;
        });
      }
    });
    _focuss[12].addListener(() {
      keyboardController.controllerSetup(widget.userName);
      keyboardController.setKeypad(CAPITALKEYBOARD);
      if (_focuss[12].hasFocus) {
        setState(() {
          _isFocus[0] = false;
          _isFocus[1] = false;
          _isFocus[2] = false;
          _isFocus[3] = false;
          _isFocus[4] = false;
          _isFocus[5] = false;
          _isFocus[6] = false;
          _isFocus[7] = false;
          _isFocus[8] = false;
          _isFocus[9] = false;
          _isFocus[10] = false;
          _isFocus[11] = false;
          _isFocus[12] = true;
        });
      }
    });

    return 
    Padding(
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
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "User Profile",
                  // languageController.languageResponse.value.users ?? '',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 55,
                  width: 115,
                ),
                InkWell(
                  onTap: () {
                    profileController.profileUpdate(
                        widget.Salutaion.text,
                        widget.Country.text,
                        widget.DOB.text,
                        widget.City.text,
                        widget.LastName.text,
                        widget.MailID.text,
                        widget.FirstName.text,
                        widget.Province.text,
                        widget.Mobile.text,
                        widget.Add1.text,
                        widget.Add2.text,
                        /* firstName.text,
                        province.text,
                        mobile.text,
                        add1.text,
                        add2.text,
                        */
                        widget.Postal.text,
                        widget.Mail.text,
                        languageController.languagenum.toString());
                  },
                  child: SizedBox(
                    // color: Color.fromARGB(255, 200, 13, 13),
                    height: 40,
                    width: 40,
                    child: optionsController.save,
                  ),
                ),
                SizedBox(
                  height: 5,
                  width: 15,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 2,
            width: double.infinity,
          ),
          SizedBox(
              height: GetPlatform.isAndroid
                  ? (widget.actualHeight - 40) -
                      (widget.actualHeight / 16.5) * 2 -
                      20
                  : (widget.actualHeight -
                          MediaQuery.of(context).padding.bottom) -
                      (widget.actualHeight / 17.5) * 2 -
                      25,
              child: GetX<ProfileController>(
                  init: (profileController),
                  initState: (_) {},
                  builder: (controller) {
                    if (keyboardController.pickerValue.value == 'FIRSTLOAD') {
                      widget.Salutaion.text =
                          profileController.profileResponse.value.salutations ??
                              '';
                      //items[9];
                      widget.FirstName.text =
                          profileController.profileResponse.value.firstName ?? '';
                      widget.LastName.text =
                          profileController.profileResponse.value.lastName ?? '';
                      widget.DOB.text =
                          profileController.profileResponse.value.dob ?? '';
                      widget.MailID.text =
                          profileController.profileResponse.value.email ?? '';
                      //widget.Mobile.text = profileController.profileResponse.value.mob3 ?? '';
                      widget.Country.text =
                          profileController.profileResponse.value.country ?? '';
                      widget.Postal.text =
                          profileController.profileResponse.value.zipCode ?? '';
                      widget.Mobile.text =
                          profileController.profileResponse.value.mob2 ?? '';
                      widget.City.text =
                          profileController.profileResponse.value.city ?? '';
                      widget.Add1.text =
                          profileController.profileResponse.value.addr1 ?? '';
                      widget.Add2.text =
                          profileController.profileResponse.value.addr2 ?? '';
                      widget.Province.text =
                          profileController.profileResponse.value.state ?? '';
                    } else if (keyboardController.pickerValue.value ==
                        'Salutation') {
                      widget.Salutaion.text = '';
                    } else if (keyboardController.pickerValue.value == 'DOB') {
                      widget.DOB.text = '';
                    } else if (keyboardController.pickerValue.value ==
                        'Country') {
                      widget.Country.text = '';
                    }
    
                    return Stack(
                      children: [
                        ListView(
                          controller: scrollController,
                          children: [
                            Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                Column(
                                  children: List.generate(
                                    18,
                                    (index) => Container(
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: Colors.grey[400]!,
                                            width: 0.5,
                                          ),
                                          top: BorderSide(
                                            color: Colors.grey[400]!,
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                      height: MediaQuery.of(context).size.height *
                                          0.056,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: SizedBox(
                                    height: 1000,
                                    child: ListView(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      // shrinkWrap: true,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Stack(
                                              alignment: Alignment.centerLeft,
                                              children: [
                                                CustomPaint(
                                                  size: Size(
                                                      300,
                                                      (MediaQuery.of(context)
                                                                  .size
                                                                  .height -
                                                              MediaQuery.of(
                                                                      context)
                                                                  .padding
                                                                  .top -
                                                              MediaQuery.of(
                                                                      context)
                                                                  .padding
                                                                  .bottom) /
                                                          5.7),
                                                  painter: DrawTriangleShape(),
                                                ),
                                                Positioned(
                                                  left: 10,
                                                  child: SizedBox(
                                                    width: 200,
                                                    child: Text(
                                                      // "Client Image",
                                                      // languageController
                                                      //         .languageResponse
                                                      //         .value
                                                      //         .clientImage ??
                                                      'Users Picture Tap to take a Selfie or Paste from Album',
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors
                                                              .deepPurple[900],
                                                          fontSize: 16.sp),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            GestureDetector(
                                                onTap: () async {
                                                  keyboardController
                                                      .setPicker('');
                                                  keyboardController
                                                      .setKeypad('');
                                                  showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return SimpleDialog(
                                                          title: Text(languageController
                                                                  .languageResponse
                                                                  .value
                                                                  .selectImage ??
                                                              ''),
                                                          children: [
                                                            SimpleDialogOption(
                                                              onPressed:
                                                                  pickImageFromCamera,
                                                              child: Text(languageController
                                                                      .languageResponse
                                                                      .value
                                                                      .takePhoto ??
                                                                  ''),
                                                            ),
                                                            SimpleDialogOption(
                                                              onPressed:
                                                                  pickImageFromGallery,
                                                              child: Text(languageController
                                                                      .languageResponse
                                                                      .value
                                                                      .chooseFromgallery ??
                                                                  ''),
                                                            ),
                                                            SimpleDialogOption(
                                                              child: Text(
                                                                languageController
                                                                        .languageResponse
                                                                        .value
                                                                        .cancel ??
                                                                    '',
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .red),
                                                              ),
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                            ),
                                                          ],
                                                        );
                                                      });
                                                },
                                                child: Container(
                                                    height:
                                                        widget.actualHeight / 7.4,
                                                    width:
                                                        widget.actualHeight / 7.4,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(),
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                70)),
                                                    child: isPicked
                                                        ? ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        200),
                                                            child: FittedBox(
                                                              fit: BoxFit.fill,
                                                              child: Image.file(
                                                                widget.imageFile!,
                                                              ),
                                                            ),
                                                          )
                                                        : Container(
                                                            height: widget
                                                                    .actualHeight /
                                                                7.4,
                                                            width: widget
                                                                    .actualHeight /
                                                                7.4,
                                                            decoration: BoxDecoration(
                                                                border:
                                                                    Border.all(),
                                                                color:
                                                                    Colors.white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            70)),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          200),
                                                              child: FittedBox(
                                                                  fit:
                                                                      BoxFit.fill,
                                                                  child: Image.network(profileController
                                                                      .profileResponse
                                                                      .value
                                                                      .profilePicture
                                                                      .toString())),
                                                            ),
                                                          )))
                                          ],
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 30.0),
                                            child: Column(
                                              children: [
                                                /* SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.056,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    children: [
                                                      getSizedBox(
                                                          context,
                                                          languageController
                                                                  .languageResponse
                                                                  .value
                                                                  .greeting ??
                                                              ''),
                                                      getSixedController(
                                                          context, 0,
                                                          controller:
                                                              widget.Salutaion),
                                                    ],
                                                  ),
                                                ),
                                                */
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.056,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    children: [
                                                      getSizedBox(
                                                          context,
                                                          languageController
                                                                  .languageResponse
                                                                  .value
                                                                  .firstName ??
                                                              ''),
                                                      getSixedController(
                                                          context, 1,
                                                          controller:
                                                              widget.FirstName),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.056,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    children: [
                                                      getSizedBox(
                                                          context,
                                                          languageController
                                                                  .languageResponse
                                                                  .value
                                                                  .lastName ??
                                                              ''),
                                                      getSixedController(
                                                          context, 2,
                                                          controller:
                                                              widget.LastName),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.056,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    children: [
                                                      getSizedBox(
                                                          context,
                                                          languageController
                                                                  .languageResponse
                                                                  .value
                                                                  .dateOfBirth ??
                                                              ''),
                                                      getSixedController(
                                                          context, 3,
                                                          controller: widget.DOB),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.056,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            GetPlatform.isAndroid
                                                                ? const EdgeInsets
                                                                    .all(5.0)
                                                                : const EdgeInsets
                                                                    .all(5.0),
                                                        child: getSizedBox(
                                                            context,
                                                            languageController
                                                                    .languageResponse
                                                                    .value
                                                                    .addressFirst ??
                                                                ''),
                                                      ),
                                                      getSixedController(
                                                          context, 4,
                                                          controller:
                                                              widget.Add1),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.056,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    children: [
                                                      getSizedBox(
                                                          context,
                                                          languageController
                                                                  .languageResponse
                                                                  .value
                                                                  .addressSecond ??
                                                              ''),
                                                      getSixedController(
                                                          context, 5,
                                                          controller:
                                                              widget.Add2),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.056,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets.all(
                                                                3.0),
                                                        child: getSizedBox(
                                                            context,
                                                            languageController
                                                                    .languageResponse
                                                                    .value
                                                                    .postalCode ??
                                                                ''),
                                                      ),
                                                      getSixedController(
                                                          context, 9,
                                                          controller:
                                                              widget.Postal),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.056,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    children: [
                                                      getSizedBox(
                                                          context,
                                                          languageController
                                                                  .languageResponse
                                                                  .value
                                                                  .location ??
                                                              ''),
                                                      Container(
                                                        padding:
                                                            const EdgeInsets.only(
                                                                left: 15),
                                                        width: 190,
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
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.056,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    children: [
                                                      getSizedBox(
                                                          context,
                                                          languageController
                                                                  .languageResponse
                                                                  .value
                                                                  .city ??
                                                              ''),
                                                      Container(
                                                        padding:
                                                            const EdgeInsets.only(
                                                                left: 15),
                                                        width: 190,
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
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.056,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    children: [
                                                      getSizedBox(
                                                          context,
                                                          languageController
                                                                  .languageResponse
                                                                  .value
                                                                  .stateOrProvince ??
                                                              ''),
                                                      Container(
                                                        padding:
                                                            const EdgeInsets.only(
                                                                left: 15),
                                                        width: 190,
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
                                                      )
                                                    ],
                                                  ),
                                                ),
    
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.056,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    children: [
                                                      getSizedBox(
                                                          context,
                                                          languageController
                                                                  .languageResponse
                                                                  .value
                                                                  .mobileNumber ??
                                                              ''),
                                                      getSixedController(
                                                          context, 10,
                                                          controller:
                                                              widget.Mobile),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.056,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets.all(
                                                                2.0),
                                                        child: getSizedBox(
                                                            context,
                                                            languageController
                                                                    .languageResponse
                                                                    .value
                                                                    .mailId ??
                                                                ''),
                                                      ),
                                                      getSixedController(
                                                          context, 11,
                                                          controller:
                                                              widget.Mail),
                                                    ],
                                                  ),
                                                ),
                                                // SizedBox(
                                                //   height: MediaQuery.of(context).size.height * 0.056,
                                                //   child: Row(
                                                //     mainAxisAlignment:
                                                //         MainAxisAlignment.center,
                                                //     children: [
                                                //       getSizedBox(
                                                //           context,
                                                //           languageController
                                                //                   .languageResponse
                                                //                   .value
                                                //                   .userName ??
                                                //               ''),
                                                //       getSixedController(context, 12,
                                                //           controller: widget.Mail),
                                                //     ],
                                                //   ),
                                                // ),
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
                        GetX<KeyboardController>(
                          init: KeyboardController(),
                          initState: (_) {},
                          builder: (controller) {
                            if (controller.pickerValue.value != '' &&
                                controller.pickerValue.value != 'FIRSTLOAD') {
                              return Positioned(
                                bottom: 0,
                                child: Container(
                                  height: 352,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/keypad_patchs/keypad_base.png'),
                                        fit: BoxFit.fill),
                                  ),
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 3.0),
                                        child: Container(
                                          height: 50,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          decoration: BoxDecoration(
                                              border: Border.all(width: 2),
                                              image: const DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage(
                                                      'assets/images/keypad_patchs/keypad_header.png'))),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  keyboardController
                                                      .setKeypad('');
                                                  keyboardController
                                                      .setPicker('');
                                                },
                                                child: Text(
                                                  'CANCEL',
                                                  style: GoogleFonts.openSans(
                                                      color: Colors.white,
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  if (controller
                                                          .pickerValue.value ==
                                                      "Salutation") {
                                                    widget.Salutaion.text = "";
                                                    print(items[name]);
                                                    widget.Salutaion.text =
                                                        items[name];
                                                  } else if (controller
                                                          .pickerValue.value ==
                                                      "DOB") {
                                                    widget.DOB.text =
                                                        currentDataTime;
                                                  } else if (controller
                                                          .pickerValue.value ==
                                                      "Country") {
                                                    widget.Country.text =
                                                        country[name].countryName;
                                                  }
                                                  keyboardController
                                                      .setKeypad('');
                                                  keyboardController
                                                      .setPicker('');
                                                },
                                                child: Text(
                                                  'DONE',
                                                  style: GoogleFonts.openSans(
                                                      color: Colors.white,
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      pickerMethod(setState, controller),
                                    ],
                                  ),
                                ),
                              );
                            } else {
                              return Container();
                            }
                          },
                        ),
                      ],
                    );
                  })
    
              //  GetX<ProfileController>(
              //     init: (ProfileController()),
              //     initState: (state) => {},
              //     builder: (profilecontroller) =>
    
              //         ),
    
              ),
        ],
      ),
    );
  }

  keyboardWidget(BuildContext context, KeyboardController controller) {
    if (controller.changekeypad.value == SYMBOLSKEYBOARD) {
      return NumeralSpecialChar(
        actualHeight: widget.actualHeight,
        context: context,
        onValueChanged: (String) {
          // keyOperation(context);
        },
        size: const Size(100, 200),
      );
    } else if (controller.changekeypad.value == CAPITALKEYBOARD) {
      return AlphaCapitalLetters(
        actualHeight: widget.actualHeight,
        context: context,
        onValueChanged: (String) {
          // keyOperation(context);
        },
        size: const Size(100, 200),
      );
    } else if (controller.changekeypad.value == SMALLKEYBOARD) {
      return AlphaSmallLetters(
        actualHeight: widget.actualHeight,
        context: context,
        onValueChanged: (String) {
          // keyOperation(context);
        },
        size: const Size(100, 200),
      );
    } else {
      Container();
    }
  }

  pickerMethod(StateSetter setState, KeyboardController controller) {
    if (controller.pickerValue.value == "Salutation") {
      // widget.Salutaion.text = "";
      return SizedBox(
        height: getProportionateScreenHeight(209),
        child: CupertinoPicker(
          magnification: 1.2,
          backgroundColor: AppColors.subHeaderContainer,
          itemExtent: 50, // height of each item
          looping: true,
          onSelectedItemChanged: (index) {
            setState(() => name = index);
            // selectItem = items[index];
            // widget.Salutaion.text = items[name];
            print("Selected Iem: $name");
            // setState(() {
            //   selectItem=value.toString();
            // });
          },
          selectionOverlay: Container(
            // width: 100,

            decoration: BoxDecoration(
              color: Colors.yellowAccent.withOpacity(0.6),
              border: Border.all(
                color: const Color.fromARGB(255, 10, 10, 10).withOpacity(0.5),
                width: 2.0,
              ),
            ),
          ),
          children: items
              .map((item) => Center(
                  child: Text(item,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ))))
              .toList(),
        ),
      );
    } else if (controller.pickerValue.value == "DOB") {
      return SizedBox(
          height: getProportionateScreenHeight(209),
          width: MediaQuery.of(context).size.width,
          child: CupertinoDatePicker(
            backgroundColor: AppColors.subHeaderContainer,
            mode: CupertinoDatePickerMode.date,
            initialDateTime: dateTime,
            onDateTimeChanged: (DateTime newDataTime) {
              print(newDataTime);
              if (mounted) {
                final String formattedDateTime =
                    DateFormat('dd/MM/yyyy').format(newDataTime);
                print(formattedDateTime);
                setState(() {
                  currentDataTime = formattedDateTime;
                  dateTime = newDataTime;
                });
              }
            },
          ));
    } else if (controller.pickerValue.value == "Country") {
      print(country
          .map((item) => Center(child: Text(item.countryName)))
          .toList());
      return SizedBox(
        height: getProportionateScreenHeight(205),
        width: MediaQuery.of(context).size.width,
        child: CupertinoPicker(
          magnification: 1.5,
          backgroundColor: Colors.white,
          itemExtent: 50,
          // height of each item
          // looping: true,
          children: country
              .map((item) => Center(child: Text(item.countryName)))
              .toList(),
          onSelectedItemChanged: (index) {
            setState(() => name = index);
            // selectItem = items[index];

            print("Selected Iem: ");
            // setState(() {
            //   selectItem=value.toString();
            // });
          },
        ),
      );
    } else {
      Container();
    }
  }

  getSixedController(BuildContext context, int index,
      {TextEditingController? controller}) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: InkWell(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.045,
          width: getProportionateScreenWidth(140),
          child: EnsureVisibleWhenFocused(
            focusNode: _focuss[index],
            child: InkWell(
              child: TextFormField(
                readOnly: true,
                showCursor: true,
                focusNode: _focuss[index],
                onChanged: (value) {
                  print("value $value");
                },
                onTap: () {
                  // keyboardController.setKeypad(CAPITALKEYBOARD);
                  //     keyboardController.controllerSetup(controller!);
                  //     keyboardController.focusSetup(_focuss[index], controller);
                  //     keyboardController.setPicker("");
                  // controller.text = '';
                  // _focuss[index].requestFocus();
                  // scrollController
                  //     .jumpTo(scrollController.position.maxScrollExtent);
                  if (keyboardController.editProfile.value == true) {
                    if (controller == widget.Salutaion) {
                      keyboardController.setKeypad('');
                      keyboardController.setPicker('Salutation');

                      setState(() {});
                    } else if (controller == widget.Country) {
                      print('objectCountry');
                      keyboardController.setKeypad('');
                      keyboardController.setPicker('Country');

                      setState(() {});
                    } else if (controller == widget.DOB) {
                      keyboardController.setKeypad('');
                      keyboardController.setPicker('DOB');

                      setState(() {});
                    } else if (index == 10) {
                      keyboardController.setKeypad(SYMBOLSKEYBOARD);
                      keyboardController.controllerSetup(controller!);
                      keyboardController.focusSetup(_focuss[index], controller);
                      keyboardController.setPicker("");
                    } else if (controller == widget.Postal) {
                      keyboardController.setKeypad(SYMBOLSKEYBOARD);
                      keyboardController.controllersetupforguest = "zipcode";
                      keyboardController.controllerSetup(widget.Postal);

                      keyboardController.symbolTrue(false);
                    } else {
                      keyboardController.changekeypad(CAPITALKEYBOARD);
                      keyboardController.controllerSetup(controller!);
                      keyboardController.focusSetup(_focuss[index], controller);
                      keyboardController.setPicker("");
                    }
                  }
                },
                controller: controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  // hintText: "Mail ID",
                  filled: _isFocus[index],
                  fillColor: textFieldColor,
                ),
                style: const TextStyle(fontSize: 21),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container getSizedBox(BuildContext context, String value) {
    return Container(
      width: getProportionateScreenWidth(150),
      decoration: const BoxDecoration(
          border: Border(right: BorderSide(color: Colors.grey))),
      height: MediaQuery.of(context).size.height * 0.056,
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            value,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
        ),
      ),
    );
  }

  Container sizedBoxImage(BuildContext context, {String? controller}) {
    String image = '';
    return Container(
      height: widget.actualHeight / 7.4,
      width: widget.actualHeight / 7.4,
      decoration: BoxDecoration(
          border: Border.all(),
          color: Colors.white,
          borderRadius: BorderRadius.circular(70)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(200),
        child: FittedBox(
          fit: BoxFit.fill,
          child: Image.network(image),
        ),
      ),
    );
  }

  SizedBox sizedBoxController2(BuildContext context, String? value) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.056,
      width: getProportionateScreenWidth(140),
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

  Future<void> sendImageFile(File imageFile) async {
    // Define the API endpoint URL
    final url = Uri.parse('YOUR_API_ENDPOINT_URL');

    // Create a multipart request
    var request = http.MultipartRequest('POST', url);

    // Attach the image file to the request
    var imageStream = http.ByteStream(imageFile.openRead());
    var length = await imageFile.length();
    var multipartFile = http.MultipartFile('image', imageStream, length,
        filename: imageFile.path);

    // Add the image file to the request
    request.files.add(multipartFile);

    // Send the request and get the response
    var response = await request.send();

    // Check if the request was successful
    if (response.statusCode == 200) {
      print('Image uploaded successfully');
    } else {
      print('Image upload failed with status: ${response.statusCode}');
    }
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

class DrawTriangleShape extends CustomPainter {
  Paint backgroundPainter = Paint();
  Paint borderPainter = Paint();

  DrawTriangleShape() {
    backgroundPainter = Paint()
      ..color = const Color.fromRGBO(214, 213, 213, 1)
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round

      // ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    borderPainter = Paint()
      ..color = Colors.grey[600]!
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();

    path.lineTo(0.0, 0.0);
    path.lineTo(size.width / 1.4, 0.0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width / 1.4, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    // path.moveTo(size.width / 2, 50);
    // path.lineTo(0, size.height);
    // path.lineTo(size.height, size.width);
    // path.close();

    canvas.drawPath(path, backgroundPainter);
    canvas.drawPath(path, borderPainter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

  commonTextVariable(String values) {
    return Text(
      values,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
    );
  }
}
