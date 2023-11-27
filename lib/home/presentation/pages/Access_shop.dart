// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, prefer_const_constructors_in_immutables

import 'package:customer_assist/core/helpers/SharedPreference/prefs.dart';
import 'package:customer_assist/home/data/configure/datasources/configure_data_remote_data_source.dart';
import 'package:customer_assist/home/presentation/controllers/configure_controller.dart';
import 'package:customer_assist/home/presentation/controllers/header_controller.dart';
import 'package:customer_assist/home/presentation/controllers/keyboard_controller.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/controllers/order_controller.dart';
import 'package:customer_assist/home/presentation/controllers/owner_data_controller.dart';
import 'package:customer_assist/home/presentation/controllers/shop_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../../core/app_constants.dart';
// import '../../controllers/header_controller.dart';
// import 'manager_access.dart';

class ShopAccess extends StatefulWidget {
  double actualHeight;
  ShopAccess({
    Key? key,
    required this.actualHeight,
  }) : super(key: key);


  @override
  State<ShopAccess> createState() => _ShopAccessState();
}

class _ShopAccessState extends State<ShopAccess> {
  var headerController = Get.put(HeaderController());
  var languageController = Get.put(LanguageController());
  var keyboardController = Get.put(KeyboardController());
  var orderController = Get.put(OrderController());
  var configureController = Get.put(ConfigureController());
  var addressController = Get.put(AddressController());
  var shopController = Get.put(ShopController());
bool? validateCountry;
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
                    if(optionsController.shoppingMode.value == '1'){
                        optionsController
                                                        .getShopatStoreOptions();
                                                    optionsController.setOptionList(
                                                        SHOPATSTORE);
                                                        headerController.setSubHeaderLabel('Shop at Store');
                                                        viewController.setView(INFO);
                                                        viewController.setInfoMessage('You can use the same App to shop at store and pay for the material without having to stand in Cashiers Queue. When you enter the shop the shop name will be automatically populated');
                                                    
                                                    optionsController
                                                        .optionIndexSetter(0);
                                                    optionsController.setSetState();
                    }else {

                    }
                  
