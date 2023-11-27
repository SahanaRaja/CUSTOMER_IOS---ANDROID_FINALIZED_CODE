import 'package:customer_assist/core/app_colors.dart';
import 'package:customer_assist/core/app_constants.dart';
import 'package:customer_assist/home/presentation/controllers/header_controller.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/sub_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/add_cart_review_controller.dart';
import '../../controllers/language_controller.dart';
import '../../controllers/options_controller.dart';
import '../../controllers/order_controller.dart';
import '../../controllers/payment_review_controller.dart';
import '../../controllers/view_controller.dart';
import 'first_row_widget.dart';

class WishListEdit extends StatefulWidget {
  final double actualHeight;
  const WishListEdit({Key? key, required this.actualHeight}) : super(key: key);

  @override
  State<WishListEdit> createState() => _WishListEditState();
}

class _WishListEditState extends State<WishListEdit> {
  AddCartReviewController addCartReviewController = Get.find();
  PaymentReviewController paymentReviewController = Get.find();
  OptionsController optionsController = Get.find();
  OrderController orderController = Get.find();
  ViewController viewController = Get.find();
  HeaderController headerController = Get.find();

  var languageController = Get.put(LanguageController());
  var checklist;

  List<bool>? reviewIdCheck;
  @override
  void initState() {
    orderController.selectedList.clear();
    checklist = List.generate(
        orderController.whishlistResponse.value.length, (index) => false);

    print(checklist);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     List<bool> whishlist = List.generate(100, (index) => false);
    return Stack(
      children: [
      SizedBox(
          width: MediaQuery.of(context).size.width,
          //height: widget.actualHeight * 0.75,
          height: GetPlatform.isAndroid
              ? ((widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                      17.9) *
                  17
              : ((widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                      17.9) *
                  17,
          child: Padding(
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
              //   actualHeight: widget.actualHeight,
              //   header: 'Edited Wish List',
              //   arrow: false,
          
              //   // languageController
              //   //  .languageResponse.value.reviewCart ??
              // ),
              const SizedBox(height: 5,),
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
                          ? ((widget.actualHeight -
                                      MediaQuery.of(context).padding.bottom) /
                                  17.9) *
                              0.99
                          : ((widget.actualHeight -
                                  MediaQuery.of(context).padding.bottom) /
                              16.5),
                      width: GetPlatform.isAndroid
                          ? ((widget.actualHeight -
                                      MediaQuery.of(context).padding.bottom) /
                                  17.9) *
                              1
                          : ((widget.actualHeight -
                                  MediaQuery.of(context).padding.bottom) /
                              17.9),
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 10, bottom: 10),
                      child: InkWell(
                          onTap: () {
                            viewController.setView(CAUTIONWISHLIST);
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
                        border:const Border(
                      right: BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                    )),
                    height: GetPlatform.isAndroid
                        ? ((widget.actualHeight - 40) / 17.9) * 0.99
                        : ((widget.actualHeight -
                                MediaQuery.of(context).padding.bottom) /
                            17),
                    width: GetPlatform.isAndroid
                        ? ((widget.actualHeight - 40) / 17.9) * 5.8
                        : ((widget.actualHeight -
                                    MediaQuery.of(context).padding.bottom) /
                                17.9) *
                            6.5,
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
                        border:const Border(
                      right: BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                    )),
                    height: GetPlatform.isAndroid
                        ? ((widget.actualHeight - 40) / 17.9) * 0.99
                        : ((widget.actualHeight -
                                MediaQuery.of(context).padding.bottom) /
                            17),
                    width: GetPlatform.isAndroid
                        ? ((widget.actualHeight - 40) / 17.9) * 1.85
                        : ((widget.actualHeight -
                                MediaQuery.of(context).padding.bottom) /
                            11.5),
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20),
                    child: Text(
                        languageController.languageResponse.value.price ??
                            '',
                        // languageController.languageResponse.value.qty ?? '',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              SizedBox(
                height: GetPlatform.isAndroid
                    ? ((widget.actualHeight - 40) / 17.9) * 13.4
                    : ((widget.actualHeight -
                                MediaQuery.of(context).padding.bottom) /
                            17.9) *
                        13.3,
                child: GetX<OrderController>(
                  init: OrderController(),
                  initState: (_) {},
                  builder: (_) {
                    return ListView.builder(
                                        shrinkWrap: true,
                                        itemCount:
                                            orderController.whishlistResponse.value.length,
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
                                                17.5,
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
                                                        ? ((widget.actualHeight - 40) / 17.9) *
                                                            1
                                                        : ((widget.actualHeight -
                                                                MediaQuery.of(context)
                                                                    .padding
                                                                    .bottom) /
                                                            16.5),
                                                    width: GetPlatform.isAndroid
                                                        ? ((widget.actualHeight - 40) / 17.9) *
                                                            1.07
                                                        : ((widget.actualHeight -
                                                                MediaQuery.of(context)
                                                                    .padding
                                                                    .bottom) /
                                                            17.9),
                                                    // alignment: Alignment.center,
                                                    padding: const EdgeInsets.only(
                                                        left: 12,
                                                        right: 12,
                                                        top: 13,
                                                        bottom: 13),
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
                                                          17),
                                                  width: GetPlatform.isAndroid
                                                      ? ((widget.actualHeight - 40) / 17.9) *
                                                          5.8
                                                      : ((widget.actualHeight -
                                                                  MediaQuery.of(context)
                                                                      .padding
                                                                      .bottom) /
                                                              17.9) *
                                                          6.2,
                                                  alignment: Alignment.centerLeft,
                                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                orderController.whishlistResponse
                                    .value[index].productName!,
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
                                      1.2
                                  : ((widget.actualHeight -
                                          MediaQuery.of(context)
                                              .padding
                                              .bottom) /
                                      17),
                              width: GetPlatform.isAndroid
                                  ? ((widget.actualHeight - 40) / 17.9) *
                                      1.85
                                  : ((widget.actualHeight -
                                          MediaQuery.of(context)
                                              .padding
                                              .bottom) /
                                      12),
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.only(left: 10),
                              child: Center(
                                child: Text(
                                    orderController.whishlistResponse
                                        .value[index].productRate
                                        .toStringAsFixed(2),
                                    style: const TextStyle(
                                        overflow: TextOverflow.ellipsis)),
                              ),
                            ),
                          ],
                        ),
                      );
                    });
                    }),
              ),
              
              Container(
                 decoration: BoxDecoration(border: Border(top: BorderSide(color: Color.fromARGB(255, 114, 111, 111)))),
                   
            height: GetPlatform.isAndroid
                ? (widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                    17.9
                : (widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                    17.9,
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(width: 10,),
                
               InkWell(
                onTap: () {
                 // keyboardController.setPicker(PAY);
                 
                },
                 child: Container(
                  height: 40,
                  width: 150,
                                      decoration:  BoxDecoration(
                                          color: AppColors.subHeaderContainer,
                                          border: Border.all(color: Colors.blueAccent),
                                          borderRadius:const BorderRadius.all(
                                              Radius.circular(25))),
                                      child: Center(
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
                                    SizedBox(width: 165,),
          
                                    InkWell(
                onTap: ()async {
                print(orderController.whishlistResponse.value);
            for (var i = 0;
                i < orderController.whishlistResponse.length;
                i++) {
             await addCartReviewController
                  .addToCartwish(orderController.whishlistResponse[i]);
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
                                      child: Center(
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
          ))
    ]);
  }
}
