// ignore_for_file: unused_local_variable, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers, must_be_immutable, library_private_types_in_public_api, non_constant_identifier_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:customer_assist/core/app_colors.dart';
import 'package:customer_assist/core/app_constants.dart';
import 'package:customer_assist/home/data/configure/datasources/configure_data_remote_data_source.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

class CalciButton extends StatefulWidget {
  double actualHeight;
  CalciButton({Key? key, required this.actualHeight}) : super(key: key);
  @override
  _CalciButtonState createState() => _CalciButtonState();
}

class _CalciButtonState extends State<CalciButton> {
  // late double actualHeight;
  String ans = "";
  String _output = "";
  double num1 = 0;
  double num2 = 0;
  var operator = "";
  String memory = "0";
  bool memoryplus = false;
  bool memoryminus = false;

  buttonPressed(String buttonText) {
    print(buttonText);
    if (buttonText == "AC") {
      operator = "AC";
      _output = "";
      num1 = 0;
      num2 = 0;
      operator = "";
      memory = "0";
    } else if (buttonText == "M+") {
      operator = "M+";
      if (operator == "+") {
        _output = (num1 + num2).toString();
      }
      if (operator == "-") {
        _output = (num1 - num2).toString();
      }
      if (operator == "x") {
        _output = (num1 * num2).toString();
      }
      if (operator == "/") {
        _output = (num1 / num2).toStringAsFixed(2);
      }
      Parser p = Parser();
      Expression exp = p.parse("$memory+$_output");

      ContextModel cm = ContextModel();
      // print("------>" + exp.toString());
      memory = '${exp.evaluate(EvaluationType.REAL, cm)}';
      // print("the vale of exp is  $exp");
    } else if (buttonText == "M-") {
      operator = "M-";
      if (operator == "+") {
        _output = (num1 + num2).toString();
      }
      if (operator == "-") {
        _output = (num1 - num2).toString();
      }
      if (operator == "x") {
        _output = (num1 * num2).toString();
      }
      if (operator == "/") {
        _output = (num1 / num2).toStringAsFixed(2);
      }
      Parser p = Parser();
      Expression exp = p.parse("$memory-$_output");

      ContextModel cm = ContextModel();
      print("------>$exp");

      memory = '${exp.evaluate(EvaluationType.REAL, cm)}';
    } else if (buttonText == "MR") {
      operator = "MR";
      print("MR memory value is $memory");
      RegExp regex = RegExp(r'([.]*0)(?!.*\d)');
      _output = memory.toString().replaceAll(RegExp(r'.0'), '');
    } else if (buttonText == "CL") {
      operator = "CL";
      _output = _output.substring(0, _output.length - 1);
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "x") {
      num1 = double.parse(ans);
      operator = buttonText;
      _output = "";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(ans);
      if (operator == "+") {
        _output = (num1 + num2).toStringAsFixed(0);
      }
      if (operator == "-") {
        _output = (num1 - num2).toStringAsFixed(0);
      }
      if (operator == "x") {
        _output = (num1 * num2).toStringAsFixed(0);
      }
      if (operator == "/") {
        _output = (num1 / num2).toStringAsFixed(2);
      }
      num1 = 0;
      num2 = 0;
      operator = "";
    } else {
      _output = _output + buttonText;
    }
    // print(_output);
    setState(() {
      // ans = double.parse(_output).toString();
      ans = _output.toString();
    });
  }

