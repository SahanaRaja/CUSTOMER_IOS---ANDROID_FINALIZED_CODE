import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:customer_assist/core/helpers/SharedPreference/prefs.dart';
import 'package:customer_assist/home/data/shopcoupon/models/shopping_products_model/item.dart';
import 'package:customer_assist/home/data/shopcoupon/models/shopping_products_model/shopping_products_model.dart';
import 'package:customer_assist/home/data/shopcoupon/models/shopping_products_model/subcategory.dart';
import 'package:customer_assist/home/presentation/controllers/add_cart_review_controller.dart';
import 'package:customer_assist/home/presentation/controllers/header_controller.dart';
import 'package:customer_assist/home/presentation/controllers/keyboard_controller.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/controllers/loading_controller.dart';
import 'package:customer_assist/home/presentation/controllers/options_controller.dart';
import 'package:customer_assist/home/presentation/controllers/order_controller.dart';
import 'package:customer_assist/home/presentation/controllers/shop_controller.dart';
import 'package:customer_assist/home/presentation/controllers/view_controller.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../../../core/app_constants.dart';
import '../../../../../core/app_urls.dart';
import '../../../../../core/error/exceptions.dart';

class SubCatagoryFilter extends StatefulWidget {
  double actualHeight;
  SubCatagoryFilter({Key? key, required this.actualHeight}) : super(key: key);
  @override
  State<SubCatagoryFilter> createState() => _SubCatagoryFilterState();
}

class _SubCatagoryFilterState extends State<SubCatagoryFilter> {
  ScrollController scrollController = ScrollController();
  OptionsController optionsController = Get.find();
  ShopController shopController = Get.find();
  HeaderController headerController = Get.find();
  KeyboardController keyboardController = Get.find();
  ViewController viewController = Get.find();
  AddCartReviewController addCartReviewController = Get.find();
  OrderController orderController = Get.find();
  LanguageController languageController = Get.find();
  LoadingController loadingController = Get.put(LoadingController());

