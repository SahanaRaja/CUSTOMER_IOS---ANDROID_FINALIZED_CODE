import 'package:customer_assist/home/presentation/controllers/add_cart_review_controller.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/controllers/order_controller.dart';
import 'package:customer_assist/home/presentation/controllers/shop_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/options_controller.dart';
import '../../../controllers/payment_review_controller.dart';
import '../first_row_widget.dart';

class filtershop extends StatefulWidget {
  final double actualHeight;
  const filtershop({super.key, required this.actualHeight});

  @override
  State<filtershop> createState() => _filtershopState();
}

class _filtershopState extends State<filtershop> {
  AddCartReviewController addCartReviewController = Get.find();
  PaymentReviewController paymentReviewController = Get.find();
  var languageController = Get.put(LanguageController());
  OptionsController optionsController = Get.find();
  OrderController orderController = Get.find();
  List<bool>? reviewIdCheck;
  ShopController shopController = Get.find();
  var checklist;

  @override
  void initState() {
     shopController.catalogueResponse.clear();
    checklist = List.generate(
        shopController.shoppingOutletResponse.length, (index) => false);
    // shopController.shoppingOutletResponse.value.length, (index) => false);
    print(checklist);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // SizedBox(
        //   height: GetPlatform.isAndroid
        //       ? ((widget.actualHeight - 40) / 17.9) * 14
        //       // 1.8
        //       : ((widget.actualHeight - MediaQuery.of(context).padding.bottom) /
        //               17.9) *
        //           14,
          //child: 
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Column(
                children: [
                  FirstRowWidget(
                      actualHeight: widget.actualHeight,
                      header: 'Apply Filter',
                      arrow: false),
                  Column(
                    children: [
                      SizedBox(
                          height: GetPlatform.isAndroid
                              ? ((widget.actualHeight - 40) / 17.9) * 13
                              : ((widget.actualHeight -
                                          MediaQuery.of(context)
                                              .padding
                                              .bottom) /
                                      17.9) *
                                  13,
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: shopController
                                  .shoppingOutletResponse.value.length,
                              itemBuilder:
                                  (BuildContext context, int itemindex) {
                                return Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 1, bottom: 2),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.26,
                              //          height: GetPlatform.isAndroid
                              // ? ((widget.actualHeight - 40) / 17.9) * 5
                              // : ((widget.actualHeight -
                              //             MediaQuery.of(context)
                              //                 .padding
                              //                 .bottom) /
                              //         17.9) *
                              //     5,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: const Color.fromARGB(
                                                255, 241, 231, 231),
                                          ),
                                          color: const Color.fromARGB(
                                              255, 117, 212, 219),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(15))),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 7, left: 1),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 100),
                                              child: Container(
                                                  margin: const EdgeInsets.only(
                                                      bottom: 28, left: 12),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      border: Border.all(),
                                                      boxShadow: const [
                                                        BoxShadow(
                                                            color: Colors.grey,
                                                            spreadRadius: 1,
                                                            blurRadius: 1,
                                                            offset:
                                                                Offset(4, 4))
                                                      ]),
                                                  height: 30,
                                                  width: 30,
                                                  child: InkWell(
                                                    onTap: () {
                                                      print('------->${shopController
                                                              .shoppingOutletResponse
                                                              .value}');
                                                      print('------->${shopController
                                                              .checklist[
                                                                  itemindex]}');
                                                      setState(() {
                                            //            if (checklist[itemindex] == true) {
                                            //   shopController.selectedList
                                            //       .remove(itemindex);
                                            //   checklist[itemindex] = false;
                                            // } else {
                                            //   shopController.selectedList
                                            //       .add(itemindex);
                                            //   checklist[itemindex] = true;
                                            // }
                                                        if (shopController
                                                                    .checklist[
                                                                itemindex] ==
                                                            true) {
                                                          shopController
                                                              .catalogueResponse
                                                              .remove(shopController
                                                                      .catalogueListResponse
                                                                      .value[
                                                                  itemindex]);
                                                          shopController
                                                                  .checklist[
                                                              itemindex] = false;
                                                        } else {
                                                          shopController
                                                              .catalogueResponse
                                                              .add(shopController
                                                                      .catalogueListResponse
                                                                      .value[
                                                                  itemindex]);
                                                          shopController
                                                                  .checklist[
                                                              itemindex] = true;
                                                        }
                                                      });
                                                    },
                                                    child: Center(
                                                      child: Icon(
                                                        Icons.done,
                                                        color: shopController
                                                                        .checklist[
                                                                    itemindex] ==
                                                                true
                                                            ? Colors.green
                                                            : const Color
                                                                    .fromARGB(
                                                                255,
                                                                255,
                                                                255,
                                                                255),
                                                        size: 25,
                                                      ),
                                                    ),
                                                  )),
                                            ),
                                            const SizedBox(
                                              width: 70,
                                            ),
                                            Column(
                                              children: [
                                                Container(
                                                  // decoration: BoxDecoration(
                                                  //   color: const Color.fromARGB(
                                                  //       255, 117, 212, 219),
                                                  //   // border: Border.all(),
                                                  // ),
                                                  height: 40,
                                                  width: 180,
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    // "",
                                                    shopController
                                                        .shoppingOutletResponse[
                                                            itemindex]
                                                        .shopName!,
                                                    style: const TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 0, 0, 0),
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Container(
                                                  decoration: const BoxDecoration(
                                                      // border: Border.all(),
                                                      ),
                                                  height: 70,
                                                  width: 180,
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        margin: const EdgeInsets
                                                            .only(top: 1),
                                                        height: 31,
                                                        width: 174,
                                                        alignment: Alignment
                                                            .centerRight,
                                                        child:  Text(
                                                           languageController
                                                                .languageResponse
                                                                .value
                                                                .distanceToShop ??'',
                                                         // " Distance to shop ",
                                                          style: const TextStyle(
                                                              color: Color
                                                                  .fromARGB(255,
                                                                      0, 0, 0),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal),
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: const EdgeInsets
                                                            .only(top: 3),
                                                        height: 30,
                                                        width: 174,
                                                        alignment: Alignment
                                                            .centerRight,
                                                        child:  Text(
                                                           languageController
                                                                .languageResponse
                                                                .value
                                                                .max_ProductAvailability ??'',
                                                         // " Max. product availability ",
                                                          style: const TextStyle(
                                                              color: Color
                                                                  .fromARGB(255,
                                                                      0, 0, 0),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Container(
                                                  decoration: const BoxDecoration(
                                                      // border: Border.all(),
                                                      ),
                                                  height: 78,
                                                  width: 180,
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        margin: const EdgeInsets
                                                            .only(top: 1),
                                                        height: 36,
                                                        width: 175,
                                                        alignment: Alignment
                                                            .centerRight,
                                                        child:  Text(
                                                         // " Lowest overall cost ",
                                                          languageController
                                                                .languageResponse
                                                                .value
                                                                .lowestOverallCost ??'',
                                                          style: const TextStyle(
                                                              color: Color
                                                                  .fromARGB(255,
                                                                      0, 0, 0),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal),
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: const EdgeInsets
                                                            .only(top: 1),
                                                        height: 36,
                                                        width: 175,
                                                        alignment: Alignment
                                                            .centerRight,
                                                        child:  FittedBox(
                                                          fit: BoxFit.fill,
                                                          child: Text(
                                                           // " Best Quality as per ratings ",
                                                            languageController
                                                                .languageResponse
                                                                .value
                                                                .bestQualityAsPerRatings ??'',
                                                            style: const TextStyle(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        0,
                                                                        0,
                                                                        0),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Container(
                                                  decoration: const BoxDecoration(
                                                      // border: Border.all(),
                                                      ),
                                                  height: 40,
                                                  width: 180,
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child:  Text(
                                                     languageController
                                                                .languageResponse
                                                                .value
                                                                .deliverySpeed ??'',
                                                   // " Delivery Speed ",
                                                    style: const TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 0, 0, 0),
                                                        fontWeight:
                                                            FontWeight.normal),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              width: 30,
                                            ),
                                            Column(
                                              children: [
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      top: 45),
                                                  decoration: BoxDecoration(
                                                    color: const Color.fromARGB(
                                                        255, 237, 240, 241),
                                                    border: Border.all(),
                                                  ),
                                                  height: 34,
                                                  width: 150,
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  padding:
                                                      const EdgeInsets.only(left: 5),
                                                  child: Text(
                                                    // "",
                                                    shopController
                                                        .shoppingOutletResponse[
                                                            itemindex]
                                                        .distance!,
                                                    style: const TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 0, 0, 0),
                                                        fontWeight:
                                                            FontWeight.normal),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 3,
                                                ),
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      top: 2.5),
                                                  decoration: BoxDecoration(
                                                    color: const Color.fromARGB(
                                                        255, 237, 240, 241),
                                                    border: Border.all(),
                                                  ),
                                                  height: 34,
                                                  width: 150,
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  padding:
                                                      const EdgeInsets.only(left: 5),
                                                  child: Text(
                                                    // "",
                                                    shopController
                                                        .shoppingOutletResponse[
                                                            itemindex]
                                                        .availability!,
                                                    style: const TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 0, 0, 0),
                                                        fontWeight:
                                                            FontWeight.normal),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 2,
                                                ),
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      top: 3),
                                                  decoration: BoxDecoration(
                                                    color: const Color.fromARGB(
                                                        255, 237, 240, 241),
                                                    border: Border.all(),
                                                  ),
                                                  height: 37,
                                                  width: 150,
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  padding:
                                                      const EdgeInsets.only(left: 5),
                                                  child: Text(
                                                    // "",
                                                    shopController
                                                        .shoppingOutletResponse[
                                                            itemindex]
                                                        .cost!
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 0, 0, 0),
                                                        fontWeight:
                                                            FontWeight.normal),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 2,
                                                ),
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      top: 2.5),
                                                  decoration: BoxDecoration(
                                                    color: const Color.fromARGB(
                                                        255, 237, 240, 241),
                                                    border: Border.all(),
                                                  ),
                                                  height: 37,
                                                  width: 150,
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  padding:
                                                      const EdgeInsets.only(left: 5),
                                                  child: Text(
                                                    // "",
                                                    shopController
                                                        .shoppingOutletResponse[
                                                            itemindex]
                                                        .quality
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 0, 0, 0),
                                                        fontWeight:
                                                            FontWeight.normal),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 2,
                                                ),
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      top: 6),
                                                  decoration: BoxDecoration(
                                                    color: const Color.fromARGB(
                                                        255, 237, 240, 241),
                                                    border: Border.all(),
                                                  ),
                                                  height: 40,
                                                  width: 150,
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  padding:
                                                      const EdgeInsets.only(left: 5),
                                                  child: Text(
                                                    // "",
                                                    shopController
                                                        .shoppingOutletResponse[
                                                            itemindex]
                                                        .speed!,
                                                    style: const TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 0, 0, 0),
                                                        fontWeight:
                                                            FontWeight.normal),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                );
                              }))
                    ],
                  ),
                ],
              ),
            ],
          ),
        //),
      ],
    );
  }
}
