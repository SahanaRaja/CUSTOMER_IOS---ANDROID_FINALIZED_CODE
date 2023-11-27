// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, must_be_immutable, camel_case_types, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:customer_assist/core/app_colors.dart';
import 'package:customer_assist/core/app_constants.dart';
import 'package:customer_assist/home/data/configure/datasources/configure_data_remote_data_source.dart';
import 'package:customer_assist/home/presentation/controllers/fetch_currency_controller.dart';
import 'package:customer_assist/home/presentation/controllers/options_controller.dart';
import 'package:customer_assist/home/presentation/controllers/view_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

enum TextInputField { left, right }

enum KeypadKeys {
  one,
  two,
  three,
  four,
  five,
  six,
  seven,
  eight,
  nine,
  zero,
  dot,
  doubleZero,
  cancel,
  delete
}

class CurrencyTab extends StatefulWidget {
  double actualHeight;
  CurrencyTab({Key? key, required this.actualHeight}) : super(key: key);

  @override
  State<CurrencyTab> createState() => _currencyTabState();
}

class _currencyTabState extends State<CurrencyTab> {
  double actualHeight = 0;
  var viewController = Get.put(ViewController());
  var optionsController = Get.put(OptionsController());
  final _fetchCurrencyController = Get.put(FetchCurrencyController());
  List<String> _allCurrencyCodes = [];
  TextEditingController leftController = TextEditingController(text: '0.00');
  TextEditingController rightController = TextEditingController(text: '0.00');
  String _leftSelectedCode = '';
  String _rightSelectedCode = '';
  final int _textLimit = 7;

  // final _leftColor = const Color.fromARGB(255, 95, 227, 65);
  // final _rightColor = const Color.fromARGB(255, 210, 247, 78);
  // color: Color.fromARGB(255, 243, 243, 115),
  final _leftColor = Color.fromARGB(255, 243, 243, 115);
  final _rightColor = Color.fromARGB(255, 243, 243, 115);

  @override
  void initState() {
    super.initState();
    fetchPriceDetails();
  }

