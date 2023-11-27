import 'dart:convert';

import 'package:customer_assist/core/app_constants.dart';
import 'package:customer_assist/core/helpers/SharedPreference/prefs.dart';
import 'package:customer_assist/home/data/shopcoupon/models/shopping_products_model/res_category.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/controllers/shop_controller.dart';
import 'package:customer_assist/home/presentation/controllers/view_controller.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/store/free_flow_shopping.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/store/shopping_list_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import '../../../core/app_urls.dart';
import '../../../database/database.dart';
import '../../data/orders/models/pending_order_models/item.dart';
import '../../data/orders/models/whish_list_model/item.dart';
import '../../data/shopcoupon/models/addons.dart/additem.dart';
import '../../data/shopcoupon/models/shopping_products_model/sub_category_items.dart';
import 'header_controller.dart';
import 'keyboard_controller.dart';
import 'options_controller.dart';

class AddCartReviewController extends GetxController {
  var viewController = Get.put(ViewController());
  var optionsController = Get.put(OptionsController());
  var headerController = Get.put(HeaderController());
  var keyboardController = Get.put(KeyboardController());
  var shopController = Get.put(ShopController());
  var languageController = Get.put(LanguageController());

  final _cartReview = <SubCategoryItems>[].obs;
  final _cartReviewfinal = <ResSubCategoryItems>[].obs;

  List<SubCategoryItems> get cartReview => _cartReview;
  final _shoppingList = [].obs;
  List get shoppingList => _shoppingList;
  var quantity = 0.obs;

  final _orderItemTable = <OrderedItemTable>[].obs;
  List<OrderedItemTable> get orderItemTable => _orderItemTable;
 var myOrderEditResponse = <orderitems>[].obs;
  final _cartWish = <WhishItems>[].obs;
  final _cartAddons = <AddOns>[].obs;
  final _cartshop = <cataloguefetch>[].obs;
  final _cartshopatstore = <cataloguedetails>[].obs;
  final _cartPending = <Items>[].obs;
  final _cartOldorders = <orderitems>[].obs;
  var tableLength = <dynamic>[].obs;
  var tablevalue = <dynamic>[].obs;
  var tableValue = 0.obs;
  var tabletotalvalue = 0.obs;
  int discount = 0;
  double taxes = 0;
  double total = 0;
  var selectedListCart = [].obs;
  var selectedList = [].obs;
  var orderitemsbyid = <orderitems>[].obs;

