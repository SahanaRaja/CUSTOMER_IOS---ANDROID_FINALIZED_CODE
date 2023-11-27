import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:customer_assist/core/app_constants.dart';
import 'package:customer_assist/core/app_urls.dart';
import 'package:customer_assist/home/presentation/controllers/configure_controller.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/helpers/SharedPreference/prefs.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../database/database.dart';
import '../../controllers/header_controller.dart';
import '../../controllers/options_controller.dart';
import '../../controllers/view_controller.dart';
import 'package:http/http.dart' as http;

class Userdelete extends StatefulWidget {
  final String content;
  final String heading;

  const Userdelete({
    Key? key,
    required this.content,
    required this.heading,
  }) : super(key: key);
  @override
  _UserDeletePage createState() => _UserDeletePage();
}

class _UserDeletePage extends State<Userdelete> {
  ViewController viewController = Get.find();
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
    SizeConfig().init(context);
    return Container(
      margin: const EdgeInsets.only(top: 50),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
        // color: Colors.red,
        color: Colors.white,
      ),
      height:
          (actualHeight - MediaQuery.of(context).padding.bottom) / 17.9 * 4.7,
      // 4.7
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
                widget.heading == 'USERDELETE'
                    ? getHeaderLogo('Alert White BG')
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
              padding: const EdgeInsets.only(top: 18.0),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  color: Colors.white,
                  height: 300,
                  width: 400,
                  child: Center(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        AutoSizeText(
                          widget.content,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[600],
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                var value = customeDlete(
                                    context, viewController, optionsController);
                                print(value);
                                if (value.toString().contains('false')) {
                                  print('login delete');
                                  viewController.setView(LOGIN);
                                  viewController.setView(ERROR);
                                  viewController
                                      .setErrorMessage('Please login first');
                                } else {
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
                        // const SizedBox(
                        //   height: 20,
                        // ),
                        // (viewController.viewKey.value != CAUTIONDELETE)
                        //     ? AutoSizeText(
                        //         languageController.languageResponse.value
                        //                 .quitConformation ??
                        //             '',
                        //         style: TextStyle(
                        //           fontSize: 18,
                        //           color: Colors.grey[600],
                        //         ),
                        //         textAlign: TextAlign.center,
                        //       )
                        //     : Container(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
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

customeDlete(BuildContext context, ViewController viewController,
    OptionsController optionsController) async {
  print("delete start");
  SharedPreferences pref = await SharedPreferences.getInstance();
  String? email = pref.getString('Email');
  if (email == null) {
    print(email);
    print("email is null");
    // Navigator.pop(context);
    return 'false';
  }
  print(email);
  print('delete');
  // String token = await Prefs.token;
  String jsonRequestBody;
  http.Response response;
  // Map<String, String> headers = {
  //   "Content-type": "application/json",
  //   "TokenNo": TOKEN
  // };
  var prefs = await SharedPreferences.getInstance();
  String? tokenNos = prefs.getString("TokenNo");
  String NEWTOKEN = tokenNos ?? "";
  Map<String, String> headers = {
    "Content-type": "application/json",
    "TokenNo": NEWTOKEN
    //  TOKEN
  };
  jsonRequestBody = '	{"EMAIL":"$email"}';
  print(CustomerDelete);
  response = await http.post(Uri.parse(CustomerDelete),
      headers: headers, body: jsonRequestBody);
  print(jsonRequestBody);
  // if(SHOW_DEBUGGING)print("FetchProfileDetailsBody: " + response.body);
  if (response.statusCode == 200) {
    // if (SHOW_DEBUGGING)
    print('Response Delete Found');
    print(json.decode(response.body)['status']);
    var status = json.decode(response.body)['status'];
    print(status);
    if (status.entries.firstWhere((element) => element.key == 'Result').value ==
        1) {
      optionsController.setSetState();
      Prefs.setSuperUserLoggedIn(false);
      Prefs.setSuperUserEmailId('');
      viewController.setView(INFO);
      viewController.setInfoMessage('Your User Account Successfully Deleted');

      optionsController.getclientLogout();
      // viewController.setView(LOGIN);
    } else {
      print("user not found");
      optionsController.setOptionView('1');
      viewController.setView(ERROR);
      viewController.setErrorMessage('User Account not exist');
    }

    // if (SHOW_DEBUGGING)
    // var test = LanguageResponseModel.fromJson(json.decode(status['ARB']));
    //print(test);
    //print(test.runtimeType);
    return 'true';
  } else {
    // if (SHOW_DEBUGGING)
    print('FetchLanguageDetailsBlock Called Client Failed');
    print(response.body);
    throw ServerException();
  }
}
