// ignore_for_file: prefer_const_constructors

import 'package:customer_assist/core/app_colors.dart';
import 'package:customer_assist/home/presentation/controllers/order_controller.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/size_config.dart';

class ServiceCharge extends StatefulWidget {
  final double actualHeight;
  const ServiceCharge({Key? key, required this.actualHeight}) : super(key: key);

  @override
  State<ServiceCharge> createState() => _ServiceChargeState();
}

class _ServiceChargeState extends State<ServiceCharge> {
  OrderController orderController = Get.find();
  bool value1 = true;
  bool value2 = false;
  List<bool> isSwitched = [];

  @override
  void initState() {
    isSwitched = List.generate(
        orderController.subscriptionResponse.value.serviceModel!.length,
        (index) => false);

    for (int i = 0;
        i < orderController.subscriptionResponse.value.serviceModel!.length;
        i++) {
      if (orderController
              .subscriptionResponse.value.serviceModel![i].selectedType!
              .toUpperCase() ==
          'Y') {
        setState(() {
          isSwitched[i] = true;
        });
      } else {
        isSwitched[i] = false;
      }
    }

    super.initState();
  }

  var languageController = Get.put(LanguageController());
  @override
  Widget build(BuildContext context) {
    return Padding(
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
              "Subscription",
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            )),
          ),
          Container(
            // color: Colors.red,
            height: GetPlatform.isAndroid
                ? (widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                    17.9 *
                    2.2
                : (widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                    17.9 *
                    0.1,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            height: getHeight(context),
            width: getHeight(context) * 7,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              decoration: BoxDecoration(
                color: Colors.grey[600],
                borderRadius: const BorderRadius.all(Radius.circular(30)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: FractionallySizedBox(
                      heightFactor: 1,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            value1 = true;
                            value2 = false;
                          });
                        },
                        //Monthly
                        child: Container(
                          decoration: BoxDecoration(
                            color: value1 ? Colors.white : Colors.grey[800],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30)),
                          ),
                          child: Center(
                              child: FittedBox(
                            child: Text(
                              languageController
                                      .languageResponse.value.subscription ??
                                  '',
                              style: TextStyle(
                                  fontSize: 21,
                                  color:
                                      value1 ? Colors.grey[600] : Colors.white),
                            ),
                          )),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: FractionallySizedBox(
                      heightFactor: 1,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            value2 = true;
                            value1 = false;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: value2 ? Colors.white : Colors.grey[800],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30)),
                          ),
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: FittedBox(
                              child: Text(
                                languageController
                                        .languageResponse.value.convenienceFee ??
                                    '',
                                style: TextStyle(
                                    fontSize: 21,
                                    color:
                                        value2 ? Colors.grey[600] : Colors.white),
                              ),
                            ),
                          )),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: GetPlatform.isAndroid
                ? (widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                    17.9 *
                    1.3
                : (widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                    17.9 *
                    1.3,
          ),
          value1
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: orderController
                      .subscriptionResponse.value.serviceModel!.length,
                  itemBuilder: (context, data) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              orderController.subscriptionResponse.value
                                  .serviceModel![data].caption!,
                              style: const TextStyle(fontSize: 20),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              '₹' " " +
                                  orderController.subscriptionResponse.value
                                      .serviceModel![data].value!
                                      .toString(),
                              style: const TextStyle(fontSize: 20),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Switch(
                              value: isSwitched[data],
                              onChanged: (value) {
                                setState(() {
                                  isSwitched[data] = value;
                                });
                                if (isSwitched[data] == true) {
                                  orderController.updateMysubscription(
                                      orderController.subscriptionResponse.value
                                          .serviceModel![data].caption!,
                                      languageController.languagenum.toString());
                                }
                              },
                              activeTrackColor: Colors.lightGreenAccent,
                              activeColor: Colors.green,
                            ),
                          ],
                        ),
                      ],
                    );
                  })
              : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 80.0, right: 80.0),
                      child: Container(
                        height: getHeight(context) * 1.8,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey[500]!),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black45, offset: Offset(3, 5))
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: Center(
                              child: Text(
                                orderController
                                    .subscriptionResponse.value.serviceRemarks!,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
        ],
      ),
    );
  }
}
