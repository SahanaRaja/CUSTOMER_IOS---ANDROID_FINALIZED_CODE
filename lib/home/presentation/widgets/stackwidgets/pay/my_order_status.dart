// ignore_for_file: prefer_const_constructors

import 'package:customer_assist/core/app_colors.dart';
import 'package:customer_assist/core/app_constants.dart';
import 'package:customer_assist/home/data/configure/datasources/configure_data_remote_data_source.dart';
import 'package:customer_assist/home/presentation/controllers/configure_controller.dart';
import 'package:customer_assist/home/presentation/controllers/header_controller.dart';
import 'package:customer_assist/home/presentation/controllers/order_controller.dart';
import 'package:customer_assist/home/presentation/controllers/view_controller.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/first_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MyOrderStatus extends StatefulWidget {
  final double actualHeight;
  const MyOrderStatus({Key? key, required this.actualHeight}) : super(key: key);

  @override
  State<MyOrderStatus> createState() => _MyOrderStatusState();
}

class _MyOrderStatusState extends State<MyOrderStatus> {
  //final double actualHeight ;
  var viewController = Get.put(ViewController());
  var orderController = Get.put(OrderController());
  var headerController = Get.put(HeaderController());
  ConfigureController configureController = Get.find();
  var checklist;
  var actualHeight;
  List<bool>? reviewIdCheck;
  @override
  void initState() {
    actualHeight = widget.actualHeight;
    orderController.selectedList.clear();
    checklist = List.generate(
        orderController.myOrderEditResponse.value.length, (index) => false);

    print(checklist);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
       padding: GetPlatform.isAndroid
         ?const EdgeInsets.only(top: 5)
         :const EdgeInsets.only(),
      child: Column(children: [
        // FirstRowWidget(actualHeight: actualHeight, header: 'Delivery Pending', arrow: false),
        // SizedBox(
        //   height: MediaQuery.of(context).size.height * 0.02,
        // ),
        Container(
          height: MediaQuery.of(context).size.height * 0.043,
              width: MediaQuery.of(context).size.width * 0.99,
              color: AppColors.subHeaderContainer,
          child: Row(
            children: [
               InkWell(
                    onTap: () {
                     viewController.setView(OLDORDERS);
                     headerController.setSubHeaderLabel('Old Order');
                     
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      child: RotatedBox(
                      
                          quarterTurns: DateTime.june,
                      child: optionsController.backNew),
                      ),
                  ),
                  SizedBox(width: 70,),
              Text(
                "Old Order - Pending Delivery",
                // languageController.languageResponse.value.users ?? '',
                style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          height: GetPlatform.isAndroid
          ? MediaQuery.of(context).size.height * 0.77
         : MediaQuery.of(context).size.height * 0.77,
          child: GetX<OrderController>(
              init: OrderController(),
              initState: (_) {},
              builder: (shopController) {
                // children: [
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: orderController.myOrderEditResponse.value.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(children: [
                      Container(
                        margin: const EdgeInsets.only(
                            left: 10, right: 12, bottom: 5, top: 2),
                        width: GetPlatform.isAndroid
                            ? (actualHeight - 40) / 2
                            // 18.1
                            : (actualHeight -
                                    MediaQuery.of(context).padding.bottom) /
                                17.9 *
                                8.5,
                        height: GetPlatform.isAndroid
                            ? (actualHeight - 40) / 17.9 *
                                14.9
                            // 18.1
                            : (actualHeight -
                                    MediaQuery.of(context).padding.bottom) /
                                17.9 *
                                14.5,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                            ),
                            color: Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15))),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 32.0,
                            right: 10,
                          ),
                          child: Column(
                            children: [
                              Row(
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
                                                '------->${orderController.selectedList}');
                                            print('------->${checklist[index]}');
                                            setState(() {
                                              if (checklist[index] == true) {
                                                orderController.selectedList
                                                    .remove(index);
                                                checklist[index] = false;
                                              } else {
                                                orderController.selectedList
                                                    .add(index);
                                                checklist[index] = true;
                                              }
                                            });
                                            viewController.setView(MYORDERITEMS);
                                            headerController.setThirdHeaderLabel(
                                                'Edit Order');
                                          },
                                          child: Icon(
                                            Icons.done,
                                            color: checklist[index] == true
                                                ? Colors.green
                                                : const Color.fromARGB(
                                                    255, 255, 255, 255),
                                            size: 25,
                                          ),
                                        ),
                                      )),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Container(
                                    width: GetPlatform.isAndroid
                                        ? (actualHeight - 40) / 8
                                        // 18.1
                                        : (actualHeight -
                                                MediaQuery.of(context)
                                                    .padding
                                                    .bottom) /
                                            17.9 *
                                            2.5,
                                    height: GetPlatform.isAndroid
                                        ? (actualHeight - 40) / 7
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
                                            image: NetworkImage(orderController
                                                .myOrderEditResponse
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
                                        left: 15.0, top: 12, bottom: 5),
                                    child: Column(
                                      // mainAxisAlignment: MainAxisAlignment.space,
                                      children: [
                                        Container(
                                          width: GetPlatform.isAndroid
                                              ? (actualHeight - 40) / 17.9 *
                                                  3.85
                                              // 18.1
                                              : (actualHeight -
                                                      MediaQuery.of(context)
                                                          .padding
                                                          .bottom) /
                                                  17.9 *
                                                  3.85,
                                          height: GetPlatform.isAndroid
                                              ? (actualHeight - 40) / 22
                                              //  18.1
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
                                                    .myOrderEditResponse
                                                    .value[index]
                                                    .orderDate!
                                                // orderController
                                                //   .myOrderResponse.value[].orderDate!
                                                ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          width: GetPlatform.isAndroid
                                              ? (actualHeight - 40) / 17.9 *
                                                  3.85
                                              //  18.1
                                              : (actualHeight -
                                                      MediaQuery.of(context)
                                                          .padding
                                                          .bottom) /
                                                  17.9 *
                                                  3.85,
                                          height: GetPlatform.isAndroid
                                              ? (actualHeight - 40) / 22
                                              //  18.1
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
                                                    .myOrderEditResponse
                                                    .value[index]
                                                    .orderAmount!
                                                // orderController
                                                //   .myOrderResponse.value[].orderAmount!
                                                ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          width: GetPlatform.isAndroid
                                              ? (actualHeight - 40) /17.9 *
                                                  3.85
                                              //  18.1
                                              : (actualHeight -
                                                      MediaQuery.of(context)
                                                          .padding
                                                          .bottom) /
                                                  17.9 *
                                                  3.85,
                                          height: GetPlatform.isAndroid
                                              ? (actualHeight - 40) / 22
                                              //  18.1
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
                                                    .myOrderEditResponse
                                                    .value[index]
                                                    .orderStatus!
                                                // orderController
                                                //   .myOrderResponse.value[].orderStatus!
                                                ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 75,
                              ),
                              SizedBox(
                                  height: 125,
                                  width: 250,
                                  child: Center(
                                      child: Text(
                                    "Your Order Number : ${orderController.myOrderEditResponse.value[index].orderId!}",
                                    style: const TextStyle(fontSize: 18),
                                  ))),
                              QrImageView(
                                data: orderController.myOrderEditResponse
                                    .value[index].deliveryCode!,
                                version: QrVersions.auto,
                                size: 225.0,
                              ),
                              SizedBox(
                                height: ((widget.actualHeight -
                                            MediaQuery.of(context)
                                                .padding
                                                .bottom) /
                                        17.9) *
                                    2,
                                child: const Center(
                                  child: Text(
                                    "Delivery Security Code",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: ((widget.actualHeight -
                                            MediaQuery.of(context)
                                                .padding
                                                .bottom) /
                                        17.9) *
                                    .5,
                                child: Center(
                                  child: Text(
                                    orderController.myOrderEditResponse
                                        .value[index].deliveryCode!,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]);
                  },
                );
              }),
        ),
      ]),
    );
  }
}
