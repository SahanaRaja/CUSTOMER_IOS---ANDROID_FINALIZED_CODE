// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_typing_uninitialized_variables, unused_field, invalid_use_of_protected_member, camel_case_types, sized_box_for_whitespace, avoid_unnecessary_containers

import 'dart:convert';

import 'package:customer_assist/core/app_colors.dart';
import 'package:customer_assist/core/app_constants.dart';
import 'package:customer_assist/core/helpers/SharedPreference/prefs.dart';
import 'package:customer_assist/home/presentation/controllers/add_cart_review_controller.dart';
import 'package:customer_assist/home/presentation/controllers/configure_controller.dart';
import 'package:customer_assist/home/presentation/controllers/guest_fetchCountry_controller.dart';
import 'package:customer_assist/home/presentation/controllers/header_controller.dart';
import 'package:customer_assist/home/presentation/controllers/keyboard_controller.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/controllers/options_controller.dart';
import 'package:customer_assist/home/presentation/controllers/shop_controller.dart';
import 'package:customer_assist/home/presentation/controllers/view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_qr_bar_scanner/qr_bar_scanner_camera.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class FreeFlowShopping extends StatefulWidget {
  final double actualHeight;
  const FreeFlowShopping({Key? key, required this.actualHeight})
      : super(key: key);

  @override
  State<FreeFlowShopping> createState() => _FreeFlowShoppingState();
}

class _FreeFlowShoppingState extends State<FreeFlowShopping> {
  OptionsController optionsController = Get.find();
  ShopController shopController = Get.find();
  var languageController = Get.put(LanguageController());
  ViewController viewController = Get.find();
  HeaderController headerController = Get.find();
  var keyboardController = Get.put(KeyboardController());
  var addCartReviewController = Get.put(AddCartReviewController());
  var configureController = Get.put(ConfigureController());
  var GuestCountryController = Get.put(GuestFetchCountryController());

  TextEditingController firstController = TextEditingController();

  var checklist;
  var actualHeight;

  String? _qrInfo = '';

  bool _camState = false;

  _qrCallback(String? code) {
    setState(() {
      _camState = false;
      _qrInfo = code;
    });
  }