  Widget CustomButton(String buttonText) {
    return Container(
      //padding: const EdgeInsets.only(left: 1, top: 10),
      height: double.infinity,
      width: double.infinity,
      color: Colors.grey,
      // const Color.fromARGB(255, 77, 74, 74),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: FloatingActionButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
                side: const BorderSide(
                    color: Colors.grey, width: 5, style: BorderStyle.none)),
            onPressed: () => {
                  // print("button pressed" + buttonText),
                  buttonPressed(buttonText),
                },
            // buttonPressed(buttonText),

            backgroundColor: Colors.white,
            // Colors.grey[350],
            child: Text(
              buttonText,
              style: const TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0)),
            )),
      ),
    );
  }

  Widget CustomsButton(String buttonText) {
    return Container(
      //padding: const EdgeInsets.only(left: 3, top: 10),
      height: double.infinity,
      width: double.infinity,
      color: Colors.grey,
      // const Color.fromARGB(255, 77, 74, 74),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: FloatingActionButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
                side: const BorderSide(
                    color: Colors.grey, width: 5, style: BorderStyle.none)),
            onPressed: () => buttonPressed(buttonText),
            backgroundColor: Colors.white,
            //  Colors.grey[350],
            child: Text(
              buttonText,
              style: const TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 225, 42, 22)),
            )),
      ),
    );
  }

