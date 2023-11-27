// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, prefer_const_constructors_in_immutables

import 'package:customer_assist/core/helpers/SharedPreference/prefs.dart';
import 'package:customer_assist/home/data/configure/datasources/configure_data_remote_data_source.dart';
import 'package:customer_assist/home/presentation/controllers/header_controller.dart';
import 'package:customer_assist/home/presentation/controllers/keyboard_controller.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/controllers/reset_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../../core/app_constants.dart';
import '../controllers/configure_controller.dart';
// import '../../controllers/header_controller.dart';
// import 'manager_access.dart';

class ClientLogoutAccess extends StatefulWidget {
  double actualHeight;
  ClientLogoutAccess({
    Key? key,
    required this.actualHeight,
  }) : super(key: key);


  @override
  State<ClientLogoutAccess> createState() => _ClientLogoutAccessState();
}

class _ClientLogoutAccessState extends State<ClientLogoutAccess> {
  var headerController = Get.put(HeaderController());
  var keyboardController = Get.put(KeyboardController());
  var languageController = Get.put(LanguageController());
  var forggetController = Get.put(ResetController());
  var configureController = Get.put(ConfigureController());

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
                    Prefs.superUserLoggedIn.then((value) {
                      if (value) {
                        optionsController.optionIndexSetter(0);
                        optionsController.setSetState();
                        headerController.setSubHeaderLabel('Address Book');
                        configureController.fetchCustomerDeliveryAddress(
                            languageController.languagenum.toString());

                        keyboardController.addProfile.value = true;
                        keyboardController.editProfile.value = false;
                        viewController.setView(CHANGEDELIVERYADDRESS);
                        optionsController.setOptionList(ADDRESSBOOK);
                        optionsController.getAddressBook();
                      } else {
                        viewController.setView(ERROR);
                        viewController.setErrorMessage(
                          'Please login to view and update your Address',
                        );
                        
                      }
                    });
                  
                    print(' Image 1 is tapped...! ');
                  },
                  child: Container(
                      height: 100,
                      width: 120,
                      child: optionsController.addressbook),
                 
                ),
                SizedBox(height: 10.0),
                GestureDetector(
                  onTap: () {
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
                                                    viewController.setView('');
                                                    optionsController.getShopList();
                                                    optionsController.setOptionList(
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
                                                    optionsController.setSetState();
                                                  } else {
                                                    //added by saha
                                                    viewController
                                                        .setView(ERROR);
                                                    viewController
                                                        .setErrorMessage(
                                                      languageController
                                                              .languageResponse
                                                              .value
                                                              .profileError ??
                                                          '',
                                                    );
                                                  }
                                                });
                    // Handle onTap for image 2
                    print(' Image 2 is tapped...! ');
                  },
                  child: Container(
                      height: 100,
                      width: 120,
                      child: optionsController.settingsaccess),
                  
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
                   optionsController.getClientOptions();
                      viewController
                                                        .setView(CAUTION);
                                                    headerController
                                                        .subHeaderLabel(
                                                          languageController
                                                                    .languageResponse
                                                                    .value
                                                                    .logout ??''
                                                          //LOGOUT
                                                          );
                                                    keyboardController
                                                        .setKeypad('');
                                                    optionsController
                                                        .getclientLogout();
                                                    optionsController
                                                        .setState();
                        optionsController.setOptionList(CLIENT);
                       headerController.subHeaderLabel(LOGOUT);
                      optionsController.optionIndexSetter(1);
                      optionsController.setSetState();

                    // Handle onTap for image 3
                    print(' Image 3 is tapped...! ');
                  },
                  child: Container(
                      height: 100,
                      width: 120,
                      child: 
                      optionsController.logout
                    ),
                  ),
                SizedBox(height: 10.0),
                GestureDetector(
                  onTap: () {
                    Prefs.superUserLoggedIn.then((value) {
                    if (value) {
                       optionsController.getClientOptions();
                        viewController.setView('');
                      //added by saha
                        optionsController.setOptionList(CLIENT);
                       headerController.subHeaderLabel(CLIENT);
                      optionsController.optionIndexSetter(0);
                      optionsController.setSetState();

                    }else{

                    }
                    });
                   
                    // Handle onTap for image 4
                    print(' Image 4 is tapped...! ');
                  },
                  child: Container(
                      height: 100,
                      width: 120,
                      child: optionsController.client),
                 
                ),
                SizedBox(height: 10.0),
                GestureDetector(
                  onTap: () {
                   // viewController.setView(SUPPORTACCESS);
                    
                    // Handle onTap for image 5
                    print(' Image 5 is tapped...! ');
                  },
                  child: Container(
                      height: 100,
                      width: 120,
                      child: optionsController.blankaccess),
                 
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
                     Prefs.superUserLoggedIn.then((value) {
                   if (value) {
                     viewController.setView(SHOPACCESS);

                   }else{
                    viewController.setView(ERROR);
                      viewController.setErrorMessage(
                         'Please login to view and update your Shop details',
                       );
                      
                   }
                   });
                 
                    // Handle onTap for image 6
                    headerController
                        .setSubHeaderLabel('Direct Access - Shop');
                    print(' Image 6 is tapped...! ');
                  },
                  child: Container(
                      height: 100,
                      width: 120,
                      child: optionsController.shop),
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
                                                                .resetPassword ??
                                                            '');
                                                Prefs.superUserLoggedIn
                                                    .then((value) {
                                                  if (value) {
                                                    viewController.setView(
                                                        ClIENTCHANGEPASSWORD);
                                                     optionsController
                                                        .userSettingList();
                                            optionsController.setOptionList( USERSETTINGS);
                                            optionsController.setSetState();
                                            optionsController.optionIndexSetter(2);
                                            
                                            //viewController.setView(DELAGENTACCESS);
                                            headerController
                                                .setSubHeaderLabel('Change Password');
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
                                                        .setView(ERROR);
                                                    viewController
                                                        .setErrorMessage(
                                                      languageController
                                                              .languageResponse
                                                              .value
                                                              .profileError ??
                                                          '',
                                                    );
                                                  }
                                                });
                                                optionsController.hideShadow();
                    // //viewController.setView(DELAGENTACCESS);
                    // headerController
                    //     .setSubHeaderLabel('Direct Access - Del Agent');
                    // Handle onTap for image 7
                    print(' Image 7 is tapped...! ');
                  },
                  child: Container(
                      height: 100,
                      width: 120,
                      child: optionsController.changepassaccess),
                 ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
