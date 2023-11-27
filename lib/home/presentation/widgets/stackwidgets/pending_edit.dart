import 'package:customer_assist/home/presentation/controllers/header_controller.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/sub_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/app_constants.dart';
import '../../controllers/add_cart_review_controller.dart';
import '../../controllers/language_controller.dart';
import '../../controllers/options_controller.dart';
import '../../controllers/order_controller.dart';
import '../../controllers/payment_review_controller.dart';
import '../../controllers/view_controller.dart';
import 'first_row_widget.dart';

class pendingEdit extends StatefulWidget {
  final double actualHeight;
  const pendingEdit({Key? key, required this.actualHeight}) : super(key: key);
  @override
  State<pendingEdit> createState() => _pendingEditState();
}

class _pendingEditState extends State<pendingEdit> {
  AddCartReviewController addCartReviewController = Get.find();
  PaymentReviewController paymentReviewController = Get.find();
  OptionsController optionsController = Get.find();
  OrderController orderController = Get.find();
  ViewController viewController = Get.find();
  HeaderController headerController = Get.find();

  var languageController = Get.put(LanguageController());
  var checklist;
   var actualHeight;

  List<bool>? reviewIdCheck;
  @override
  void initState() {
    orderController.selectedList.clear();
    checklist = List.generate(
        orderController.pendingEditsResponse.value.length, (index) => false);

    print(checklist);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
          width: MediaQuery.of(context).size.width,
          //height: widget.actualHeight * 0.75,
          // height: GetPlatform.isAndroid
          //     ? ((widget.actualHeight - 40) / 17.9) * 1.8
          //     : ((widget.actualHeight - MediaQuery.of(context).padding.bottom) /
          //             17.9) *
          //         14,
          child: Padding(
            padding: GetPlatform.isAndroid
         ?const EdgeInsets.only(top: 5)
         :const EdgeInsets.only(),
            child: Column(
              children: [
                // Container(
                //   height: 200,
                //   // decoration: BoxDecoration(
                //   //                           border: Border.all(
                //   //                             color: Colors.black,
                //   //                           ),),
                //      child: Column(
                //        children: [
                //          Container(
                //           height: 150,
                //           width: 460,
                //            decoration: BoxDecoration(
                //                                 border: Border.all(
                //                                   color: Colors.black,
                //                                 ),borderRadius: BorderRadius.circular(15)
                //                                 ),
                          
          
                //          ),
                //        ],
                //      ),                     
          
                // ),
                
               Container(
          
            // margin: const EdgeInsets.only(right: 2),
           height: MediaQuery.of(context).size.height * 0.043,
              width: MediaQuery.of(context).size.width * 0.99,
              color: AppColors.subHeaderContainer,
            child: Row(
              children: [
                InkWell(
                    onTap: () {
                     viewController.setView(PENDINGORDERS);
                     headerController.setSubHeaderLabel(languageController.languageResponse.value.pendingOrders?? '');
                     
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      child: RotatedBox(
                      
                          quarterTurns: DateTime.june,
                      child: optionsController.backNew),
                      ),
                  ),
                 const SizedBox(width: 130,),
                SubHeader(),
              ],
            )),
              // FirstRowWidget(
              //     actualHeight: widget.actualHeight,
              //     header: 'Pending Order',
              //     arrow: false
              //     // languageController
              //     //  .languageResponse.value.reviewCart ??
              //     ),
              SizedBox(height: 5,),
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
                    child: Container(
                      height: GetPlatform.isAndroid
                          ? ((widget.actualHeight - 40) / 17.9) * 0.99
                          : ((widget.actualHeight -
                                  MediaQuery.of(context).padding.bottom) /
                              17.9),
                      width: GetPlatform.isAndroid
                          ? ((widget.actualHeight - 40) / 17.9) * 1
                          : ((widget.actualHeight -
                                  MediaQuery.of(context).padding.bottom) /
                              17.9),
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 10, bottom: 10),
                      child: InkWell(
                          onTap: () {
                            viewController.setView(CAUTIONPENDING);
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: const Color.fromARGB(255, 249, 249, 249)),
                            ),
                            child: optionsController.addbookdelete,
                          )),
                    ),
                  ),
                  Container(
                    decoration:  BoxDecoration(
                       color: Colors.yellow[300],
                        border: Border(
                      right: BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                    )),
                    height: GetPlatform.isAndroid
                        ? ((widget.actualHeight - 40) / 17.9) * 0.99
                        : ((widget.actualHeight -
                                MediaQuery.of(context).padding.bottom) /
                            17.9),
                    width: GetPlatform.isAndroid
                        ? ((widget.actualHeight - 40) / 17.9) * 4.6
                        : ((widget.actualHeight -
                                    MediaQuery.of(context).padding.bottom) /
                                17.9) *
                            5,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 10),
                    child: const Text(
                      // languageController.languageResponse.value.itemName ??
                      'Product',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    decoration:  BoxDecoration(
                        color: Colors.yellow[300],
                        border: Border(
                      right: BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                    )),
                    height: GetPlatform.isAndroid
                        ? ((widget.actualHeight - 40) / 17.9) * 0.99
                        : ((widget.actualHeight -
                                MediaQuery.of(context).padding.bottom) /
                            17.9),
                    width: GetPlatform.isAndroid
                        ? ((widget.actualHeight - 40) / 17.9) * 1.5
                        : ((widget.actualHeight -
                                MediaQuery.of(context).padding.bottom) /
                            11.5),
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 10),
                    child: const Text('Quantity',
                        // languageController.languageResponse.value.qty ?? '',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                   Container(
                    decoration:  BoxDecoration(
                        color: Colors.yellow[300],
                        border: Border(
                      right: BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                    )),
                    height: GetPlatform.isAndroid
                        ? ((widget.actualHeight - 40) / 17.9) * 0.99
                        : ((widget.actualHeight -
                                MediaQuery.of(context).padding.bottom) /
                            17.9),
                    width: GetPlatform.isAndroid
                        ? ((widget.actualHeight - 40) / 17.9) * 1.6
                        : ((widget.actualHeight -
                                MediaQuery.of(context).padding.bottom) /
                            11.5),
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 10),
                    child: const Text('Price',
                        // languageController.languageResponse.value.qty ?? '',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              SizedBox(
                height: GetPlatform.isAndroid
                    ? ((widget.actualHeight - 40) / 17.9) * 10
                    : ((widget.actualHeight -
                                MediaQuery.of(context).padding.bottom) /
                            17.9) *
                        9.7,
                child: Stack(
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount:
                            orderController.pendingEditsResponse.value.length,
                        itemBuilder: (BuildContext context, int index) {
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
                                18.5,
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    // print("nbvsmdnbvmd");
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
                                        ? ((widget.actualHeight - 40) / 17.9) *
                                            0.99
                                        : ((widget.actualHeight -
                                                MediaQuery.of(context)
                                                    .padding
                                                    .bottom) /
                                            17.9),
                                    width: GetPlatform.isAndroid
                                        ? ((widget.actualHeight - 40) / 17.9) *
                                            1
                                        : ((widget.actualHeight -
                                                MediaQuery.of(context)
                                                    .padding
                                                    .bottom) /
                                            17.9),
                                    // alignment: Alignment.center,
                                    padding: const EdgeInsets.only(
                                        left: 10,
                                        right: 10,
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
                                        print('------->${orderController.selectedList}');
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
                                      },
                                      child: Container(
                                        height: 20,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Colors.blueAccent),
                                        ),
                                        child: Icon(
                                          Icons.done,
                                          color: checklist[index] == true
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
                                          0.99
                                      : ((widget.actualHeight -
                                              MediaQuery.of(context)
                                                  .padding
                                                  .bottom) /
                                          17.2),
                                  width: GetPlatform.isAndroid
                                      ? ((widget.actualHeight - 40) / 17.9) * 4.62
                                      : ((widget.actualHeight -
                                                  MediaQuery.of(context)
                                                      .padding
                                                      .bottom) /
                                              17.9) *
                                          4.75,
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    orderController.pendingEditsResponse
                                        .value[index].itemName!,
                                    style: const TextStyle(
                                        overflow: TextOverflow.ellipsis),
                                    maxLines: 1,
                                    textAlign: TextAlign.center,
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
                                          0.99
                                      //1.8
                                      : ((widget.actualHeight -
                                              MediaQuery.of(context)
                                                  .padding
                                                  .bottom) /
                                          17.9),
                                  width: GetPlatform.isAndroid
                                      ? ((widget.actualHeight - 40) / 17.9) *
                                          1.5
                                      : ((widget.actualHeight -
                                              MediaQuery.of(context)
                                                  .padding
                                                  .bottom) /
                                          12),
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Center(
                                    child: Text(
                                        orderController.pendingEditsResponse
                                            .value[index].itemQty!
                                            .toString(),
                                        style: const TextStyle(
                                            overflow: TextOverflow.ellipsis)),
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
                                          0.99
                                      //1.8
                                      : ((widget.actualHeight -
                                              MediaQuery.of(context)
                                                  .padding
                                                  .bottom) /
                                          17.9),
                                  width: GetPlatform.isAndroid
                                      ? ((widget.actualHeight - 40) / 17.9) *
                                          1.6
                                      : ((widget.actualHeight -
                                              MediaQuery.of(context)
                                                  .padding
                                                  .bottom) /
                                          12),
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Center(
                                    child: Text(
                                        orderController.pendingEditsResponse
                                            .value[index].itemPrice!
                                            .toString(),
                                        style: const TextStyle(
                                            overflow: TextOverflow.ellipsis)),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  ],
                ),
              ),
               SizedBox(
            height: GetPlatform.isAndroid
                ? (widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                    17.9 *
                    3.3
                : (widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                    17.9 *
                    3.7,
                  ),
               Container(
                 decoration:const BoxDecoration(border: Border(top: BorderSide(color: Color.fromARGB(255, 114, 111, 111)))),
                   
            height: GetPlatform.isAndroid
                ? (widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                    17.9
                : (widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                    17.9,
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
               const SizedBox(width: 10,),
                
               InkWell(
                onTap: () {
                 // keyboardController.setPicker(PAY);
                 viewController.setView(PENDINGORDERS);
                 headerController.setSubHeaderLabel(languageController.languageResponse.value.pendingOrders??'');
                },
                 child: Container(
                  height: 40,
                  width: 150,
                                      decoration:  BoxDecoration(
                                          color: AppColors.subHeaderContainer,
                                          border: Border.all(color: Colors.blueAccent),
                                          borderRadius:const BorderRadius.all(
                                              Radius.circular(25))),
                                      child:const Center(
                                        child: Text(
                                          // languageController.languageResponse.value
                                          //         .pay ??
                                              'Close',
                                          style:  TextStyle(
                                              color: Color.fromARGB(255, 6, 6, 6),
                                              fontSize: 20,
                                              ),
                                        ),
                                      )),
               ),
                                    const SizedBox(width: 165,),
          
                                    InkWell(
                onTap: ()async {
                print(orderController.pendingEditsResponse.value);
            for (var i = 0;
                i < orderController.pendingEditsResponse.length;
                i++) {
             await addCartReviewController
                  .addToCarpending(orderController.pendingEditsResponse[i]);
            }
             
            await addCartReviewController.getReviewCartItems(false);
                   headerController.subHeaderLabel('Review Cart');
              viewController.setView(REVIEWPAGE);
             // optionsController.getReviewcart();
                  // optionsController.setOptionList(REVIEWCART);
                  // optionsController.optionIndexSetter(0);
                 
                },
                 child: Container(
                  height: 40,
                  width: 150,
                                      decoration:  BoxDecoration(
                                          color: AppColors.subHeaderContainer,
                                          border: Border.all(color: Colors.blueAccent),
                                          borderRadius:const BorderRadius.all(
                                              Radius.circular(25))),
                                      child:const Center(
                                        child: Text(
                                          // languageController.languageResponse.value
                                          //         .pay ??
                                              'Add to Cart',
                                          style:  TextStyle(
                                              color: Color.fromARGB(255, 6, 6, 6),
                                              fontSize: 20,
                                              ),
                                        ),
                                      )),
               ),
                
              ],
            ),
                  )
            ]
            ),
          )
          )
    ]);
  }
}