  //Cart View //
  Future<void> addToCartReview(SubCategoryItems page,TextEditingController textcontroller) async {
    var contains =
        _cartReview.where((element) => element.productCode == page.productCode);
    if (contains.isEmpty) {
      _cartReview.add(page);
      var totalTaxCount = (page.tax1! +
          page.tax2! +
          page.tax3! +
          page.tax4! +
          page.tax5! +
          page.tax6!);
      var totalAmount = (page.productRate * 
      ((textcontroller.text == '1') || textcontroller.text == ''
      ? 1
      : int.parse(textcontroller.text)));
      var addCartLocal = OrderedItemTable(
          ITEMS_ID: page.productCode,
          PRODUCT_CODE: page.productCode,
          QUANTITY: 
          textcontroller.text == '1' || textcontroller.text == ''
                  ? '1'
                  : textcontroller.text,
          PRICE: page.productRate.toString(),
          TAX: totalTaxCount,
          DISCOUNT: page.discountValue!,
          TOTAL: totalAmount,
          IMAGE_URL: page.imageUrl,
          CUSTOMER_ID: await Prefs.customerID,
          ITEM_NAME: page.productName!);

      orderItemTable.add(addCartLocal);

      final db = await initDb();
      Batch batch = db.batch();

      batch.insert(
        'ordered_items',
        addCartLocal.toMap(),
      );

      await batch.commit(noResult: true, continueOnError: true);

      await getReviewCartItems(false);
    } else {
      var fetchDetails =
          await getParticular('ordered_items', page.productCode!);

      updateOrderedItems([
        int.parse(fetchDetails[0]['QUANTITY']) + 1,
        (page.productRate * (int.parse(fetchDetails[0]['QUANTITY']) + 1)),
        page.productCode
      ]);
      await getReviewCartItems(false);

      print("Data::::${await getReviewCartItems(false)}");
    }
  }

// added by sofiya
  Future<void> addToCartReviewfinalwithSubCategoryItemsandListofQtyControllers(
      SubCategoryItems page, TextEditingController textcontroller) async {
    var contains =
        _cartReview.where((element) => element.productCode == page.productCode);
    if (contains.isEmpty) {
      _cartReview.add(page);
      var totalTaxCount = (page.tax1! +
          page.tax2! +
          page.tax3! +
          page.tax4! +
          page.tax5! +
          page.tax6!);
      var totalAmount = (page.productRate *
          ((textcontroller.text == 'QTY') || textcontroller.text == ''
              ? 1
              : int.parse(textcontroller.text)));

      var addCartLocal = OrderedItemTable(
          ITEMS_ID: page.productCode,
          PRODUCT_CODE: page.productCode,
          QUANTITY: textcontroller.text == 'QTY' || textcontroller.text == ''
              ? '1'
              : textcontroller.text,
          PRICE: page.productRate.toString(),
          TAX: totalTaxCount,
          DISCOUNT: page.discountValue!,
          TOTAL: totalAmount,
          IMAGE_URL: page.imageUrl,
          CUSTOMER_ID: await Prefs.customerID,
          ITEM_NAME: page.productName!);

      orderItemTable.add(addCartLocal);

      final db = await initDb();
      Batch batch = db.batch();

      batch.insert(
        'ordered_items',
        addCartLocal.toMap(),
      );

      await batch.commit(noResult: true, continueOnError: true);

      await getReviewCartItems(false);
    } else {
      var fetchDetails =
          await getParticular('ordered_items', page.productCode!);

      updateOrderedItems([
        int.parse(fetchDetails[0]['QUANTITY']) + int.parse(textcontroller.text),
        (page.productRate *
            (int.parse(fetchDetails[0]['QUANTITY']) +
                int.parse(textcontroller.text))),
        page.productCode
      ]);
      await getReviewCartItems(false);

      print("Data::::${await getReviewCartItems(false)}");
    }
  }

//addedbysofiya
  Future<void> addToCartReviewfinal(
      ResSubCategoryItems page, TextEditingController textcontroller) async {
    var contains = _cartReviewfinal
        .where((element) => element.productCode == page.productCode!);
    if (contains.isEmpty) {
      _cartReviewfinal.add(page);
      var totalTaxCount = (page.tax1! +
          page.tax2! +
          page.tax3! +
          page.tax4! +
          page.tax5! +
          page.tax6!);
      var totalAmount = (page.productRate *
          ((textcontroller.text == '1') || textcontroller.text == ''
              ? 1
              : int.parse(textcontroller.text)));

      var addCartLocal = OrderedItemTable(
          ITEMS_ID: page.productCode,
          PRODUCT_CODE: page.productCode,
          QUANTITY:

              //added by saha
              textcontroller.text == '1' || textcontroller.text == ''
                  ? '1'
                  : textcontroller.text,
          PRICE: page.productRate.toString(),
          TAX: totalTaxCount,
          DISCOUNT: page.discountValue,
          TOTAL: totalAmount,
          IMAGE_URL: page.imageUrl.toString(),
          CUSTOMER_ID: await Prefs.customerID,
          ITEM_NAME: page.productName);
      print(page.productRate);
      print(page.productName);
      print(totalAmount);
      // print();

      orderItemTable.add(addCartLocal);

      final db = await initDb();
      Batch batch = db.batch();

      batch.insert(
        'ordered_items',
        addCartLocal.toMap(),
      );

      await batch.commit(noResult: true, continueOnError: true);

      await getReviewCartItems(false);
    } else {
      var fetchDetails =
          await getParticular('ordered_items', page.productCode!);

      updateOrderedItems([
        int.parse(fetchDetails[0]['QUANTITY']) + int.parse(textcontroller.text),
        (page.productRate! *
            (int.parse(fetchDetails[0]['QUANTITY']) +
                int.parse(textcontroller.text))),
        page.productCode!
      ]);
      await getReviewCartItems(false);

      print("Data::::${await getReviewCartItems(false)}");
    }
  }

