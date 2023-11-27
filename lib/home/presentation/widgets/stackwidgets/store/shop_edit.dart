import 'package:customer_assist/core/app_constants.dart';
import 'package:customer_assist/home/presentation/controllers/add_cart_review_controller.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/controllers/shop_controller.dart';
import 'package:customer_assist/home/presentation/controllers/view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/options_controller.dart';
import '../../../controllers/payment_review_controller.dart';
import '../first_row_widget.dart';

class editedshop extends StatefulWidget {
  final double actualHeight;
  const editedshop({super.key, required this.actualHeight});

  @override
  State<editedshop> createState() => _editedshopState();
}

class _editedshopState extends State<editedshop> {
  AddCartReviewController addCartReviewController = Get.find();
  ViewController viewController = Get.find();
  PaymentReviewController paymentReviewController = Get.find();
  var languageController = Get.put(LanguageController());
  OptionsController optionsController = Get.find();
  List<bool>? reviewIdCheck;
  ShopController shopController = Get.find();
  var checklist;

  @override
  void initState() {
    shopController.selectedList.clear();
    checklist = List.generate(
        shopController.catalogueResponse.value.length, (index) => false);

    print(checklist);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: GetPlatform.isAndroid
              ? ((widget.actualHeight - 40) / 17.9) * 14.1
              //  1.8
              : ((widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                      17.9) *
                  14.5,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Column(
                children: [
                  FirstRowWidget(
                      actualHeight: widget.actualHeight,
                      header: 'Edited List',
                      // languageController
                      //     .languageResponse.value.reviewCart ??
                      arrow: false),
                      SizedBox(
                        height: GetPlatform.isAndroid
                        ? 5
                       : 8,),
                  Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            border: Border(
                          right: BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                        )),
                        // child: const Text('    '),
                        height: GetPlatform.isAndroid
                            ? ((widget.actualHeight - 40) / 17.9) * 1
                            // 1.8
                            : ((widget.actualHeight -
                                    MediaQuery.of(context).padding.bottom) /
                                17.9),
                        width: GetPlatform.isAndroid
                            ? ((widget.actualHeight - 40) / 17.9) * 1.2
                            : ((widget.actualHeight -
                                    MediaQuery.of(context).padding.bottom) /
                                17.9),

                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 10, bottom: 10),
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: const Color.fromARGB(255, 249, 249, 249)),
                          ),
                          child: InkWell(
                            onTap: () {
                              print("**************");
                              viewController.setView(CAUTIONSHOPLIST);
                            },
                            child: optionsController.delete,
                            // color: Color.fromARGB(255, 209, 27, 27),
                            // size: 25,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.yellow[300],
                            border: const Border(
                              right: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                            )),
                        height: GetPlatform.isAndroid
                            ? ((widget.actualHeight - 40) / 17.9) * 1
                            // 1.8
                            : ((widget.actualHeight -
                                    MediaQuery.of(context).padding.bottom) /
                                17.9),
                        width: GetPlatform.isAndroid
                            ? ((widget.actualHeight - 40) / 17.9) * 4.5
                            // 1.8
                            : ((widget.actualHeight -
                                        MediaQuery.of(context).padding.bottom) /
                                    17.9) *
                                4.8,
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          languageController.languageResponse.value.itemName ??
                              '',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.yellow[300],
                            border: const Border(
                              right: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                            )),
                        height: GetPlatform.isAndroid
                            ? ((widget.actualHeight - 40) / 17.9) * 1
                            //  1.8
                            : ((widget.actualHeight -
                                    MediaQuery.of(context).padding.bottom) /
                                17.9),
                        width: GetPlatform.isAndroid
                            ? ((widget.actualHeight - 40) / 17.9) * 1.8
                            : ((widget.actualHeight -
                                    MediaQuery.of(context).padding.bottom) /
                                11),
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 10),
                        child: const Text('SKU',
                            // languageController.languageResponse.value.qty ?? '',
                            style:
                                TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.yellow[300],
                            border: const Border(
                              right: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                            )),
                        height: GetPlatform.isAndroid
                            ? ((widget.actualHeight - 40) / 17.9) * 1
                            // 1.8
                            : ((widget.actualHeight -
                                    MediaQuery.of(context).padding.bottom) /
                                17.9),
                        width: GetPlatform.isAndroid
                            ? ((widget.actualHeight - 40) / 17.9) * 1.8
                            : ((widget.actualHeight -
                                    MediaQuery.of(context).padding.bottom) /
                                11),
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 10),
                        child: const Text(
                            // languageController.languageResponse.value.price ??
                            'Price',
                            style:
                                TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: GetPlatform.isAndroid
                        ? ((widget.actualHeight - 40) / 17.9) * 11.2
                        // 1.8
                        : ((widget.actualHeight -
                                    MediaQuery.of(context).padding.bottom) /
                                17.9) *
                            12,
                    child: Stack(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount:
                              shopController.catalogueResponse.value.length,
                          itemBuilder: (buildContext, data) {
                            return Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey[400]!,
                                    width: 0.5,
                                  ),
                                  top: BorderSide(
                                    color: Colors.grey[400]!,
                                    width: 1,
                                  ),
                                ),
                              ),
                              height: (widget.actualHeight -
                                      MediaQuery.of(context).padding.bottom) /
                                  16,
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      print("nbvsmdnbvmd");
                                      // setState(() {
                                      //   reviewIdCheck![data] =
                                      //       !reviewIdCheck![data];
                                      // });
                                      // if (reviewIdCheck![data] == true) {
                                      //   print(addCartReviewController
                                      //       .tableLength
                                      //       .value[data]['ITEMS_ID']);
                                      //   addCartReviewController
                                      //       .deleteOrderedItem([
                                      //     addCartReviewController.tableLength
                                      //         .value[data]['ITEMS_ID']
                                      //   ]);
                                      // }
                                    },
                                    child: Container(
                                      height: GetPlatform.isAndroid
                                          ? ((widget.actualHeight - 40) /
                                                  17.9) *
                                              1
                                          // 1.8
                                          : ((widget.actualHeight -
                                                  MediaQuery.of(context)
                                                      .padding
                                                      .bottom) /
                                              17.9),
                                      width: GetPlatform.isAndroid
                                          ? ((widget.actualHeight - 40) /
                                                  17.9) *
                                              1.2
                                          // 1.8
                                          : ((widget.actualHeight -
                                                  MediaQuery.of(context)
                                                      .padding
                                                      .bottom) /
                                              17.9),
                                      // alignment: Alignment.center,
                                      padding: const EdgeInsets.only(
                                          left: 15,
                                          right: 15,
                                          top: 10,
                                          bottom: 10),
                                      decoration: const BoxDecoration(
                                          border: Border(
                                        right: BorderSide(
                                          color: Colors.black,
                                          width: 1,
                                        ),
                                      )),
                                      child: InkWell(
                                        onTap: () {
                                          print('------->${shopController.selectedList}');
                                          print('------->${checklist[data]}');
                                          setState(() {
                                            if (checklist[data] == true) {
                                              shopController.selectedList
                                                  .remove(data);
                                              checklist[data] = false;
                                            } else {
                                              shopController.selectedList
                                                  .add(data);
                                              checklist[data] = true;
                                            }
                                          });
                                        },
                                        child: Container(
                                          height: 20,
                                          width: 40,
                                          // height: GetPlatform.isAndroid
                                          //     ? ((widget.actualHeight - 40) /
                                          //             17.9) *
                                          //         2
                                          //     // 1.8
                                          //     : ((widget.actualHeight -
                                          //             MediaQuery.of(context)
                                          //                 .padding
                                          //                 .bottom) /
                                          //         17.9),
                                          // width: GetPlatform.isAndroid
                                          //     ? ((widget.actualHeight - 40) /
                                          //             17.9) *
                                          //         2
                                          //     // 1.8
                                          //     : ((widget.actualHeight -
                                          //             MediaQuery.of(context)
                                          //                 .padding
                                          //                 .bottom) /
                                          //         17.9),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                color: Colors.blueAccent),
                                          ),
                                          child: Icon(
                                            Icons.done,
                                            color: checklist[data] == true
                                                ? Colors.green
                                                : const Color.fromARGB(
                                                    255, 255, 255, 255),
                                            size: 25,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(
                                        border: Border(
                                      right: BorderSide(
                                        color: Colors.black,
                                        width: 1,
                                      ),
                                    )),
                                    height: GetPlatform.isAndroid
                                        ? ((widget.actualHeight - 40) / 17.9) *
                                            2
                                        // 1.8
                                        : ((widget.actualHeight -
                                                MediaQuery.of(context)
                                                    .padding
                                                    .bottom) /
                                            17.9),
                                    width: GetPlatform.isAndroid
                                        ? ((widget.actualHeight - 40) / 17.9) *
                                            4.5
                                        // 1.8
                                        : ((widget.actualHeight -
                                                    MediaQuery.of(context)
                                                        .padding
                                                        .bottom) /
                                                17.9) *
                                            4.8,
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      shopController.catalogueResponse
                                          .value[data].productname!,
                                      style: const TextStyle(
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(
                                        border: Border(
                                      right: BorderSide(
                                        color: Colors.black,
                                        width: 1,
                                      ),
                                    )),
                                    height: GetPlatform.isAndroid
                                        ? ((widget.actualHeight - 40) / 17.9) *
                                            1.8
                                        : ((widget.actualHeight -
                                                MediaQuery.of(context)
                                                    .padding
                                                    .bottom) /
                                            17.9),
                                    width: GetPlatform.isAndroid
                                        ? ((widget.actualHeight - 40) / 17.9) *
                                            1.8
                                        : ((widget.actualHeight -
                                                MediaQuery.of(context)
                                                    .padding
                                                    .bottom) /
                                            11),
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(shopController
                                        .catalogueResponse.value[data].uom!),
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(
                                        border: Border(
                                      right: BorderSide(
                                        color: Colors.black,
                                        width: 1,
                                      ),
                                    )),
                                    height: GetPlatform.isAndroid
                                        ? ((widget.actualHeight - 40) / 17.9) *
                                            1.8
                                        : ((widget.actualHeight -
                                                MediaQuery.of(context)
                                                    .padding
                                                    .bottom) /
                                            17.9),
                                    width: GetPlatform.isAndroid
                                        ? ((widget.actualHeight - 40) / 17.9) *
                                            1.8
                                        : ((widget.actualHeight -
                                                MediaQuery.of(context)
                                                    .padding
                                                    .bottom) /
                                            11),
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(shopController
                                        .catalogueResponse.value[data].productRate!
                                        .toString()),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