  @override
  void didChangeDependencies() {
    actualHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: GetPlatform.isAndroid
         ?const EdgeInsets.only(top: 5)
         :const EdgeInsets.only(),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.83,
        width: double.infinity,
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
                      viewController.setView(MATHCALCULATE);
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
                  Container(
                    margin: EdgeInsets.only(left: 30),
                    height: 50,
                    width: 300,
                    child: Center(
                      child: Text(
                        "Foreign Exchange Calculator",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 32,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  _buildConverterPad,
                  SizedBox(height: MediaQuery.of(context).size.height * 0.024),
                  const Text(
                      "Select from which currency to convert to which and enter the value"),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                  Container(
                    //decoration: BoxDecoration(border: Border.all(width: 1,color: Color.fromARGB(255, 210, 208, 208))),
                    alignment: Alignment.bottomCenter,
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.253,
                    color: const Color.fromARGB(255, 169, 167, 167),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: Platform.isAndroid ? 40 : 50,
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                    'assets/images/keypad_header.png')),
                            border: Border(
                              top: BorderSide(
                                  width: 2,
                                  color: Colors.black,
                                  style: BorderStyle.solid), //BorderSide
                              bottom: BorderSide(
                                  width: 2,
                                  color: Colors.black,
                                  style: BorderStyle.solid), //BorderSide
                              left: BorderSide(
                                  width: 2,
                                  color: Colors.black,
                                  style: BorderStyle.solid), //Borderside
                              right: BorderSide(
                                  width: 2,
                                  color: Colors.black,
                                  style: BorderStyle.solid), //BorderSide
                            ), //Border
    
                            /* width: double.infinity,
                                      height: 50,
                                      child: Image.asset(
                                          'assets/images/keypad_header.png'), */
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    leftController.text = '';
                                    rightController.text = '';
                                  });
                                },
                                child: const Text(
                                  'CANCEL',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  await _fetchCurrencyController
                                      .fetchCurrencyPriceDetails(
                                          _leftSelectedCode, _rightSelectedCode);
                                  setState(() {
                                    var rate = double.parse(
                                        _fetchCurrencyController.priceDetails
                                                .value.status?.rATE ??
                                            '0.0');
                                    var price =
                                        double.parse(leftController.text) * rate;
                                    rightController.text =
                                        price.toStringAsFixed(2);
                                  });
                                },
                                child: const Text(
                                  'DONE',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2, color: Colors.black)),
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width * 0.4,
                                height: MediaQuery.of(context).size.height * 0.2,
                                child: _allCurrencyCodes.isEmpty
                                    ? Container()
                                    : CountryCodePicker(
                                        allCurrencyCodes: _allCurrencyCodes,
                                        bgColor: _leftColor,
                                        callBack: (value) {
                                          _leftSelectedCode = value;
                                        },
                                      )),
                            const SizedBox(width: 5),
                            Icon(Icons.arrow_forward_ios,
                                size: 35.sp,
                                color: const Color.fromARGB(255, 76, 76, 76)),
                            const SizedBox(width: 5),
                            Container(
                              decoration: BoxDecoration(
                                  // color: Colors.black,
                                  border:
                                      Border.all(width: 2, color: Colors.black)),
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: MediaQuery.of(context).size.height * 0.2,
                              child: _allCurrencyCodes.isEmpty
                                  ? Container()
                                  : CountryCodePicker(
                                      allCurrencyCodes: _allCurrencyCodes,
                                      bgColor: _rightColor,
                                      callBack: (value) {
                                        _rightSelectedCode = value;
                                        // rightController.text = '${_fetchCurrencyController.currencyPriceModel.value.rates?.toJson()[value]}';
                                      }),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget get _buildConverterPad {
    var space = SizedBox(height: 8.sp);
    var buttonSize = 15.w;

    List<Widget> row1 = [
      KeypadKeys.one,
      KeypadKeys.two,
      KeypadKeys.three,
      KeypadKeys.four,
      KeypadKeys.five
    ]
        .map((e) => SizedBox(
            height: buttonSize,
            width: buttonSize,
            child: CustomButton(keyType: e, callBack: _keypadButtonAction)))
        .toList();

    List<Widget> row2 = [
      KeypadKeys.six,
      KeypadKeys.seven,
      KeypadKeys.eight,
      KeypadKeys.nine,
      KeypadKeys.zero
    ]
        .map((e) => SizedBox(
            height: buttonSize,
            width: buttonSize,
            child: CustomButton(keyType: e, callBack: _keypadButtonAction)))
        .toList();

    List<Widget> row3 = [
      KeypadKeys.cancel,
      KeypadKeys.delete,
      KeypadKeys.dot,
      KeypadKeys.doubleZero
    ]
        .map((e) => SizedBox(
            height: buttonSize,
            width: buttonSize,
            child: CustomButton(keyType: e, callBack: _keypadButtonAction)))
        .cast<Widget>()
        .toList();

    row3.insert(2, SizedBox(width: buttonSize));

    var numberPad = Flexible(
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: row1),
            space,
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: row2),
            space,
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: row3),
          ],
        ),
      ),
    );

    var pad = Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.sp),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.390,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.sp),
          color: Colors.grey,
          //  const Color.fromARGB(255, 77, 74, 74),
        ),
        child: Column(children: [
          space,
          space,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 243, 243, 115),
                    border: Border.all()),
                height: 50,
                width: 195,
                child: Center(
                  child: Text(" Currency - 1 ",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.normal,
                          color: Colors.black)),
                ),
              ),
              space,
              Container(
                height: 50,
                width: 195,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 243, 243, 115),
                    border: Border.all()),
                child: Center(
                  child: Text(" Currency - 2 ",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.normal,
                          color: Colors.black)),
                ),
              ),
            ],
          ),
          space,
          Row(
            children: [
              _buildTextInput(TextInputField.left, controller: leftController),
              space,
              _buildTextInput(TextInputField.right,
                  controller: rightController),
            ],
          ),
          space,
          space,
          numberPad,
        ]),
      ),
    );

    return pad;
  }

  Widget _buildTextInput(TextInputField field,
      {required TextEditingController controller}) {
    var color = field == TextInputField.left ? _leftColor : _rightColor;

    return Row(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.sp),
          child: SizedBox(
            height: 9.h,
            width: 198,
            child: TextField(
              textAlignVertical: TextAlignVertical.center,
              textAlign: TextAlign.right,
              style:
                  const TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
              controller: field == TextInputField.left
                  ? leftController
                  : rightController,
              readOnly: true,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: color,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7.sp),
                  )),
            ),
          ),
        ),
      ],
    );
  }

  SizedBox iconSize(controller, int index) {
    return SizedBox(
      width: 75,
      height: 75,
      child: controller,
    );
  }

  void _keypadButtonAction(KeypadKeys key) {
    print(leftController.text);
    if (key != KeypadKeys.dot &&
        key != KeypadKeys.cancel &&
        key != KeypadKeys.delete &&
        leftController.text.length >= _textLimit) {
      return;
    }

    switch (key) {
      case KeypadKeys.cancel:
        leftController.text = '';
        rightController.text = '';
        break;
      case KeypadKeys.delete:
        if (leftController.text.isEmpty) break;
        leftController.text =
            leftController.text.substring(0, leftController.text.length - 1);
        break;
      case KeypadKeys.dot:
        if (leftController.text.isEmpty ||
            leftController.text.contains('.') ||
            leftController.text.length == _textLimit) break;
        leftController.text = '${leftController.text}.';
        break;
      case KeypadKeys.one:
        leftController.text = '${leftController.text}1';
        break;
      case KeypadKeys.two:
        leftController.text = '${leftController.text}2';
        break;
      case KeypadKeys.three:
        leftController.text = '${leftController.text}3';
        break;
      case KeypadKeys.four:
        leftController.text = '${leftController.text}4';
        break;
      case KeypadKeys.five:
        leftController.text = '${leftController.text}5';
        break;
      case KeypadKeys.six:
        leftController.text = '${leftController.text}6';
        break;
      case KeypadKeys.seven:
        leftController.text = '${leftController.text}7';
        break;
      case KeypadKeys.eight:
        leftController.text = '${leftController.text}8';
        break;
      case KeypadKeys.nine:
        leftController.text = '${leftController.text}9';
        break;
      case KeypadKeys.zero:
        leftController.text = '${leftController.text}0';
        break;
      case KeypadKeys.doubleZero:
        if (leftController.text.length == _textLimit - 1) {
          leftController.text = '${leftController.text}0';
          break;
        }
        leftController.text = '${leftController.text}00';
        break;
    }
  }

  void fetchPriceDetails() async {
    if (!mounted) return;
    await _fetchCurrencyController.fetchCurrencyCodeDetails();
    setState(() {
      _allCurrencyCodes.clear();
      _allCurrencyCodes = _fetchCurrencyController.currencyCodeModel.value.rates
              ?.toJson()
              .keys
              .toList() ??
          [];
      _allCurrencyCodes.sort((a, b) => a.compareTo(b));
    });
  }
}

