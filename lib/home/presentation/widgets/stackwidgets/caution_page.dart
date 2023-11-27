import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:customer_assist/core/app_constants.dart';
import 'package:customer_assist/home/presentation/controllers/configure_controller.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/controllers/shop_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/helpers/SharedPreference/prefs.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../database/database.dart';
import '../../controllers/add_cart_review_controller.dart';
import '../../controllers/header_controller.dart';
import '../../controllers/options_controller.dart';
import '../../controllers/order_controller.dart';
import '../../controllers/view_controller.dart';

class CautionPage extends StatefulWidget {
  final String content;
  final String heading;

  const CautionPage({
    Key? key,
    required this.content,
    required this.heading,
  }) : super(key: key);
  @override
  _CautionPageState createState() => _CautionPageState();
}

class _CautionPageState extends State<CautionPage> {
  ViewController viewController = Get.find();
  ShopController shopController = Get.find();
  OrderController orderController = Get.find();
  AddCartReviewController addCartReviewController = Get.find();

  OptionsController optionsController = Get.find();
  HeaderController headerController = Get.find();
  var languageController = Get.put(LanguageController());
  ConfigureController configureController = Get.find();
  double actualHeight = 0;
  @override
  void didChangeDependencies() {
    actualHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    //SizeConfig().init(context);
    return Column(
      children: [
        SizedBox(height: 150,),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
            ),
            color: Colors.white,
          ),
          height:
              (actualHeight - MediaQuery.of(context).padding.bottom) / 17.9 * 4.7,
          width: 102.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: getProportionateScreenHeight(40),
                padding: const EdgeInsets.symmetric(horizontal: 5),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.subHeaderContainer,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    widget.heading == 'CAUTION'
                        ? getHeaderLogo('Alert')
                        : Container(),
                    AutoSizeText(
                      widget.heading,
                      style: const TextStyle(fontSize: 22),
                      maxFontSize: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        viewController.setPreviousView();
                      },
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/close.png'),
                              fit: BoxFit.fill),
                        ),
                      ),
                    )
                    // getImagenBase64(closeIcon),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      color: Colors.white,
                      height: 300,
                      width: 400,
                      child: Center(
                        child: Column(
                          children: [
                            AutoSizeText(
                              widget.content,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey[600],
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    if (viewController.viewKey.value == CAUTION) {
                                      Prefs.setSuperUserLoggedIn(false);
                                      Prefs.setSuperUserEmailId('');
                                      //added by sahana
                                      optionsController.getClientOptions();
                                      headerController.setSubHeaderLabel(
                                          languageController
                                                  .languageResponse.value.login ??
                                              '');
                                      optionsController.setState();
                                      viewController.setView(LOGIN);
                                    } else if (viewController.viewKey.value ==
                                        CAUTIONDELETE) {
                                      configureController
                                          .deliveryAddress[0].salutations!;
                                      configureController
                                          .updateCustomerDeliveryAddress(
                                        configureController
                                            .deliveryAddress[viewController
                                                .addressbookselectedindex]
                                            .salutations!,
                                         configureController
                                          .deliveryAddress[viewController
                                                                  .addressbookselectedindex]
                                                              .customerAddressId!,
                                        'D',
                                        configureController
                                            .deliveryAddress[viewController
                                                .addressbookselectedindex]
                                            .firstName!,
                                        configureController
                                            .deliveryAddress[viewController
                                                .addressbookselectedindex]
                                            .lastName!,
                                        configureController
                                            .deliveryAddress[viewController
                                                .addressbookselectedindex]
                                            .address1!,
                                        configureController
                                            .deliveryAddress[viewController
                                                .addressbookselectedindex]
                                            .address2!,
                                        configureController
                                            .deliveryAddress[viewController
                                                .addressbookselectedindex]
                                            .location!,
                                        configureController
                                            .deliveryAddress[viewController
                                                .addressbookselectedindex]
                                            .country!,
                                        configureController
                                            .deliveryAddress[viewController
                                                .addressbookselectedindex]
                                            .provience!,
                                        configureController
                                            .deliveryAddress[viewController
                                                .addressbookselectedindex]
                                            .city!,
                                        '1',
                                        configureController
                                            .deliveryAddress[viewController
                                                .addressbookselectedindex]
                                            .buildingType!,
                                        configureController
                                            .deliveryAddress[viewController
                                                .addressbookselectedindex]
                                            .zipcode!,
                                        languageController.languagenum.toString(),
                                        configureController
                                            .deliveryAddress[viewController
                                                .addressbookselectedindex]
                                            .contactNo1!,
                                        configureController
                                            .deliveryAddress[viewController
                                                .addressbookselectedindex]
                                            .contactNo2!,
                                        configureController
                                            .deliveryAddress[viewController
                                                .addressbookselectedindex]
                                            .contactNo3!,
                                      );
                                      // configureController.fetchCustomerDeliveryAddress(
                                      // languageController.languagenum.toString());
                                    } else if (viewController.viewKey.value ==
                                        CAUTIONSHOPLIST) {
                                      for (var temp
                                          in shopController.selectedList) {
                                        shopController.catalogueResponse
                                            .removeAt(temp);
                                      }
                                      viewController.setPreviousView();
                                    } else if (viewController.viewKey.value ==
                                        CAUTIONWISHLIST) {
                                      for (var temp
                                          in orderController.selectedList) {
                                        orderController.whishlistResponse
                                            .removeAt(temp);
                                      }
                                      viewController.setPreviousView();
                                    } else if (viewController.viewKey.value ==
                                        CAUTIONPENDING) {
                                      for (var temp
                                          in orderController.selectedList) {
                                        orderController.pendingEditsResponse
                                            .removeAt(temp);
                                      }
                                      viewController.setPreviousView();
                                    } else if (viewController.viewKey.value ==
                                        CAUTIONREVIEWPAGE) {
                                      for (var item in addCartReviewController
                                          .selectedListCart) {
                                        print("hiiiiiiiiiiiiiiiiiiiiiiiiiiii$item");

                                        addCartReviewController
                                            .deleteOrderedItem([item]);
                                        addCartReviewController
                                          .getReviewCartItems(false);
                                      }
                                      
                                      viewController.setPreviousView();
                                    }
                                  },
                                  child: Text(
                                    languageController.languageResponse.value.yes ??
                                        '',
                                    style: const TextStyle(
                                        color: Colors.green, fontSize: 25),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                InkWell(
                                  onTap: () {
                                    viewController.setPreviousView();
                                   
                                  },
                                  child: Text(
                                    languageController.languageResponse.value.no ??
                                        '',
                                    style: const TextStyle(
                                        color: Colors.red, fontSize: 25),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            (viewController.viewKey.value == CAUTIONDELETE)
                                ? AutoSizeText(
                                    languageController.languageResponse.value
                                            .quitConformation ??
                                        '',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey[600],
                                    ),
                                    textAlign: TextAlign.center,
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
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
}
