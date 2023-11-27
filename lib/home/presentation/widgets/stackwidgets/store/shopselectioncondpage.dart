import 'dart:developer';

import 'package:customer_assist/core/app_colors.dart';
import 'package:customer_assist/core/app_constants.dart';
import 'package:customer_assist/home/presentation/controllers/keyboard_controller.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/sub_header.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class Shopselectioncond extends StatefulWidget {
  final double actualHeight;
  const Shopselectioncond({Key? key, required this.actualHeight})
      : super(key: key);

  @override
  _ShopselectioncondState createState() => _ShopselectioncondState();
}

class _ShopselectioncondState extends State<Shopselectioncond> {
  double actualHeight = 0;
  int billGroupValue = -1;
  List<TextEditingController> guastcount =
      List.generate(2, (index) => TextEditingController());
  List<TextEditingController> billcount =
      List.generate(2, (index) => TextEditingController());

  List<TextEditingController> mobilenumbercontroller =
      List.generate(10, (index) => TextEditingController());
  List<dynamic> mobnumcntrllst = [];
  List<dynamic> mobnumcntrllstfocus = [];

  final no_of_guast = TextEditingController();
  final no_of_bills = TextEditingController();

  final pinController = TextEditingController();

  List<FocusNode> focusNodecount = List.generate(2, (index) => FocusNode());
  List<FocusNode> focusNodebillcount = List.generate(2, (index) => FocusNode());

  List<FocusNode> focusNode = List.generate(10, (index) => FocusNode());
  final List<bool> _isFocused = List.generate(10, (index) => false);
  final List<bool> _isFocusedcount = List.generate(2, (index) => false);
  final List<bool> _isFocusedbillcount = List.generate(2, (index) => false);

  KeyboardController keyboardController = Get.find();
  LanguageController languageController = Get.find();

  var defaultPinTheme;

