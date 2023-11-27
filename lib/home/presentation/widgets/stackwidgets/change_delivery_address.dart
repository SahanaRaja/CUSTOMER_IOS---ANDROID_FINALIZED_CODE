// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:customer_assist/core/app_colors.dart';
import 'package:customer_assist/core/app_constants.dart';
import 'package:customer_assist/home/presentation/controllers/configure_controller.dart';
import 'package:customer_assist/home/presentation/controllers/guest_fetchCountry_controller.dart';
import 'package:customer_assist/home/presentation/controllers/header_controller.dart';
import 'package:customer_assist/home/presentation/controllers/keyboard_controller.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/controllers/options_controller.dart';
import 'package:customer_assist/home/presentation/controllers/owner_data_controller.dart';
import 'package:customer_assist/home/presentation/controllers/view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeDEliveryAddress extends StatefulWidget {
  final double actualHeight;
  final KeyboardController keyboardController;
  const ChangeDEliveryAddress({
    Key? key,
    required this.actualHeight,
    required this.keyboardController,
  }) : super(key: key);

  @override
  State<ChangeDEliveryAddress> createState() => _ChangeDEliveryAddressState();
}

class _ChangeDEliveryAddressState extends State<ChangeDEliveryAddress> {
  List<bool> selectchecked = [];
  List<bool> deletechecked = [];
  List<bool> defaultChecked = [];
  List<bool> home = [];
  List<bool> office = [];

  ConfigureController configureController = Get.find();
  OptionsController optionsController = Get.find();
  AddressController addressController = Get.find();
  ViewController viewController = Get.find();
  var languageController = Get.put(LanguageController());
  var keyboardController = Get.put(KeyboardController());
  var GuestCountryController = Get.put(GuestFetchCountryController());
  var headerController = Get.put(HeaderController());

