// ignore_for_file: avoid_function_literals_in_foreach_calls, avoid_print, prefer_is_empty, must_be_immutable, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:equatable/equatable.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> initDb() async {
  // var databasesPath = await getDatabasesPath();
  // String path = join(databasesPath, 'demo.db');
  final database = openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    join(await getDatabasesPath(), 'customer_assist.db'),
    // When the database is first created, create a table to store dogs.
    onCreate: (db, version) => _createDb(db),
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
  );
  return database;
}

void _createDb(Database db) {
  db.execute(
    'CREATE TABLE pos_user_details(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, UD_DEVICE_ID TEXT, UD_USER_PASSWORD TEXT, UD_EMAIL_ID TEXT NOT NULL UNIQUE, UD_USER_ASSIGNED_TYPE TEXT, UD_USER_TYPE TEXT, UD_VERTICAL_ID TEXT, UD_USER_CODE INTEGER, UD_USER_NAME TEXT, UD_COUNTRY_NAME TEXT, UD_CREATED_DATE TEXT, UD_DOB TEXT, UD_FIRST_NAME TEXT, UD_FLAG_STATUS INTEGER, UD_IMAGE_PATH TEXT, UD_LAST_NAME TEXT, UD_MOBILE_NO TEXT, UD_SHOP_ID TEXT, UD_STATE_NAME TEXT, UD_TITLE TEXT,UD_ACCESS_TYPE_ID INTEGER,UD_ADDRESS1 TEXT,UD_ADDRESS2 TEXT,UD_ZIP_CODE TEXT)',
  );
  db.execute(
    'CREATE TABLE assets(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, BM_BASE64_ID TEXT NOT NULL UNIQUE, BM_FLAG_STATUS TEXT, BM_ICON_NAME TEXT, BM_BASE64_IMAGE_STRING TEXT)',
  );

  db.execute(
      'CREATE TABLE ordered_items(ITEMS_ID INTEGER NOT NULL,PRODUCT_CODE TEXT NOT NULL,QUANTITY TEXT NOT NULL,PRICE TEXT NOT NULL,TAX TEXT NOT NULL,DISCOUNT TEXT NOT NULL, TOTAL TEXT NOT NULL, IMAGE_URL TEXT NOT NULL, CUSTOMER_ID TEXT NOT NULL,ITEM_NAME TEXT NOT NULL)');
}

Future<Map> getImage(String id) async {
  Database db = await initDb();
  List<String> columnsToSelect = [
    'BM_BASE64_ID',
    'BM_ICON_NAME',
    'BM_BASE64_IMAGE_STRING',
  ];
  String whereString = 'BM_BASE64_ID = ?';
  List<dynamic> whereArguments = [id];
  List<Map> result = await db.query('assets',
      columns: columnsToSelect, where: whereString, whereArgs: whereArguments);
  return result[0];
}

Future<List<Map>> getUserList() async {
  Database db = await initDb();

  List<String> columnsToSelect = [
    'UD_EMAIL_ID',
    'UD_USER_PASSWORD',
  ];
  List<Map> result =
      await db.query('pos_user_details', columns: columnsToSelect);
  print(result);
  for (var element in result) {
    print(element);
  }
  return result;
}

Future<bool> checkLocalLogin(String username, String password) async {
  Database db = await initDb();
  List<Map> result = await db.rawQuery(
      'SELECT * FROM pos_user_details WHERE UD_EMAIL_ID=? AND UD_USER_PASSWORD=?',
      [username, password]);
  if (result.length > 0) {
    return true;
  } else {
    return false;
  }
}

Future<List<dynamic>> getDbValues(String tableName) async {
  Database db = await initDb();
  List<Map> result = await db.rawQuery('SELECT * FROM $tableName');
  return result;
}

Future<List<dynamic>> getParticular(String tableName, String ItemID) async {
  Database db = await initDb();
  List<Map> result =
      await db.rawQuery('SELECT * FROM $tableName WHERE ITEMS_ID = "$ItemID"');
  return result;
}
//Employee Log

Future<List<dynamic>> getGroupImages(List<String> ids) async {
  Database db = await initDb();
  List<Map> result = await db.rawQuery(
      'SELECT DISTINCT BM_BASE64_IMAGE_STRING,BM_ICON_NAME,BM_BASE64_ID FROM assets WHERE BM_BASE64_ID in (${ids.join(',')})');

  List<Map> rearranged = [];
  ids.forEach((element) {
    result.forEach((dbElement) {
      if (dbElement['BM_BASE64_ID'] == element) {
        rearranged.add(dbElement);
      }
    });
  });
  print(rearranged);
  return rearranged;
}

