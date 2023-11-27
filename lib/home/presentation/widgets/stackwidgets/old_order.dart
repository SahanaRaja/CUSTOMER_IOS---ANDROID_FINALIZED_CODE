// ignore_for_file: prefer_const_constructors

import 'package:customer_assist/core/app_colors.dart';
import 'package:customer_assist/core/app_constants.dart';
import 'package:customer_assist/home/presentation/controllers/header_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/add_cart_review_controller.dart';
import '../../controllers/language_controller.dart';
import '../../controllers/order_controller.dart';
import '../../controllers/view_controller.dart';
import 'first_row_widget.dart';

class MyOrderWidget extends StatefulWidget {
  final double actualHeight;
  const MyOrderWidget({Key? key, required this.actualHeight}) : super(key: key);

  @override
  State<MyOrderWidget> createState() => _MyOrderWidgetState();
}

class _MyOrderWidgetState extends State<MyOrderWidget> {
  var languageController = Get.put(LanguageController());
  ViewController viewController = Get.find();
  OrderController orderController = Get.find();
  AddCartReviewController addCartReviewController = Get.find();
  HeaderController headerController = Get.find();

  var checklist;

  var actualHeight;

  @override
  void initState() {
    actualHeight = widget.actualHeight;
    orderController.myOrderEditResponse.clear();
    checklist = List.generate(
        orderController.myOrderResponse.value.length, (index) => false);
    print(checklist);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      // width: MediaQuery.of(context).size.width,
      // height: widget.actualHeight * 0.75,
      height: GetPlatform.isAndroid
          ? (widget.actualHeight - 40) / 17.9 *
              16.45
          //  18.1
          : (widget.actualHeight - MediaQuery.of(context).padding.bottom) /
              17.9 *
              16.45,
      child: Padding(
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
                "Old Order",
                // languageController.languageResponse.value.users ?? '',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              )),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
                height: GetPlatform.isAndroid
                    ? (widget.actualHeight - 40) /  17.9 *
                        15.3
                    //  18.1
                    : (widget.actualHeight -
                            MediaQuery.of(context).padding.bottom) /
                        17.9 *
                        15.2,
                child: GetX<OrderController>(
                    init: OrderController(),
                    initState: (_) {},
                    builder: (orderController) {
                      return ListView.builder(
                        itemCount: orderController.myOrderResponse.value.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: GetPlatform.isAndroid
                                    ? (actualHeight - 40) / 2
                                    // 18.1
                                    : (actualHeight -
                                            MediaQuery.of(context)
                                                .padding
                                                .bottom) /
                                        17.9 *
                                        8.5,
                                height: GetPlatform.isAndroid
                                    ? (actualHeight - 40) /  17.9 *
                                        2.9
                                    // 18.1
                                    : (actualHeight -
                                            MediaQuery.of(context)
                                                .padding
                                                .bottom) /
                                        17.9 *
                                        3.0,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black,
                                    ),
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15))),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 32.0, right: 10),
                                  child: Row(
                                    children: [
                                      Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(),
                                              boxShadow: const [
                                                BoxShadow(
                                                    color: Colors.grey,
                                                    spreadRadius: 1,
                                                    blurRadius: 1,
                                                    offset: Offset(4, 4))
                                              ]),
                                          child: Center(
                                              child: InkWell(
                                            onTap: () {
                                              print(
                                                  '------->${orderController.myOrderEditResponse.value}');
                                              print(
                                                  '------->${checklist[index]}');
                                              setState(() {
                                                if (checklist[index] == true) {
                                                  orderController
                                                      .myOrderEditResponse
                                                      .remove(orderController
                                                          .myOrderResponse
                                                          .value[index]);
                                                  checklist[index] = false;
                                                } else {
                                                  orderController
                                                      .myOrderEditResponse
                                                      .add(orderController
                                                          .myOrderResponse
                                                          .value[index]);
                                                  checklist[index] = true;
                                                }
                                              });
                                              viewController
                                                  .setView(MYORDERSTATUS);
                                              headerController
                                                  .setThirdHeaderLabel(
                                                      'Delivery Pending');
                                            },
                                            child: Center(
                                              child: Icon(
                                                Icons.done,
                                                color: checklist[index] == true
                                                    ? Colors.green
                                                    : const Color.fromARGB(
                                                        255, 255, 255, 255),
                                                size: 25,
                                              ),
                                            ),
                                          ))),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(
                                            top: 5, bottom: 5),
                                        width: GetPlatform.isAndroid
                                            ? (actualHeight - 40) / 7
                                            // 18.1
                                            : (actualHeight -
                                                    MediaQuery.of(context)
                                                        .padding
                                                        .bottom) /
                                                17.9 *
                                                2.5,
                                        height: GetPlatform.isAndroid
                                            ? (actualHeight - 40) / 6.3
                                            // 18.1
                                            : (actualHeight -
                                                    MediaQuery.of(context)
                                                        .padding
                                                        .bottom) /
                                                17.9 *
                                                2.5,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: NetworkImage(
                                                    orderController
                                                        .myOrderResponse
                                                        .value[index]
                                                        .shopImage!)),
                                            border: Border.all(
                                              color: Colors.black,
                                            ),
                                            borderRadius: const BorderRadius.all(
                                                Radius.circular(15))),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15.0, top: 20),
                                        child: Column(
                                          // mainAxisAlignment: MainAxisAlignment.space,
                                          children: [
                                            Container(
                                              width: GetPlatform.isAndroid
                                                  ? (actualHeight - 40) / 4.9
                                                  // 18.1
                                                  : (actualHeight -
                                                          MediaQuery.of(context)
                                                              .padding
                                                              .bottom) /
                                                      17.9 *
                                                      3.85,
                                              height: GetPlatform.isAndroid
                                                  ? (actualHeight - 40) / 24
                                                  // 18.1
                                                  : (actualHeight -
                                                          MediaQuery.of(context)
                                                              .padding
                                                              .bottom) /
                                                      17.9 *
                                                      0.76,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.black,
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(orderController
                                                    .myOrderResponse
                                                    .value[index]
                                                    .orderDate!),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Container(
                                              width: GetPlatform.isAndroid
                                                  ? (actualHeight - 40) / 4.9
                                                  //  18.1
                                                  : (actualHeight -
                                                          MediaQuery.of(context)
                                                              .padding
                                                              .bottom) /
                                                      17.9 *
                                                      3.85,
                                              height: GetPlatform.isAndroid
                                                  ? (actualHeight - 40) / 24
                                                  // 18.1
                                                  : (actualHeight -
                                                          MediaQuery.of(context)
                                                              .padding
                                                              .bottom) /
                                                      17.9 *
                                                      0.76,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.black,
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(orderController
                                                    .myOrderResponse
                                                    .value[index]
                                                    .orderAmount!),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Container(
                                              width: GetPlatform.isAndroid
                                                  ? (actualHeight - 40) / 4.9
                                                  //  18.1
                                                  : (actualHeight -
                                                          MediaQuery.of(context)
                                                              .padding
                                                              .bottom) /
                                                      17.9 *
                                                      3.85,
                                              height: GetPlatform.isAndroid
                                                  ? (actualHeight - 40) / 24
                                                  // 18.1
                                                  : (actualHeight -
                                                          MediaQuery.of(context)
                                                              .padding
                                                              .bottom) /
                                                      17.9 *
                                                      0.76,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.black,
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(orderController
                                                    .myOrderResponse
                                                    .value[index]
                                                    .orderStatus!),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 9)
                            ],
                          );
                        },
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