typedef typeFunction = void Function(KeypadKeys);

class CustomButton extends StatelessWidget {
  final KeypadKeys keyType;
  final typeFunction callBack;

  const CustomButton({Key? key, required this.keyType, required this.callBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          callBack(keyType);
        },
        child: _buildKey);
  }

  Widget get _buildKey {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5.sp)),
        color: Colors.white,
      ),
      // color: const Color.fromARGB(211, 255, 255, 255)),
      child: Text(
        _buttonText,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: _textColor, fontSize: 20.sp, fontWeight: FontWeight.bold),
      ),
    );
  }

  String get _buttonText {
    switch (keyType) {
      case KeypadKeys.one:
        return '1';
      case KeypadKeys.two:
        return '2';
      case KeypadKeys.three:
        return '3';
      case KeypadKeys.four:
        return '4';
      case KeypadKeys.five:
        return '5';
      case KeypadKeys.six:
        return '6';
      case KeypadKeys.seven:
        return '7';
      case KeypadKeys.eight:
        return '8';
      case KeypadKeys.nine:
        return '9';
      case KeypadKeys.zero:
        return '0';
      case KeypadKeys.dot:
        return '.';
      case KeypadKeys.doubleZero:
        return '00';
      case KeypadKeys.cancel:
        return 'CA';
      case KeypadKeys.delete:
        return '<';
    }
  }

  Color get _textColor {
    switch (keyType) {
      case KeypadKeys.cancel:
        return const Color.fromARGB(255, 225, 42, 22);
      case KeypadKeys.delete:
        return const Color.fromARGB(255, 89, 91, 88);
      default:
        return Colors.black;
    }
  }
}

typedef StringFunction = void Function(String);

class CountryCodePicker extends StatefulWidget {
  final double itemExtent = 55;
  final List<String> allCurrencyCodes;
  final StringFunction callBack;
  final Color bgColor;

  const CountryCodePicker(
      {super.key,
      required this.allCurrencyCodes,
      required this.bgColor,
      required this.callBack});

  @override
  State<CountryCodePicker> createState() => _CountryCodePickerState();
}

class _CountryCodePickerState extends State<CountryCodePicker> {
  double total = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _pickerHandler(int idx) {
    widget.callBack(widget.allCurrencyCodes[idx]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.bgColor,
      child: CupertinoPicker(
        itemExtent: widget.itemExtent,
        magnification: 1.2,
        useMagnifier: true,
        onSelectedItemChanged: (int index) => _pickerHandler(index),
        children:
            widget.allCurrencyCodes.map((e) => Center(child: Text(e))).toList(),
      ),
    );
  }
}