  @override
  void initState() {
    //languageController.languagefetch();
    // Get.put(AssetsDownloadController());
    keyboardController.moblistcontrls.clear();
    keyboardController.listofguestmobile.value = '1';
    actualHeight = widget.actualHeight;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    actualHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    pinController.setText('1222');

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    defaultPinTheme = PinTheme(
      margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 10),
      height: boxHeight() - 15.0,
      width: 30.0,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(color: Colors.blue, width: 2.0)),
    );
    // for (int i = 0; i < focusNode.length; i++) {
    //   focusNode[i].addListener(() {
    //     setState(() {
    //       if (focusNode[i].hasFocus) {
    //         _isFocused[i] = true;
    //       } else {
    //         _isFocused[i] = false;
    //       }
    //     });
    //   });
    // }

    // for (int i = 0; i < focusNodebillcount.length; i++) {
    //   focusNodebillcount[i].addListener(() {
    //     setState(() {
    //       if (focusNodebillcount[i].hasFocus) {
    //         _isFocusedbillcount[i] = true;
    //       } else {
    //         _isFocusedbillcount[i] = false;
    //       }
    //     });
    //   });
    // }

    // for (int i = 0; i < focusNode.length; i++) {
    //   focusNode[i].addListener(() {
    //     setState(() {
    //       if (focusNode[i].hasFocus) {
    //         _isFocusedbillcount[i] = true;
    //       } else {
    //         _isFocusedbillcount[i] = false;
    //       }
    //     });
    //   });
    // }

    // for (var focuslist in mobnumcntrllstfocus) {

    //   for (var focus in focuslist) {
    //     int i = 0;
    //     focus.addListener(() {
    //       setState(() {
    //         if (focus.hasFocus) {
    //           _isFocused[i] = true;
    //         } else {
    //           _isFocused[i] = false;
    //         }
    //       });
    //     });
    //     i += 1;
    //   }
    // }
    //   return layoutWithoutHomeButton(context);
    // }

    // layoutWithoutHomeButton(BuildContext context) {
    //   return Scaffold(
    //       resizeToAvoidBottomInset: true,
    //       body:

    return Container(
      child: SizedBox(
        // height: GetPlatform.isAndroid
        //     ? (actualHeight - 40) * 0.7
        //     : actualHeight - MediaQuery.of(context).padding.bottom,
            height: GetPlatform.isAndroid
                              ? ((widget.actualHeight - 40) * 0.7) 
                              : ((widget.actualHeight -
                                      MediaQuery.of(context).padding.bottom) /
                                  17.9)* 13,
        child: Column(
          children: [
            Container(
    
              // margin: const EdgeInsets.only(right: 2),
             height: MediaQuery.of(context).size.height * 0.043,
              width: MediaQuery.of(context).size.width * 0.99,
              color: AppColors.subHeaderContainer,
              child: const Center(child: SubHeader())),
              SizedBox(height: 12,),
            // Stack(
            //   children: [
            buildScreenData(),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }

  SizedBox iconSize(controller, int index) {
    return SizedBox(
      width: 75,
      height: 75,
      child: controller,
    );
  }

  Widget buildScreenData() {
    return Column(
      children: [
        buildScreenTitle(),
        buildNumberOfGuestsRow(),
        buildNumberOfBillsChoiceRow(),
        buildNumberOfBillsEntryRow(),
        buildPayeeNumberTitle(),
        GetX<KeyboardController>(
          init: KeyboardController(),
          initState: (_) {},
          builder: (controller) {
            // print("====================" +
            //     controller.listofguestmobile.value.toString());
            print(controller.listofguestmobile.value);
            int counter =
                int.parse(controller.listofguestmobile.value.toString());
            return Column(
              children: List.generate(counter, (index) {
                mobnumcntrllst.add(TextEditingController());
                mobnumcntrllstfocus.add(focusNode);
                return Pinput(
                  showCursor: true,
                  onTap: () {
                    keyboardController.controllersetupforguest = 'mobilenum';

                    keyboardController.controllerSetup(mobnumcntrllst[index]);
                    keyboardController.setKeypad(SYMBOLSKEYBOARD);
                  },
                  defaultPinTheme: defaultPinTheme,
                  length: 10,
                  readOnly: true,
                  controller: mobnumcntrllst[index],
                );
                // buildPayeeNumberRow1(index);
              }),
            );
          },
        ),
        buildPayeeNumberRow2(),
      ],
    );
  }

  Widget buildScreenTitle() {
    return Container(
      //color: Colors.amber,
      //height: boxHeight(),
      height: GetPlatform.isAndroid
                                                  ? MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.050
                                                  : MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.055,
      child:  Center(
          child: Text(
        //'Enter Diner Data',
        languageController.languageResponse.value.enterDinerData ?? '',
        style: const TextStyle(fontSize: 21.0),
      )),
    );
  }

  Widget buildNumberOfGuestsRow() {
    return SizedBox(
       height: GetPlatform.isAndroid
                                                  ? MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.050
                                                  : MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.055,
     // height: boxHeight(),
      child: Row(children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children:  [
              Text(
                languageController.languageResponse.value.numbeOfGuests ?? '',
                //languageController.languageResponse.value.numberof ?? ''
                //'Number of Guests',
                style: const TextStyle(fontSize: 21.0),
              ),
              const SizedBox(width: 20.0),
            ],
          ),
        ),
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.2,
            child: Pinput(
              onTap: () {
                keyboardController.controllerSetup(no_of_guast);
                keyboardController.setKeypad(SYMBOLSKEYBOARD);
              },
              defaultPinTheme: defaultPinTheme,
              length: 2,
              readOnly: true,
              controller: no_of_guast,
            )
            // Row(children: [
            //   buildTextField(
            //       guastcount, focusNodecount, 0, 'guestcount', 'guestcount', 0),
            //   buildTextField(
            //       guastcount, focusNodecount, 1, 'guestcount', 'guestcount', 0),
            // ]),

            )
      ]),
    );
  }

  Widget buildNumberOfBillsEntryRow() {
    return SizedBox(
       height: GetPlatform.isAndroid
                                                  ? MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.050
                                                  : MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.055,
      //height: boxHeight(),
      child: Row(children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children:  [
              Text(
                //'Number of Bills',
                languageController.languageResponse.value.numberOfBills ?? '',
                style: const TextStyle(fontSize: 21.0),
              ),
              const SizedBox(width: 20.0),
            ],
          ),
        ),
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.2,
            child: Pinput(
              onTap: () {
                keyboardController.controllersetupforguest = 'billcount';
                keyboardController.controllerSetup(no_of_bills);
                keyboardController.setKeypad(SYMBOLSKEYBOARD);
              },
              defaultPinTheme: defaultPinTheme,
              length: 2,
              readOnly: true,
              controller: no_of_bills,
            )
            // Row(children: [
            //   buildTextField(
            //       billcount, focusNodebillcount, 0, 'guestcount', 'billcount', 0),
            //   buildTextField(
            //       billcount, focusNodebillcount, 1, 'guestcount', 'billcount', 0),
            // ]),

            )
      ]),
    );
  }

  Widget buildNumberOfBillsChoiceRow() {
    return SizedBox(
       height: GetPlatform.isAndroid
                                                  ? MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.050
                                                  : MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.055,
     // height: boxHeight(),
      child: Row(children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children:  [
              Text(
                //'Number of Bills',
                languageController.languageResponse.value.numberOfBills ?? '',
                style: const TextStyle(fontSize: 21.0),
              ),
              const SizedBox(width: 20.0),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width * 0.5,
          child: Row(children: [
            buildRadioButton('Single', 0),
            buildRadioButton('Multiple', 1),
          ]),
        )
      ]),
    );
  }

  Widget buildPayeeNumberTitle() {
    return SizedBox(

       height: GetPlatform.isAndroid
                                                  ? MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.050
                                                  : MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.055,
      //height: boxHeight(),
      child:  Center(
          child: Text(
        //'Payee Mobile Number',
        languageController.languageResponse.value.payeeMobileNumber ?? '',
        style: const TextStyle(fontSize: 21.0),
      )),
    );
  }

  Widget buildPayeeNumberRow1(index) {
    // return ListView.builder(
    //   itemCount: keyboardController.listofguestmobile,
    //   itemBuilder: (context, index) {
    keyboardController.setguestmobControllers(mobnumcntrllst[index]);
    print('------>$index');

    return SizedBox(
       height: GetPlatform.isAndroid
                                                  ? MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.050
                                                  : MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.055,
     // height: boxHeight(),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        buildTextField(mobnumcntrllst[index], mobnumcntrllstfocus[index], 0,
            'guestmobilenumber', 'mobilenum', index),
        buildTextField(mobnumcntrllst[index], mobnumcntrllstfocus[index], 1,
            'guestmobilenumber', 'mobilenum', index),
        buildTextField(mobnumcntrllst[index], mobnumcntrllstfocus[index], 2,
            'guestmobilenumber', 'mobilenum', index),
        buildTextField(mobnumcntrllst[index], mobnumcntrllstfocus[index], 3,
            'guestmobilenumber', 'mobilenum', index),
        buildTextField(mobnumcntrllst[index], mobnumcntrllstfocus[index], 4,
            'guestmobilenumber', 'mobilenum', index),
        buildTextField(mobnumcntrllst[index], mobnumcntrllstfocus[index], 5,
            'guestmobilenumber', 'mobilenum', index),
        buildTextField(mobnumcntrllst[index], mobnumcntrllstfocus[index], 6,
            'guestmobilenumber', 'mobilenum', index),
        buildTextField(mobnumcntrllst[index], mobnumcntrllstfocus[index], 7,
            'guestmobilenumber', 'mobilenum', index),
        buildTextField(mobnumcntrllst[index], mobnumcntrllstfocus[index], 8,
            'guestmobilenumber', 'mobilenum', index),
        buildTextField(mobnumcntrllst[index], mobnumcntrllstfocus[index], 9,
            'guestmobilenumber', 'mobilenum', index),
      ]),
    );

    // );
  }

  Widget buildPayeeNumberRow2() {
    return SizedBox(
      height: boxHeight(),
      child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        //buildTextField(),
        //buildTextField(),
        //buildTextField(),
        //buildTextField(),
        //buildTextField(),
        //buildTextField(),
        //buildTextField(),
        //buildTextField(),
        //buildTextField(),
        //buildTextField(),
      ]),
    );
  }

  double boxHeight() {
    return GetPlatform.isAndroid
        ? (actualHeight - MediaQuery.of(context).padding.bottom) / 19
        : (actualHeight - MediaQuery.of(context).padding.bottom) / 19;
  }

  Widget buildRadioButton(
    String title,
    int value,
  ) {
    return Row(
      children: [
        Radio(
          // title: Text(
          //   title,
          //   style: const TextStyle(fontSize: 19.0),
          // ),
          value: value,
          groupValue: billGroupValue,
          onChanged: (newValue) => setState(() {
            print(value);
            billGroupValue = int.parse(newValue.toString());
          }),
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 19.0),
        )
      ],
    );
  }

  Widget buildTextField(controller, focusnode, index, contollrtype,
      donecntltype, mobilecntrlindex) {
    print(
        '----->>>>>>>$mobilecntrlindex $index');
    return InkWell(
      // onTap: () {
      //   // keyboardController.setguestControllers(controller);
      //   keyboardController.controllerSetup(controller[index]);
      //   keyboardController.focusSetup(focusnode[index], controller[index]);
      //   keyboardController.setKeypad(SYMBOLSKEYBOARD);
      // },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
         height: GetPlatform.isAndroid
                                                  ? MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.050
                                                  : MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.055,
        //height: boxHeight(),
        width: 35.0,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(color: Colors.blue, width: 2.0)),
        child: TextFormField(
          textAlign: TextAlign.end,
          showCursor: true,
          controller: controller[index],
          readOnly: true,
          maxLength: 1,
          focusNode: focusnode[index],
          //style: normalTextStyle,
          decoration: const InputDecoration(
            //fillColor: textFieldColor,
            //filled: _isFocusedcount[index],
            counterText: "",
            //contentPadding: const EdgeInsets.fromLTRB(12, 2, 5, 15),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
          maxLines: 1,
          onChanged: (value) {},
          onTap: () {
            log('\n$focusNode\n$index\n$contollrtype\n$donecntltype\n$mobilecntrlindex');
            if (index == 0) {
              keyboardController.setinitialstage(0);
            }
            keyboardController.controllersetupforguest = donecntltype;
            keyboardController.setguestControllers(controller);
            keyboardController.setguestmobControllerindex(mobilecntrlindex);
            keyboardController.setmobileboxcountindex(index);
            keyboardController.setguastcountandnummber(contollrtype);
            keyboardController.controllerSetup(controller[index]);
            keyboardController.focusSetup(focusnode[index], controller[index]);
            keyboardController.setKeypad(SYMBOLSKEYBOARD);
          },
        ),
        //  TextField(
        //   showCursor: true,
        //   controller: controller[index],
        //   focusNode: focusnode[index],
        //   readOnly: true,
        //   textAlign: TextAlign.center,
        //   decoration: const InputDecoration(border: InputBorder.none),
        // ),
      ),
    );
  }
}