  Future<int> deleteOrderedItem(List values) async {
    Database db = await initDb();
    int id = await db.rawDelete(
      'DELETE FROM ordered_items WHERE ITEMS_ID = ? ',
      values,
    );
    _cartReview.removeWhere((item) => item.productCode! == values[0]);
    getReviewCartItems(false);
    print(id);
    return id;
  }

  Future<List<dynamic>> getReviewCartItems(bool value) async {
    tabletotalvalue.value = 0;

    tableLength.value = await getDbValues('ordered_items');

    tableValue.value = tableLength.value.length;
    if (value) {
      viewController.setView(REVIEWPAGE);
    }
    discount = 0;
    taxes = 0;
    total = 0;
    for (var element in tableLength.value) {
      discount = discount + int.parse(element['DISCOUNT']);
      taxes = taxes + double.parse(element['TAX']);
      total = total + double.parse(element['TOTAL']);
      tabletotalvalue = tabletotalvalue + int.parse(element['QUANTITY']);
    }
    return tableLength.value;
  }

//ShoppingList //
  Future<void> addToShoppingList(SubCategoryItems page) async {
    var contains = _shoppingList
        .where((element) => element['Product_Selected'] == page.productCode);
    if (contains.isEmpty) {
      _shoppingList
          .add({'Product_Selected': '${page.productCode}', 'product_qty': '1'});
      shopController.shoppingUpdate(
          _shoppingList, languageController.languagenum.toString());
    } else {
      _shoppingList.remove(page);
    }
  }

//ADDONS
  Future<void> addToCartAddons(AddOns page, ResSubCategoryItems items) async {
    var contains =
        _cartAddons.where((element) => element.aDDONCODE == page.aDDONCODE);

    _cartReviewfinal
        .where((element) => element.productCode == items.productCode);

    print(_cartAddons);
    if (contains.isEmpty) {
      _cartAddons.add(page);
      _cartReviewfinal.add(items);
      var totalTaxCount = (page.aDDONTAX! +
          items.tax1 +
          items.tax2! +
          items.tax3! +
          items.tax4! +
          items.tax5! +
          items.tax6!);

      var totalAmount = (page.aDDONPRICE! + items.productRate * 1);

      var addCartLocal = OrderedItemTable(
        ITEMS_ID: page.aDDONCODE! + items.productCode!,
        PRODUCT_CODE: page.aDDONCODE! + items.productCode!,
        PRICE: (page.aDDONPRICE! + items.productRate!).toString(),
        QUANTITY: '1',
        TAX: totalTaxCount,
        DISCOUNT: 0 + items.discountValue!,
        IMAGE_URL: items.imageUrl!,
        TOTAL: totalAmount,
        CUSTOMER_ID: await Prefs.customerID,
        ITEM_NAME: items.productName! + page.aDDONNAME!,
      );

      orderItemTable.add(addCartLocal);

      print("<><><><><><>$orderItemTable");

      final db = await initDb();
      Batch batch = db.batch();

      batch.insert(
        'ordered_items',
        addCartLocal.toMap(),
      );

      await batch.commit(noResult: true, continueOnError: true);
      List<dynamic> temp = await getDbValues('ordered_items');
      for (var element in temp) {
        print(element);
      }
      print('----------|||$temp');
      await getReviewCartItems(false);
    } else {
      var fetchDetails = await getParticular(
          'ordered_items', page.aDDONCODE! + items.productCode!
          // + items.productCode!
          );

      print(page.aDDONCODE);
      print(fetchDetails[0]['QUANTITY']);
      updateOrderedItems([
        int.parse(fetchDetails[0]['QUANTITY']) + 1,
        (page.aDDONPRICE +
            items.productRate * (int.parse(fetchDetails[0]['QUANTITY']) + 1)),
        page.aDDONCODE, items.productCode
        //items.productCode
      ]);
      await getReviewCartItems(true);

      print("Data::::${await getReviewCartItems(false)}");
    }
  }