  _scanCode() {
    setState(() {
      _camState = true;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    asyncker();

    shopController.productweight.clear();
    checklist = List.generate(
        shopController.flowShopping.value.length, (index) => false);
    actualHeight = widget.actualHeight;
    asyncker();

    print(shopController.checklist);
    super.initState();
    _scanCode();
  }

  asyncker() async {
    await getData();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.043,
              width: MediaQuery.of(context).size.width * 0.99,
              color: AppColors.subHeaderContainer,
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    viewController.setView(SHOPLIST);
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 15),
                    height: 40,
                    width: 40,
                    child: RotatedBox(
                        quarterTurns: DateTime.june,
                        child: optionsController.arrowfrwd),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 90.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () async {
                          // await addCartReviewController.addToCartshopatstore(
                          //     shopController.flowShopping[data]
                          //     );
    
                          await addCartReviewController.getReviewCartItems(true);
    
                          viewController.setView(REVIEWPAGE);
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
                        // onTap: () {
                        //   viewController.setView(SHOPATSTOREWEIGH);
                        // },
                        /* onTap: () {
                                           
                                           
                                            setState(() {
                                              if (shopController
                                                      .checklist[data] ==
                                                  true) {
                                                shopController.productweight
                                                    .remove(shopController
                                                        .flowShopping
                                                        .value[data]);
                                                shopController.checklist[data] =
                                                    false;
                                              } else {
                                                shopController.productweight.add(
                                                    shopController.flowShopping
                                                        .value[data]);
                                                shopController.checklist[data] =
                                                    true;
                                              }
                                            });
                                            viewController
                                                .setView(SHOPATSTOREWEIGH);
                                           
                                          },*/
                        child: Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(5)),
                          child: optionsController.weighscale,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                        width: 20,
                      ),
                      InkWell(
                        onTap: () {
                          // viewController.setView(CAUTIONDELETE);
                        },
                        child: Container(
                          height: 45,
                          width: 45,
                          child: optionsController.minus,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              color: Colors.black,
              height:
                  ((widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                          17.9) *
                      3.84,
              width: double.infinity,
              child: QRBarScannerCamera(
                onError: (context, error) => Text(
                  error.toString(),
                  style: const TextStyle(color: Colors.red),
                ),
                qrCodeCallback: (code) {
                  _qrCallback(code);
                },
              ),
            ),
          ),
          SizedBox(
              height: GetPlatform.isAndroid
                  ? ((widget.actualHeight -
                              MediaQuery.of(context).padding.bottom) /
                          17.9) *
                      10.7
                  : ((widget.actualHeight -
                              MediaQuery.of(context).padding.bottom) /
                          17.9) *
                      11.4,
              child: GetX<ShopController>(
                  init: ShopController(),
                  initState: (_) {},
                  builder: (shopController) {
                    return ListView.builder(
                        itemCount: shopController.flowShopping.value.length,
                        itemBuilder: (context, data) {
                          return Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                    top: 5, left: 2, right: 2),
                                height: 145,
                                width: double.infinity,
                                decoration: BoxDecoration(border: Border.all()),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: 133,
                                      width: 140,
                                      child: Column(children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                            top: 2,
                                            bottom: 1,
                                            // left: 3,
                                            // right: 3
                                          ),
                                          height: 30,
                                          width: 150,
                                          child: Row(children: [
                                            Container(
                                              alignment: Alignment.centerRight,
                                              height: 27,
                                              width: 95,
                                              child: Text(
                                                "Stock",
                                                textAlign: TextAlign.right,
                                              ),
                                            ),
                                            Container(
                                              color: Colors.green,
                                              margin: EdgeInsets.only(left: 10),
                                              height: 27,
                                              width: 27,
                                            ),
                                          ]),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(
                                            top: 1,
                                            bottom: 1,
                                          ),
                                          height: 30,
                                          width: 150,
                                          child: Row(children: [
                                            Container(
                                              alignment: Alignment.centerRight,
                                              height: 27,
                                              width: 95,
                                              child: Text(
                                                "Pre Order",
                                                textAlign: TextAlign.right,
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(left: 10),
                                              height: 27,
                                              width: 27,
                                              decoration: BoxDecoration(
                                                border: Border.all(),
                                              ),
                                            ),
                                          ]),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(
                                            top: 1,
                                            bottom: 1,
                                          ),
                                          height: 30,
                                          width: 150,
                                          child: Row(children: [
                                            Container(
                                              alignment: Alignment.centerRight,
                                              height: 27,
                                              width: 95,
                                              child: Text(
                                                "Alternate",
                                                textAlign: TextAlign.right,
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(left: 10),
                                              height: 27,
                                              width: 27,
                                              decoration: BoxDecoration(
                                                border: Border.all(),
                                              ),
                                            ),
                                          ]),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(
                                            top: 1,
                                            bottom: 1,
                                          ),
                                          height: 30,
                                          width: 150,
                                          child: Row(children: [
                                            Container(
                                              alignment: Alignment.centerRight,
                                              height: 27,
                                              width: 95,
                                              child: Text(
                                                "Select",
                                                textAlign: TextAlign.right,
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () async {
                                                await addCartReviewController
                                                    .addToCartshopatstore(
                                                        shopController
                                                            .flowShopping[data]);
    
                                                await addCartReviewController
                                                    .getReviewCartItems(true);
    
                                                viewController
                                                    .setView(REVIEWPAGE);
                                              },
                                              child: Container(
                                                margin: EdgeInsets.only(left: 10),
                                                height: 27,
                                                width: 27,
                                                decoration: BoxDecoration(
                                                  border: Border.all(),
                                                ),
                                              ),
                                            ),
                                          ]),
                                        ),
                                      ]),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 3, bottom: 3, left: 5, right: 5),
                                      height: 133,
                                      width: 132,
                                      decoration: BoxDecoration(
                                          border: Border.all(),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: itemwidget(context, data),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 3, bottom: 3, left: 3, right: 3),
                                      height: 133,
                                      width: 185,
                                      child: Column(children: [
                                        Container(
                                            margin: const EdgeInsets.only(
                                              top: 1,
                                              bottom: 1,
                                            ),
                                            alignment: Alignment.center,
                                            height: 30,
                                            width: 182,
                                            decoration: BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            child: itemwidgetname(context, data)),
                                        Row(
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(
                                                top: 1,
                                                bottom: 1,
                                              ),
                                              alignment: Alignment.center,
                                              height: 30,
                                              width: 91,
                                              decoration: BoxDecoration(
                                                border: Border(
                                                  bottom: BorderSide(
                                                    color: Colors.black,
                                                  ),
                                                  right: BorderSide(
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                top: 1,
                                                bottom: 1,
                                              ),
                                              alignment: Alignment.center,
                                              height: 30,
                                              width: 91,
                                              decoration: BoxDecoration(
                                                border: Border(
                                                  bottom: BorderSide(
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(
                                                top: 1,
                                                bottom: 1,
                                              ),
                                              alignment: Alignment.center,
                                              height: 30,
                                              width: 91,
                                              decoration: BoxDecoration(
                                                border: Border(
                                                  bottom: BorderSide(
                                                    color: Colors.black,
                                                  ),
                                                  right: BorderSide(
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                top: 1,
                                                bottom: 1,
                                              ),
                                              alignment: Alignment.center,
                                              height: 30,
                                              width: 91,
                                              decoration: BoxDecoration(
                                                border: Border(
                                                  bottom: BorderSide(
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(
                                                top: 1,
                                                bottom: 1,
                                              ),
                                              alignment: Alignment.center,
                                              height: 30,
                                              width: 91,
                                              child: Container(
                                                margin: EdgeInsets.only(top: 5),
                                                height: 30,
                                                width: 65,
                                                color: Colors.yellow,
                                                child: Center(
                                                  child: Text(
                                                    "",
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                top: 1,
                                                bottom: 1,
                                              ),
                                              alignment: Alignment.center,
                                              height: 30,
                                              width: 91,
                                              child: Container(
                                                margin: EdgeInsets.only(top: 5),
                                                height: 30,
                                                width: 65,
                                                color: Colors.green,
                                                child: Center(
                                                  child: Text(
                                                    "",
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ]),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        });
                  }))
        ],
      ),
    );
  }

  itemwidget(BuildContext context, int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: NetworkImage(shopController.flowShopping[index].imageurl!),
        ),
      ),
    );
  }

  itemwidgetname(BuildContext context, int index) {
    return Container(
      child: Text(
        shopController.flowShopping[index].productname!,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  getData() async {
    var jsonRequestBody =
        '{"CUSTOMER_ID":"${await Prefs.customerID}","PAGE_NO":1}';
    print(jsonRequestBody);

    var prefs = await SharedPreferences.getInstance();
    String? tokenNos = prefs.getString("TokenNo");
    String NEWTOKEN = tokenNos ?? "";
    Map<String, String> headers = {
      "Content-type": "application/json",
      "TokenNo": NEWTOKEN
    };
    final response = await http.post(
      Uri.parse(
          'https://www.retailresonance.com/retailresonancev2/api/fetchCatalogueProductOnlyItems'),
      headers: headers,
      body: jsonRequestBody,
    );

    var jsonData = jsonDecode(response.body);

    shopController.flowShopping.value =
        (jsonData['status']['ITEMS'] as List<dynamic>)
            .map((d) => cataloguedetails.fromJson(d))
            .toList();
    shopController.checklist = List.generate(
        shopController.flowShopping.value.length, (index) => false);

    print(shopController.flowShopping.value.length);
  }
}

class cataloguedetails {
  String? imageurl;
  String? productname;
  String? uom;
  int? qty;
  String? productcode;
  dynamic productMrp;
  dynamic productRate;
  dynamic discountValue;
  dynamic tax2;
  dynamic tax1;
  dynamic tax3;
  dynamic tax4;
  dynamic tax5;
  dynamic tax6;
  String? netweight;

  cataloguedetails(
      {this.imageurl,
      this.productname,
      this.uom,
      this.qty,
      this.productcode,
      this.productMrp,
      this.productRate,
      this.discountValue,
      this.tax1,
      this.tax2,
      this.tax3,
      this.tax4,
      this.tax5,
      this.tax6,
      this.netweight});

  factory cataloguedetails.fromJson(Map<String, dynamic> json) {
    return cataloguedetails(
        imageurl: json['IMAGE_URL'],
        productname: json['PRODUCT_NAME'],
        uom: json['UOM'],
        qty: json['AVAILABLE_STOCK_QUANTY'],
        productcode: json["PRODUCT_CODE"],
        productMrp: json['PRODUCT_MRP'],
        productRate: json['PRODUCT_RATE'],
        discountValue: json['DISCOUNT_VALUE'],
        tax2: json['TAX2'],
        tax1: json['TAX1'],
        tax3: json['TAX3'],
        tax4: json['TAX4'],
        tax5: json['TAX5'],
        tax6: json['TAX6'],
        netweight: json['NET_WEIGHT']);
  }
}


/*
// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_typing_uninitialized_variables, unused_field, invalid_use_of_protected_member, camel_case_types, sized_box_for_whitespace, avoid_unnecessary_containers

import 'dart:convert';

import 'package:customer_assist/core/app_constants.dart';
import 'package:customer_assist/core/helpers/SharedPreference/prefs.dart';
import 'package:customer_assist/home/presentation/controllers/add_cart_review_controller.dart';
import 'package:customer_assist/home/presentation/controllers/configure_controller.dart';
import 'package:customer_assist/home/presentation/controllers/guest_fetchCountry_controller.dart';
import 'package:customer_assist/home/presentation/controllers/header_controller.dart';
import 'package:customer_assist/home/presentation/controllers/keyboard_controller.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/controllers/options_controller.dart';
import 'package:customer_assist/home/presentation/controllers/shop_controller.dart';
import 'package:customer_assist/home/presentation/controllers/view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_qr_bar_scanner/qr_bar_scanner_camera.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class FreeFlowShopping extends StatefulWidget {
  final double actualHeight;
  const FreeFlowShopping({Key? key, required this.actualHeight})
      : super(key: key);

  @override
  State<FreeFlowShopping> createState() => _FreeFlowShoppingState();
}

class _FreeFlowShoppingState extends State<FreeFlowShopping> {
  OptionsController optionsController = Get.find();
  ShopController shopController = Get.find();
  var languageController = Get.put(LanguageController());
  ViewController viewController = Get.find();
  HeaderController headerController = Get.find();
  var keyboardController = Get.put(KeyboardController());
  var addCartReviewController = Get.put(AddCartReviewController());
  var configureController = Get.put(ConfigureController());
  var GuestCountryController = Get.put(GuestFetchCountryController());

  TextEditingController firstController = TextEditingController();

  var checklist;
  var actualHeight;

  String? _qrInfo = '';

  bool _camState = false;

  _qrCallback(String? code) {
    setState(() {
      _camState = false;
      _qrInfo = code;
    });
  }

  _scanCode() {
    setState(() {
      _camState = true;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    asyncker();

    shopController.productweight.clear();
    checklist = List.generate(
        shopController.flowShopping.value.length, (index) => false);
    actualHeight = widget.actualHeight;
    asyncker();

    print(shopController.checklist);
    super.initState();
    _scanCode();
  }

  asyncker() async {
    await getData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: const Color.fromARGB(255, 210, 207, 207),
          height: 55,
          width: double.infinity,
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  viewController.setView(SHOPLIST);
                },
                child: Container(
                  margin: EdgeInsets.only(left: 15),
                  height: 50,
                  width: 50,
                  child: RotatedBox(
                      quarterTurns: DateTime.june,
                      child: optionsController.arrowfrwd),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 90.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () async {
                        // await addCartReviewController.addToCartshopatstore(
                        //     shopController.flowShopping[data]
                        //     );

                        await addCartReviewController.getReviewCartItems(true);

                        viewController.setView(REVIEWPAGE);
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
                      // onTap: () {
                      //   viewController.setView(SHOPATSTOREWEIGH);
                      // },
                      onTap: () {
                                         
                                         
                                          setState(() {
                                            if (shopController
                                                    .checklist[data] ==
                                                true) {
                                              shopController.productweight
                                                  .remove(shopController
                                                      .flowShopping
                                                      .value[data]);
                                              shopController.checklist[data] =
                                                  false;
                                            } else {
                                              shopController.productweight.add(
                                                  shopController.flowShopping
                                                      .value[data]);
                                              shopController.checklist[data] =
                                                  true;
                                            }
                                          });
                                          viewController
                                              .setView(SHOPATSTOREWEIGH);
                                         
                                        },
                      child: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(5)),
                        child: optionsController.weighscale,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                      width: 20,
                    ),
                    InkWell(
                      onTap: () {
                        // viewController.setView(CAUTIONDELETE);
                      },
                      child: Container(
                        height: 45,
                        width: 45,
                        child: optionsController.minus,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            color: Colors.black,
            height:
                ((widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                        17.9) *
                    3.84,
            width: double.infinity,
            child: QRBarScannerCamera(
              onError: (context, error) => Text(
                error.toString(),
                style: const TextStyle(color: Colors.red),
              ),
              qrCodeCallback: (code) {
                _qrCallback(code);
              },
            ),
          ),
        ),
        SizedBox(
            height: GetPlatform.isAndroid
                ? ((widget.actualHeight -
                            MediaQuery.of(context).padding.bottom) /
                        17.9) *
                    9.7
                : ((widget.actualHeight -
                            MediaQuery.of(context).padding.bottom) /
                        17.9) *
                    11.5,
            child: GetX<ShopController>(
                init: ShopController(),
                initState: (_) {},
                builder: (shopController) {
                  return ListView.builder(
                      itemCount: shopController.flowShopping.value.length,
                      itemBuilder: (context, data) {
                        return Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 5, left: 2, right: 2),
                              height: 145,
                              width: double.infinity,
                              decoration: BoxDecoration(border: Border.all()),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: 133,
                                    width: 140,
                                    child: Column(children: [
                                      Container(
                                        margin: const EdgeInsets.only(
                                          top: 2,
                                          bottom: 1,
                                          // left: 3,
                                          // right: 3
                                        ),
                                        height: 30,
                                        width: 150,
                                        child: Row(children: [
                                          Container(
                                            alignment: Alignment.centerRight,
                                            height: 27,
                                            width: 95,
                                            child: Text(
                                              "Stock",
                                              textAlign: TextAlign.right,
                                            ),
                                          ),
                                          Container(
                                            color: Colors.green,
                                            margin: EdgeInsets.only(left: 10),
                                            height: 27,
                                            width: 27,
                                          ),
                                        ]),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(
                                          top: 1,
                                          bottom: 1,
                                          // left: 3,
                                          // right: 3
                                        ),
                                        height: 30,
                                        width: 150,
                                        child: Row(children: [
                                          Container(
                                            alignment: Alignment.centerRight,
                                            height: 27,
                                            width: 95,
                                            child: Text(
                                              "Pre Order",
                                              textAlign: TextAlign.right,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 10),
                                            height: 27,
                                            width: 27,
                                            decoration: BoxDecoration(
                                              border: Border.all(),
                                            ),
                                          ),
                                        ]),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(
                                          top: 1,
                                          bottom: 1,
                                          // left: 3,
                                          // right: 3
                                        ),
                                        height: 30,
                                        width: 150,
                                        child: Row(children: [
                                          Container(
                                            alignment: Alignment.centerRight,
                                            height: 27,
                                            width: 95,
                                            child: Text(
                                              "Alternate",
                                              textAlign: TextAlign.right,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 10),
                                            height: 27,
                                            width: 27,
                                            decoration: BoxDecoration(
                                              border: Border.all(),
                                            ),
                                          ),
                                        ]),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(
                                          top: 1,
                                          bottom: 1,
                                          // left: 3,
                                          // right: 3
                                        ),
                                        height: 30,
                                        width: 150,
                                        child: Row(children: [
                                          Container(
                                            alignment: Alignment.centerRight,
                                            height: 27,
                                            width: 95,
                                            child: Text(
                                              "Select",
                                              textAlign: TextAlign.right,
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              await addCartReviewController
                                                  .addToCartshopatstore(
                                                      shopController
                                                          .flowShopping[data]);

                                              await addCartReviewController
                                                  .getReviewCartItems(true);

                                              viewController
                                                  .setView(REVIEWPAGE);
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(left: 10),
                                              height: 27,
                                              width: 27,
                                              decoration: BoxDecoration(
                                                border: Border.all(),
                                              ),
                                            ),
                                          ),
                                        ]),
                                      ),
                                    ]),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 3, bottom: 3, left: 5, right: 5),
                                    height: 133,
                                    width: 132,
                                    decoration: BoxDecoration(
                                        border: Border.all(),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: itemwidget(context, data),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 3, bottom: 3, left: 3, right: 3),
                                    height: 133,
                                    width: 185,
                                    // decoration:
                                    //     BoxDecoration(border: Border.all()),
                                    child: Column(children: [
                                      Container(
                                          margin: const EdgeInsets.only(
                                            top: 1,
                                            bottom: 1,
                                          ),
                                          alignment: Alignment.center,
                                          height: 30,
                                          width: 182,
                                          decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          child: itemwidgetname(context, data)),
                                      Row(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(
                                              top: 1,
                                              bottom: 1,
                                            ),
                                            alignment: Alignment.center,
                                            height: 30,
                                            width: 91,
                                            decoration: BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(
                                                  color: Colors.black,
                                                ),
                                                right: BorderSide(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(
                                              top: 1,
                                              bottom: 1,
                                            ),
                                            alignment: Alignment.center,
                                            height: 30,
                                            width: 91,
                                            decoration: BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(
                                              top: 1,
                                              bottom: 1,
                                            ),
                                            alignment: Alignment.center,
                                            height: 30,
                                            width: 91,
                                            decoration: BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(
                                                  color: Colors.black,
                                                ),
                                                right: BorderSide(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(
                                              top: 1,
                                              bottom: 1,
                                            ),
                                            alignment: Alignment.center,
                                            height: 30,
                                            width: 91,
                                            decoration: BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(
                                              top: 1,
                                              bottom: 1,
                                            ),
                                            alignment: Alignment.center,
                                            height: 30,
                                            width: 91,
                                            child: Container(
                                              margin: EdgeInsets.only(top: 5),
                                              height: 30,
                                              width: 65,
                                              color: Colors.yellow,
                                              child: Center(
                                                child: Text(
                                                  "",
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(
                                              top: 1,
                                              bottom: 1,
                                            ),
                                            alignment: Alignment.center,
                                            height: 30,
                                            width: 91,
                                            child: Container(
                                              margin: EdgeInsets.only(top: 5),
                                              height: 30,
                                              width: 65,
                                              color: Colors.green,
                                              child: Center(
                                                child: Text(
                                                  "",
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ]),
                                  ),
                                ],
                              ),
                            ),
                            /*
                            Container(
                              margin: const EdgeInsets.only(
                                  bottom: 5, left: 5, right: 5),
                              height: GetPlatform.isAndroid ? 255 : 270,
                              decoration: BoxDecoration(
                                  // color: Colors.white,
                                  color: Colors.purple,
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(30)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      height: 30,
                                      width: 30,
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
                                    ),
                                  ),
                                  itemwidget(context, data),
                                  Column(
                                    children: [
                                      const SizedBox(
                                        height: 25,
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          await addCartReviewController
                                              .addToCartshopatstore(
                                                  shopController
                                                      .flowShopping[data]);

                                          await addCartReviewController
                                              .getReviewCartItems(true);
                                          headerController.subHeaderLabel(
                                              configureController
                                                  .subheaderResponse.value);
                                          viewController.setView(REVIEWPAGE);
                                          optionsController
                                              .setOptionList(REVIEWCART);
                                          optionsController.getReviewcart();
                                          optionsController
                                              .optionIndexSetter(0);
                                          optionsController.setSetState();
                                        },
                                        child: SizedBox(
                                          width: 65,
                                          height: 65,
                                          child: optionsController.increase,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          print(
                                              '------->${shopController.checklist[data]}');
                                          setState(() {
                                            if (shopController
                                                    .checklist[data] ==
                                                true) {
                                              shopController.productweight
                                                  .remove(shopController
                                                      .flowShopping
                                                      .value[data]);
                                              shopController.checklist[data] =
                                                  false;
                                            } else {
                                              shopController.productweight.add(
                                                  shopController.flowShopping
                                                      .value[data]);
                                              shopController.checklist[data] =
                                                  true;
                                            }
                                          });
                                          viewController
                                              .setView(SHOPATSTOREWEIGH);
                                          headerController.setSubHeaderLabel(
                                              'Weigh Product');
                                          optionsController
                                              .optionIndexSetter(3);
                                          optionsController.setSetState();
                                        },
                                        child: SizedBox(
                                          width: 65,
                                          height: 65,
                                          child: optionsController.weighItem,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: SizedBox(
                                          width: 65,
                                          height: 65,
                                          child: optionsController.decrease,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(top: 35),
                                        width: GetPlatform.isAndroid
                                            ? (widget.actualHeight -
                                                    MediaQuery.of(context)
                                                        .padding
                                                        .bottom) /
                                                17.9 *
                                                2.8
                                            : (widget.actualHeight -
                                                    MediaQuery.of(context)
                                                        .padding
                                                        .bottom) /
                                                17.9 *
                                                2.8,
                                        height: GetPlatform.isAndroid
                                            ? (widget.actualHeight -
                                                    MediaQuery.of(context)
                                                        .padding
                                                        .bottom) /
                                                17.9 *
                                                0.8
                                            : (widget.actualHeight -
                                                    MediaQuery.of(context)
                                                        .padding
                                                        .bottom) /
                                                17.9 *
                                                0.8,
                                        decoration: BoxDecoration(
                                          color: Colors.yellowAccent,
                                          border: Border.all(
                                            color: Colors.black,
                                          ),
                                        ),
                                        child: Center(
                                            child: Text(
                                          shopController
                                              .shoppinglistResponse[data].qty!
                                              .toString(),
                                        )),
                                      ),
                                      const SizedBox(
                                        height: 105,
                                      ),
                                      Container(
                                        width: GetPlatform.isAndroid
                                            ? (widget.actualHeight -
                                                    MediaQuery.of(context)
                                                        .padding
                                                        .bottom) /
                                                17.9 *
                                                2.8
                                            : (widget.actualHeight -
                                                    MediaQuery.of(context)
                                                        .padding
                                                        .bottom) /
                                                17.9 *
                                                2.8,
                                        height: GetPlatform.isAndroid
                                            ? (widget.actualHeight -
                                                    MediaQuery.of(context)
                                                        .padding
                                                        .bottom) /
                                                17.9 *
                                                0.8
                                            : (widget.actualHeight -
                                                    MediaQuery.of(context)
                                                        .padding
                                                        .bottom) /
                                                17.9 *
                                                0.8,
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 63, 249, 69),
                                          border: Border.all(
                                            color: Colors.black,
                                          ),
                                        ),
                                        child: const Center(
                                            child: Text("Qty Picked")),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          
                         */
                          ],
                        );
                      });
                }))
      ],
    );
  }

  itemwidget(BuildContext context, int index) {
    return Container(
      decoration: BoxDecoration(
        // border: Border.all(),
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: NetworkImage(shopController.flowShopping[index].imageurl!),
        ),
      ),
    );
    /* Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: GetPlatform.isAndroid
            ? ((widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                    17.9) *
                4.6
            : ((widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                    17.9) *
                4.6,
        width: GetPlatform.isAndroid
            ? ((widget.actualHeight - 40) / 17.9) * 3
            : ((widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                    17.9) *
                3,
        decoration: BoxDecoration(color: Colors.grey[300]),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: GetPlatform.isAndroid
                    ? ((widget.actualHeight - 40) / 17.9) * 2.5
                    : ((widget.actualHeight -
                                MediaQuery.of(context).padding.bottom) /
                            17.9) *
                        2.5,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  color: Colors.white,
                  image: DecorationImage(
                    image: NetworkImage(
                        shopController.flowShopping[index].imageurl!),
                  ),
                ),
              ),
            ),
            /* const SizedBox(
              height: 10,
            ),
            Center(
                child: Text(
              shopController.flowShopping[index].productname!,
              style: const TextStyle(fontSize: 15),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )),
            const SizedBox(
              height: 10,
            ),
            Text(
              shopController.flowShopping[index].uom!,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              shopController.flowShopping[index].productRate!.toString(),
            ),
            */
          ],
        ),
      ),
    );
    */
  }

  itemwidgetname(BuildContext context, int index) {
    return Container(
      child: Text(
        shopController.flowShopping[index].productname!,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  getData() async {
    var jsonRequestBody =
        '{"CUSTOMER_ID":"${await Prefs.customerID}","PAGE_NO":1}';
    print(jsonRequestBody);

    var prefs = await SharedPreferences.getInstance();
    String? tokenNos = prefs.getString("TokenNo");
    String NEWTOKEN = tokenNos ?? "";
    Map<String, String> headers = {
      "Content-type": "application/json",
      "TokenNo": NEWTOKEN
    };
    final response = await http.post(
      Uri.parse(
          'https://www.retailresonance.com/retailresonancev2/api/fetchCatalogueProductOnlyItems'),
      headers: headers,
      body: jsonRequestBody,
    );

    var jsonData = jsonDecode(response.body);

    shopController.flowShopping.value =
        (jsonData['status']['ITEMS'] as List<dynamic>)
            .map((d) => cataloguedetails.fromJson(d))
            .toList();
    shopController.checklist = List.generate(
        shopController.flowShopping.value.length, (index) => false);

    print(shopController.flowShopping.value.length);
  }
}

class cataloguedetails {
  String? imageurl;
  String? productname;
  String? uom;
  int? qty;
  String? productcode;
  dynamic productMrp;
  dynamic productRate;
  dynamic discountValue;
  dynamic tax2;
  dynamic tax1;
  dynamic tax3;
  dynamic tax4;
  dynamic tax5;
  dynamic tax6;
  String? netweight;

  cataloguedetails(
      {this.imageurl,
      this.productname,
      this.uom,
      this.qty,
      this.productcode,
      this.productMrp,
      this.productRate,
      this.discountValue,
      this.tax1,
      this.tax2,
      this.tax3,
      this.tax4,
      this.tax5,
      this.tax6,
      this.netweight});

  factory cataloguedetails.fromJson(Map<String, dynamic> json) {
    return cataloguedetails(
        imageurl: json['IMAGE_URL'],
        productname: json['PRODUCT_NAME'],
        uom: json['UOM'],
        qty: json['AVAILABLE_STOCK_QUANTY'],
        productcode: json["PRODUCT_CODE"],
        productMrp: json['PRODUCT_MRP'],
        productRate: json['PRODUCT_RATE'],
        discountValue: json['DISCOUNT_VALUE'],
        tax2: json['TAX2'],
        tax1: json['TAX1'],
        tax3: json['TAX3'],
        tax4: json['TAX4'],
        tax5: json['TAX5'],
        tax6: json['TAX6'],
        netweight: json['NET_WEIGHT']);
  }
}

*/