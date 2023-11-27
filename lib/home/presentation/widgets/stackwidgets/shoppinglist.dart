// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'dart:convert';

import 'package:customer_assist/core/app_colors.dart';
import 'package:customer_assist/core/app_constants.dart';
import 'package:customer_assist/core/helpers/SharedPreference/prefs.dart';
import 'package:customer_assist/home/presentation/controllers/configure_controller.dart';
import 'package:customer_assist/home/presentation/controllers/header_controller.dart';
import 'package:customer_assist/home/presentation/controllers/keyboard_controller.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/controllers/options_controller.dart';
import 'package:customer_assist/home/presentation/controllers/shop_controller.dart';
import 'package:customer_assist/home/presentation/controllers/view_controller.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/first_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ShoppingList extends StatefulWidget {
  double actualHeight;
  ShoppingList({Key? key, required this.actualHeight}) : super(key: key);

  @override
  State<ShoppingList> createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  HeaderController headerController = Get.find();
  ConfigureController configureController = Get.put(ConfigureController());
  LanguageController languageController = Get.find();
  OptionsController optionsController = Get.find();
  ShopController shopController = Get.find();
  List<bool> shoppingListCheck = List.generate(100, (index) => false);
  List<Map<String, String>> wlist = [];
  var keyboardController = Get.put(KeyboardController());
  var viewController = Get.put(ViewController());

  var actualHeight;
  @override
  void initState() {
    // asyncker();
    shopController.catalogueResponse.clear();
    shopController.shoppingOutlets.clear();

    actualHeight = widget.actualHeight;
    asyncker();

    print(shopController.checklist);
    super.initState();
  }

  asyncker() async {
    await getData();
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
              children: [
                Container(
                  margin: EdgeInsets.only(left: 95),
                  height: 50,
                  width: 280,
                  child: Center(
                    child: Text(
                      "Shopping List",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    viewController.setView(FREEFLOWSHOPPING);
    
                    keyboardController.setPicker('');
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 40),
                    height: 40,
                    width: 40,
                    child: optionsController.arrowfrwd,
                  ),
                ),
              ],
            ),
          ),
          /*  Container(
            color: const Color.fromARGB(255, 210, 207, 207),
            height: 50,
            width: double.infinity,
            child: Center(
                child: Text(
              "Shopping List",
              // languageController.languageResponse.value.users ?? '',
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            )),
          ),
          */
          const SizedBox(
            height: 2,
          ),
          Row(
            children: [
              Container(
                decoration: const BoxDecoration(
                    border: Border(
                  right: BorderSide(
                    color: Colors.black,
                    width: 1,
                  ),
                )),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.056,
                  width: GetPlatform.isAndroid
                      ? ((widget.actualHeight -
                                  MediaQuery.of(context).padding.bottom) /
                              17.9) *
                          1
                      : ((widget.actualHeight -
                              MediaQuery.of(context).padding.bottom) /
                          17.9),
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 10, bottom: 10),
                  // child: InkWell(
                  //     onTap: () {
                  //       //viewController.setView(CAUTIONWISHLIST);
                  //     },
                  //     child: Container(
                  //       height: 40,
                  //       width: 40,
                  //       decoration: BoxDecoration(
                  //         color: Colors.white,
                  //         border: Border.all(
                  //             color: Color.fromARGB(255, 249, 249, 249)),
                  //       ),
                  //       //child: optionsController.delete,
                  //     )),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.yellow[300],
                    border: const Border(
                      right: BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                    )),
                height: MediaQuery.of(context).size.height * 0.056,
                width: GetPlatform.isAndroid
                    ? ((widget.actualHeight - 40) / 17.9) * 6.4
                    : ((widget.actualHeight -
                                MediaQuery.of(context).padding.bottom) /
                            17.9) *
                        6.5,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 10),
                child: const Text(
                  // languageController.languageResponse.value.itemName ??
                  'Item Name',
                  style: TextStyle(fontSize: 22),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.yellow[300],
                    border: const Border(
                      right: BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                    )),
                height: MediaQuery.of(context).size.height * 0.056,
                width: GetPlatform.isAndroid
                    ? ((widget.actualHeight - 40) / 17.9) * 1.3
                    : ((widget.actualHeight -
                            MediaQuery.of(context).padding.bottom) /
                        11.3),
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 20),
                child: Text(languageController.languageResponse.value.qty ?? '',
                    // languageController.languageResponse.value.qty ?? '',
                    style: const TextStyle(fontSize: 22)),
              ),
            ],
          ),
          SizedBox(
            height: GetPlatform.isAndroid
                ? ((widget.actualHeight - 40) / 17.9) * 14.19
                : ((widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                        17.9) *
                    14.15,
            child: Stack(
              children: [
                GetX<ShopController>(
                    init: ShopController(),
                    initState: (_) {},
                    builder: (shopController) {
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount:
                              shopController.shoppinglistResponse.value.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey[400]!,
                                    width: 0.5,
                                  ),
                                  top: BorderSide(
                                    color: Colors.grey[400]!,
                                    width: 1,
                                  ),
                                ),
                              ),
                              height: GetPlatform.isAndroid
                                  ? MediaQuery.of(context).size.height * 0.057
                                  : MediaQuery.of(context).size.height * 0.056,
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      print("nbvsmdnbvmd");
                                      // setState(() {
                                      //   reviewIdCheck![data] =
                                      //       !reviewIdCheck![data];
                                      // });
                                      // if (reviewIdCheck![data] == true) {
                                      //   print(addCartReviewController
                                      //       .tableLength
                                      //       .value[data]['ITEMS_ID']);
                                      //   addCartReviewController
                                      //       .deleteOrderedItem([
                                      //     addCartReviewController.tableLength
                                      //         .value[data]['ITEMS_ID']
                                      //   ]);
                                      // }
                                    },
                                    child: Container(
                                      height: MediaQuery.of(context).size.height *
                                          0.056,
                                      width: GetPlatform.isAndroid
                                          ? ((widget.actualHeight -
                                                      MediaQuery.of(context)
                                                          .padding
                                                          .bottom) /
                                                  17.9) *
                                              1
                                          : ((widget.actualHeight -
                                                  MediaQuery.of(context)
                                                      .padding
                                                      .bottom) /
                                              17.9),
                                      // alignment: Alignment.center,
                                      padding: const EdgeInsets.only(
                                          left: 12,
                                          right: 12,
                                          top: 13,
                                          bottom: 13),
                                      decoration: const BoxDecoration(
                                          border: Border(
                                        right: BorderSide(
                                          color: Colors.black,
                                          width: 1,
                                        ),
                                      )),
                                      child: InkWell(
                                        onTap: () {
                                          // print('------->' +
                                          //     orderController.selectedList
                                          //         .toString());
                                          // print('------->' +
                                          //     checklist[index].toString());
                                          // setState(() {
                                          //   if (checklist[index] == true) {
                                          //     orderController.selectedList
                                          //         .remove(index);
                                          //     checklist[index] = false;
                                          //   } else {
                                          //     orderController.selectedList
                                          //         .add(index);
                                          //     checklist[index] = true;
                                          //   }
                                          // });
                                        },
                                        child: Container(
                                          height: 20,
                                          width: 40,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                color: Colors.blueAccent),
                                          ),
                                          // child: Icon(
                                          //   Icons.done,
                                          //   color: checklist[index] == true
                                          //       ? Colors.green
                                          //       : const Color.fromARGB(
                                          //           255, 255, 255, 255),
                                          //   size: 25,
                                          // ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(
                                        border: Border(
                                      right: BorderSide(
                                        color: Colors.black,
                                        width: 1,
                                      ),
                                    )),
                                    height: MediaQuery.of(context).size.height *
                                        0.056,
                                    width: GetPlatform.isAndroid
                                        ? ((widget.actualHeight - 40) / 17.9) *
                                            6.39
                                        : ((widget.actualHeight -
                                                    MediaQuery.of(context)
                                                        .padding
                                                        .bottom) /
                                                17.9) *
                                            6.2,
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      shopController.shoppinglistResponse[index]
                                          .productname!,
                                      style: const TextStyle(
                                          overflow: TextOverflow.ellipsis),
                                      maxLines: 1,
                                      //textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(
                                        border: Border(
                                      right: BorderSide(
                                        color: Colors.black,
                                        width: 1,
                                      ),
                                    )),
                                    height: MediaQuery.of(context).size.height *
                                        0.056,
                                    width: GetPlatform.isAndroid
                                        ? ((widget.actualHeight - 40) / 17.9) *
                                            1.3
                                        : ((widget.actualHeight -
                                                MediaQuery.of(context)
                                                    .padding
                                                    .bottom) /
                                            12),
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Center(
                                      child: Text(
                                          shopController
                                              .shoppinglistResponse[index].qty!
                                              .toString(),
                                          style: const TextStyle(
                                              overflow: TextOverflow.ellipsis)),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }

  getData() async {
    var jsonRequestBody =
        '{"CUSTOMER_ID":"${await Prefs.customerID}","PAGE_NO":1}';
    print(jsonRequestBody);
    // '{"CUSTOMER_ID":"560","PAGE_NO":1}';
    var prefs = await SharedPreferences.getInstance();
    String? tokenNos = prefs.getString("TokenNo");
    String NEWTOKEN = tokenNos ?? "";
    Map<String, String> headers = {
      "Content-type": "application/json",
      "TokenNo": NEWTOKEN
      //  TOKEN
    };

    /*  Map<String, String> headers = {
      "Content-type": "application/json",
      "TokenNo": 'cce618086bfccd93b47dd9d4cf06f52778515b5d'
    };
*/
    final response = await http.post(
      Uri.parse(
          'https://www.retailresonance.com/retailresonancev2/api/fetchCatalogueProductOnlyItems'),
      headers: headers,
      body: jsonRequestBody,
    );

    var jsonData = jsonDecode(response.body);

    shopController.shoppinglistResponse.value =
        (jsonData['status']['ITEMS'] as List<dynamic>)
            .map((d) => cataloguefetchdetails.fromJson(d))
            .toList();
    shopController.checklist = List.generate(
        shopController.shoppinglistResponse.value.length, (index) => false);

    print(shopController.shoppinglistResponse.value.length);
  }
}

class cataloguefetchdetails {
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

  cataloguefetchdetails(
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
      this.tax6});

  factory cataloguefetchdetails.fromJson(Map<String, dynamic> json) {
    return cataloguefetchdetails(
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
    );
  }
}