//  buttontext
  Widget CustomButtons(String buttonText) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.grey,
      //  const Color.fromARGB(255, 77, 74, 74),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: FloatingActionButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
                side: const BorderSide(
                    color: Colors.grey, width: 5, style: BorderStyle.none)),
            // buttonpressed(buttontext)
            onPressed: () {
              // print("button pressed" + buttonText);
              buttonPressed(buttonText);
            },
            // => buttonPressed(buttonText),
            //  print( maincontroller.text );
            backgroundColor: Colors.white,
            //  Colors.grey[350],
            child: Text(
              buttonText,
              // buttontext,
              style: const TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 64, 181, 31)),
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var ans2 = ans;
    return Padding(
      padding: GetPlatform.isAndroid
         ?const EdgeInsets.only(top: 5)
         :const EdgeInsets.only(),
      child: Container(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.043,
              width: MediaQuery.of(context).size.width * 0.99,
              color: AppColors.subHeaderContainer,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 95),
                        height: 50,
                        width: 280,
                        child: Center(
                          child: Text(
                            "Arithmetic Calculator",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      ),
                      // Container(
                      //   width: 50,
                      // ),
                      InkWell(
                        onTap: () {
                          viewController.setView(CURRENCYCALCULATE);
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 40),
                          height: 40,
                          width: 40,
                          // decoration: BoxDecoration(border: Border.all()),
                          child: optionsController.arrowfrwd,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 37,
                ),
                Container(
                  height: GetPlatform.isAndroid
                      ? (widget.actualHeight - 40) / 1.29
                      : (widget.actualHeight -
                              MediaQuery.of(context).padding.bottom) /
                          17.9 *
                          // 16,
                          13.91,
                  width: GetPlatform.isAndroid
                      ? (widget.actualHeight - 40) / 1.98
                      : (widget.actualHeight -
                              MediaQuery.of(context).padding.bottom) /
                          17.9 *
                          10,
                  margin: const EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: const LinearGradient(
                      colors: [
                        Colors.grey, Colors.grey
                        // Color.fromARGB(255, 77, 74, 74),
                        // Color.fromARGB(255, 77, 74, 74),
                      ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(
                          height: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              //added by saha
                              height: GetPlatform.isAndroid
                                  ? (widget.actualHeight - 40) / 17.9 * 2.1
                                  : (widget.actualHeight -
                                          MediaQuery.of(context).padding.bottom) /
                                      17.9 *
                                      2.1,
                              width: GetPlatform.isAndroid
                                  ? (widget.actualHeight - 40) / 17.9 * 2.1
                                  : (widget.actualHeight -
                                          MediaQuery.of(context).padding.bottom) /
                                      17.9 *
                                      2.1,
                              // height: 110,
                              // width: 108,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 243, 243, 115),
                                  //  const Color.fromARGB(255, 117, 247, 81),
                                  borderRadius: BorderRadius.circular(15)),
                              padding: const EdgeInsets.all(13),
                              // .symmetric(vertical: 24.0, horizontal: 12.0),
                              child: AutoSizeText(operator,
                                  style: const TextStyle(
                                    fontSize: 60.0,
                                    fontWeight: FontWeight.normal,
                                  )),
                            ),
                            Container(
                                // ADDED BY SAHANA
                                height: GetPlatform.isAndroid
                                    ? (widget.actualHeight - 40) / 17.9 * 2.1
                                    : (widget.actualHeight -
                                            MediaQuery.of(context)
                                                .padding
                                                .bottom) /
                                        17.9 *
                                        2.1,
                                width: GetPlatform.isAndroid
                                    ? (widget.actualHeight - 40) / 17.9 * 6.2
                                    : (widget.actualHeight -
                                            MediaQuery.of(context)
                                                .padding
                                                .bottom) /
                                        17.9 *
                                        6.5,
                                // height: 110,
                                // width: 327,
                                alignment: Alignment.centerRight,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 243, 243, 115),
                                    // const Color.fromARGB(255, 117, 247, 81),
                                    borderRadius: BorderRadius.circular(15)),
                                padding: const EdgeInsets.all(13),
                                // .symmetric(vertical: 24.0, horizontal: 12.0),
                                child: AutoSizeText(ans,
                                    // validator : ans ,
                                    maxLines: 1,
                                    // ans.length > 10
                                    //     ? '${ans.substring(0, 10)}...'
                                    //     : ans,
                                    style: const TextStyle(
                                      fontSize: 60.0,
                                      fontWeight: FontWeight.normal,
                                    ))),
                          ],
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Flexible(
                          flex: 10,
                          child: Container(
                            padding: const EdgeInsets.only(left: 0.3),
                            height: double.infinity,
                            width: double.infinity,
                            color: const Color.fromARGB(255, 77, 74, 74),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Flexible(
                                  flex: 1,
                                  child: SizedBox(
                                    height: double.infinity,
                                    width: double.infinity,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Flexible(
                                          flex: 1,
                                          child: CustomButtons("M+"),
                                        ),
                                        Flexible(
                                            flex: 1, child: CustomButton("7")),
                                        Flexible(
                                            flex: 1, child: CustomButton("4")),
                                        Flexible(
                                            flex: 1, child: CustomButton("1")),
                                        Flexible(
                                            flex: 1, child: CustomButton("0")),
                                      ],
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: SizedBox(
                                    height: double.infinity,
                                    width: double.infinity,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Flexible(
                                            flex: 1, child: CustomsButton("M-")),
                                        Flexible(
                                            flex: 1, child: CustomButton("8")),
                                        Flexible(
                                            flex: 1, child: CustomButton("5")),
                                        Flexible(
                                            flex: 1, child: CustomButton("2")),
                                        Flexible(
                                            flex: 1, child: CustomButton("00")),
                                      ],
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: SizedBox(
                                    height: double.infinity,
                                    width: double.infinity,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Flexible(
                                            flex: 1, child: CustomButton("MR")),
                                        Flexible(
                                            flex: 1, child: CustomButton("9")),
                                        Flexible(
                                            flex: 1, child: CustomButton("6")),
                                        Flexible(
                                            flex: 1, child: CustomButton("3")),
                                        Flexible(
                                            flex: 1, child: CustomButton("."))
                                      ],
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: SizedBox(
                                    height: double.infinity,
                                    width: double.infinity,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Flexible(
                                            flex: 1, child: CustomsButton("AC")),
                                        Flexible(
                                            flex: 1, child: CustomsButton("CL")),
                                        Flexible(
                                            flex: 1, child: CustomButtons("+")),
                                        Flexible(
                                            flex: 1, child: CustomButtons("-")),
                                        Flexible(
                                            flex: 1, child: CustomButtons("x")),
                                        Flexible(
                                            flex: 1, child: CustomButtons("/")),
                                        Flexible(
                                            flex: 1, child: CustomButtons("=")),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 37,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
