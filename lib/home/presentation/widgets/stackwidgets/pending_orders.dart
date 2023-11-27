import 'package:customer_assist/core/app_colors.dart';
import 'package:customer_assist/home/presentation/controllers/header_controller.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/sub_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/app_constants.dart';
import '../../controllers/add_cart_review_controller.dart';
import '../../controllers/language_controller.dart';
import '../../controllers/order_controller.dart';
import '../../controllers/view_controller.dart';
import 'first_row_widget.dart';

class OrdersPending extends StatefulWidget {
  final double actualHeight;
  const OrdersPending({Key? key, required this.actualHeight}) : super(key: key);

  @override
  State<OrdersPending> createState() => _OrdersPendingState();
}

class _OrdersPendingState extends State<OrdersPending> {
  var languageController = Get.put(LanguageController());
  ViewController viewController = Get.find();
  OrderController orderController = Get.find();
  AddCartReviewController addCartReviewController = Get.find();
  List<Map<String, String>> plist = [];
  HeaderController headerController = Get.find();
  var checklist;

  var actualHeight;
  var selectedlist = [];
// final double actualHeight;

  @override
  void initState() {
    orderController.pendingEditsResponse.clear();
    actualHeight = widget.actualHeight;
    checklist = List.generate(
        orderController.pendingOutletResponse.value.length, (index) => false);

    print(checklist);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
      SizedBox(
          // color: Colors.red,
          width: MediaQuery.of(context).size.width,
          //height: widget.actualHeight * 0.75,
          child: Stack(alignment: Alignment.topCenter, children: [
            Padding(
               padding: GetPlatform.isAndroid
         ?const EdgeInsets.only(top: 5)
         :const EdgeInsets.only(),
              child: Column(
                children: [
                  Container(
            
              // margin: const EdgeInsets.only(right: 2),
             height: MediaQuery.of(context).size.height * 0.043,
              width: MediaQuery.of(context).size.width * 0.99,
              color: AppColors.subHeaderContainer,
              child: const Center(child: SubHeader())),
                  // FirstRowWidget(
                  //     actualHeight: widget.actualHeight, header: '', arrow: false
                  //     //languageController
                  //     //  .languageResponse.value.reviewCart ??
                  //     ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                      height: GetPlatform.isAndroid
                          ? ((widget.actualHeight - 40) / 17.9) * 12.8
                          //  18.1
                          : (widget.actualHeight -
                                  MediaQuery.of(context).padding.bottom) /
                              17.9 *
                              15.3,
                      child: GetX<OrderController>(
                          init: OrderController(),
                          initState: (_) {},
                          builder: (orderController) {
                            return ListView.builder(
                              itemCount: orderController
                                  .pendingOutletResponse.value.length,
                              itemBuilder: (BuildContext context, int index) {
                                return 
                                Column(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: GetPlatform.isAndroid
                                          ? (actualHeight - 40) / 2
                                          : (actualHeight -
                                                  MediaQuery.of(context)
                                                      .padding
                                                      .bottom) /
                                              17.9 *
                                              8.5,
                                      height: GetPlatform.isAndroid
                                          ? (actualHeight - 40) / 5.82
                                          : (actualHeight -
                                                  MediaQuery.of(context)
                                                      .padding
                                                      .bottom) /
                                              17.9 *
                                              3.2,
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
                                                child: InkWell(
                                                  onTap: () {
                                                    // print('------->${orderController
                                                    //         .pendingEditsResponse
                                                    //         .value}');
                                                    // print('------->${checklist[index]}');
                                                    setState(() {
                                                      orderController.fetchPendingOrders(languageController.languagenum.toString());
                                                      headerController.setSubHeaderLabel('Edit Pending Order');
                                                    
                                                    //   if (checklist[index] ==
                                                    //       true) {
                                                      
                                                    //     orderController
                                                    //         .pendingOrdersResponse
                                                    //         .remove(orderController
                                                    //             .pendingOutletResponse
                                                    //             .value[index]);
                                                    //     checklist[index] = false;
                                                    //   } else {
                                                    //     orderController
                                                    //         .pendingOrdersResponse
                                                    //         .add(orderController
                                                    //             .pendingOutletResponse
                                                    //             .value[index]);
                                                    //     checklist[index] = true;
                                                    //  }
                                                   });
                                                  },
                                                  child: Center(
                                                    child: Icon(
                                                      Icons.done,
                                                      color: checklist![index] ==
                                                              true
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
                                              margin: const EdgeInsets.only(
                                                  top: 5, bottom: 5),
                                              width: GetPlatform.isAndroid
                                                  ? (actualHeight - 40) / 6
                                                  // 18.1
                                                  : (actualHeight -
                                                          MediaQuery.of(context)
                                                              .padding
                                                              .bottom) /
                                                      17.9 *
                                                      2.5,
                                              height: GetPlatform.isAndroid
                                                  ? (actualHeight - 40) / 3
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
                                                              .pendingOutletResponse
                                                              .value[index]
                                                              .shopImage!)),
                                                  border: Border.all(
                                                    color: Colors.black,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(15))),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15.0, top: 10),
                                              child: Column(
                                                // mainAxisAlignment: MainAxisAlignment.space,
                                                children: [
                                                  Container(
                                                    width: GetPlatform.isAndroid
                                                        ? (actualHeight - 40) /
                                                            4.8
                                                        // 18.1
                                                        : (actualHeight -
                                                                MediaQuery.of(
                                                                        context)
                                                                    .padding
                                                                    .bottom) /
                                                            17.9 *
                                                            3.85,
                                                    height: GetPlatform.isAndroid
                                                        ? (actualHeight - 40) /
                                                            20.8
                                                        //18.1
                                                        : (actualHeight -
                                                                MediaQuery.of(
                                                                        context)
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
                                                          .pendingOutletResponse
                                                          .value[index]
                                                          .shopName!,style: TextStyle(fontSize: 20),overflow: TextOverflow.ellipsis,),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    width: GetPlatform.isAndroid
                                                        ? (actualHeight - 40) /
                                                            4.8
                                                        // 18.1
                                                        : (actualHeight -
                                                                MediaQuery.of(
                                                                        context)
                                                                    .padding
                                                                    .bottom) /
                                                            17.9 *
                                                            3.85,
                                                    height: GetPlatform.isAndroid
                                                        ? (actualHeight - 40) /
                                                            20.8
                                                        //18.1
                                                        : (actualHeight -
                                                                MediaQuery.of(
                                                                        context)
                                                                    .padding
                                                                    .bottom) /
                                                            17.9 *
                                                            0.76,
                                                    // decoration: BoxDecoration(
                                                    //   border: Border.all(
                                                    //     color: Colors.black,
                                                    //   ),
                                                    // ),
                                                    // child: Center(
                                                    //   child: Text(orderController
                                                    //       .pendingOutletResponse
                                                    //       .value[index]
                                                    //       .totalCost!.toString()),
                                                    // ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    width: GetPlatform.isAndroid
                                                        ? (actualHeight - 40) /
                                                            4.8
                                                        //18.1
                                                        : (actualHeight -
                                                                MediaQuery.of(
                                                                        context)
                                                                    .padding
                                                                    .bottom) /
                                                            17.9 *
                                                            3.85,
                                                    height: GetPlatform.isAndroid
                                                        ? (actualHeight - 40) /
                                                            20.8
                                                        //18.1
                                                        : (actualHeight -
                                                                MediaQuery.of(
                                                                        context)
                                                                    .padding
                                                                    .bottom) /
                                                            17.9 *
                                                            0.76,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        SizedBox(width: 80,),
                                                        Text('₹ ',style: TextStyle(fontSize: 20),),
                                                        Text(orderController
                                                            .pendingOutletResponse
                                                            .value[index]
                                                            .totalCost.toString(),style: TextStyle(fontSize: 20),),
                                                      ],
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
          ]))
    ]);
  }
}