  //WISHLIST //
  Future<void> addToCartwish(WhishItems page) async {
    var contains =
        _cartWish.where((element) => element.productCode == page.productCode);
    print(_cartWish);
    if (contains.isEmpty) {
      _cartWish.add(page);
      var totalTaxCount = (page.tax1! +
          page.tax2! +
          page.tax3! +
          page.tax4! +
          page.tax5! +
          page.tax6!);
      var totalAmount = (page.productRate * 1);
      var addCartLocal = OrderedItemTable(
          ITEMS_ID: page.productCode,
          PRODUCT_CODE: page.productCode,
          QUANTITY: '1',
          PRICE: page.productRate.toString(),
          TAX: totalTaxCount,
          DISCOUNT: page.discountValue!,
          TOTAL: totalAmount,
          IMAGE_URL: page.imageUrl,
          CUSTOMER_ID: await Prefs.customerID,
          ITEM_NAME: page.productName!);

      orderItemTable.add(addCartLocal);

      final db = await initDb();
      Batch batch = db.batch();

      batch.insert(
        'ordered_items',
        addCartLocal.toMap(),
      );

      await batch.commit(noResult: true, continueOnError: true);

      await getReviewCartItems(false);
    } else {
      var fetchDetails =
          await getParticular('ordered_items', page.productCode!);
      print(page.productCode);
      print(fetchDetails[0]['QUANTITY']);
      updateOrderedItems([
        int.parse(fetchDetails[0]['QUANTITY']) + 1,
        (page.productRate * (int.parse(fetchDetails[0]['QUANTITY']) + 1)),
        page.productCode
      ]);
      await getReviewCartItems(true);

      print("Data::::${await getReviewCartItems(false)}");
    }
  }

  // PENDING //
  Future<void> addToCarpending(Items page) async {
    var contains =
        _cartPending.where((element) => element.itemCode == page.itemCode);
    print(_cartPending);
    if (contains.isEmpty) {
      _cartPending.add(page);
      var totalTaxCount = (page.tax1! +
          page.tax2! +
          page.tax3! +
          page.tax4! +
          page.tax5! +
          page.tax6!);
      var totalAmount = (page.itemPrice * 1);
      var addCartLocal = OrderedItemTable(
          ITEMS_ID: page.itemCode,
          PRODUCT_CODE: page.itemCode,
          QUANTITY: '1',
          PRICE: page.itemPrice.toString(),
          TAX: totalTaxCount,
          DISCOUNT: page.discountValue!,
          TOTAL: totalAmount,
          IMAGE_URL: page.imageUr1,
          CUSTOMER_ID: await Prefs.customerID,
          ITEM_NAME: page.itemName!);

      orderItemTable.add(addCartLocal);

      final db = await initDb();
      Batch batch = db.batch();

      batch.insert(
        'ordered_items',
        addCartLocal.toMap(),
      );

      await batch.commit(noResult: true, continueOnError: true);

      await getReviewCartItems(false);
    } else {
      var fetchDetails = await getParticular('ordered_items', page.itemCode!);
      print(page.itemCode);
      print(fetchDetails[0]['QUANTITY']);
      updateOrderedItems([
        int.parse(fetchDetails[0]['QUANTITY']) + 1,
        (page.itemPrice! * (int.parse(fetchDetails[0]['QUANTITY']) + 1)),
        page.itemCode
      ]);
      await getReviewCartItems(false);

      print("Data::::${await getReviewCartItems(false)}");
    }
  }

  // shoplist //
  Future<void> addToCartshop(cataloguefetch page) async {
    var contains =
        _cartshop.where((element) => element.productcode == page.productcode);
    print(_cartWish);
    if (contains.isEmpty) {
      _cartshop.add(page);
      var totalTaxCount = (page.tax1! +
          page.tax2! +
          page.tax3! +
          page.tax4! +
          page.tax5! +
          page.tax6!);
      var totalAmount = (page.productRate! * 1);
      var addCartLocal = OrderedItemTable(
          ITEMS_ID: page.productcode,
          PRODUCT_CODE: page.productcode,
          QUANTITY: '1',
          PRICE: page.productRate.toString(),
          TAX: totalTaxCount,
          DISCOUNT: page.discountValue!,
          TOTAL: totalAmount,
          IMAGE_URL: page.imageurl,
          CUSTOMER_ID: await Prefs.customerID,
          ITEM_NAME: page.productname!);

      orderItemTable.add(addCartLocal);

      final db = await initDb();
      Batch batch = db.batch();

      batch.insert(
        'ordered_items',
        addCartLocal.toMap(),
      );

      await batch.commit(noResult: true, continueOnError: true);

      await getReviewCartItems(false);
    } else {
      var fetchDetails =
          await getParticular('ordered_items', page.productcode!);
      print(page.productcode);
      print(fetchDetails[0]['QUANTITY']);
      updateOrderedItems([
        int.parse(fetchDetails[0]['QUANTITY']) + 1,
        (page.productRate! * (int.parse(fetchDetails[0]['QUANTITY']) + 1)),
        page.productcode
      ]);
      await getReviewCartItems(false);

      print("Data::::${await getReviewCartItems(false)}");
    }
  }

