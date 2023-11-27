import 'package:customer_assist/core/app_colors.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/sub_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/add_cart_review_controller.dart';
import '../../../controllers/language_controller.dart';
import '../../../controllers/order_controller.dart';
import '../../../controllers/view_controller.dart';
import '../first_row_widget.dart';

class WishItems extends StatefulWidget {
  final double actualHeight;
  const WishItems({Key? key, required this.actualHeight}) : super(key: key);

  @override
  State<WishItems> createState() => _WishItemsState();
}

class _WishItemsState extends State<WishItems> {
  var languageController = Get.put(LanguageController());
  ViewController viewController = Get.find();
  OrderController orderController = Get.find();
  AddCartReviewController addCartReviewController = Get.find();
  List<Map<String, String>> wlist = [];
  var checklist;

  var actualHeight;

  @override
  void initState() {
    orderController.whishlistEditResponse.clear();
    actualHeight = widget.actualHeight;
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
          // color: Colors.red,
          width: MediaQuery.of(context).size.width,
          height: widget.actualHeight * 0.75,
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
                          // 18.1
                          : (widget.actualHeight -
                                  MediaQuery.of(context).padding.bottom) /
                              17.9 *
                              12.5,
                      child: GetX<OrderController>(
                        init: OrderController(),
                        initState: (_) {},
                        builder: (orderController) {
                          return ListView.builder(
                            itemCount:
                                orderController.whishlistResponse.value.length,
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
                                        ? (actualHeight - 40) / 5.82
                                        // 18.1
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
                                                  print('------->${orderController
                                                          .whishlistEditResponse
                                                          .value}');
                                                  print('------->${checklist[index]}');
                                                  setState(() {
                                                    if (checklist[index] ==
                                                        true) {
                                                      orderController
                                                          .whishlistEditResponse
                                                          .remove(orderController
                                                              .whishlistResponse
                                                              .value[index]);
                                                      checklist[index] = false;
                                                    } else {
                                                      orderController
                                                          .whishlistEditResponse
                                                          .add(orderController
                                                              .whishlistResponse
                                                              .value[index]);
                                                      checklist[index] = true;
                                                    }
                                                  });
                                                },
                                                child: Center(
                                                  child: Icon(
                                                    Icons.done,
                                                    color:
                                                        checklist[index] == true
                                                            ? Colors.green
                                                            : Colors.white,
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
                                                    image: NetworkImage(
                                                        orderController
                                                            .whishlistResponse
                                                            .value[index]
                                                            .imageUrl!),
                                                    fit: BoxFit.fill),
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
                                                        //  18.1
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
                                                      child: Text(
                                                        orderController
                                                            .whishlistResponse
                                                            .value[index]
                                                            .productName!,
                                                        textAlign:
                                                            TextAlign.center,
                                                        overflow:
                                                            TextOverflow.ellipsis,
                                                        maxLines: 2,
                                                      ),
                                                    )),
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
                                                        // 18.1
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
                                                          .whishlistResponse
                                                          .value[index]
                                                          .uom!),
                                                    )),
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
                                                        // 18.1
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
                                                          .whishlistResponse
                                                          .value[index]
                                                          .productRate!
                                                          .toString()),
                                                    ))
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
                        },
                      ))
                ],
              ),
            ),
          ]))
    ]);
  }
}


































