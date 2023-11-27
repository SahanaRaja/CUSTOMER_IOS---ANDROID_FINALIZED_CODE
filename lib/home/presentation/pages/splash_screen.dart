// ignore_for_file: invalid_use_of_protected_member

import 'dart:convert';
import 'dart:typed_data';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/pages/icon_access_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/app_constants.dart';
import 'package:customer_assist/core/helpers/SharedPreference/prefs.dart';

import '../../../core/utils/size_config.dart';
import '../controllers/fetch_country_controller.dart';
import '../controllers/header_controller.dart';
import '../controllers/keyboard_controller.dart';
import '../controllers/menu_controller.dart';
import '../controllers/options_controller.dart';
import '../controllers/splash_controller.dart';
import '../controllers/view_controller.dart';

class SplashScreen extends StatefulWidget {
  final double actualHeight;
  const SplashScreen({Key? key, required this.actualHeight}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Widget splashImage = const SizedBox();
  bool firstTime = false;
  ViewController viewController = Get.find();
  FetchCountryController fetchCountryController = Get.find();
  HeaderController headerController = Get.put(HeaderController());
  OptionsController optionsController = Get.find();
  KeyboardController keyboardController = Get.find();
  MenuOptionController menuController = Get.find();
  var languageController = Get.put(LanguageController());

  @override
  void initState() {
    Prefs.firstTimeSplash.then((value) => {firstTime = value});
    getBase64Image1();
    optionsController.getUserIcons();
    optionsController.getMenuBackIcons();
    super.initState();
  }

  getBase64Image1() {
    setState(() {
      splashImage = GetX<SplashController>(
        init: SplashController(),
        initState: (_) {},
        builder: (controller) => SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                controller.splashResponseInit == []
                    ? ''
                    : controller.splashResponseInit[0].title,
                style: const TextStyle(
                  fontSize: 26,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: getImagenBase64(
                    controller.splashResponseInit[0].logo_text,
                    10,
                    50,
                    BoxFit.contain),
              ),
              const SizedBox(
                height: 50,
              ),
              (firstTime == true)
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              skipOnce();
                            },
                            child: Container(
                                decoration: const BoxDecoration(
                                    color: Colors.lightBlueAccent,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25))),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0,
                                      bottom: 8.0,
                                      left: 20.0,
                                      right: 20.0),
                                  child: Text(
                                    languageController
                                            .languageResponse.value.skipOnce ??
                                        '',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                          ),
                          InkWell(
                            onTap: () {
                              skipAlways();
                            },
                            child: Container(
                                decoration: const BoxDecoration(
                                    color: Colors.lightBlueAccent,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25))),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0,
                                      bottom: 8.0,
                                      left: 20.0,
                                      right: 20.0),
                                  child: Text(
                                    languageController.languageResponse.value
                                            .skipAlways ??
                                        '',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                          ),
                        ],
                      ),
                    )
                  : Container()
            ],
          ),
        ),
      );

      Future.delayed(const Duration(seconds: 7), () {
        getBase64Image2();
      });
    });
  }

  void getBase64Image2() {
    setState(() {
      splashImage = GetX<SplashController>(
        init: SplashController(),
        initState: (_) {},
        builder: (controller) => SizedBox(
          height: GetPlatform.isAndroid
              ? (widget.actualHeight - 40) -
                  (widget.actualHeight / 16.5) * 2 -
                  88
              : (widget.actualHeight - MediaQuery.of(context).padding.bottom) -
                  (widget.actualHeight / 16.5) * 2 -
                  88,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                controller.splashResponseInit == []
                    ? ''
                    : controller.splashResponseInit[1].title,
                style: const TextStyle(
                  fontSize: 26,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: getImagenBase64(
                    controller.splashResponseInit[1].logo_text,
                    10,
                    50,
                    BoxFit.fitWidth),
              ),
              // (firstTime == true)
              //     ? InkWell(
              //         onTap: () {
              //           viewController.setFlagView(SPLASH);
              //           getView();
              //         },
              //         child: const Text(
              //           'SKIP',
              //           style: TextStyle(
              //             fontSize: 30,
              //             color: Colors.black,
              //             fontWeight: FontWeight.bold,
              //           ),
              //         ),
              //       )
              //     : Container(),
              (firstTime == true)
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              skipOnce();
                            },
                            child: Container(
                                decoration: const BoxDecoration(
                                    color: Colors.lightBlueAccent,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25))),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0,
                                      bottom: 8.0,
                                      left: 20.0,
                                      right: 20.0),
                                  child: Text(
                                    languageController
                                            .languageResponse.value.skipOnce ??
                                        '',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                          ),
                          InkWell(
                            onTap: () {
                              skipAlways();
                            },
                            child: Container(
                                decoration: const BoxDecoration(
                                    color: Colors.lightBlueAccent,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25))),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0,
                                      bottom: 8.0,
                                      left: 20.0,
                                      right: 20.0),
                                  child: Text(
                                    languageController.languageResponse.value
                                            .skipAlways ??
                                        '',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                          ),
                        ],
                      ),
                    )
                  : Container()
            ],
          ),
        ),
      );
      Future.delayed(const Duration(milliseconds: 3000), () {
        // headerController.setSubHeaderLabel(MOBILENUMBER);
        Prefs.setFirstTimeSplash(true);
        // userConditionCheck();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const IconPageTab()),
        );
    
        optionsController.showImages();
        optionsController.showShadow();
        optionsController.setOptionList('');
        keyboardController.setKeypad('');
        viewController.setView('');
      });
      // Future.delayed(const Duration(seconds: 6), () {
      //   getBase64Image3();
      // });
    });
  }

  void getBase64Image3() {
    viewController.setFlagView(SPLASH);
    setState(() {
      splashImage = GetX<SplashController>(
        init: SplashController(),
        initState: (_) {},
        builder: (controller) => SizedBox(
          height: GetPlatform.isAndroid
              ? (widget.actualHeight - 40) -
                  (widget.actualHeight / 16.5) * 2 -
                  88
              : (widget.actualHeight - MediaQuery.of(context).padding.bottom) -
                  (widget.actualHeight / 16.5) * 2 -
                  88,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                controller.splashResponse.value == []
                    ? ''
                    : controller.splashResponse[2].title,
                style: const TextStyle(
                  fontSize: 26,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: getImagenBase64(controller.splashResponse[2].logo_text,
                    10, 50, BoxFit.fitWidth),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 120.0),
                  child: (firstTime == true)
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () {
                                  skipOnce();
                                },
                                child: Container(
                                    decoration: const BoxDecoration(
                                        color: Colors.lightBlueAccent,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(25))),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0,
                                          bottom: 8.0,
                                          left: 20.0,
                                          right: 20.0),
                                      child: Text(
                                        languageController.languageResponse
                                                .value.skipOnce ??
                                            '',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )),
                              ),
                              InkWell(
                                onTap: () {
                                  skipAlways();
                                },
                                child: Container(
                                    decoration: const BoxDecoration(
                                        color: Colors.lightBlueAccent,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(25))),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0,
                                          bottom: 8.0,
                                          left: 20.0,
                                          right: 20.0),
                                      child: Text(
                                        languageController.languageResponse
                                                .value.skipAlways ??
                                            '',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        )
                      : Container()),
            ],
          ),
        ),
      );

      Future.delayed(const Duration(milliseconds: 3000), () {
        // headerController.setSubHeaderLabel(MOBILENUMBER);
        Prefs.setFirstTimeSplash(true);
        // userConditionCheck();
        
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const IconPageTab()),
          
        );
       
        optionsController.showImages();
        optionsController.showShadow();
        optionsController.setOptionList('');
        keyboardController.setKeypad('');
        viewController.setView('');
      });
    });
  }

  void userConditionCheck() {
    Prefs.shopId.then((value) {
      if (value == '') {
        headerController.setSubHeaderLabel(
            languageController.languageResponse.value.ownerDetails ?? '');
        viewController.setView(OWNERDETAILS);
        viewController.setFlagView(SPLASH);
      } else {
        getView();
      }
    });
  }

  getView() async {
    // optionsController.showImages();
    // optionsController.setOptionList('');
    // keyboardController.setKeypad('');
    // headerController.setSubHeaderLabel(
    //     languageController.languageResponse.value.ownerDetails ?? '');
    // menuController.deActiveMenu();
    // viewController.setView(OWNERDETAILS);

    optionsController.showImages();
    optionsController.showShadow();
    optionsController.setOptionList('');
    keyboardController.setKeypad('');
    headerController.setSubHeaderLabel(
        languageController.languageResponse.value.credits ?? '');
    menuController.deActiveMenu();
    viewController.setView(CREDITS);
    // catalogueController.fetchMainCatalogue(await Prefs.shopId);
    viewController.setFlagView(SPLASH);
    // catalogueController.fetchUnit(await Prefs.shopId);
  }

  skipOnce() {
    Prefs.setSkipOnce(true);
    getView();
  }

  skipAlways() {
    Prefs.setSkipAlways(true);
    getView();
  }

  Widget getImagenBase64(
      String imageBase64, double height, double width, BoxFit fit) {
    const Base64Codec base64 = Base64Codec();
    if (imageBase64 == "") return Container();
    Uint8List bytes = base64.decode(imageBase64);
    return Image.memory(
      bytes,
      height: height,
      width: width,
      fit: fit,
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: 700,
      color: Colors.white,
      child: Center(child: splashImage),
      // child: Image.network(controller.splashResponse.value[0].logo),
    );
  }
}