  Future<void> addToCartshopatstore(cataloguedetails page) async {
    var contains = _cartshopatstore
        .where((element) => element.productcode == page.productcode);
    print(_cartWish);
    if (contains.isEmpty) {
      _cartshopatstore.add(page);
      var totalTaxCount = (page.tax1! +
          page.tax2! +
          page.tax3! +
          page.tax4! +
          page.tax5! +
          page.tax6!);
      var totalAmount = (page.productRate! * 1);
      var addCartLocal = OrderedItemTable(
          ITEMS_ID: page.productcode,
          PRODUCT_CODE: page.productcode,
          QUANTITY: '1',
          PRICE: page.productRate.toString(),
          TAX: totalTaxCount,
          DISCOUNT: page.discountValue!,
          TOTAL: totalAmount,
          IMAGE_URL: page.imageurl,
          CUSTOMER_ID: await Prefs.customerID,
          ITEM_NAME: page.productname!);

      orderItemTable.add(addCartLocal);

      final db = await initDb();
      Batch batch = db.batch();

      batch.insert(
        'ordered_items',
        addCartLocal.toMap(),
      );

      await batch.commit(noResult: true, continueOnError: true);

      await getReviewCartItems(false);
    } else {
      var fetchDetails =
          await getParticular('ordered_items', page.productcode!);
      print(page.productcode);
      print(fetchDetails[0]['QUANTITY']);
      updateOrderedItems([
        int.parse(fetchDetails[0]['QUANTITY']) + 1,
        (page.productRate! * (int.parse(fetchDetails[0]['QUANTITY']) + 1)),
        page.productcode!
      ]);
      await getReviewCartItems(false);

      print("Data::::${await getReviewCartItems(false)}");
    }
  }

  Future<void> addToCarOldOrders(orderitems page) async {
    var contains =
        _cartOldorders.where((element) => element.Item_code == page.Item_code);
    print(_cartOldorders);
    if (contains.isEmpty) {
      _cartOldorders.add(page);
      var totalTaxCount = (page.TAX1! +
          page.TAX2! +
          page.TAX3! +
          page.TAX4! +
          page.TAX5! +
          page.TAX6!);
      var totalAmount = (page.Item_Price! * 1);
      print("----+++$totalAmount");
      var addCartLocal = OrderedItemTable(
          ITEMS_ID: page.Item_code,
          PRODUCT_CODE: page.Item_code,
          QUANTITY: page.Item_Qty,
          PRICE: page.Item_Price.toString(),
          TAX: totalTaxCount,
          DISCOUNT: page.DISCOUNT_VALUE!,
          TOTAL: totalAmount,
          IMAGE_URL: page.IMAGE_URL,
          CUSTOMER_ID: await Prefs.customerID,
          ITEM_NAME: page.Item_Name!);

      orderItemTable.add(addCartLocal);

      final db = await initDb();
      Batch batch = db.batch();

      batch.insert(
        'ordered_items',
        addCartLocal.toMap(),
      );

      await batch.commit(noResult: true, continueOnError: true);

      await getReviewCartItems(false);
    } else {
      var fetchDetails = await getParticular('ordered_items', page.Item_code!);
      print(page.Item_Price);
      print(double.parse(page.Item_Price!) *
          (int.parse(fetchDetails[0]['QUANTITY'].toString().split(".")[0]) +
              1));
      updateOrderedItems([
        int.parse(fetchDetails[0]['QUANTITY'].toString().split(".")[0]) + 1,
        (double.parse(page.Item_Price!) *
            (int.parse(fetchDetails[0]['QUANTITY'].toString().split(".")[0]) +
                1)),
        page.Item_code
      ]);
      await getReviewCartItems(false);

      print("Data::::${await getReviewCartItems(false)}");
    }
  }