  int selectedindex = -1;
  @override
  void initState() {
    // if (addressController.fetchAddressResponse[0].addressType == '1') {
    //   home = true;
    //   office = false;
    // } else {
    //   home = false;
    //   office = true;
    // }
    selectchecked = List.generate(
        configureController.deliveryAddress.length, (index) => false);
    // deletechecked = List.generate(
    //     configureController.deliveryAddress.length, (index) => false);
    // defaultChecked = List.generate(
    //     configureController.deliveryAddress.length, (index) => false);
    // home = List.generate(
    //     configureController.deliveryAddress.length, (index) => false);
    // office = List.generate(
    //     configureController.deliveryAddress.length, (index) => false);
    // if (addressController.fetchAddressResponse.isNotEmpty) {
    //   if (addressController.fetchAddressResponse[0].addressType == '1') {
    //     home[0] = true;
    //     office[0] = false;
    //   }
    // }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    print("ADDADDRESS Increase");
                    viewController.setView(ADDADDRESS);
    
                    GuestCountryController.fetchzipcode('');
                    keyboardController.setEdit(true);
                  },
                  child: Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.green,
                      ),
                      borderRadius: BorderRadius.circular(
                        5,
                      ),
                      color: Colors.green,
                    ),
                    child: optionsController.plus,
                  ),
                ),
                SizedBox(
                  height: 20,
                  width: 20,
                ),
                InkWell(
                  onTap: () {
                    // if (keyboardController.editProfile.value == true) {
                    //   if (viewController.viewKey.value == CHANGEDELIVERYADDRESS) {
                        viewController.setView(EDITADDRESS);
                        //headerController.setSubHeaderLabel('Edit Address');
                        
                        // GuestCountryController
                        //     .fetchzipcode(
                        //         keyboardController
                        //             .currentController
                        //             .value
                        //             .text);
                    //   }
                    //   keyboardController.setEdit(true);
                    // }
                    // headerController
                    //     .setSubHeaderLabel(
                    //         'Edit Address');
                    print("hello...");
                  },
                  child: Container(
                    height: 45,
                    width: 45,
                    // decoration: BoxDecoration(border: Border.all()),
                    child: optionsController.edit,
                  ),
                ),
                SizedBox(
                  height: 20,
                  width: 20,
                ),
                InkWell(
                  onTap: () {
                    viewController.setView(CAUTIONDELETE);
                  },
                  child: Container(
                    height: 45,
                    width: 45,
                    // decoration: BoxDecoration(border: Border.all()),
                    child: optionsController.addbookdelete,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
              height: GetPlatform.isAndroid
                  ? (widget.actualHeight - 40) * 0.79 //addedbysofiya april
                  : (widget.actualHeight -
                          MediaQuery.of(context).padding.bottom) /
                      17.9 *
                      14,
              width: GetPlatform.isAndroid
                  ? (widget.actualHeight - 40)
                  : (widget.actualHeight -
                          MediaQuery.of(context).padding.bottom) /
                      17.9 *
                      13,
              // child: GetX<ConfigureController>(
              //   init: ConfigureController(),
              //   initState: (_) {},
              //   builder: (controller) {
              //     return
              child: ListView.builder(
                  itemCount: configureController.deliveryAddress.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(children: [
                      Row(
                        children: [
                          Container(
                            width: GetPlatform.isAndroid
                                ? MediaQuery.of(context).size.width
                                : (widget.actualHeight -
                                        MediaQuery.of(context).padding.bottom) /
                                    17.9 *
                                    8.7,
                            // 8.73,
                            height: GetPlatform.isAndroid
                                ? (widget.actualHeight - 40) / 5.5
                                : (widget.actualHeight -
                                        MediaQuery.of(context).padding.bottom) /
                                    17.9 *
                                    3.3,
                            decoration: const BoxDecoration(
                              // color: Colors.amberAccent,
                              color: Colors.white,
                              border: Border(
                                top: BorderSide(color: Colors.black),
                                bottom: BorderSide(color: Colors.black),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 28.0,
                                top: 25,
                                 right: 30
                              ),
                              child: Row(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              configureController
                                                      .deliveryAddress[index]
                                                      .firstName ??
                                                  '',
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              configureController
                                                      .deliveryAddress[index]
                                                      .lastName ??
                                                  '',
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            commonTextVariable(configureController
                                                    .deliveryAddress[index]
                                                    .address1 ??
                                                ''),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            commonTextVariable(configureController
                                                    .deliveryAddress[index]
                                                    .address2 ??
                                                '')
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            commonTextVariable(configureController
                                                    .deliveryAddress[index]
                                                    .location ??
                                                ''),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            commonTextVariable(configureController
                                                    .deliveryAddress[index]
                                                    .city ??
                                                ''),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            commonTextVariable(configureController
                                                    .deliveryAddress[index]
                                                    .provience ??
                                                '')
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            commonTextVariable(configureController
                                                    .deliveryAddress[index]
                                                    .zipcode ??
                                                ''),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            commonTextVariable(configureController
                                                    .deliveryAddress[index]
                                                    .contactNo2 ??
                                                ''),
                                            const SizedBox(
                                              width: 1,
                                            ),
                                            commonTextVariable(configureController
                                                    .deliveryAddress[index]
                                                    .contactNo3 ??
                                                '')
                                          ],
                                        ),
                                      ]),
                                  Column(children: [
                                    Column(
                                      children: [
                                        SizedBox(
                                            height: 40,
                                            width: 40,
                                            //addedbysofiya
                                            child: configureController
                                                        .deliveryAddress[index]
                                                        .buildingType ==
                                                    'H'
                                                ? optionsController
                                                    .addressbookHome
                                                : optionsController
                                                    .addressbookWork),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 35,
                                    ),
                                    Column(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              selectchecked[index] =
                                                  !selectchecked[index];
                                              viewController
                                                      .addressbookselectedindex =
                                                  index;
                                              viewController.isdelivaryaddress =
                                                  true;
    
                                              viewController
                                                      .addressbookselectedbuildingtype =
                                                  configureController
                                                      .deliveryAddress[index]
                                                      .buildingType!;
                                              widget.keyboardController
                                                  .editProfile.value = true;
                                              widget.keyboardController.addProfile
                                                  .value = false;
                                              print(
                                                "CustomerAddress ID----${configureController.deliveryAddress[viewController.addressbookselectedindex].customerAddressId!}",
                                              );
                                            });
                                          },
                                          child: Container(
                                              height: 35,
                                              width: 35,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                        color: Colors.grey,
                                                        spreadRadius: 1,
                                                        blurRadius: 1,
                                                        offset: Offset(4, 4))
                                                  ]),
                                              child: Container(
                                                color: viewController
                                                            .addressbookselectedindex ==
                                                        index
                                                    ? Colors.yellowAccent
                                                    : Colors.white,
                                              )),
                                        ),
                                      ],
                                    ),
                                  ]),
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ]);
                  }))
        ],
      ),
    );
  }

  commonTextVariable(String values) {
    return Text(
      values,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
    );
  }
}