                    // Handle onTap for image 1
                    print(' Image 1 is tapped...! ');
                  },
                  child: Container(
                      height: 100,
                      width: 120,
                      child:(optionsController.shoppingMode.value == '1')
                     ? optionsController.shopatstore
                     : optionsController.fromehome
                     )
                     ,
                  
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
                                                                .reviewStore ??''
                                                       // 'Review Store'
                                                        );
                                                Prefs.superUserLoggedIn
                                                    .then((value) {
                                                  if (value) {
                                                  //    Prefs.setReviewId(orderController.fetchProductReviewResponse.value[index]
                                                  //  .reviewId!);
                                                    orderController
                                                        .fetchstoreReview(
                                                            languageController
                                                                .languagenum
                                                                .toString());
                                                    orderController
                                                        .fetchProductReview(
                                                            languageController
                                                                .languagenum
                                                                .toString(),'');
                                                    viewController
                                                        .setView(REVIEWSTORE);
                                                   optionsController.setOptionList(REVIEWCART);
                                                   optionsController.getReviewcart();
                                                    optionsController
                                                        .optionIndexSetter(2);
                                                        keyboardController
                                                              .setKeypad('');
                                                          keyboardController
                                                              .setPicker('');
                                                    optionsController.setSetState();
                                                  } else {
                                                    //added by saha
                                                    viewController
                                                        .setView(ERROR);
                                                    viewController
                                                        .setErrorMessage(
                                                      // languageController
                                                      //         .languageResponse
                                                      //         .value
                                                      //         .reviewStore ??
                                                       languageController
                                                                    .languageResponse
                                                                    .value
                                                                    .reviewDetails ??''
                                                     // 'Please log in to view and update your Review Details',
                                                    );
                                                  }
                                                });
                    // Handle onTap for image 2
                    print(' Image 2 is tapped...! ');
                  },
                  child: Container(
                      height: 100,
                      width: 120,
                      child: optionsController.review),
                  
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
                    Prefs.superUserLoggedIn
                                                    .then((value) async {
                                                  if (value) {
                                                    headerController
                                                        .setSubHeaderLabel(
                                                          //  languageController
                                                          //           .languageResponse
                                                          //           .value
                                                          //           .currentSettings ??
                                                                  //  ''
                                                           'Current Settings'
                                                            );
                                                           

                                                    if (optionsController.shoppingMode
                                                                .value ==
                                                            '0' 
                                                            ||
                                                        await Prefs
                                                                .shoppingMode ==
                                                            '0' 
                                                            ||
                                                        await Prefs
                                                                .shoppingMode ==
                                                            ''
                                                        ) {
                                                      optionsController.getShopFromHomeList(
                                                          addressController
                                                              .retailResponse[
                                                                  optionsController
                                                                      .vertical]
                                                              .base64Imageid!
                                                              .toString());
                                                    } else {
                                                      optionsController.getShopatStore(
                                                          addressController
                                                              .retailResponse[
                                                                  optionsController
                                                                      .vertical]
                                                              .base64Imageid!
                                                              .toString());
                                                    }
                                                     configureController
                                                        .fetchDetails(
                                                            languageController
                                                                .languagenum
                                                                .toString());
                                                    keyboardController
                                                        .setKeypad('');
                                                    keyboardController
                                                        .setPicker('');
                                                    optionsController.setSetState();

                                                    optionsController.setOptionList(
                                                        CONFIGURE);
                                                    checkCountry();

                                                    // controller
                                                    //     .optionIndexSetter(-1);

                                                    configureController.fetchCustomerDeliveryAddress(
                                                    languageController.languagenum.toString());
                                                    configureController
                                                   .fetchShopType(languageController.languagenum.toString());
                                                    optionsController.setSetState();
                                                  } else {
                                                    viewController
                                                        .setView(ERROR);
                                                    viewController
                                                        .setErrorMessage(
                                                      languageController
                                                              .languageResponse
                                                              .value
                                                              .updateYourConfigureDetails ??
                                                          '',
                                                    );
                                                  }
                                                });
                                                
                                                optionsController.setSetState();
                                                optionsController.hideShadow();
                                                keyboardController
                                                    .setKeypad("");
                  
                    // Handle onTap for image 3
                    print(' Image 3 is tapped...! ');
                  },
                  child: Container(
                      height: 100,
                      width: 120,
                      child: optionsController.cursettings),
                  
                ),
                SizedBox(height: 10.0),
                GestureDetector(
                  onTap: () async{
                     headerController.setTimeChange();
                       
                       
                        Prefs.superUserLoggedIn.then((value)async {
                         if (value) {
                          print("shop id =====${await Prefs.shopId}");
                          if(await Prefs.shopId == ''){
                         viewController.setView(INFO);
                         viewController.setInfoMessage('Kindly update the shop in Current Settings, then only you can shop.');

                      }else {
                                    // if (optionsController.outlet ==
                                    //                 '41') {
                                                  Prefs.setSuperUserShopId(true);
                                                  shopController.downloadRestaurantProduct(
              languageController.languagenum.toString());
                                                      headerController
                                                          .setSubHeaderLabel(
                                                              languageController
                                                                      .languageResponse
                                                                      .value
                                                                      .shop ??
                                                                  '');
                                                      // keyboardController
                                                      //     .setEdit(false);
                                                      viewController
                                                          .setView('');
                                                      optionsController.getShopList();
                                                      optionsController
                                                          .setOptionList(SHOP);

                                                      // viewController
                                                      //     .setUserOption(SHOP);
                                                      optionsController
                                                          .hideShadow();
                                                     keyboardController
                                                              .setKeypad('');
                                                          keyboardController
                                                              .setPicker('');
                                                      optionsController
                                                          .optionIndexSetter(0);
                                                      optionsController.setSetState();
                                                    //} 
                                                    }}
                                                  
                                                // else {
                                                  // sofiya..
                                            //       if (viewController.qrvalue !=
                                            //           "") {
                                            //         optionsController
                                            //             .setSetState();
                                            //         headerController
                                            //             .setSubHeaderLabel(
                                            //                 languageController
                                            //                         .languageResponse
                                            //                         .value
                                            //                         .shop ??
                                            //                     '');
                                            //         keyboardController
                                            //             .setEdit(false);
                                            //         optionsController
                                            //             .getShopList();
                                            //         optionsController
                                            //             .setOptionList(SHOP);
                                            //         // viewController
                                            //         //     .setUserOption(SHOP);
                                            //         viewController.setView('');
                                            //         optionsController
                                            //             .hideShadow();
                                            //         keyboardController
                                            //             .setKeypad("");
                                            //         optionsController
                                            //             .optionIndexSetter(0);
                                            //         optionsController
                                            //             .setSetState();
                                            //       } else {
                                            //         if (configureController
                                            //                 .fetchdetails
                                            //                 .value
                                            //                 .menu![0]
                                            //                 .subMenu![0]
                                            //                 .value! !=
                                            //             'SHOP FROM HOME') {
                                            //           viewController
                                            //               .setView(RESQRCODE);
                                            //         } else {
                                            //           optionsController
                                            //               .setSetState();
                                            //           headerController
                                            //               .setSubHeaderLabel(
                                            //                   languageController
                                            //                           .languageResponse
                                            //                           .value
                                            //                           .shop ??
                                            //                       '');
                                            //           keyboardController
                                            //               .setEdit(false);
                                            //           optionsController
                                            //               .getShopList();
                                            //           optionsController
                                            //               .setOptionList(SHOP);
                                            //           // viewController
                                            //           //     .setUserOption(SHOP);
                                            //           viewController
                                            //               .setView('');
                                            //           optionsController
                                            //               .hideShadow();
                                            //           keyboardController
                                            //               .setKeypad("");
                                            //           optionsController
                                            //               .optionIndexSetter(
                                            //                   -1);
                                            //           optionsController
                                            //               .setSetState();
                                            //         }
                                            //       }
                                            //     }

                                            //  }}
                                             else {
                                              
                                                      viewController
                                                          .setView(ERROR);
                                                      viewController
                                                          .setErrorMessage(
                                                        languageController
                                                                .languageResponse
                                                                .value
                                                                .updateYourShopDetails ??
                                                            '',
                                                      );
                                                }
                                                }
                                                );

                      
                                                
                                                 
                                             
                    // Handle onTap for image 4
                    print(' Image 4 is tapped...! ');
                  },
                  child: Container(
                      height: 100,
                      width: 120,
                      child: optionsController.shop),
                  
                ),
                SizedBox(height: 10.0),
                GestureDetector(
                  onTap: () {
                  
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
                     optionsController.setOptionList(NEWORDERCHANGE);
                    viewController.setView(CATALOG);
                                                //added by sahana
                  headerController.subHeaderLabel(
                          'By Product Catalog'
                      );
                    headerController.subThirdHeaderLabel('Items');
                      optionsController.optionIndexSetter(2);
                      optionsController.setSetState();
                   
                   
                    print(' Image 6 is tapped...! ');
                  },
                  child: Container(
                      height: 100,
                      width: 120,
                      child: optionsController.catalog),
                 
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
                      child: optionsController.manage),
                  
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

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
