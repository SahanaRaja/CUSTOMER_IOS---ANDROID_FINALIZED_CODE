// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, prefer_const_constructors_in_immutables

import 'package:customer_assist/home/data/configure/datasources/configure_data_remote_data_source.dart';
import 'package:customer_assist/home/presentation/controllers/header_controller.dart';
import 'package:customer_assist/home/presentation/controllers/keyboard_controller.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../../core/app_constants.dart';
// import '../../controllers/header_controller.dart';
// import 'manager_access.dart';

class SupportAccess extends StatefulWidget {
 double actualHeight;
  SupportAccess({
    Key? key,
    required this.actualHeight,
  }) : super(key: key);


  @override
  State<SupportAccess> createState() => _SupportAccessState();
}

class _SupportAccessState extends State<SupportAccess> {
  var headerController = Get.put(HeaderController());
  var languageController = Get.put(LanguageController());
  var keyboardController = Get.put(KeyboardController());

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
            //height: MediaQuery.of(context).size.height * 0.70,
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
                   
                    // Handle onTap for image 1
                    print(' Image 1 is tapped...! ');
                  },
                  child: Container(
                      height: 100,
                      width: 120,
                      child: optionsController.chattyaccess),
                 
                ),
                SizedBox(height: 10.0),
                GestureDetector(
                  onTap: () {
                   headerController
                                                    .setTimeChange();
                                                //headerController.setHeaderLabel('');
                                                headerController
                                                    .setSubHeaderLabel(
                                                      languageController
                                                                .languageResponse
                                                                .value
                                                                .expertViews ??
                                                            ''
                                                        //'Expert views'
                                                        );
                                                         optionsController
                                                    .setOptionList(SUPPORT);
                                                optionsController.getSupport();
                                                optionsController.optionIndexSetter(1);
                                                optionsController.setSetState();
                                                viewController
                                                    .setView(EXPERTVIEWS);
                                                optionsController.hideShadow();
                                                keyboardController
                                                    .setKeypad("");
                                                keyboardController
                                                    .setPicker('');
                    // Handle onTap for image 2
                    print(' Image 2 is tapped...! ');
                  },
                  child: Container(
                      height: 100,
                      width: 120,
                      child: optionsController.expertaccess),
                 
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
                   headerController
                                                    .setTimeChange();
                                                headerController
                                                    .setSubHeaderLabel(
                                                      //'FAQ'
                                                       languageController
                                                                .languageResponse
                                                                .value
                                                                .faq ??''
                                                      );
                                                      optionsController
                                                    .setOptionList(SUPPORT);
                                                optionsController.getSupport();
                                                optionsController.optionIndexSetter(2);
                                                optionsController.setSetState();
                                                viewController.setView(FAQ);
                                                optionsController.hideShadow();
                                                keyboardController
                                                    .setKeypad("");
                                                keyboardController
                                                    .setPicker('');
                    // Handle onTap for image 3
                    print(' Image 3 is tapped...! ');
                  },
                  child: Container(
                      height: 100,
                      width: 120,
                      child: optionsController.faqaccess),
                  
                ),
                SizedBox(height: 10.0),
                GestureDetector(
                  onTap: () {
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
                    // Handle onTap for image 4
                    print(' Image 4 is tapped...! ');
                  },
                  child: Container(
                      height: 100,
                      width: 120,
                      child: optionsController.supportaccess),
                  
                ),
                SizedBox(height: 10.0),
                GestureDetector(
                  onTap: () {
                   
                    print(' Image 5 is tapped...! ');
                  },
                  child: Container(
                      height: 100,
                      width: 120,
                      child: optionsController.summaryaccess),
                  
                ),
              ],
            ),
          ),
        ),
        Positioned(
          // top: 155,
          top: 260,
          //  140,
          left: 199,
          right: 0,
          // 35,
          // right: 41,
          // 69,

          child: Container(
            // color: Colors.green,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    headerController
                                                    .setTimeChange();
                                                viewController
                                                    .setView(TERMSANDCONDITION);
                                                headerController
                                                    .setSubHeaderLabel(
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
                                                optionsController.optionIndexSetter(5);
                                                optionsController.setSetState();
                    print(' Image 6 is tapped...! ');
                  },
                  child: Container(
                      height: 100,
                      width: 120,
                      child: optionsController.tcaccess),
                  
                ),
                SizedBox(height: 10.0),
                GestureDetector(
                  onTap: () {
                    headerController
                                                    .setTimeChange();
                                                headerController
                                                    .setSubHeaderLabel(
                                                      languageController
                                                                .languageResponse
                                                                .value
                                                                .resources ??
                                                            ''
                                                       // 'Resources'
                                                        );
                                                        optionsController
                                                    .setOptionList(SUPPORT);
                                                optionsController.getSupport();
                                                optionsController.optionIndexSetter(3);
                                                optionsController.setSetState();
                                                viewController
                                                    .setView(RESOURCES);
                                                optionsController.hideShadow();
                                                keyboardController
                                                    .setKeypad("");
                                                keyboardController
                                                    .setPicker('');
                    // Handle onTap for image 7
                    print(' Image 7 is tapped...! ');
                  },
                  child: Container(
                      height: 100,
                      width: 120,
                      child: optionsController.resourcessaccess),
                  
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
