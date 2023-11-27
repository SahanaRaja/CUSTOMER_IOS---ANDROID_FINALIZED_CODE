// ignore_for_file: prefer_const_constructors, camel_case_types, must_be_immutable

import 'package:customer_assist/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class faqview extends StatefulWidget {
  double actualHeight;
  faqview({Key? key, required this.actualHeight}) : super(key: key);

  @override
  State<faqview> createState() => _faqviewState();
}

class _faqviewState extends State<faqview> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse(
            'https://www.retailresonance.com/retailresonancev2/Api/files/faq.html'),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Padding(
        padding: GetPlatform.isAndroid
         ?const EdgeInsets.only(top: 5)
         :const EdgeInsets.only(),
        child: Column(
          children: [
            Container(
             height: MediaQuery.of(context).size.height * 0.043,
              width: MediaQuery.of(context).size.width * 0.99,
              color: AppColors.subHeaderContainer,
              child: Center(
                  child: Text(
                "FAQ",
                // languageController.languageResponse.value.users ?? '',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              )),
            ),
            Container(
              height: GetPlatform.isAndroid
                  ? (widget.actualHeight -
                          MediaQuery.of(context).padding.bottom) /
                      17.9 *
                      14.8
                  : (widget.actualHeight -
                          MediaQuery.of(context).padding.bottom) /
                      17.9 *
                      15.6,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(),
              ),
              child: WebViewWidget(
                controller: controller,
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