Future<void> getImageList() async {
  Database db = await initDb();
  List<String> columnsToSelect = [
    'BM_BASE64_ID',
    'BM_ICON_NAME',
    
  ];
  List<Map> result = await db.query('assets', columns: columnsToSelect);
  result.forEach((element) {
    print(element);
  });
}

Future<String> getSingleImage(String iconName) async {
  Database db = await initDb();
  List<Map<String, dynamic>> result =
      await db.rawQuery('SELECT * FROM assets WHERE BM_ICON_NAME="$iconName"');
  print(result[0]['BM_BASE64_IMAGE_STRING']);
  return result[0]['BM_BASE64_IMAGE_STRING'];
}

//Add Items to Order
Future<int> addItemToOrder(List<String> values) async {
  Database db = await initDb();
  // if (SHOW_DEBUGGING)
  print(values);
  Future<int> id = db.rawInsert(
    'INSERT INTO ordered_items(PRODUCT_CODE,ITEMS_ID,QUANTITY,PRICE,TAX,DISCOUNT,TOTAL,IMAGE_URL,CUSTOMER_ID,ITEM_NAME) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
    values,
  );
  print("Added ");

  // getDbValues('ordered_items');
  // getOrderedItemList(await Prefs.customerID);
  print(id);
  return id;
}

Future<int> updateOrderedItems(List values) async {
  Database db = await initDb();
  int id = await db.rawUpdate(
    '''UPDATE ordered_items
      SET  QUANTITY = ?, TOTAL = ?
      WHERE ITEMS_ID = ?  
      ''',
    values,
  );
  return id;
}

Future<List<OrderedItemTable>> getOrderedItemList(String customerId) async {
  List<OrderedItemTable> localData = [];
  Database db = await initDb();
  List<Map> result = await db.query('ordered_items');
  result.forEach((e) {
    localData.add(
      OrderedItemTable(
          PRODUCT_CODE: e['PRODUCT_CODE'],
          ITEMS_ID: e['ITEMS_ID'],
          QUANTITY: e['QUANTITY'],
          PRICE: e['PRICE'],
          TAX: e['TAX'],
          DISCOUNT: e['DISCOUNT'],
          TOTAL: e['TOTAL'],
          IMAGE_URL: e['IMAGE_URL'],
          CUSTOMER_ID: e['CUSTOMER_ID'],
          ITEM_NAME: e['ITEM_NAME']),
    );
  });
  localData.forEach((e) {
    // if (SHOW_DEBUGGING)
    print(
        'Order $customerId    ${e.PRODUCT_CODE}     ${e.ITEMS_ID}    ${e.QUANTITY}     ${e.PRICE}   ${e.TAX}   ${e.DISCOUNT}   ${e.ITEM_NAME}    ${e.IMAGE_URL}   ');
  });
  return localData;
}

class OrderedItemTable extends Equatable {
 
  final String? ITEMS_ID;
  final String? PRODUCT_CODE;
   //added by saha
  var  QUANTITY;
  //final String? QUANTITY;
  final String? PRICE;
  final String? ITEMS;
  final String? PRODUCTCODE;
  final String? ITEMNAME;
   
  final dynamic TAX;
  final int? DISCOUNT;
  var TOTAL;
  final String? IMAGE_URL;
  final String? CUSTOMER_ID;
  final String? ITEM_NAME;

  OrderedItemTable(
      {this.ITEMS_ID,
      this.PRODUCT_CODE,
      this.QUANTITY,
      this.PRICE,
      this.TAX,
      this.DISCOUNT,
      this.TOTAL,
      this.IMAGE_URL,
      this.CUSTOMER_ID,
      this.ITEM_NAME,
      this.ITEMNAME,
      this.ITEMS,
      this.PRODUCTCODE
      });

  Map<String, dynamic> toMap() {
    return {
      'ITEMS_ID': ITEMS_ID,
      'PRODUCT_CODE': PRODUCT_CODE,
      'QUANTITY': QUANTITY,
      'PRICE': PRICE,
      'TAX': TAX,
      'DISCOUNT': DISCOUNT,
      'TOTAL': TOTAL,
      'IMAGE_URL': IMAGE_URL,
      'CUSTOMER_ID': CUSTOMER_ID,
      'ITEM_NAME': ITEM_NAME,
      
    };
  }

  @override
  List<Object?> get props => [
        ITEMS_ID,
        PRODUCT_CODE,
        QUANTITY,
        PRICE,
        TAX,
        DISCOUNT,
        TOTAL,
        IMAGE_URL,
        CUSTOMER_ID,
        ITEM_NAME
      ];
}
