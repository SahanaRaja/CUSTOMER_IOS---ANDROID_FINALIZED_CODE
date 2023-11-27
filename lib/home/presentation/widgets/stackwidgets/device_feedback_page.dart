// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:customer_assist/core/app_colors.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

class DeviceFeedBack extends StatefulWidget {
  final double actualHeight;
  const DeviceFeedBack({Key? key, required this.actualHeight})
      : super(key: key);

  @override
  State<DeviceFeedBack> createState() => _DeviceFeedBackState();
}

class _DeviceFeedBackState extends State<DeviceFeedBack> {
  bool haptic = false;
  bool systemSound = false;
  var languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: GetPlatform.isAndroid
         ?const EdgeInsets.only(top: 5)
         :const EdgeInsets.only(),
      child: SizedBox(
       
        height: GetPlatform.isAndroid
            ? (widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                17.9 *
                16.4
            // 18.1
            : (widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                17.9 *
                16.4,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.043,
              width: MediaQuery.of(context).size.width * 0.99,
              color: AppColors.subHeaderContainer,
              child: Center(
                  child: Text(
                "System Feed Back",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              )),
            ),
            Container(
              padding: EdgeInsets.only(top: 130),
              // color: Colors.amber,
              height: GetPlatform.isAndroid
                  ? (widget.actualHeight -
                          MediaQuery.of(context).padding.bottom) /
                      17.9 *
                      5.3
                  // 18.1
                  : (widget.actualHeight -
                          MediaQuery.of(context).padding.bottom) /
                      17.9 *
                      5.5,
              width: GetPlatform.isAndroid
                  ? (widget.actualHeight - 40) / 5
                  // 18.1
                  : (widget.actualHeight -
                          MediaQuery.of(context).padding.bottom) /
                      17.9 *
                      5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: GetPlatform.isAndroid
                        ? (widget.actualHeight - 40) / 5
                        // 18.1
                        : (widget.actualHeight -
                                MediaQuery.of(context).padding.bottom) /
                            17.9 *
                            3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          languageController.languageResponse.value.haptic ?? '',
                          style: const TextStyle(fontSize: 16),
                        ),
                        FlutterSwitch(
                          width: 70.0,
                          height: 35,
                          value: haptic,
                          borderRadius: 30.0,
                          padding: 8.0,
                          onToggle: (val) {
                            setState(() {
                              haptic = val;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: GetPlatform.isAndroid
              ? EdgeInsets.only()
             : EdgeInsets.only(bottom: 50),
              // color: Color.fromARGB(255, 249, 5, 5),
              height: GetPlatform.isAndroid
                  ? (widget.actualHeight - 40) / 18.1
                  : (widget.actualHeight -
                          MediaQuery.of(context).padding.bottom) /
                      17.9 *
                      2,
              width: GetPlatform.isAndroid
                  ? (widget.actualHeight - 40) / 3.2
                  : (widget.actualHeight -
                          MediaQuery.of(context).padding.bottom) /
                      17.9 *
                      5,
              child: Row(
                children: [
                  SizedBox(
                    width: GetPlatform.isAndroid
                        ? (widget.actualHeight - 40) / 4
                        : (widget.actualHeight -
                                MediaQuery.of(context).padding.bottom) /
                            17.9 *
                            4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          languageController.languageResponse.value.systemSound ??
                              '',
                          style: const TextStyle(fontSize: 16),
                        ),
                        FlutterSwitch(
                          width: 70.0,
                          height: 35,
                          value: systemSound,
                          borderRadius: 30.0,
                          padding: 8.0,
                          onToggle: (val) {
                            setState(() {
                              systemSound = val;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
                // padding: EdgeInsets.only(top: 100),
                // color: Colors.amber,
                height: GetPlatform.isAndroid
                    ? (widget.actualHeight -
                            MediaQuery.of(context).padding.bottom) /
                        17.9 *
                        0.5
                    : (widget.actualHeight -
                            MediaQuery.of(context).padding.bottom) /
                        17.9 *
                        3
                // 4.7,
                ),
            Container(
              height: GetPlatform.isAndroid
                  ? (widget.actualHeight - 40) / 2.64
                  : (widget.actualHeight -
                          MediaQuery.of(context).padding.bottom) /
                      17.9,
              child: Center(
                child: Text(
                  languageController
                          .languageResponse.value.hapticPowerConsumptio ??
                      '',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
