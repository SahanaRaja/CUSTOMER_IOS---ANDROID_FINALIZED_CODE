import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:customer_assist/home/presentation/controllers/add_cart_review_controller.dart';
import 'package:customer_assist/home/presentation/controllers/shop_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/helpers/SharedPreference/prefs.dart';
import '../first_row_widget.dart';

class CatalogueListWidget extends StatefulWidget {
  final double actualHeight;

  const CatalogueListWidget({Key? key, required this.actualHeight})
      : super(key: key);

  @override
  State<CatalogueListWidget> createState() => _CatalogueListWidgetState();
}

class _CatalogueListWidgetState extends State<CatalogueListWidget> {
  List<bool> shoppingListCheck = List.generate(100, (index) => false);
  AddCartReviewController addCartReviewController = Get.find();
  ShopController shopController = Get.find();
  List<Map<String, String>> wlist = [];

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
    return Stack(children: [
      SizedBox(
          // color: Colors.red,
          width: MediaQuery.of(context).size.width,
          //height:MediaQuery.of(context).size.height * 0.65,
          child: Stack(alignment: Alignment.topCenter, children: [
            Column(
              children: [
                FirstRowWidget(
                    actualHeight: widget.actualHeight,
                    header: 'Shopping List',
                    arrow: false
                    // languageController
                    //  .languageResponse.value.reviewCart ??
                    ),
                Column(
                  children: [
                    SizedBox(
                      height: GetPlatform.isAndroid
                          ? ((widget.actualHeight - 40) / 17.9) * 12.9
                          // 1.8
                          : ((widget.actualHeight -
                                      MediaQuery.of(context).padding.bottom) /
                                  17.9) *
                              13.4,
                      child: GetX<ShopController>(
                          init: ShopController(),
                          initState: (_) {},
                          builder: (shopController) {
                            return ListView.builder(
                              itemCount: shopController
                                  .catalogueListResponse.value.length,
                              itemBuilder:
                                  (BuildContext context, int itemindex) {
                                return Column(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: GetPlatform.isAndroid
                                          ? (widget.actualHeight - 40) / 2
                                          // 18.1
                                          : (widget.actualHeight -
                                                  MediaQuery.of(context)
                                                      .padding
                                                      .bottom) /
                                              17.9 *
                                              8.5,
                                      height: GetPlatform.isAndroid
                                          ? (widget.actualHeight - 40) / 5.82
                                          //  18.1
                                          : (widget.actualHeight -
                                                  MediaQuery.of(context)
                                                      .padding
                                                      .bottom) /
                                              17.9 *
                                              3,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                          ),
                                          color: Colors.white,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(15))),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 32.0, right: 10),
                                        child: Row(
                                          children: [
                                            Container(
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
                                                child: InkWell(
                                                  onTap: () {
                                                    print(
                                                        '------->${shopController.catalogueResponse.value}');
                                                    print(
                                                        '------->${shopController.checklist[itemindex]}');
                                                    setState(() {
                                                      if (shopController
                                                                  .checklist[
                                                              itemindex] ==
                                                          true) {
                                                        shopController
                                                            .catalogueResponse
                                                            .remove(shopController
                                                                .catalogueListResponse
                                                                .value[itemindex]);
                                                        shopController
                                                                .checklist[
                                                            itemindex] = false;
                                                      } else {
                                                        shopController
                                                            .catalogueResponse
                                                            .add(shopController
                                                                .catalogueListResponse
                                                                .value[itemindex]);
                                                        shopController
                                                                .checklist[
                                                            itemindex] = true;
                                                      }
                                                    });
                                                  },
                                                  child: Center(
                                                    child: Icon(
                                                      Icons.done,
                                                      color: shopController
                                                                      .checklist[
                                                                  itemindex] ==
                                                              true
                                                          ? Colors.green
                                                          : const Color
                                                              .fromARGB(255,
                                                              255, 255, 255),
                                                      size: 25,
                                                    ),
                                                  ),
                                                )),
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  top: 5, bottom: 5),
                                              width: GetPlatform.isAndroid
                                                  ? (widget.actualHeight - 40) /
                                                      6
                                                  // 18.1
                                                  : (widget.actualHeight -
                                                          MediaQuery.of(context)
                                                              .padding
                                                              .bottom) /
                                                      17.9 *
                                                      2.5,
                                              height: GetPlatform.isAndroid
                                                  ? (widget.actualHeight - 40) /
                                                      // 18.1
                                                      3
                                                  : (widget.actualHeight -
                                                          MediaQuery.of(context)
                                                              .padding
                                                              .bottom) /
                                                      17.9 *
                                                      2.5,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.black,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(15)),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                      shopController
                                                          .catalogueListResponse[
                                                              itemindex]
                                                          .imageurl!,
                                                    ),
                                                    fit: BoxFit.fill),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15.0, top: 10),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    width: GetPlatform.isAndroid
                                                        ? (widget.actualHeight -
                                                                40) /
                                                            4.8
                                                        // 18.1
                                                        : (widget.actualHeight -
                                                                MediaQuery.of(
                                                                        context)
                                                                    .padding
                                                                    .bottom) /
                                                            17.9 *
                                                            3.85,
                                                    height: GetPlatform
                                                            .isAndroid
                                                        ? (widget.actualHeight -
                                                                40) /
                                                            20.8
                                                        //18.1
                                                        : (widget.actualHeight -
                                                                MediaQuery.of(
                                                                        context)
                                                                    .padding
                                                                    .bottom) /
                                                            17.9 *
                                                            0.76,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        shopController
                                                            .catalogueListResponse[
                                                                itemindex]
                                                            .productname!,
                                                        style: const TextStyle(
                                                          fontSize: 14,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 2,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    width: GetPlatform.isAndroid
                                                        ? (widget.actualHeight -
                                                                40) /
                                                            4.8
                                                        // 18.1
                                                        : (widget.actualHeight -
                                                                MediaQuery.of(
                                                                        context)
                                                                    .padding
                                                                    .bottom) /
                                                            17.9 *
                                                            3.85,
                                                    height: GetPlatform
                                                            .isAndroid
                                                        ? (widget.actualHeight -
                                                                40) /
                                                            20.8
                                                        // 18.1
                                                        : (widget.actualHeight -
                                                                MediaQuery.of(
                                                                        context)
                                                                    .padding
                                                                    .bottom) /
                                                            17.9 *
                                                            0.76,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        shopController
                                                            .catalogueListResponse[
                                                                itemindex]
                                                            .uom!,
                                                        style: const TextStyle(
                                                            fontSize: 14),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    width: GetPlatform.isAndroid
                                                        ? (widget.actualHeight -
                                                                40) /
                                                            4.8
                                                        //18.1
                                                        : (widget.actualHeight -
                                                                MediaQuery.of(
                                                                        context)
                                                                    .padding
                                                                    .bottom) /
                                                            17.9 *
                                                            3.85,
                                                    height: GetPlatform
                                                            .isAndroid
                                                        ? (widget.actualHeight -
                                                                40) /
                                                            20.8
                                                        //18.1
                                                        : (widget.actualHeight -
                                                                MediaQuery.of(
                                                                        context)
                                                                    .padding
                                                                    .bottom) /
                                                            17.9 *
                                                            0.76,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        shopController
                                                            .catalogueListResponse[
                                                                itemindex]
                                                            .productRate!
                                                            .toString(),
                                                        style: const TextStyle(
                                                            fontSize: 14),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 9)
                                  ],
                                );
                              },
                            );
                          }),
                    ),
                  ],
                ),
              ],
            ),
          ]))
    ]);
  }

  getData() async {
    var jsonRequestBody =
        '{"CUSTOMER_ID":"${await Prefs.customerID}","PAGE_NO":1}';
    print(jsonRequestBody);
    // '{"CUSTOMER_ID":"560","PAGE_NO":1}';

    Map<String, String> headers = {
      "Content-type": "application/json",
      "TokenNo": 'cce618086bfccd93b47dd9d4cf06f52778515b5d'
    };

    final response = await http.post(
      Uri.parse(
          'https://www.retailresonance.com/retailresonancev2/api/fetchCatalogueProductOnlyItems'),
      headers: headers,
      body: jsonRequestBody,
    );

    var jsonData = jsonDecode(response.body);

    shopController.catalogueListResponse.value =
        (jsonData['status']['ITEMS'] as List<dynamic>)
            .map((d) => cataloguefetch.fromJson(d))
            .toList();
    shopController.checklist = List.generate(
        shopController.catalogueListResponse.value.length, (index) => false);

    print(shopController.catalogueListResponse.value.length);
  }
}

class cataloguefetch {
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

  cataloguefetch(
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

  factory cataloguefetch.fromJson(Map<String, dynamic> json) {
    return cataloguefetch(
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
