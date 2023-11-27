// ignore_for_file: non_constant_identifier_names, unused_local_variable, avoid_print
import 'dart:convert';
import 'dart:io';
import 'package:customer_assist/home/presentation/controllers/guest_fetchCountry_controller.dart';
import 'package:customer_assist/home/presentation/controllers/owner_data_controller.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'core/app_constants.dart';
import 'database/database.dart' as db;
import 'home/presentation/controllers/language_controller.dart';
import 'home/presentation/pages/static_page_tab.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:http/http.dart' as http;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Get the device information
  final deviceInfo = DeviceInfoPlugin();
  String udid = "";
  try {
    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      udid = androidInfo.androidId;
    } else if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      udid = iosInfo.identifierForVendor;
    }
  } catch (e) {
    print('Error getting UDID: $e');
  }

  // Set preferred orientations
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // print('UDID: $udid');
  var pref = await SharedPreferences.getInstance();

  String UDIDS = udid;
  await pref.setString("udid", UDIDS);

  String? storedUDID = pref.getString("udid");
  print("Stored udid : $storedUDID");
  
  // Call the function to send the request and store the token
  await sendRequestAndStoreToken();

  await db.initDb();

  
  var GuestCountryController = Get.put(GuestFetchCountryController());
  var addressController = Get.put(AddressController());
 var languageController = Get.put(LanguageController());
 await languageController.languagefetch();
  GuestCountryController.guestFetchCountryLogin();
  addressController.fetchVertical(languageController.languagenum.toString());

  print(languageController.languageResponse);

  await db.getImageList();

  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Material(
      child: Container(
        color: Colors.green,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              details.exceptionAsString(),
            )
          ],
        ),
      ),
    );
  };
  runApp(const MyApp());
}

Future<void> sendRequestAndStoreToken() async {
  // Define the API endpoint URL
  final url = Uri.parse(
      "https://www.retailresonance.com/retailresonancev2/api/updateversion");

  // Define the request headers
  final headers = {
    "Content-type": "application/json",
    "TokenNo": CLIENTTOKENS
    //  TOKENS // Replace with your actual client token
  };
  var pref = await SharedPreferences.getInstance();
  var UDID = pref.get("udid");
  // Define the request body
  final requestBody = {
    "udid": "$UDID",
    "Bundle_identifier": "com.retailresonance.customerAssist",
    "Versionno_Xcode": "0.0.7",
    "Buildno_Xcode": "2",
    "Applicationname_appStore": "RetailResonance-Customer",
    "Versionno_appstore": "1.0.3",
    "Buildno_appstore": "1",
    "Support_URL":
        "https://www.retailresonance.com/retailresonancemerchant/support.html",
    "Marketing_URL": "https://www.confluence-singapore.com/",
    "Copyright_appstore":
        "© - Copyright - Retail Resonance Pvt., Ltd. - All Rights Reserved",
    "SKU": "com.retailresonance.customerAssist",
  };

  // Make the POST request
  final response = await http.post(
    url,
    headers: headers,
    body: json.encode(requestBody),
  );
  print(requestBody);
  print(response.body);
  // Check if the request was successful (status code 200)
  if (response.statusCode == 200) {
    // Parse the JSON response
    final jsonResponse = json.decode(response.body);

    // Extract the "TokenNo" from the response
    final tokenNo = jsonResponse["status"]["TokenNo"];

    // Store the "TokenNo" in shared preferences
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString("TokenNo", tokenNo);
    print("TokenNo stored in SharedPreferences: $tokenNo");

    // You can now access the stored "TokenNo" in your Flutter app using prefs.getString("TokenNo")
    prefs = await SharedPreferences.getInstance();
    String? tokenNos = prefs.getString("TokenNo");
    print("TokenNo retrived from SharedPreferences: $tokenNos");
  } else {
    // Handle the case when the request fails
    print("Request failed with status code: ${response.statusCode}");
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        routes: {
          '/': (context) => const StaticPageTab(),
          // '/home': (context) => const HomePage(),
        },
        debugShowCheckedModeBanner: false,
        builder: (context, widget) {
          return Overlay(
            initialEntries: [
              OverlayEntry(builder: (context) {
                return ResponsiveWrapper.builder(
                  widget!,
                  maxWidth: 1200,
                  minWidth: 480,
                  defaultScale: true,
                  breakpoints: [
                    const ResponsiveBreakpoint.resize(480, name: MOBILE),
                    const ResponsiveBreakpoint.autoScale(800, name: TABLET),
                    const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
                    const ResponsiveBreakpoint.autoScale(2460, name: '4K'),
                  ],
                  background: Container(color: const Color(0xFFF5F5F5)),
                );
              })
            ],
          );
        },
        initialRoute: "/",
      );
    });
  }
}