  List<dynamic> brand = [];
  List<dynamic> rating = [];
  List<dynamic> price = [];
  Item? dropdownValue;
  var brandtext = '';
  var ratingtext = '';
  var pricetext = '';
  var cattext = '';
  var subtext = '';
  String ratingid = '';
  String priceid = '';
  Subcategory? subcatagoryValue;
  @override
  void initState() {
    catsubBrand("");
    shopController.setCatagoryIndex(0);
    brandFilter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return Stack(children: [
    return Stack(children: [
      Container(
          padding: const EdgeInsets.only(right: 3),
          height: GetPlatform.isAndroid
              // added by bhava
              ? (widget.actualHeight - 40) / 1.279
              : (widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                  17.9 *
                  14,
          //width: 475,
          width: GetPlatform.isAndroid
              ? (widget.actualHeight - 40)
              : (widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                  17.9 *
                  14,
          decoration: BoxDecoration(
            border: Border.all(width: 1),
          ),
          child: Container(
              padding: const EdgeInsets.only(right: 3, left: 5, bottom: 5, top: 5),
              height: GetPlatform.isAndroid
                  ? (widget.actualHeight - 40)
                  : (widget.actualHeight -
                          MediaQuery.of(context).padding.bottom) /
                      17.9 *
                      14,
              width: GetPlatform.isAndroid
                  ? (widget.actualHeight - 40)
                  : (widget.actualHeight -
                          MediaQuery.of(context).padding.bottom) /
                      17.9,

              //width: 475,
              child: DottedBorder(
                  borderType: BorderType.RRect,
                  dashPattern: const [4, 4],
                  strokeWidth: 1,
                  strokeCap: StrokeCap.square,
                  color: Colors.black,
                  padding: const EdgeInsets.all(6),
                  child: ClipRRect(
                      child: Column(children: [
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          margin: const EdgeInsets.only(left: 70),
                          child: const Text(
                            'Brand',
                            style: TextStyle(fontSize: 22, color: Colors.black),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.1,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: GetPlatform.isAndroid
                          ? MediaQuery.of(context).size.height / 55
                          : MediaQuery.of(context).size.height / 55,
                    ),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 250, 247, 247),
                              border: Border.all(),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.grey,
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: Offset(4, 4))
                              ]),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 45,
                          width: 400,
                          padding: const EdgeInsets.only(left: 10),

                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 252, 240, 110),
                              border: Border.all()),
                          // child: Center(
                          child: Row(
                            children: [
                              Text(
                                brandtext,
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  // fontWeight: FontWeight.bold
                                ),
                              ),
                              // SizedBox(
                              //   width:
                              // MediaQuery.of(context).size.width * 0.1,
                              // ),
                              Expanded(
                                // flex: 3,
                                // Container(
                                // FittedBox(
                                //   fit: BoxFit.fitWidth,
                                child: DropdownButton<dynamic>(
                                  isExpanded: true,
                                  // value: brandtext,

                                  icon: const Icon(Icons.arrow_drop_down,
                                      color: Colors.blue, size: 50),

                                  elevation: 16,
                                  // alignment: Alignment.center,

                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.black),
                                  onChanged: (dynamic newValue) {
                                    setState(() {
                                      brandtext = newValue!['BRAND_NAME'];

                                      catsubBrand(brandtext);

                                      // print(
                                      // 'items......${shopController.catagory.indexOf(newValue)}');
                                      // subcatagory(context, newValue.subcategory!.length);
                                    });
                                  },
                                  items: brand.map<DropdownMenuItem<dynamic>>(
                                    (dynamic value) {
                                      return DropdownMenuItem<dynamic>(
                                        value: value,
                                        child: Text(
                                          value!['BRAND_NAME'],
                                          style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.black),
                                          //   ),
                                          // ),
                                        ),
                                      );
                                    },
                                  ).toList(),
                                ),
                              )
                            ],
                          ),
                          //  ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          margin: const EdgeInsets.only(left: 70, top: 15),
                          child: const Text(
                            "Product Category",
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.30,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: GetPlatform.isAndroid
                          ? MediaQuery.of(context).size.height / 68
                          : MediaQuery.of(context).size.height / 65,
                    ),

                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 250, 247, 247),
                              border: Border.all(),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.grey,
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: Offset(4, 4))
                              ]),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 45,
                          width: 400,
                          padding: const EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 252, 240, 110),
                              border: Border.all()),
                          child: Row(
                              // mainAxisAlignment: MainAxisAlignment.end,
                              // mainAxisAlignment: MainAxisAlignment.start,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                AutoSizeText(
                                  cattext,
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.black),
                                ),
                                // SizedBox(
                                //     width: GetPlatform.isAndroid
                                //         // added by bhava
                                //         ? MediaQuery.of(context).size.width *
                                //             0.1
                                //         : MediaQuery.of(context).size.width *
                                //             1.5),
                                Expanded(
                                  //flex: 1,
                                  //Container(
                                  // FittedBox(
                                  //   fit: BoxFit.fitWidth,
                                  child: DropdownButton<Item?>(
                                    // iconSize: 50,
                                    isExpanded: true,
                                    value: dropdownValue,
                                    icon: const Icon(Icons.arrow_drop_down,
                                        color: Colors.blue, size: 50),
                                    elevation: 16,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        overflow: TextOverflow.ellipsis),
                                    onChanged: (Item? newValue) {
                                      setState(() {
                                        dropdownValue = newValue!;
                                        // log(shopController.catagory.toString());
                                        // log(newValue.toString());

                                        shopController.setCatagoryIndex(
                                            shopController.catagory
                                                .indexOf(newValue));
                                        print(
                                            'items......${shopController.catagory.indexOf(newValue)}');
                                        // subcatagory(context, newValue.subcategory!.length);
                                      });
                                    },
                                    items: shopController.catagory
                                        .map<DropdownMenuItem<Item?>>(
                                            (Item? value) {
                                      return DropdownMenuItem<Item?>(
                                        value: value,

                                        child: Text(
                                          value!.categoryName!,
                                          style: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            // ),
                                          ),
                                        ),
                                        // ),
                                        // ),
                                        // ),
                                      );
                                    }).toList(),
                                  ),
                                )
                              ]),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 7,
                    ),

                    // *********************

                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 70, top: 15),
                          child: const Text(
                            "Sub Category Filtered by",
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          margin: const EdgeInsets.only(left: 70, top: 15),
                          child: const Text(
                            "Sub Category",
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.30,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: GetPlatform.isAndroid
                          ? MediaQuery.of(context).size.height / 68
                          : MediaQuery.of(context).size.height / 65,
                    ),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 250, 247, 247),
                              border: Border.all(),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.grey,
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: Offset(4, 4))
                              ]),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 45,
                          width: 400,
                          padding: const EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                              border: Border.all(),
                              color: const Color.fromARGB(255, 252, 240, 110)),

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                subtext,
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                              // SizedBox(
                              //   width: MediaQuery.of(context).size.width * 0.1,
                              // ),
                              Expanded(
                                // FittedBox(
                                //   fit: BoxFit.fitWidth,
                                child: DropdownButton<Subcategory?>(
                                  isExpanded: true,
                                  value: subcatagoryValue,
                                  icon: const Icon(Icons.arrow_drop_down,
                                      color: Colors.blue, size: 50),
                                  elevation: 16,
                                  // alignment: Alignment.center,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      overflow: TextOverflow.ellipsis),
                                  onChanged: (Subcategory? newValue) {
                                    setState(
                                      () {
                                        subcatagoryValue = newValue!;
                                        shopController.setSubCatagoryPageIndex(
                                            shopController
                                                .catagory[shopController
                                                    .catagoryIndex.value]
                                                .subcategory!
                                                .indexOf(newValue));
                                      },
                                    );
                                  },
                                  items: shopController
                                      .catagory[
                                          shopController.catagoryIndex.value]
                                      .subcategory!
                                      .map<DropdownMenuItem<Subcategory?>>(
                                          (Subcategory? value) {
                                    return DropdownMenuItem<Subcategory?>(
                                      value: value,
                                      // child: Padding(
                                      //   padding:
                                      //       const EdgeInsets.only(right: 119),
                                      // child: Center(
                                      child: Text(
                                        value!.subcategoryName!,
                                        style: const TextStyle(
                                            fontSize: 20, color: Colors.black),
                                        // ),
                                        //  ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              )
                            ],
                          ),
                          // ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          margin: const EdgeInsets.only(left: 70, top: 15),
                          child: const Text(
                            "Customer Rating",
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.30,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: GetPlatform.isAndroid
                          ? MediaQuery.of(context).size.height / 75
                          : MediaQuery.of(context).size.height / 70,
                    ),
                    // *********************

                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 250, 247, 247),
                              border: Border.all(),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.grey,
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: Offset(4, 4))
                              ]),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                            height: 45,
                            width: 400,
                            padding: const EdgeInsets.only(
                                left:
                                    10), //color: Color.fromARGB(255, 252, 240, 110),
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 252, 240, 110),
                                border: Border.all()),
                            child: Center(
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                  Text(
                                    ratingtext,
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                  // SizedBox(
                                  //   width:
                                  // MediaQuery.of(context).size.width * 0.1,
                                  // ),
                                  Expanded(
                                    // FittedBox(
                                    //   fit: BoxFit.fitWidth,
                                    child: DropdownButton<dynamic>(
                                      isExpanded: true,
                                      //value: dropdownValue,
                                      icon: const Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.blue,
                                        size: 50,
                                      ),
                                      elevation: 16,
                                      // alignment: Alignment.center,

                                      style: const TextStyle(
                                          fontSize: 20, color: Colors.black),
                                      onChanged: (dynamic newValue) {
                                        setState(() {
                                          ratingid = newValue!['Id'];
                                          ratingtext = newValue!['val'];
                                          // catsubBrand(brandtext);
                                          // print('items......${shopController.catagory.indexOf(newValue)}');
                                        });
                                      },
                                      items: rating
                                          .map<DropdownMenuItem<dynamic>>(
                                              (dynamic value) {
                                        return DropdownMenuItem<dynamic>(
                                          value: value,
                                          // child: Padding(
                                          //   padding: const EdgeInsets.only(
                                          //       right: 40),
                                          child: Text(
                                            value!['val'],
                                            style: const TextStyle(
                                                fontSize: 20,
                                                color: Colors.black),
                                          ),
                                          //  ),
                                        );
                                      }).toList(),
                                    ),
                                  )
                                ]))),
                      ],
                    ),

                    // *********************
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          margin: const EdgeInsets.only(left: 70, top: 15),
                          child: const Text(
                            "Price",
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.30),
                      ],
                    ),
                    SizedBox(
                      height: GetPlatform.isAndroid
                          ? MediaQuery.of(context).size.height / 80
                          : MediaQuery.of(context).size.height / 75,
                    ),
                    Row(children: [
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 250, 247, 247),
                            border: Border.all(),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: Offset(4, 4))
                            ]),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 45,
                        width: 400,
                        padding: const EdgeInsets.only(
                            left:
                                10), //color: Color.fromARGB(255, 252, 240, 110),

                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 252, 240, 110),
                            border: Border.all()),
                        //  child: Center(
                        child: Row(
                            // mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                pricetext.toString().trim(),
                                style: const TextStyle(fontSize: 20),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.1,
                              ),
                              Expanded(
                                // FittedBox(
                                //   fit: BoxFit.fitWidth,
                                child: DropdownButton<dynamic>(
                                  isExpanded: true,
                                  icon: const Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.blue,
                                    size: 50,
                                  ),
                                  elevation: 16,
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.black),
                                  onChanged: (dynamic newValue) {
                                    setState(
                                      () {
                                        priceid = newValue!['Id'];
                                        pricetext = newValue!['val'];
                                        // catsubBrand(brandtext);
                                      },
                                    );
                                  },
                                  items: price.map<DropdownMenuItem<dynamic>>(
                                      (dynamic value) {
                                    return DropdownMenuItem<dynamic>(
                                      value: value,

                                      child: Text(
                                        value!['val'],
                                        style: const TextStyle(
                                            fontSize: 20, color: Colors.black),
                                      ),
                                      // ),
                                    );
                                  }).toList(),
                                ),
                              )
                            ]
                            //    ),
                            ),
                      ),
                    ]),
                    // *********************

                    SizedBox(
                      // height: 60,
                      height: GetPlatform.isAndroid
                          ? MediaQuery.of(context).size.height * 0.06
                          : MediaQuery.of(context).size.height * 0.057,
                    ),
                    SizedBox(
                        width: 158,
                        height: 45,
                        //decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                        child: ElevatedButton(
                            onPressed: (() async {
                              await productAll(brandtext, ratingid, priceid);

//shopController.setCatagoryPageIndex(0);
//shopController.setSubCatagoryPageIndex(0);
                              optionsController.optionIndexSetter(3);
//viewController.setSubUserOption(NEWORDERCHANGE);
                              viewController.setsearchoption("search");
                              viewController.setView(SELECTSUBCATAGORYPAGE);
                              headerController.setSubHeaderLabel(
                                  //'Sub Category Filter'
                                  languageController.languageResponse.value
                                          .subCatagoryFilter ??
                                      '');
                            }),
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ))),
                            child: Text(
                              //"CONFIRM",
                              languageController
                                      .languageResponse.value.confirm ??
                                  '',
                              style: const TextStyle(
                                  fontSize: 26, fontWeight: FontWeight.bold),
                            )))
                  ])))))
    ]);
  }

  catsubBrand(String brandsearch) async {
    String token = await Prefs.token;
    String jsonRequestBody;
    http.Response response;
    // Map<String, String> headers = {
    //   "Content-type": "application/json",
    //   "TokenNo": CLIENTTOKEN
    // };
    var prefs = await SharedPreferences.getInstance();
    String? tokenNos = prefs.getString("TokenNo");
    String NEWTOKEN = tokenNos ?? "";
    Map<String, String> headers = {
      "Content-type": "application/json",
      "TokenNo": NEWTOKEN
      //  TOKEN
    };
    loadingController.setLoading(true);
    if (optionsController.outlet == '41' || optionsController.outlet == '202') {
      jsonRequestBody =
          '    {"SHOP_ID":"${await Prefs.shopId}","CUSTOMER_ID":"${await Prefs.customerID}","brandsearch":"$brandsearch"}';
    } else {
      jsonRequestBody =
          '    {"SHOP_ID":"334","CUSTOMER_ID":"${await Prefs.customerID}","brandsearch":"$brandsearch"}';
    }
    print(FETCH_CAT_SUB_BRAND_FILTER);
    response = await http.post(Uri.parse(FETCH_CAT_SUB_BRAND_FILTER),
        headers: headers, body: jsonRequestBody);
    print(jsonRequestBody);
    // if(SHOW_DEBUGGING)print("FetchProfileDetailsBody: " + response.body);
    if (response.statusCode == 200) {
      // if (SHOW_DEBUGGING)
      print('Response Delete Found');
      print(json.decode(response.body)['status']);
      var status = json.decode(response.body)['status'];
      var productmodel = ShoppingProductsModel.fromJson(response.body);
      print(productmodel);
      if (status.entries
              .firstWhere((element) => element.key == 'Result')
              .value ==
          1) {
        setState(() {
          shopController.catagory.value = productmodel.status!.items!;
          print(shopController.catagory);
          loadingController.setLoading(false);
        });
      } else {}

      return 'true';
    } else {
      // if (SHOW_DEBUGGING)
      print('FetchLanguageDetailsBlock Called Client Failed');
      print(response.body);
      throw ServerException();
    }
  }

  brandFilter() async {
    print('brandsearch');
    // print('delete');
    String token = await Prefs.token;
    String jsonRequestBody;
    http.Response response;
    // Map<String, String> headers = {
    //   "Content-type": "application/json",
    //   "TokenNo": CLIENTTOKEN
    // };
    var prefs = await SharedPreferences.getInstance();
    String? tokenNos = prefs.getString("TokenNo");
    String NEWTOKEN = tokenNos ?? "";
    Map<String, String> headers = {
      "Content-type": "application/json",
      "TokenNo": NEWTOKEN
      //  TOKEN
    };
    if (optionsController.outlet == '41' || optionsController.outlet == '202') {
      jsonRequestBody =
          '    {"SHOP_ID":"${await Prefs.shopId}","CUSTOMER_ID":"${await Prefs.customerID}"}';
    } else {
      jsonRequestBody =
          '    {"SHOP_ID":"334","CUSTOMER_ID":"${await Prefs.customerID}"}';
    }
    print(FETCH_BRAND_FILTER);
    print(jsonRequestBody);
    response = await http.post(Uri.parse(FETCH_BRAND_FILTER),
        headers: headers, body: jsonRequestBody);
    //print(jsonRequestBody);
    print("FetchProfileDetailsBody: ${response.body}");
    if (response.statusCode == 200) {
      // if (SHOW_DEBUGGING)
      print('Response Delete Found');
      var session = json.decode(response.body)['session'];
      var status = json.decode(response.body)['status'];

      print(session.entries
          .firstWhere((element) => element.key == 'SessionResult')
          .value);

      if (session.entries
              .firstWhere((element) => element.key == 'SessionResult')
              .value ==
          1) {
        setState(() {
          brand = status.entries
              .firstWhere((element) => element.key == 'BRAND')
              .value;
          rating = status.entries
              .firstWhere((element) => element.key == 'CUSTOMERRATING')
              .value;
          price = status.entries
              .firstWhere((element) => element.key == 'PRICE')
              .value;
        });

        print(price);
        print(rating);
        print(brand);
      } else {}

      return 'true';
    } else {
      // if (SHOW_DEBUGGING)
      print('FetchLanguageDetailsBlock Called Client Failed');
      print(response.body);
      throw ServerException();
    }
  }

  productAll(String brandsearch, String ratings, String pricefilter) async {
    String categorysearch = shopController
        .catagory[shopController.catagoryIndex.value].categoryName
        .toString();
    String subcategorysearch = shopController
        .catagory[shopController.catagoryIndex.value]
        .subcategory![shopController.subcatagoryPageIndex.value]
        .subcategoryName
        .toString();

    String token = await Prefs.token;
    String jsonRequestBody;
    http.Response response;
    // Map<String, String> headers = {
    //   "Content-type": "application/json",
    //   "TokenNo": CLIENTTOKEN
    // };
    var prefs = await SharedPreferences.getInstance();
    String? tokenNos = prefs.getString("TokenNo");
    String NEWTOKEN = tokenNos ?? "";
    Map<String, String> headers = {
      "Content-type": "application/json",
      "TokenNo": NEWTOKEN
      //  TOKEN
    };
    if (optionsController.outlet == '41' || optionsController.outlet == '202') {
      jsonRequestBody =
          '    {"SHOP_ID":"${await Prefs.shopId}","CUSTOMER_ID":"${await Prefs.customerID}","categorysearch":"$categorysearch","subcategorysearch":"$subcategorysearch" ,"brandsearch":"$brandsearch","ratings":"$ratings","pricefilter":"$pricefilter","ITEM_TYPE":"A"}';
    } else {
      jsonRequestBody =
          '    {"SHOP_ID":"${await Prefs.shopId}","CUSTOMER_ID":"${await Prefs.customerID}","categorysearch":"$categorysearch","subcategorysearch":"$subcategorysearch" ,"brandsearch":"$brandsearch","ratings":"$ratings","pricefilter":"$pricefilter","ITEM_TYPE":"E"}';
    }
    print(FETCH_PRODUCT_ALL);
    response = await http.post(Uri.parse(FETCH_PRODUCT_ALL),
        headers: headers, body: jsonRequestBody);
    print("Request found$jsonRequestBody");

    // if(SHOW_DEBUGGING)print("FetchProfileDetailsBody: " + response.body);
    if (response.statusCode == 200) {
      // if (SHOW_DEBUGGING)
      print('Response Delete Found');
      print('Response:\n${response.body}');
      print(json.decode(response.body)['status']);
      var status = json.decode(response.body)['status'];
      var productmodel = ShoppingProductsModel.fromJson(response.body);

      if (status.entries
              .firstWhere((element) => element.key == 'Result')
              .value ==
          1) {
        shopController.catagory.value = productmodel.status!.items!;
        shopController.setCatagoryIndex(0);
        shopController.setSubCatagoryPageIndex(0);
        print(shopController.catagory);

        // viewController.setView(LOGIN);
      } else {}
      return 'true';
    } else {
      // if (SHOW_DEBUGGING)
      print('FetchLanguageDetailsBlock Called Client Failed');
      print(response.body);
      throw ServerException();
    }
  }
}
