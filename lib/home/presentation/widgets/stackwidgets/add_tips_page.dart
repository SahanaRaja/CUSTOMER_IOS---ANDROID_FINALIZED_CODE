import 'package:customer_assist/core/app_colors.dart';
import 'package:customer_assist/core/app_constants.dart';
import 'package:customer_assist/home/data/configure/datasources/configure_data_remote_data_source.dart';
import 'package:customer_assist/home/presentation/controllers/add_cart_review_controller.dart';
import 'package:customer_assist/home/presentation/controllers/configure_controller.dart';
import 'package:customer_assist/home/presentation/controllers/header_controller.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/controllers/payment_review_controller.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/first_row_widget.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/sub_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTipPage extends StatefulWidget {
  final double actualHeight;
  const AddTipPage({Key? key, required this.actualHeight}) : super(key: key);

  @override
  State<AddTipPage> createState() => _AddTipPageState();
}

class _AddTipPageState extends State<AddTipPage> {
  bool value1 = true;
  bool value2 = false;
  PaymentReviewController reviewController = Get.find();
  AddCartReviewController addCartReviewController = Get.find();
  HeaderController headerController = Get.find();
  ConfigureController configureController =Get.find();
  var languageController = Get.put(LanguageController());
  List updateProduct = [];
  bool noThankSelection = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
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
          //     actualHeight: widget.actualHeight,
          //     header: 
          //     //languageController.languageResponse.value.addTips ?? 
          //     'Add Tips',
          //     arrow: false),
          SizedBox(
            height:
                ((widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                        17.9) *
                    2.2,
          ),
          SizedBox(
           // color: Colors.amber,
             height:
                 MediaQuery.of(context).size.height * 0.056,
            // height:
            //     ((widget.actualHeight - MediaQuery.of(context).padding.bottom) /
            //             17.9) *
            //         1,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              InkWell(
                onTap: () {
                  setState(() {
                    noThankSelection = !noThankSelection;
                  });
                  if (noThankSelection == true) {
                    reviewController.setAddTip(0);
                  }
                },
                child: Container(
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
                    child: Icon(
                      Icons.done,
                      color:
                          noThankSelection == true ? Colors.green : Colors.white,
                      size: 25,
                    )),
              ),
              const SizedBox(
                width: 15,
              ),
              SizedBox(
                child: Text(
                  languageController.languageResponse.value.noThanks ?? '',
                  style: const TextStyle(fontSize: 18),
                ),
              )
            ]),
          ),
          SizedBox(
               height:
                  MediaQuery.of(context).size.height * 0.01,
                      ),
          Container(
            height:
                  MediaQuery.of(context).size.height * 0.047,
            width:
                ((widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                        17.9) *
                    7,
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
                      child: Container(
                        decoration: BoxDecoration(
                          color: value1 ? Colors.white : Color.fromARGB(255, 211, 208, 208),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30)),
                        ),
                        child: Center(
                            child: FittedBox(
                          child: Text(
                            languageController.languageResponse.value.byValue ??
                                '',
                            style: TextStyle(
                                fontSize: 21,
                                color: value1 ? const Color.fromARGB(255, 8, 7, 7) : Color.fromARGB(255, 129, 126, 126)),
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
                          color: value2 ? Colors.white : Color.fromARGB(255, 211, 208, 208),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30)),
                        ),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: FittedBox(
                            child: Text(
                              languageController
                                      .languageResponse.value.percentOfPurchase ??
                                  '',
                              style: TextStyle(
                                  fontSize: 21,
                                   color: value2 ? const Color.fromARGB(255, 8, 7, 7) : Color.fromARGB(255, 166, 162, 162)),
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
          SizedBox(
            height:
                  MediaQuery.of(context).size.height * 0.056,
          ),
          value1 == true ? byValueMethod() : byPercentageMethod(),
          //  SizedBox(
          //      height:
          //         MediaQuery.of(context).size.height * 0.059,
          //             ),
          // Container(
          //   height:
          //         MediaQuery.of(context).size.height * 0.047,
          //   width:
          //       ((widget.actualHeight - MediaQuery.of(context).padding.bottom) /
          //               17.9) *
          //           7,
          //   padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          //   decoration: BoxDecoration(
          //     color: Colors.grey[600],
          //     borderRadius: const BorderRadius.all(Radius.circular(30)),
          //   ),
          //   child: Row(
          //     children: [
          //       Expanded(
          //         child: FractionallySizedBox(
          //           heightFactor: 1,
          //           child: GestureDetector(
          //             onTap: () {
          //               setState(() {
          //                 value1 = true;
          //                 value2 = false;
          //               });
          //             },
          //             child: Container(
          //               decoration: BoxDecoration(
          //                 color: value1 ? Colors.white : Color.fromARGB(255, 211, 208, 208),
          //                 borderRadius:
          //                     const BorderRadius.all(Radius.circular(30)),
          //               ),
          //               child: Center(
          //                   child: FittedBox(
          //                 child: Text(
          //                   languageController.languageResponse.value.byValue ??
          //                       '',
          //                   style: TextStyle(
          //                       fontSize: 21,
          //                       color: value1 ? const Color.fromARGB(255, 8, 7, 7) : Color.fromARGB(255, 129, 126, 126)),
          //                 ),
          //               )),
          //             ),
          //           ),
          //         ),
          //       ),
          //       Expanded(
          //         child: FractionallySizedBox(
          //           heightFactor: 1,
          //           child: GestureDetector(
          //             onTap: () {
          //               setState(() {
          //                 value2 = true;
          //                 value1 = false;
          //               });
          //             },
          //             child: Container(
          //               decoration: BoxDecoration(
          //                 color: value2 ? Colors.white : Color.fromARGB(255, 211, 208, 208),
          //                 borderRadius:
          //                     const BorderRadius.all(Radius.circular(30)),
          //               ),
          //               child: Center(
          //                   child: Padding(
          //                 padding: const EdgeInsets.all(4.0),
          //                 child: FittedBox(
          //                   child: Text(
          //                     languageController
          //                             .languageResponse.value.percentOfPurchase ??
          //                         '',
          //                     style: TextStyle(
          //                         fontSize: 21,
          //                          color: value2 ? const Color.fromARGB(255, 8, 7, 7) : Color.fromARGB(255, 166, 162, 162)),
          //                   ),
          //                 ),
          //               )),
          //             ),
          //           ),
          //         ),
          //       )
          //     ],
          //   ),
          // ),
          //
          //  SizedBox(
          //   height:
          //         MediaQuery.of(context).size.height * 0.057,
          // ),
          // value1 == true ? byValueMethod() : byPercentageMethod(),
          SizedBox(
            //added by sahana
            height:GetPlatform.isAndroid
               ? ((widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                        17.9) *
                    7.5
              :((widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                        17.9) *
                    7.7
          ),
          Container(
            decoration: const BoxDecoration(
                border: Border(
              top: BorderSide(
                color: Colors.black,
                width: 0.5,
              ),
              // bottom: BorderSide(
              //   color: Colors.black,
              //   width: 0.5,
              // ),
            )),
            height:
                 MediaQuery.of(context).size.height * 0.050,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () async {
                     viewController.setPreviousView();
                     viewController.setView(REVIEWPAGE);
    
                   headerController.setSubHeaderLabel('Review Cart');
                     //added by saha
                   // headerController.setTimeChange();
                    // headerController.subHeaderLabel( configureController
                    // .subheaderResponse.value);
                   
                       // headerController.subThirdHeaderLabel('Overall');
                  },
                  child: Container(
                      decoration: const BoxDecoration(
                         ),
                      child: Container(
                      padding: EdgeInsets.only(top: 10),
                    height: 60,
                    width: 50,
                  decoration: const BoxDecoration(
                  ),
                  child: RotatedBox(
    
                        quarterTurns: DateTime.june,
                    child: optionsController.backNew))),
                ),
                 SizedBox(width: 370,),
                InkWell(
                  //added by sahana
                  onTap: () async {
                    // viewController.setView(SELECTCATAGORYPAGE);
                    // headerController.subHeaderLabel( configureController
                    // .subheaderResponse.value);
                    for (var element
                        in addCartReviewController.tableLength.value) {
                      updateProduct.add({
                        "PRODUCT_CODE": element['PRODUCT_CODE'],
                        "PRODUCT_QUANTITY": element['QUANTITY']
                      });
                    }
    
                    reviewController.fetchUpdateProductDetails(
                        updateProduct, languageController.languagenum.toString());
                        headerController.subHeaderLabel('Review Payment');
                  },
                  child: Container(
                      decoration: const BoxDecoration(
                         ),
                      child: Container(
                      padding: EdgeInsets.only(top: 10),
                    height: 60,
                    width: 50,
                  decoration: const BoxDecoration(
                  ),
                  child: RotatedBox(
    
                        quarterTurns: DateTime.april,
                    child: optionsController.backNew))),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  byValueMethod() {
    if (reviewController.addTipsResponse.value.status!.tipsAmount!
            .toUpperCase() ==
        'YES') {
      return SizedBox(
          height:
                MediaQuery.of(context).size.height * 0.056,
          width:
              ((widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                      17.9) *
                  7,
          child: GetX<PaymentReviewController>(
            init: PaymentReviewController(),
            initState: (_) {},
            builder: (controller) {
              return GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  // separatorBuilder: (BuildContext context, int index) =>
                  //     const Divider(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          print(controller.addTipsResponse.value.status!
                              .tipsValue![index].value!);
                          reviewController.setAddTip(int.parse(reviewController
                              .addTipsResponse
                              .value
                              .status!
                              .tipsValue![index]
                              .value!));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(),
                            color: Colors.grey[300],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30)),
                          ),
                          height: ((widget.actualHeight -
                                      MediaQuery.of(context).padding.bottom) /
                                  17.9) *
                              1, //your width size,
                          width: ((widget.actualHeight -
                                      MediaQuery.of(context).padding.bottom) /
                                  17.9) *
                              1,
                          child: Center(
                              child: Text(
                            '₹ ${controller.addTipsResponse.value.status!.tipsValue![index].value!}',
                            style: const TextStyle(fontSize: 18),
                          )),
                        ),
                      ),
                    );
                  },
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 2 / 3,
                  ),
                  itemCount: controller
                      .addTipsResponse.value.status!.tipsValue!.length);
            },
          ));
    } else {
      return SizedBox(
        height: ((widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                17.9) *
            1,
        width: ((widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                17.9) *
            7,
      );
    }
  }

  byPercentageMethod() {
    if (reviewController.addTipsResponse.value.status!.tipsPercentage!
            .toUpperCase() ==
        'YES') {
      return SizedBox(
          height:
                MediaQuery.of(context).size.height * 0.056,
          width:
              ((widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                      17.9) *
                  7,
          child: GetX<PaymentReviewController>(
            init: PaymentReviewController(),
            initState: (_) {},
            builder: (controller) {
              return GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  // separatorBuilder: (BuildContext context, int index) =>
                  //     const Divider(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          print(controller.addTipsResponse.value.status!
                              .tipsValue![index].value!);
                          reviewController.setAddTip(int.parse(reviewController
                              .addTipsResponse
                              .value
                              .status!
                              .tipsValue![index]
                              .value!));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(),
                            color: Colors.grey[300],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30)),
                          ),
                          height: ((widget.actualHeight -
                                      MediaQuery.of(context).padding.bottom) /
                                  17.9) *
                              1, //your width size,
                          width: ((widget.actualHeight -
                                      MediaQuery.of(context).padding.bottom) /
                                  17.9) *
                              1,
                          child: Center(
                              child: Text(
                            '₹ ${controller.addTipsResponse.value.status!.tipsValue![index].value!}',
                            style: const TextStyle(fontSize: 18),
                          )),
                        ),
                      ),
                    );
                  },
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 2 / 3,
                  ),
                  itemCount: controller
                      .addTipsResponse.value.status!.tipsValue!.length);
            },
          ));
    } else {
      return SizedBox(
        height: ((widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                17.9) *
            1,
        width: ((widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                17.9) *
            7,
      );
    }
  }
}
