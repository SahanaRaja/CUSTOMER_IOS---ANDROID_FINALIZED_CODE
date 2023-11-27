import 'dart:async';
import 'dart:convert';

import 'package:customer_assist/core/app_constants.dart';
import 'package:customer_assist/core/helpers/SharedPreference/prefs.dart';
import 'package:customer_assist/database/database.dart';
import 'package:customer_assist/home/presentation/controllers/configure_controller.dart';
import 'package:customer_assist/home/presentation/controllers/header_controller.dart';
import 'package:customer_assist/home/presentation/controllers/keyboard_controller.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/controllers/options_controller.dart';
import 'package:customer_assist/home/presentation/controllers/order_controller.dart';
import 'package:customer_assist/home/presentation/controllers/owner_data_controller.dart';
import 'package:customer_assist/home/presentation/controllers/view_controller.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class IconPageTab extends StatefulWidget {
  const IconPageTab({
    Key? key,
  }) : super(key: key);

  @override
  _IconPageTabState createState() => _IconPageTabState();
}

class _IconPageTabState extends State<IconPageTab> {
  OptionsController optionsController = Get.find();
  ViewController viewController = Get.find();
  KeyboardController keyboardController = Get.find();
  HeaderController headerController = Get.find();
  LanguageController languageController = Get.find();
  OrderController orderController = Get.find();
  var addressController = Get.put(AddressController());
  var configureController = Get.put(ConfigureController());

  double actualHeight = 0;
  var headerLabel = ''.obs;
  var togglelabel = ''.obs;
  var subHeaderLabel = ''.obs;
  var labelChange = false.obs;
   bool? validateCountry;
   late Position position;
  @override             
  void initState() {
     //value=false;
        Prefs.superUserLoggedIn.then((value) {
           //tempvalue=true;
        // });
        if (value) {
            optionsController.directAccessIconLogout();
         }else{
             optionsController. directAccessIcon();
         } });
   
    super.initState();
  }

  @override
  void didChangeDependencies() {
    actualHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return layoutWithoutHomeButton(context);
    
  }

