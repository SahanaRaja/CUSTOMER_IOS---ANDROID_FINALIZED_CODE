// ignore_for_file: sized_box_for_whitespace, unused_local_variable, prefer_const_constructors

import 'package:customer_assist/core/app_colors.dart';
import 'package:customer_assist/core/utils/size_config.dart';
import 'package:customer_assist/home/data/posmasterSelection/models/pos_master_response_model.dart';
import 'package:customer_assist/home/presentation/controllers/header_controller.dart';
import 'package:customer_assist/home/presentation/controllers/keyboard_controller.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/controllers/pos_master_selection_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LanguageSelectionTab extends StatefulWidget {
  final KeyboardController keyboardController;
  final HeaderController headercontroller;
  final double actualHeight;

  const LanguageSelectionTab(
      {Key? key,
      required this.keyboardController,
      required this.actualHeight,
      required this.headercontroller})
      : super(key: key);

  @override
  State<LanguageSelectionTab> createState() => _LanguageSelectionTabState();
}

class _LanguageSelectionTabState extends State<LanguageSelectionTab> {
  var languagenum = 0;
  var padder = false;

  PosMasterSelectionController posMasterSelectionController = Get.find();

  List<LanguageSelectionResponseModel> languages = [];
  LanguageController languageController = Get.put(LanguageController());
  HeaderController headerController = Get.find();
  @override
  void initState() {
    super.initState();
    languageController.languageResponse.value;
    languages = posMasterSelectionController.LanguageResponse.value;

    // widget.keyboardController.setPicker('FIRSTLOAD');
  }

  pickerMethod(StateSetter setState, KeyboardController controller) {
    print(controller.changekeypad.value);
    if (controller.pickerValue.value == "Languages") {
      // widget.Salutaion.text = "";
      return Container(
        height: getProportionateScreenHeight(214),
        child: CupertinoPicker(
          magnification: 1.3,
          backgroundColor: AppColors.subHeaderContainer,
          itemExtent: 50, //height of each item
          looping: true,
          onSelectedItemChanged: (index) {
            setState(() {
              languagenum = index;
            });
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

          children: languages
              .map((item) => Center(
                  child: Text(item.languageName,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ))))
              .toList(),
        ),
      );
    } else {
      Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (languages.isEmpty) {
      posMasterSelectionController.posMasterSelection();
    }

    var langcount =
        languageController.languageResponse.value.defauldLanguage!.length;
    return Padding(
      padding: GetPlatform.isAndroid
         ?const EdgeInsets.only(top: 5)
         :const EdgeInsets.only(),
      child: Container(
          // color: Colors.blue,
          width: double.infinity,
          height: GetPlatform.isAndroid
              ? ((widget.actualHeight - 40) / 17.9) * 16
              : ((widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                      17.9) *
                  16.4,
          child: StatefulBuilder(builder: (buildcontext, setState) {
            // keyboardController.pickerValue.value = '';
            return Stack(
              children: [
                Column(
                  children: [
                    Container(
                     height: MediaQuery.of(context).size.height * 0.043,
              width: MediaQuery.of(context).size.width * 0.99,
              color: AppColors.subHeaderContainer,
                      child: Center(
                          child: Text(
                        " Set Language ",
                        // languageController.languageResponse.value.users ?? '',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      )),
                    ),
                    Positioned(
                      top: widget.actualHeight / 9.3,
                      child: Column(
                        children: [
                          Container(
                            width: 500,
                            height: 275,
                            // 98,
                            // margin: const EdgeInsets.only(bottom: 36.5),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 100),
                            child: GetX<LanguageController>(
                              init: LanguageController(),
                              initState: (_) {},
                              builder: (controller) {
                                return Text(
                                  languageController.languageResponse.value
                                          .defauldLanguage ??
                                      '',
                                  style: const TextStyle(
                                      fontSize: 17, color: Colors.grey),
                                  textAlign: TextAlign.center,
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: GetPlatform.isAndroid
                                ? (((widget.actualHeight - 40) / 17.9) * 2)
                                :
                                //  langcount > 50
                                //     ? ((widget.actualHeight -
                                //                 MediaQuery.of(context)
                                //                     .padding
                                //                     .bottom) /
                                //             17.9) *
                                //         0.05
                                //     :
    
                                ((widget.actualHeight -
                                            MediaQuery.of(context)
                                                .padding
                                                .bottom) /
                                        17.9) *
                                    0.0,
                          ),
                          Ink(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 2,
                              ), //Border.all
                              borderRadius: BorderRadius.circular(2),
                            ), //BoxDecoratio
                            child: InkWell(
                              onTap: () {
                                widget.keyboardController.setPicker('Languages');
                                widget.keyboardController.setKeypad('');
                              },
                              child: Container(
                                padding: const EdgeInsets.all(7),
                                child: GetX<LanguageController>(
                                  init: LanguageController(),
                                  initState: (_) {},
                                  builder: (controller) {
                                    return Text(
                                      languageController.languageResponse.value
                                              .selectLanguage ??
                                          '',
                                      style: padder == true
                                          ? const TextStyle(
                                              fontSize: 13,
                                            )
                                          : const TextStyle(
                                              fontSize: 20,
                                            ),
                                      textAlign: TextAlign.center,
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
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
                          height: 350,
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                child: Container(
                                  height: 50,
                                  width: MediaQuery.of(context).size.width,
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 10),
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
                                          widget.keyboardController.setKeypad('');
                                          widget.keyboardController.setPicker('');
                                        },
                                        child: Text(
                                          'CANCEL',
                                          style: GoogleFonts.openSans(
                                              color: Colors.white,
                                              fontSize: 25,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      GetX<LanguageController>(
                                        init: LanguageController(),
                                        initState: (_) {},
                                        builder: (controller) {
                                          if (controller.loading.value) {}
                                          return GestureDetector(
                                            onTap: () {
                                              controller.languagefetch(
                                                languageNum: languagenum + 1,
                                              );
    
                                              if (languagenum == 11) {
                                                padder = true;
                                              } else {
                                                padder = false;
                                              }
    
                                              // businessController
                                              //     .fetchBusinessHeadings(
                                              //         (languagenum + 1)
                                              //             .toString());
                                              // setState() {}
    
                                              widget.keyboardController
                                                  .setKeypad('');
                                              widget.keyboardController
                                                  .setPicker('');
                                            },
                                            child: Text(
                                              'DONE',
                                              style: GoogleFonts.openSans(
                                                  color: Colors.white,
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          );
                                        },
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
          })),
    );
  }
}
