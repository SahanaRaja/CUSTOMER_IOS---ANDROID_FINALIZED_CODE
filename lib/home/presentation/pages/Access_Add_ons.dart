// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, prefer_const_constructors_in_immutables

import 'package:customer_assist/home/data/configure/datasources/configure_data_remote_data_source.dart';
import 'package:customer_assist/home/presentation/controllers/header_controller.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/controllers/order_controller.dart';
import 'package:customer_assist/home/presentation/controllers/shop_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../../core/app_constants.dart';
// import '../../controllers/header_controller.dart';
// import 'manager_access.dart';

class AddonsAccess extends StatefulWidget {
  double actualHeight;
  AddonsAccess({
    Key? key,
    required this.actualHeight,
  }) : super(key: key);


  @override
  State<AddonsAccess> createState() => _AddonsAccessState();
}

class _AddonsAccessState extends State<AddonsAccess> {
  var headerController = Get.put(HeaderController());
 var languageController = Get.put(LanguageController());
 var shopController = Get.put(ShopController());
 var orderController = Get.put(OrderController());
  
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
                   headerController.setTimeChange();
                    headerController.setSubHeaderLabel(
                        languageController.languageResponse.value.calculate ??
                                                            ''
                                                    //'CALCULATE'
                                                    );
                                                    optionsController.optionIndexSetter(0);
                                                optionsController
                                                    .setOptionList(CALCULATE);
                                                optionsController.getCalculator();
                                                viewController.setView('');
                    // Handle onTap for image 1
                    print(' Image 1 is tapped...! ');
                  },
                child: 
                  Container(
                      height: 100,
                      width: 120,
                      child: optionsController.calculate
                      ),
                  
                ),
                SizedBox(height: 10.0),
                GestureDetector(
                  onTap: () {
                   viewController.setView(INFO);
                   viewController.setInfoMessage('The following screens provide a DEMO of the power of Augmented Reality and the Immersive Experience it provides. As merchants sign in , the same will be available as part of the respective Application.');
                    headerController
                        .setSubHeaderLabel('Augmented Reality');
                        optionsController.setOptionList(AREXP);
                        optionsController.getArExperience();
                        optionsController.setSetState();
                        optionsController.optionIndexSetter(0);
                      
                       shopController.downloadRestaurantProduct(languageController.languagenum.toString()) ;

                    // Handle onTap for image 2
                    print(' Image 2 is tapped...! ');
                  },
                  child: Container(
                      height: 100,
                      width: 120,
                      child: optionsController.arexp
                      ),
                  
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
                   
                    // Handle onTap for image 3
                    print(' Image 3 is tapped...! ');
                  },
                  child: Container(
                      height: 100,
                      width: 120,
                      child: optionsController.communicate),
                 
                ),
                SizedBox(
                  height: 10.0
                ),
                GestureDetector(
                  onTap: () {
                    // Handle onTap for image 4
                    print(' Image 4 is tapped...! ');
                    viewController.setView('');
                     orderController.fetchShare();
                         optionsController.getReviewSettings();
                     optionsController.setOptionList(REVIEWSTORE);
                     viewController.setView('');
                     headerController.setSubHeaderLabel('Add-Ons');
                     optionsController.optionIndexSetter(0);
                  },
                  child: Container(
                      height: 100,
                      width: 120,
                      child: optionsController.addons),
                  
                ),
                SizedBox(height: 10.0),
                GestureDetector(
                  onTap: () {
                   viewController.setView(SUPPORTACCESS);
                    headerController
                        .setSubHeaderLabel('Direct Access - Support');
                    // Handle onTap for image 5
                    print(' Image 5 is tapped...! ');
                  },
                  child: Container(
                      height: 100,
                      width: 120,
                      child: optionsController.supportaccess),
                  
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
                    
                    // Handle onTap for image 7
                    print(' Image 7 is tapped...! ');
                  },
                  child: Container(
                      height: 100,
                      width: 120,
                      child: optionsController.marketplace),
                  
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