  getData(orderid) async {
    var jsonRequestBody =
        //  '	{ "CUSTOMER_ID":"${await Prefs.customerID}", "SHOP_ID":"${await Prefs.shopId}","ORDER_ID":"$orderid" }';
        '{"CUSTOMER_ID": "${await Prefs.customerID}","SHOP_ID": "${await Prefs.shopId}","ORDER_ID": "$orderid"}';
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

    final response = await http.post(
      Uri.parse(FETCH_MYORDER_item),
      headers: headers,
      body: jsonRequestBody,
    );
    print(' FETCH_MYORDER_item request$jsonRequestBody');
    print('FETCH_MYORDER_item Response${response.body}');
    var jsonData = jsonDecode(response.body);
    print(jsonData['status']['Result']);
    if (jsonData['status']['Result'] == 1) {
      orderitemsbyid.value = (jsonData['status']['Items'] as List<dynamic>)
          .map((d) => orderitems.fromJson(d))
          .toList();
      update();
    } else {}
    print(orderitemsbyid.length);
  }
}

// ignore: camel_case_types
class orderitems {
  dynamic TAX2;
  dynamic TAX1;
  String? SOLD_BY;
  String? Item_Qty;
  double? PRODUCT_MRP;
  int? AVAILABLE_STOCK_QUANTY;
  int? DISCOUNT_VALUE;
  dynamic TAX6;
  String? MANUFACTURER_NAME;
  dynamic TAX5;
  String? DISCOUNT_TYPE;
  dynamic TAX4;
  dynamic TAX3;
  String? UOM;
  String? Item_code;
  String? IS_OFFER_ITEM;
  String? Item_Name;
  String? BRAND_NAME;
  String? Item_Price;
  String? WEIGHT_BY;
  String? IMAGE_URL;
  double? IS_FAVORITE_ITEM;
  String? COMMON_ITEM;

  orderitems({
    this.TAX2,
    this.TAX1,
    this.SOLD_BY,
    this.Item_Qty,
    this.PRODUCT_MRP,
    this.AVAILABLE_STOCK_QUANTY,
    this.DISCOUNT_VALUE,
    this.TAX6,
    this.MANUFACTURER_NAME,
    this.TAX5,
    this.DISCOUNT_TYPE,
    this.TAX4,
    this.TAX3,
    this.UOM,
    this.Item_code,
    this.IS_OFFER_ITEM,
    this.Item_Name,
    this.BRAND_NAME,
    this.Item_Price,
    this.WEIGHT_BY,
    this.IMAGE_URL,
    this.IS_FAVORITE_ITEM,
    this.COMMON_ITEM,
  });

  factory orderitems.fromJson(Map<String, dynamic> json) {
    return orderitems(
      TAX2: double.parse(json['TAX2'].toString()),
      TAX1: double.parse(json['TAX1'].toString()),
      SOLD_BY: json['SOLD_BY'],
      Item_Qty: json['Item_Qty'],
      PRODUCT_MRP: json['PRODUCT_MRP'],
      AVAILABLE_STOCK_QUANTY: json['AVAILABLE_STOCK_QUANTY'],
      DISCOUNT_VALUE: json['DISCOUNT_VALUE'],
      TAX6: double.parse(json['TAX6'].toString()),
      MANUFACTURER_NAME: json['MANUFACTURER_NAME'],
      TAX5: double.parse(json['TAX5'].toString()),
      DISCOUNT_TYPE: json['DISCOUNT_TYPE'],
      TAX4: double.parse(json['TAX4'].toString()),
      TAX3: double.parse(json['TAX3'].toString()),
      UOM: json['UOM'],
      Item_code: json['Item_code'],
      IS_OFFER_ITEM: json['IS_OFFER_ITEM'],
      Item_Name: json['Item_Name'],
      BRAND_NAME: json['BRAND_NAME'],
      Item_Price: json['Item_Price'],
      WEIGHT_BY: json['WEIGHT_BY'],
      IMAGE_URL: json['IMAGE_URL'],
      IS_FAVORITE_ITEM: double.parse(json['IS_FAVORITE_ITEM'].toString()),
      COMMON_ITEM: json['COMMON_ITEM'],
    );
  }
}
