import 'package:customer_assist/core/helpers/SharedPreference/prefs.dart';
import 'package:customer_assist/home/presentation/controllers/configure_controller.dart';
import 'package:customer_assist/home/presentation/controllers/header_controller.dart';
import 'package:customer_assist/home/presentation/controllers/keyboard_controller.dart';
import 'package:customer_assist/home/presentation/controllers/options_controller.dart';
import 'package:customer_assist/home/presentation/controllers/shop_controller.dart';
import 'package:customer_assist/home/presentation/controllers/view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/app_constants.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../controllers/language_controller.dart';

class ShoppingReview extends StatefulWidget {
  final double actualHeight;

  const ShoppingReview({Key? key, required this.actualHeight})
      : super(key: key);

  @override
  State<ShoppingReview> createState() => _ShoppingReviewState();
}

class _ShoppingReviewState extends State<ShoppingReview> {
  OptionsController optionController = Get.find();
  ConfigureController configureController = Get.find();
  ViewController viewController = Get.find();
  HeaderController headerController = Get.find();
  ShopController shopController = Get.find();
  var languageController = Get.put(LanguageController());
  TextEditingController shoppingMode = TextEditingController();
  TextEditingController retailVertical = TextEditingController();
  TextEditingController deliveryMode = TextEditingController();
  TextEditingController deliveryAddress = TextEditingController();
  TextEditingController deliveryAddress1 = TextEditingController();
  TextEditingController deliveryAddress2 = TextEditingController();
  TextEditingController deliveryAddress3 = TextEditingController();
  TextEditingController deliveryAddress4 = TextEditingController();
  TextEditingController deliveryTime = TextEditingController();
  TextEditingController shop = TextEditingController();
  TextEditingController shop1 = TextEditingController();
  TextEditingController shop2 = TextEditingController();
  TextEditingController shop3 = TextEditingController();
  KeyboardController keyboardController = Get.find();
  bool? validateCountry;
  @override
  void initState() {
    print(configureController.fetchdetails.value);
    if (configureController.fetchdetails.value.menu!.isNotEmpty) {
      initializeMethod();
    }
    super.initState();
  }