  layoutWithoutHomeButton(BuildContext context) {
    return 
    Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
            bottom: false,
            child: Column(
              children: [
                SizedBox(
                  height: GetPlatform.isAndroid
                      ? (actualHeight - 40) * 1
                      : actualHeight - MediaQuery.of(context).padding.bottom,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        height: GetPlatform.isAndroid
                            ? (actualHeight / 19.8)
                            : (actualHeight / 16.5),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    width: GetPlatform.isAndroid
                                        ? (actualHeight / 19.8)
                                        : (actualHeight / 16.5) * 1 - 10,
                                    height: GetPlatform.isAndroid
                                        ? (actualHeight / 19.8)
                                        : (actualHeight / 16.5) * 1 - 10,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: InkWell(
                                        child: SizedBox(
                                      width: GetPlatform.isAndroid
                                          ? (actualHeight / 19.8)
                                          : (actualHeight / 16.5) * 1 - 10,
                                      height: GetPlatform.isAndroid
                                          ? (actualHeight / 19.8)
                                          : (actualHeight / 16.5) * 1 - 10,
                                    ))),
                                SizedBox(
                                  width: GetPlatform.isAndroid
                                      ? (actualHeight - 40) * .013
                                      : (actualHeight / 16.5) / 8.5,
                                ),
                                Container(
                                  // height: 45,
                                  // width: 300,
                                  width: GetPlatform.isAndroid
                                      ? (actualHeight - 40) * 0.33
                                      : (actualHeight / 16.5) * 5,//added by saha
                                      //4.8
                                  height: GetPlatform.isAndroid
                                      ? (actualHeight / 19.8)
                                      : (actualHeight / 16.5) * 0.85,
                                  color: Colors.grey,
                                  child: Center(
                                    //added by saha
                                      child: FittedBox(
                                        child: GetX<HeaderController>(
                                                init: HeaderController(),
                                                initState: (_) {},
                                                builder: (_) {
                                                  return Text(
                                                    headerController
                                                        .headerLabel.value,
                                                        style: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                                                          
                                                  );
                                                },
                                              ),
                                      )),
                                   
                                  
                                ),
                                SizedBox(
                                  width: GetPlatform.isAndroid
                                      ? (actualHeight - 40) * .013
                                      : (actualHeight / 16.5) * 0.3,
                                ),
                                SizedBox(
                                  width: GetPlatform.isAndroid
                                      ? (actualHeight - 40) * 0.07
                                      : (actualHeight / 16.5) * 1 - 10,
                                  height: GetPlatform.isAndroid
                                      ? (actualHeight - 40) * 0.05
                                      : (actualHeight / 16.5) * 1 - 10,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: GetPlatform.isAndroid
                            ? (actualHeight - 40) * 0.01
                            : (actualHeight / 16.5) * 0.0001,
                      ),
                      Container(
                        height: GetPlatform.isAndroid
                            ? (actualHeight / 19.8)
                            : (actualHeight / 16.5) * 1 - 5,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                                child: SizedBox(
                                 
                              width: GetPlatform.isAndroid
                                  ? (actualHeight - 40) * 0.053
                                  : (actualHeight / 16.5) * 1 - 10,
                              height: GetPlatform.isAndroid
                                  ? (actualHeight - 40)
                                  : (actualHeight / 16.5) * 1 - 10,
                                 
                              child: 
                              
                               RotationTransition(
                                turns: const AlwaysStoppedAnimation(180 / 360),
                                child: getHeaderLogo('Arrow Fwd Active'),
                              ),
                            )),
                            SizedBox(
                              width: GetPlatform.isAndroid
                                  ? (actualHeight - 40) * .013
                                  : (actualHeight / 16.5) / 8,
                            ),
                            Container(
                                width: GetPlatform.isAndroid
                                    ? (actualHeight - 40) * 0.33
                                    : (actualHeight / 16.5) * 5,//added by saha
                                height: GetPlatform.isAndroid
                                    ? (actualHeight / 19.8)
                                    : (actualHeight / 16.5) * 0.85,
                                color: Colors.grey[350],
                                child:  Center(
                                    child: Text(
                                  // 'Direct Feature Access',
                                  languageController.languageResponse.value
                                          .directFeatureAccess ??'',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal),
                                ))),
                            SizedBox(
                              width: GetPlatform.isAndroid
                                  ? (actualHeight - 40) * .013
                                  : (actualHeight / 16.5) / 8,
                            ),
                            SizedBox(
                              width: GetPlatform.isAndroid
                                  ? (actualHeight - 40) * 0.06
                                  : (actualHeight / 16.5) * 1 - 10,
                              height: GetPlatform.isAndroid
                                  ? (actualHeight - 40) * 0.05
                                  : (actualHeight / 16.5) * 1 - 10,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: GetPlatform.isAndroid
                            ? (actualHeight - 40) * 0.02
                            : (actualHeight / 16.5) * 0.15,
                      ),
                      Container(
                        padding:
                            const EdgeInsets.only(top: 20, left: 0, right: 0),
                        decoration: const BoxDecoration(
                            border: Border(
                          top: BorderSide(
                            color: Colors.black,
                            width: 0.5,
                          ),
                        )),
                        child: StatefulBuilder(builder: (context, setState) {
                          return SizedBox(
                            width: GetPlatform.isAndroid
                                ? (actualHeight - 40)
                                : (actualHeight),
                            height: GetPlatform.isAndroid
                                ? (actualHeight - 40) * 0.84
                                : (actualHeight) * 0.8,
                            // height:  MediaQuery.of(context).size.height,
                            // width: MediaQuery.of(context).size.width,
                            
                            child: 
                            GridView.builder(
                              
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: 
                              optionsController.directAccess.length,
                            
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: 15,
                                crossAxisSpacing: 2,
                                childAspectRatio: MediaQuery.of(context)
                                        .size
                                        .width /
                                    (MediaQuery.of(context).size.height / 2.9),
                              ),
                              itemBuilder: (context, index) {
                                 
                                return GestureDetector(
                                  onTap: () {
                                    optionsController
                                                  .optionIndexSetter(index);
                                    print('homepage');
                                    print(index);
                                    if (index == 0) {
                                      Navigator.pop(context);

                                      headerController.setHeaderLabel('USER');
                                      headerController
                                          .setSubHeaderLabel('Pick User');
                                      optionsController.showImages();
                                      optionsController.showShadow();
                                      optionsController.setOptionList('');
                                      keyboardController.setKeypad('');
                                      viewController.setView('');
                                    } else if (index == 1) {
                                      headerController.setHeaderLabel('USER');
                                      headerController
                                          .setSubHeaderLabel('Guest');
                                      addressController.fetchVertical(
                                          languageController.languagenum
                                              .toString());
                                      optionsController.setOptionList(GUEST);
                                      // viewController.setUserOption(GUEST);
                                      viewController.setView(INFO);
                                      viewController.setInfoMessage(
                                         // 'As a Guest User you can browse the products that are available at shops in selected retail vertical in specific country and in a specified area'
                                         languageController.languageResponse
                                                  .value.asGuestUser ??''
                                         );
                                      optionsController.hideShadow();
                                      
                                      keyboardController.setKeypad('');
                                      keyboardController.setEdit(false);
                                      //optionsController.guestImageList();
                                      Navigator.pop(context);
                                    } else if (index == 2) {
                                      getLocation();
                                      optionsController.setSetState();
                                      optionsController
                                          .setOptionList(REGISTERNEW);
                                      optionsController.getRegister();
                                      optionsController.getBrowseList();
                                      headerController
                                          .setSubHeaderLabel('Enroll');
                                      viewController.setView('');
                                      optionsController.optionIndexSetter(0);
                                      headerController.headerLabel('Guest');
                                      Navigator.pop(context);
                                    } else if (index == 3) {
                                      Navigator.pop(context);

                                      headerController.setHeaderLabel('USER');
                                      headerController
                                          .setSubHeaderLabel('Pick User');
                                      optionsController.showImages();
                                      optionsController.showShadow();
                                      optionsController.setOptionList('');
                                      keyboardController.setKeypad('');
                                      viewController.setView('');
                                    } else if (index == 4) {
                                      headerController.setHeaderLabel('USER');
                                      headerController
                                          .setSubHeaderLabel(
                                           // 'Client'
                                             languageController
                                                      .languageResponse
                                                      .value
                                                      .client ??''
                                            );
                                      optionsController.showImages();
                                      optionsController.showShadow();
                                      optionsController.setOptionList(CLIENT);
                                      keyboardController.setKeypad('');
                                      viewController.setView('');
                                      Navigator.pop(context);
                                    } else if (index == 5) {
                                      headerController.setHeaderLabel(
                                          languageController.languageResponse
                                                  .value.client ??
                                              '');
                                      // getOptionClient(optionsController, index);
                                      optionsController.setOptionList(CLIENT);
                                      viewController.setUserOption(CLIENT);

                                      Prefs.superUserLoggedIn.then((value) {
                                        if (value) {
                                          viewController.setView(CAUTION);
                                          headerController
                                              .subHeaderLabel(LOGOUT);
                                          keyboardController.setEdit(false);
                                          optionsController.getclientLogout();
                                          optionsController.setState();
                                        } else {
                                          viewController.setView(CLIENTLOGIN);
                                          headerController.setSubHeaderLabel(
                                              languageController
                                                      .languageResponse
                                                      .value
                                                      .login ??
                                                  '');
                                          keyboardController.setEdit(false);

                                          optionsController.getClientOptions();
                                          optionsController.setState();
                                        }
                                      });

                                      Navigator.pop(context);
                                    } else if (index == 6) {
                                                
                                                Prefs.superUserLoggedIn
                                                    .then((value) async {
                                                  if (value) {
                                              if (optionsController.shoppingMode
                                                                .value ==
                                                            '1' ||
                                                        await Prefs
                                                                .shoppingMode ==
                                                            '1' ||
                                                        await Prefs
                                                                .shoppingMode ==
                                                            '') {
                                                      optionsController.getShopFromHomeList(
                                                          addressController
                                                              .retailResponse[
                                                                  optionsController
                                                                      .vertical]
                                                              .base64Imageid
                                                              .toString());
                                                    } else {
                                                      optionsController.getShopatStore(
                                                          addressController
                                                              .retailResponse[
                                                                  optionsController
                                                                      .vertical]
                                                              .base64Imageid
                                                              .toString());
                                                    }
                                                     optionsController.setOptionList(
                                                        CONFIGURE);
                                                    checkCountry();
                                                     configureController
                                                        .fetchDetails(
                                                            languageController
                                                                .languagenum
                                                                .toString());
                                                                 headerController
                                                        .setSubHeaderLabel(
                                                            //'Current Settings'
                                                               languageController
                                                      .languageResponse
                                                      .value
                                                      .currentSettings ??''
                                                            );
                                                keyboardController
                                                        .setKeypad('');
                                                    keyboardController
                                                        .setPicker('');
                                                    optionsController.setSetState();

                                                  
                                                    optionsController
                                                        .optionIndexSetter(-1);

                                                    
                                                  } else {
                                                    viewController
                                                        .setView(ERROR);
                                                    viewController
                                                        .setErrorMessage(
                                                      // languageController
                                                      //         .languageResponse
                                                      //         .value
                                                      //         .updateYourConfigureDetails ??
                                                          'Please login to view and update your Configure Details',
                                                    );
                                                     // CHANGED BY BHAVA
                                          optionsController
                                              .setOptionList(REGISTERNEW);
                                          optionsController.getRegister();
                                          headerController
                                                        .setSubHeaderLabel(
                                                            '');
                                                    
                                                  }
                                                    });
                                      Navigator.pop(context);
                                    } else if (index == 7) {
                                      
                                                Prefs.superUserLoggedIn
                                                    .then((value) async {
                                                  if (value) {
                                                    
                                                      if (optionsController.shoppingMode
                                                                .value ==
                                                            '1' ||
                                                        await Prefs
                                                                .shoppingMode ==
                                                            '1' ||
                                                        await Prefs
                                                                .shoppingMode ==
                                                            '') {
                                                      optionsController.getShopFromHomeList(
                                                          addressController
                                                              .retailResponse[
                                                                  optionsController
                                                                      .vertical]
                                                              .base64Imageid
                                                              .toString());
                                                    } else {
                                                      optionsController.getShopatStore(
                                                          addressController
                                                              .retailResponse[
                                                                  optionsController
                                                                      .vertical]
                                                              .base64Imageid
                                                              .toString());
                                                    }
                                                     optionsController.setOptionList(
                                                        CONFIGURE);
                                                        headerController
                                                        .setSubHeaderLabel(
                                                           // 'Address Book'
                                                            languageController
                                                      .languageResponse
                                                      .value
                                                      .addressBook ??''
                                                            );
                                                    checkCountry();
                                                     configureController
                                                        .fetchDetails(
                                                            languageController
                                                                .languagenum
                                                                .toString());
                                                    optionsController.setSetState();
                                                    optionsController.showShadow();
                                                  
                                                    optionsController
                                                        .optionIndexSetter(-1);
                                                       keyboardController
                                                        .setKeypad('');
                                                    keyboardController
                                                        .setPicker('');
                                                    
                                                  } else {
                                                    viewController
                                                        .setView(ERROR);
                                                    viewController
                                                        .setErrorMessage(
                                                     
                                                          'Please login to view and update your Address',
                                                    );
                                                     // CHANGED BY BHAVA
                                          optionsController
                                              .setOptionList(REGISTERNEW);
                                          optionsController.getRegister();
                                                  }
                                                    });
                                     
                                                
                                      Navigator.pop(context);
                                    } else if (index == 8) {
                                      Prefs.superUserLoggedIn.then((value) {
                                        if (value) {
                                          headerController.setSubHeaderLabel(
                                              languageController
                                                      .languageResponse
                                                      .value
                                                      .shop ??
                                                  '');
                                          keyboardController.setEdit(false);
                                          viewController.setView('');
                                          optionsController.getShopList();
                                          optionsController.setOptionList(SHOP);
                                          viewController.setUserOption(SHOP);
                                          optionsController.hideShadow();
                                          keyboardController.setKeypad("");
                                          optionsController
                                              .optionIndexSetter(-1);
                                          optionsController.setSetState();
                                        } else {
                                          viewController.setView(ERROR);
                                          viewController.setErrorMessage(
                                            
                                                'Please login to view and update your Shop details',
                                          );
                                           // CHANGED BY BHAVA
                                          optionsController
                                              .setOptionList(REGISTERNEW);
                                          optionsController.getRegister();
                                        }
                                      });

                                      Navigator.pop(context);
                                    } else if (index == 9) {
                                              Prefs.superUserLoggedIn
                                                    .then((value) async {
                                                  if (value) {
                                                    
                                                      if (optionsController.shoppingMode
                                                                .value ==
                                                            '1' ||
                                                        await Prefs
                                                                .shoppingMode ==
                                                            '1' ||
                                                        await Prefs
                                                                .shoppingMode ==
                                                            '') {
                                                      optionsController.getShopFromHomeList(
                                                          addressController
                                                              .retailResponse[
                                                                  optionsController
                                                                      .vertical]
                                                              .base64Imageid
                                                              .toString());
                                                    } else {
                                                      optionsController.getShopatStore(
                                                          addressController
                                                              .retailResponse[
                                                                  optionsController
                                                                      .vertical]
                                                              .base64Imageid
                                                              .toString());
                                                    }
                                                    
                                                          if (viewController
                                                        .viewKey.value ==
                                                    CONFIGURE) {
                                                  if (await Prefs
                                                          .shoppingMode ==
                                                      '0') {
                                                    print("vjbdjfh");
                                                    optionsController
                                                        .getShopatStoreOptions();
                                                    optionsController.setOptionList(
                                                        SHOPATSTORE);
                                                    viewController.setView(
                                                        FREEFLOWSHOPPING);
                                                    headerController.setSubHeaderLabel(
                                                        languageController
                                                                .languageResponse
                                                                .value
                                                                .freeFlowShopping ??
                                                            '');
                                                    // viewController
                                                    //     .setUserOption(
                                                    //         SHOPATSTORE);
                                                    optionsController
                                                        .optionIndexSetter(-1);
                                                    optionsController.setSetState();
                                                  }
                                                } else if (viewController
                                                        .viewKey.value !=
                                                    CONFIGURE) {
                                                  print(
                                                      'viewController.shoppingMode${optionsController.shoppingMode.value}');
                                                  if (validateCountry == true) {
                                                    if (optionsController.shoppingMode
                                                            .value ==
                                                        '1') {
                                                      viewController
                                                          .setView('');
                                                      configureController
                                                          .shoppingMode(
                                                              '37',
                                                              '37',
                                                              languageController
                                                                  .languagenum
                                                                  .toString());
                                                      optionsController.getShopatStore(
                                                          addressController
                                                              .retailResponse[
                                                                  optionsController
                                                                      .vertical]
                                                              .base64Imageid
                                                              .toString());
                                                      optionsController.setSetState();
                                                    } else {
                                                      viewController
                                                          .setView('');

                                                      configureController
                                                          .shoppingMode(
                                                              '36',
                                                              '36',
                                                              languageController
                                                                  .languagenum
                                                                  .toString());
                                                      optionsController.getShopFromHomeList(
                                                          addressController
                                                              .retailResponse[
                                                                  optionsController
                                                                      .vertical]
                                                              .base64Imageid
                                                              .toString());
                                                      optionsController.setSetState();
                                                    }
                                                  }
                                                }
                                                 optionsController.setOptionList(
                                                        CONFIGURE);
                                                        headerController
                                                        .setSubHeaderLabel(
                                                            //'Select Shopping Mode'
                                                            languageController
                                                      .languageResponse
                                                      .value
                                                      .selectShoppingMode ??''
                                                            );
                                                    checkCountry();
                                                     configureController
                                                        .fetchDetails(
                                                            languageController
                                                                .languagenum
                                                                .toString());
                                                    optionsController.setSetState();
                                                    optionsController.showShadow();
                                                  
                                                    optionsController
                                                        .optionIndexSetter(-1);
                                                       keyboardController
                                                        .setKeypad('');
                                                    keyboardController
                                                        .setPicker('');
                                                    
                                                  } else {
                                                    viewController
                                                        .setView(ERROR);
                                                    viewController
                                                        .setErrorMessage(
                                                     
                                                          
                                                          'Please login to change your Shopping mode',
                                                    );
                                                     // CHANGED BY BHAVA
                                          optionsController
                                              .setOptionList(REGISTERNEW);
                                          optionsController.getRegister();
                                                  }
                                                });
                                     
                                      
                                      Navigator.pop(context);
                                    } else if (index == 10) {
                                      Prefs.superUserLoggedIn.then((value) {
                                        if (value) {
                                          headerController.setSubHeaderLabel(
                                              //'User Settings'
                                                languageController
                                                      .languageResponse
                                                      .value
                                                      .userSettings ??''
                                              );
                                          viewController.setView('');
                                          optionsController.getShopList();
                                          optionsController
                                              .setOptionList(USERSETTINGS);
                                          // viewController
                                          //     .setUserOption(USERSETTINGS);
                                          optionsController.hideShadow();
                                          optionsController.userSettingList();
                                          keyboardController.setKeypad("");
                                          optionsController
                                              .optionIndexSetter(-1);
                                          optionsController.setSetState();
                                        } else {
                                          viewController.setView(ERROR);
                                          viewController.setErrorMessage(
                                              'Please login to view User Settings');
                                               // CHANGED BY BHAVA
                                          optionsController
                                              .setOptionList(REGISTERNEW);
                                          optionsController.getRegister();
                                        }
                                      });

                                      Navigator.pop(context);
                                    } else if (index == 11) {
                                      Prefs.superUserLoggedIn.then((value) {
                                        if (value) {
                                        } else {
                                          viewController.setView(INFO);
                                          viewController.setInfoMessage(
                                              'Please login to view change your password');
                                               // CHANGED BY BHAVA
                                          optionsController
                                              .setOptionList(REGISTERNEW);
                                          optionsController.getRegister();
                                        }
                                      });
                                      Navigator.pop(context);
                                    } else if (index == 12) {
                                     // headerController.setHeaderLabel('');
                                      // getOptionClient(optionsController, index);
                                      optionsController.setOptionList(CLIENT);

                                      Prefs.superUserLoggedIn.then((value) {
                                        if (value) {
                                          headerController
                                              .setSubHeaderLabel(
                                               // "Add-ons"
                                                languageController
                                                      .languageResponse
                                                      .value
                                                      .addOns ??''
                                                );
                                          keyboardController.setEdit(false);
                                          viewController.setView('');
                                          optionsController.getReviewSettings();
                                          optionsController
                                              .setOptionList(REVIEWSTORE);
                                          // viewController
                                          //     .setUserOption(REVIEWSTORE);
                                          optionsController.hideShadow();
                                          keyboardController.setKeypad("");
                                          orderController.fetchstoreReview(
                                              languageController.languagenum
                                                  .toString());
                                          orderController.fetchProductReview(
                                              languageController.languagenum
                                                  .toString(),'');
                                          optionsController
                                              .optionIndexSetter(-1);
                                          optionsController.setSetState();
                                        } else {
                                          viewController.setView(ERROR);
                                          viewController.setErrorMessage(
                                              'Please login to access the Additional Review features');
                                               // CHANGED BY BHAVA
                                          optionsController
                                              .setOptionList(REGISTERNEW);
                                          optionsController.getRegister();
                                        }
                                      });

                                      Navigator.pop(context);
                                    } else if (index == 13) {
                                      

                                      Prefs.superUserLoggedIn.then((value) {
                                        if (value) {
                                          optionsController
                                              .setOptionList(REVIEWSTORE);
                                              viewController.setView('');
                                          optionsController
                                              .setOptionList(CALCULATE);
                                          optionsController.getCalculator();
                                          headerController
                                              .setSubHeaderLabel(
                                               // 'Calculator'
                                                languageController
                                                      .languageResponse
                                                      .value
                                                      .calculate ??''
                                                );
                                          // viewController
                                          // .setUserOption(CALCULATE);
                                        } else {
                                          viewController.setView(ERROR);
                                          viewController.setErrorMessage(
                                              'Please login to access the calculator features');
                                               // CHANGED BY BHAVA
                                          optionsController
                                              .setOptionList(REGISTERNEW);
                                          optionsController.getRegister();
                                        }
                                      });
                                      Navigator.pop(context);
                                    } else if (index == 14) {
                                      Prefs.superUserLoggedIn.then((value) {
                                        if (value) {
                                          headerController
                                              .setSubHeaderLabel(
                                               // 'Support'
                                                 languageController
                                                      .languageResponse
                                                      .value
                                                      .support ??''
                                                );
                                          optionsController
                                              .setOptionList(SUPPORT);
                                          optionsController.getSupport();
                                          // viewController.setUserOption(SUPPORT);

                                          keyboardController.setKeypad('');
                                          viewController.setView('');
                                        } else {
                                          viewController.setView(ERROR);
                                          viewController.setErrorMessage(
                                              'Please login to view Support features');
                                               // CHANGED BY BHAVA
                                          optionsController
                                              .setOptionList(REGISTERNEW);
                                          optionsController.getRegister();
                                        }
                                      });

                                      Navigator.pop(context);
                                    } else if (index == 15) {
                                      Prefs.superUserLoggedIn.then((value) {
                                        if (value) {
                                          headerController.setSubHeaderLabel(
                                              //'TERMSANDCONDITION'
                                                languageController
                                                      .languageResponse
                                                      .value
                                                      .termsAndConditions ??''
                                              );
                                          optionsController
                                              .setOptionList(REVIEWSTORE);
                                          // viewController
                                          // .setUserOption(REVIEWSTORE);

                                          keyboardController.setKeypad('');
                                          viewController
                                              .setView(TERMSANDCONDITION);
                                        } else {
                                          viewController.setView(ERROR);
                                          viewController.setErrorMessage(
                                              'Please login to view Terms & Conditions features');
                                               // CHANGED BY BHAVA
                                          optionsController
                                              .setOptionList(REGISTERNEW);
                                          optionsController.getRegister();
                                        }
                                      });
                                      Navigator.pop(context);
                                    } else if (index == 16) {
                                      optionsController.showImages();
                                      optionsController.showShadow();
                                      //optionsController.setOptionList('');
                                      keyboardController.setKeypad('');
                                      viewController.setView('');
                                      viewController.setView(ERROR);
                                      viewController.setErrorMessage(
                                          'AR experience feature will be coming soon!');
                                           // CHANGED BY BHAVA
                                          optionsController
                                              .setOptionList(REGISTERNEW);
                                          optionsController.getRegister();
                                      Navigator.pop(context);
                                    } else if (index == 17) {
                                      optionsController.showImages();
                                      optionsController.showShadow();
                                      //optionsController.setOptionList('');
                                      keyboardController.setKeypad('');
                                      viewController.setView('');
                                      viewController.setView(ERROR);
                                      viewController.setErrorMessage(
                                          'Market place feature will be coming soon!');
                                           // CHANGED BY BHAVA
                                          optionsController
                                              .setOptionList(REGISTERNEW);
                                          optionsController.getRegister();
                                      Navigator.pop(context);
                                    }
                                  },
                                  // child: Container(
                                  //   height: 70,
                                  //   width: 70,
                                  //   // decoration: BoxDecoration(
                                  //   //     border: Border.all(
                                  //   //       color: Colors.black,
                                  //   //       width: 0.8,
                                  //   //     ),
                                  //   //     borderRadius:
                                  //   //         BorderRadius.circular(16)),
                                  child: iconSize(
                                      optionsController.directAccess[index],
                                      index),
                                );
                              },
                              // separatorBuilder:
                              //     (BuildContext context, int index) {
                              //   return const SizedBox(
                              //     width: 10,
                              //   );
                              // },
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).padding.bottom == 0
                      ? 40
                      : MediaQuery.of(context).padding.bottom,
                  padding: GetPlatform.isAndroid
                      ? const EdgeInsets.fromLTRB(0, 8, 0, 0)
                      : const EdgeInsets.fromLTRB(0, 8, 0, 0),
                  alignment: Alignment.topCenter,
                  color: Colors.grey[350],
                  child: const Text(
                    "© Copyright - Confluence Pte Ltd - All Rights Reserved",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            )));
  }

  SizedBox iconSize(controller, int index) {
    return SizedBox(
      width: 75,
      height: 75,
      child: controller,
    );
  }

  Widget getHeaderLogo(String iconName) => FutureBuilder<String>(
        future: getSingleImage(iconName),
        builder: (builder, imageSnapShot) {
          if (imageSnapShot.hasData) {
            return SizedBox(
              width: 40,
              height: 40,
              child: Image.memory(
                base64Decode(imageSnapShot.data!),
                fit: BoxFit.fill,
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      );
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
    Future getLocation() async {
    position = await _getGeoLocationPosition();
    //getAddressFromLatLong(position);
  }

//GET CURRENT LOCATION//

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    print(serviceEnabled);
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error(languageController
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
      getLocation();
      viewController.setView(ERROR);
      viewController.setErrorMessage(
          //languageController.languageResponse.value.locationPermissionError ??
          'The location services are used in this application to detect your country details and display the sponsors in your country, show the stores nearby to you to choose the products you want to buy. This provides you important information and rich experience. We therefore strongly recommend you providing location permission to proceed with the application.');

      return Future.error(
          languageController.languageResponse.value.locationDeniedError ?? '');
    }

    if (await Prefs.mobile != '') {
      // getLocation();
      // headerController.setSubHeaderLabel(
      //     languageController.languageResponse.value.credits ?? '');

      // viewController.setView(SPLASH);
      // viewController.setView(ORDERCONFIRMATION);
      // headerController.setSubHeaderLabel(CREDITS);
      // viewController.setView(REVIEWPAGE);
      // if (await Prefs.shopId != '' && await Prefs.customerID != '') {
      //   shopController
      //       .downloadShoppingProduct(languageController.languagenum.toString());
      //   shopController
      //       .fetchCatalogueProduct(languageController.languagenum.toString());
      // }
    }
    //  else {
    //   headerController
    //       .setHeaderLabel(languageController.languageResponse.value.user ?? '');

    //   headerController.setSubHeaderLabel('Pick User');
    //   viewController.setView('');
    //   optionsController.showImages();
    // }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }


}