  void initializeMethod() {
    print(configureController.fetchdetails.value);
    print(configureController.fetchdetails.value.menu![5].subMenu![0].value);

    try {
      if (configureController.fetchdetails.value.menu![5].subMenu![0].value! !=
          '') {
        deliveryAddress.text = '${configureController
                .fetchdetails.value.menu![5].subMenu![0].value!
                .split(',')[0]},${configureController.fetchdetails.value.menu![5].subMenu![0].value!
                .split(',')[1]}';
        deliveryAddress1.text = '${configureController
                .fetchdetails.value.menu![5].subMenu![0].value!
                .split(',')[2]},${configureController.fetchdetails.value.menu![5].subMenu![0].value!
                .split(',')[3]}';
        deliveryAddress2.text = configureController
            .fetchdetails.value.menu![5].subMenu![0].value!
            .split(',')[4];
        deliveryAddress3.text = configureController
            .fetchdetails.value.menu![5].subMenu![0].value!
            .split(',')[5];
        deliveryAddress4.text = configureController
            .fetchdetails.value.menu![5].subMenu![0].value!
            .split(',')[6];
        //     +
        // ',' +
        // configureController.fetchdetails.value.menu![5].subMenu![0].value!
        //     .split(',')[5]);
      }
    } catch (e) {
      print(e.toString());
    }

    print(
        "Values::${configureController.fetchdetails.value.menu![3].subMenu![0].value!}");
    if (configureController.fetchdetails.value.menu![3].subMenu![0].value! !=
        ' ') {
      shop.text = configureController
          .fetchdetails.value.menu![3].subMenu![0].value!
          .split(',')[0];
      shop1.text = ('${configureController
              .fetchdetails.value.menu![3].subMenu![0].value!
              .split(',')[1]},${configureController.fetchdetails.value.menu![3].subMenu![0].value!
              .split(',')[2]}');
      shop2.text = ('${configureController
              .fetchdetails.value.menu![3].subMenu![0].value!
              .split(',')[3]},${configureController.fetchdetails.value.menu![3].subMenu![0].value!
              .split(',')[4]}');
      shop3.text = ('${configureController
              .fetchdetails.value.menu![3].subMenu![0].value!
              .split(',')[5]},${configureController.fetchdetails.value.menu![3].subMenu![0].value!
              .split(',')[6]}');
    } else {
      print('EMPTY');
    }

    shoppingMode.text =
        configureController.fetchdetails.value.menu![0].subMenu![0].value!;
    retailVertical.text =
        configureController.fetchdetails.value.menu![1].subMenu![0].value!;
    deliveryMode.text =
        configureController.fetchdetails.value.menu![2].subMenu![0].value!;
    // deliveryAddress.text =
    //     configureController.fetchdetails.value.menu![5].subMenu![0].value! ??
    //         ' ';xwxs
    deliveryTime.text =
        configureController.fetchdetails.value.menu![4].subMenu![0].value!;
    // shop.text =
    //     configureController.fetchdetails.value.menu![3].subMenu![0].value!;
    if (configureController.fetchdetails.value.menu![0].subMenu![0].value! ==
        'SHOP FROM HOME') {
      optionController.setShoppingMode('0');
      Prefs.setDeliveryType('H');
    } else {
      optionController.setShoppingMode('1');
      Prefs.setDeliveryType('S');
    }

    checkCountry();
  }

  //   shoppingMode.text =
  //       configureController.fetchdetails.value.menu![0].subMenu![0].value!;
  //   retailVertical.text =
  //       configureController.fetchdetails.value.menu![1].subMenu![0].value!;
  //   deliveryMode.text =
  //       configureController.fetchdetails.value.menu![2].subMenu![0].value!;
  //   // deliveryAddress.text =
  //   //     configureController.fetchdetails.value.menu![5].subMenu![0].value! ??
  //   //         ' ';
  //   deliveryTime.text =
  //       configureController.fetchdetails.value.menu![4].subMenu![0].value!;
  //   // shop.text =
  //   //     configureController.fetchdetails.value.menu![3].subMenu![0].value!;
  //   if (configureController.fetchdetails.value.menu![0].subMenu![0].value! ==
  //       'SHOP FROM HOME') {
  //     optionController.setShoppingMode('1');
  //     Prefs.setDeliveryType('H');
  //   } else {
  //     optionController.setShoppingMode('0');
  //     Prefs.setDeliveryType('S');
  //   }

  //   checkCountry();
  // }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      // height: widget.actualHeight * 0.77,
      height: GetPlatform.isAndroid
          ? (widget.actualHeight - 40) / 1.37
          // 18.1
          : (widget.actualHeight - MediaQuery.of(context).padding.bottom) / 1,
      child: GetX<ConfigureController>(
        init: (configureController),
        initState: (_) {},
        builder: (_) {
          return Column(
            children: [
              // SizedBox(
              //   height:
              //       ((widget.actualHeight - MediaQuery.of(context).padding.bottom) /
              //               17.9) *
              //           1,
              //   child: Center(
              //     child: Text(
              //       languageController.languageResponse.value.lastConfiguration ?? '',
              //       style: const TextStyle(
              //           fontSize: 18,
              //           fontWeight: FontWeight.normal,
              //           color: Colors.black),
              //     ),
              //   ),
              // ),
              //added by saha
              //  SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.001,
              // ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.056,
                child: Row(
                  children: [
                    getSizedBox(
                        context,
                        languageController
                                .languageResponse.value.retailVertical ??
                            ''),
                    getSixedController(context, 1, controller: retailVertical),
                    refreshIcon(0, controller: retailVertical),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.056,
                child: Row(
                  children: [
                    getSizedBox(
                        context,
                        languageController
                                .languageResponse.value.shoppingMode ??
                            ''),
                    getSixedController(context, 2, controller: shoppingMode),
                    refreshIcon(1, controller: shoppingMode),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.056,
                child: Row(
                  children: [
                    getSizedBox(context,
                        languageController.languageResponse.value.shop ?? ''),
                    getSixedController(context, 4, controller: shop),
                    refreshIcon(2),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.056,
                child: Row(
                  children: [
                    SizedBox(
                      width: getProportionateScreenWidth(150),
                    ),
                    getSixedController(context, 4, controller: shop1),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.056,
                child: Row(
                  children: [
                    // getSizedBox(context, 'Delivery Address'),
                    SizedBox(
                      width: getProportionateScreenWidth(150),
                    ),
                    getSixedController(context, 4, controller: shop2),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.056,
                child: Row(
                  children: [
                    // getSizedBox(context, 'Delivery Address'),
                    SizedBox(
                      width: getProportionateScreenWidth(150),
                    ),
                    getSixedController(context, 4, controller: shop3),
                  ],
                ),
              ),
              //added by saha
              //  SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.005,
              // ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.056,
                child: Row(
                  children: [
                    getSizedBox(
                        context,
                        languageController
                                .languageResponse.value.deliveryMode ??
                            ''),
                    getSixedController(context, 2, controller: deliveryMode),
                    refreshIcon(3, controller: deliveryMode),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.056,
                child: Row(
                  children: [
                    getSizedBox(
                        context,
                        languageController
                                .languageResponse.value.deliveryAddress ??
                            ''),
                    getSixedController(context, 0, controller: deliveryAddress),
                    refreshIcon(4),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.056,
                child: Row(
                  children: [
                    SizedBox(
                      width: getProportionateScreenWidth(150),
                    ),
                    getSixedController(context, 0,
                        controller: deliveryAddress1),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.056,
                child: Row(
                  children: [
                    SizedBox(
                      width: getProportionateScreenWidth(150),
                    ),
                    getSixedController(context, 0,
                        controller: deliveryAddress2),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.056,
                child: Row(
                  children: [
                    SizedBox(
                      width: getProportionateScreenWidth(150),
                    ),
                    getSixedController(context, 0,
                        controller: deliveryAddress3),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.056,
                child: Row(
                  children: [
                    SizedBox(
                      width: getProportionateScreenWidth(150),
                    ),
                    //Text("+91 8098858076",style: TextStyle(fontSize: 20),)
                    getSixedController(context, 0,
                        controller: deliveryAddress4),
                  ],
                ),
              ),
              //added by saha
              //   SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.005,
              // ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.050,
                child: Row(
                  children: [
                    getSizedBox(
                        context,
                        languageController
                                .languageResponse.value.deliveryTime ??
                            ''),
                    getSixedController(context, 5, controller: deliveryTime),
                    refreshIcon(5),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  refreshIcon(int index, {TextEditingController? controller}) {
    return InkWell(
      onTap: (() {
        if (validateCountry == true) {
          print("Check::::$validateCountry");
          print("Check::::$index");

          if (index == 0) {
            viewController.setView('');

            print('currentRetailVerticalFirst');
            optionController.setOptionView('0');
            optionController.optionIndexSetter(0);
            optionController.setSetState();
            keyboardController.setPicker('RetailVertical');
            headerController.subHeaderLabel('Pick Retail Vertical');
            // viewController.setView(INFO);
            // viewController.setInfoMessage(
            //     ' ${languageController.languageResponse.value.currentRetailVerticalFirst}${controller!.text}${languageController.languageResponse.value.currentRetailVerticalSecond}');
          } else if (index == 1) {
            print('currentShoppingModeFirst');
            if (controller!.text == 'SHOP FROM HOME') {
              // optionController.setShoppingMode('0');
              // Prefs.setShoppingMode('0');
              // Prefs.setDeliveryType('H');
              // print('SHOP FROM HOME-->');
            } else {
              // optionController.setShoppingMode('1');
              //  Prefs.setShoppingMode('1');

              // Prefs.setDeliveryType('S');
              // print('shopatstore-->');
            }
            optionController.optionIndexSetter(1);

            optionController.setSetState();
            viewController.setView(INFO);
            viewController.setInfoMessage(
                '${languageController.languageResponse.value.currentShoppingModeFirst}${controller.text}${languageController.languageResponse.value.currentShoppingModeSecond}');
          } else if (index == 2) {
            //Select Store
            optionController.optionIndexSetter(2);

            optionController.setSetState();
            print('select Store___');
            print('Shopping');

            if (optionController.outlet == '322') {
              headerController.setSubHeaderLabel('Restaurent Type');
              shopController.getData();
              keyboardController.setKeypad('');
              keyboardController.setPicker('Restaurant');
              optionController.hideShadow();
              viewController.setView('');
            } else {
              headerController.setSubHeaderLabel('Select Store');

              configureController
                  .fetchShopType(languageController.languagenum.toString());

              viewController.setView(CHOOSESTOREPAGE);
              configureController
                  .fetchDetailsGuest(languageController.languagenum.toString());

              // viewController.setInfoMessage(
              //     'The current Retail Vertical is “GROCERY”. If you want to change it you may do so through the Retail Vertical Picker. If you do not wish to change you may skip it by tapping DONE');
            }

            // viewController
            //     .setView(CHOOSESTOREPAGE);
            // headerController.setHeaderLabel(
            //     languageController
            //             .languageResponse
            //             .value
            //             .selectStore ??
            //         '');

            // configureController
            //     .fetchShopType(languageController.languagenum.toString());
          } else if (index == 3) {
            print('DeliveryMode');
            //DeliveryMode
            if (controller!.text == 'SHOP FROM HOME') {
              optionController.setShoppingMode('1');
              Prefs.setDeliveryType('H');
            } else {
              optionController.setShoppingMode('0');
              Prefs.setDeliveryType('S');
            }
            optionController.optionIndexSetter(3);
            optionController.setSetState();
            viewController.setView(INFO);
            viewController.setInfoMessage(
                languageController.languageResponse.value.changeDeliveryMode ??
                    '');
          } else if (index == 4) {
            //DeliveryAddress

            viewController.setView(INFO);
            viewController.setInfoMessage(languageController
                    .languageResponse.value.changeDeliveryAddress ??
                '');
            optionController.optionIndexSetter(0);
            optionController.setSetState();
            headerController.setSubHeaderLabel('Address Book');
            configureController.fetchCustomerDeliveryAddress(
                languageController.languagenum.toString());

            keyboardController.addProfile.value = true;
            keyboardController.editProfile.value = false;
            viewController.setView(CHANGEDELIVERYADDRESS);
            optionController.setOptionList(ADDRESSBOOK);
            optionController.getAddressBook();

            //}
          } else if (index == 5) {
            //Delivery Time
            optionController.optionIndexSetter(5);
            optionController.setSetState();
            viewController.setView('');
            configureController
                .fetchDeliveryTime(languageController.languagenum.toString());
          }
        }
      }),
      child: SizedBox(
        width: 70,
        height: 40,
        child: optionController.refreshIcon,
      ),
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

  SizedBox getSizedBox(BuildContext context, String value) {
    return SizedBox(
      width: getProportionateScreenWidth(150),
      // decoration: const BoxDecoration(
      //     border: Border(right: BorderSide(color: Colors.grey))),

      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            value,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.black),
          ),
        ),
      ),
    );
  }

  getSixedController(BuildContext context, int index,
      {TextEditingController? controller}) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: SizedBox(
        width: getProportionateScreenWidth(162),
        child: TextFormField(
          readOnly: true,
          showCursor: false,
          // focusNode: _focuss[index],
          onChanged: (value) {
            print("value $value");
          },
          onTap: () {},
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            // hintText: "Mail ID",
            // filled: _isFocus[index],
            fillColor: textFieldColor,
          ),
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
