// ignore_for_file: invalid_use_of_protected_member, non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:customer_assist/home/presentation/controllers/add_cart_review_controller.dart';
import 'package:customer_assist/home/presentation/controllers/configure_controller.dart';
import 'package:customer_assist/home/presentation/controllers/header_controller.dart';
import 'package:customer_assist/home/presentation/controllers/options_controller.dart';
import 'package:customer_assist/home/presentation/controllers/order_controller.dart';
import 'package:customer_assist/home/presentation/controllers/payment_review_controller.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/controllers/shop_controller.dart';
import 'package:customer_assist/home/presentation/controllers/view_controller.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/first_row_widget.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/sub_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/app_colors.dart';
import '../../../../../core/app_constants.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../controllers/keyboard_controller.dart';
import '../../keyboard/alpha_capital_letters.dart';
import '../../keyboard/alpha_small_letters.dart';
import '../../keyboard/numeral_special_char.dart';

// ViewOrderBloc vOB = sl<ViewOrderBloc>();

class ViewOrderWidget extends StatefulWidget {
  final double actualHeight;
  const ViewOrderWidget({Key? key, required this.actualHeight})
      : super(key: key);
  @override
  _ViewOrderWidgetState createState() => _ViewOrderWidgetState();
}

class _ViewOrderWidgetState extends State<ViewOrderWidget> {
  AddCartReviewController addCartReviewController = Get.find();
  PaymentReviewController paymentReviewController = Get.find();
  var languageController = Get.put(LanguageController());
  OptionsController optionsController = Get.find();
  ViewController viewController = Get.find();
  HeaderController headerController = Get.find();
  ConfigureController configureController = Get.find();
  OrderController orderController = Get.find();
  ShopController shopController = Get.find();
  var checklist;
   int data = 0;
  
   List updateProduct = [];

  List<bool>? reviewIdCheck;
  @override
  void initState() {
    // for (var element in addCartReviewController.tableLength.value) {
    //   discount = discount + int.parse(element['DISCOUNT']);
    //   taxes = taxes + int.parse(element['TAX']);
    //   total = total + double.parse(element['TOTAL']);
    // }
    addCartReviewController.selectedList.clear();
    reviewIdCheck = List.generate(
        addCartReviewController.tableValue.value, (index) => false);

    super.initState();
  }

  @override
  Widget build(BuildContext buildContext) {
    return Stack(
      children: [
        Padding(
 padding: GetPlatform.isAndroid
         ?const EdgeInsets.only(top: 5)
         :const EdgeInsets.only(),
          child: SizedBox(
            height: GetPlatform.isAndroid
                ? ((widget.actualHeight - 40) / 17.9) * 17
                : ((widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                        17.9) *
                    17,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Column(
                  children: [
                     Container(
        
              // margin: const EdgeInsets.only(right: 2),
              height: MediaQuery.of(context).size.height * 0.043,
              width: MediaQuery.of(context).size.width * 0.99,
              color: AppColors.subHeaderContainer,
              child: Row(
                children: [
                   InkWell(
                    onTap: () {
                     viewController.setPreviousView();
                     headerController.setSubHeaderLabel(configureController.subheaderResponse.value);
                     
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      child: RotatedBox(
                      
                          quarterTurns: DateTime.june,
                      child: optionsController.backNew),
                      ),
                  ),
                  SizedBox(width: 130,),
                  SubHeader(),
                ],
              )),
                    // FirstRowWidget(
                    //     actualHeight: widget.actualHeight,
                    //     header: headerController.subThirdHeaderLabel(languageController
                    //             .languageResponse.value.reviewCart ??
                    //         '',) ,
                    //     arrow: false),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            viewController.setView(CAUTIONREVIEWPAGE);
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                                border: Border(
                              right: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                            )),
                            height: GetPlatform.isAndroid
                                ? ((widget.actualHeight -
                                            MediaQuery.of(context)
                                                .padding
                                                .bottom) /
                                        17.9) *
                                    1
                                : ((widget.actualHeight -
                                        MediaQuery.of(context).padding.bottom) /
                                    17.9),
                            width: GetPlatform.isAndroid
                                ? ((widget.actualHeight - 40) / 17.9) * 1
                                : ((widget.actualHeight -
                                        MediaQuery.of(context).padding.bottom) /
                                    17.9),
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(left: 10),
                            child: optionsController.addbookdelete,
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
                              ? ((widget.actualHeight -
                                          MediaQuery.of(context).padding.bottom) /
                                      17.9) *
                                  1
                              : ((widget.actualHeight -
                                      MediaQuery.of(context).padding.bottom) /
                                  17.9),
                          width: GetPlatform.isAndroid
                              ? ((widget.actualHeight -
                                          MediaQuery.of(context).padding.bottom) /
                                      17.9) *
                                  3.5
                              : ((widget.actualHeight -
                                          MediaQuery.of(context).padding.bottom) /
                                      17.9) *
                                      //added by saha
                                  4.1,
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
                              ? ((widget.actualHeight -
                                          MediaQuery.of(context).padding.bottom) /
                                      17.9) *
                                  1
                              : ((widget.actualHeight -
                                      MediaQuery.of(context).padding.bottom) /
                                  17.9),
                          width: GetPlatform.isAndroid
                              ? ((widget.actualHeight - 40) / 17.9) * 1.3
                              : ((widget.actualHeight -
                                      MediaQuery.of(context).padding.bottom) /
                                  17.9)
                                  //added by saha 
                                  *  1.2,
                          alignment: Alignment.centerLeft,
                          //added by saha
                          padding: GetPlatform.isAndroid
                          ? const EdgeInsets.only(left: 35)
                          : const EdgeInsets.only(left: 25),
                          child: Text(
                              languageController.languageResponse.value.qty ?? '',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold))
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
                              : ((widget.actualHeight -
                                      MediaQuery.of(context).padding.bottom) /
                                  17.9),
                          width: GetPlatform.isAndroid
                              ? ((widget.actualHeight - 40) / 17.9) * 1.3
                              : ((widget.actualHeight -
                                          MediaQuery.of(context).padding.bottom) /
                                      17.9) *
                                      //added by saha
                                  1.2,
                          alignment: Alignment.centerLeft,
                          //added by saha
                           padding: GetPlatform.isAndroid
                          ? const EdgeInsets.only(left: 25)
                          : const EdgeInsets.only(left: 20),
                          child: Text(
                              languageController.languageResponse.value.price ??
                                  '',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold))
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.yellow[300],
                          ),
                          height: GetPlatform.isAndroid
                              ? ((widget.actualHeight - 40) / 17.9) * 1
                              : ((widget.actualHeight -
                                      MediaQuery.of(context).padding.bottom) /
                                  17.9),
                          width: GetPlatform.isAndroid
                              ? ((widget.actualHeight - 40) / 17.9) * 1.5
                              : ((widget.actualHeight -
                                          MediaQuery.of(context).padding.bottom) /
                                      17.9) *
                                  1.6,
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 10),
                          child: Text(
                              languageController.languageResponse.value.total ??
                                  '',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: GetPlatform.isAndroid
                          ? ((widget.actualHeight - 40) / 17.9) * 10.4
                          // 1.8
                          : ((widget.actualHeight -
                                      MediaQuery.of(context).padding.bottom) /
                                  17.9) *
                              10.4,
                      child: Stack(
                        children: [
                          //added by viveka
                       Obx(() {
                         return ListView.builder(
                              shrinkWrap: true,
                              itemCount:
                                  addCartReviewController.tableLength.length,
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
                                      17.9,
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
                                              ? ((widget.actualHeight - 40) /
                                                      17.9) *
                                                  1
                                              : ((widget.actualHeight -
                                                      MediaQuery.of(context)
                                                          .padding
                                                          .bottom) /
                                                  17.9),
                                          width: GetPlatform.isAndroid
                                              ? ((widget.actualHeight - 40) /
                                                      17.9) *
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
                                              print('------->${addCartReviewController
                                                      .selectedListCart}');
                                              print('------->${reviewIdCheck![data]}');
                                              setState(() {
                                                if (reviewIdCheck![data] ==
                                                    true) {
                                                  addCartReviewController
                                                      .selectedListCart
                                                      .remove(
                                                          addCartReviewController
                                                                  .tableLength
                                                                  .value[data]
                                                              ['ITEMS_ID']);
                                                  reviewIdCheck![data] = false;
                                                 }
                                                else {
                                                  addCartReviewController
                                                      .selectedListCart
                                                      .add(addCartReviewController
                                                              .tableLength
                                                              .value[data]
                                                          ['ITEMS_ID']);
                                                  reviewIdCheck![data] = true;
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
                                                color:
                                                    reviewIdCheck![data] == true
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
                                            ? ((widget.actualHeight - 40) /
                                                    17.9) *
                                                1.2
                                            : ((widget.actualHeight -
                                                    MediaQuery.of(context)
                                                        .padding
                                                        .bottom) /
                                                17.9),
                                        width: GetPlatform.isAndroid
                                            ? ((widget.actualHeight - 40) /
                                                    17.9) *
                                                3.65
                                            : ((widget.actualHeight -
                                                        MediaQuery.of(context)
                                                            .padding
                                                            .bottom) /
                                                    17.9) *
                                                    //added by saha
                                                4.1,
                                        alignment: Alignment.centerLeft,
                                        padding: const EdgeInsets.only(left: 10),
                                        child: Text(addCartReviewController
                                            .tableLength
                                            .value[data]['ITEM_NAME']),
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
                                            ? ((widget.actualHeight - 40) /
                                                    17.9) *
                                                1.2
                                            : ((widget.actualHeight -
                                                    MediaQuery.of(context)
                                                        .padding
                                                        .bottom) /
                                                17.9),
                                        width: GetPlatform.isAndroid
                                            ? ((widget.actualHeight - 40) /
                                                    17.9) *
                                                1.3
                                            : ((widget.actualHeight -
                                                    MediaQuery.of(context)
                                                        .padding
                                                        .bottom) /
                                                17.9)
                                                //added by saha
                                                * 1.2,
                                        alignment: Alignment.centerRight,
                                        padding: const EdgeInsets.only(right: 10),
                                        
                                        child: Text(
                                      double.parse(
                                                addCartReviewController
                                                    .tableLength
                                                    .value[data]['QUANTITY']
                                                   )
                                          .toStringAsFixed(2)
                                            
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
                                            ? ((widget.actualHeight - 40) /
                                                    17.9) *
                                                1.2
                                            : ((widget.actualHeight -
                                                    MediaQuery.of(context)
                                                        .padding
                                                        .bottom) /
                                                17.9),
                                        width: GetPlatform.isAndroid
                                            ? ((widget.actualHeight - 40) /
                                                    17.9) *
                                                1.3
                                            : ((widget.actualHeight -
                                                        MediaQuery.of(context)
                                                            .padding
                                                            .bottom) /
                                                    17.9) *
                                                    //added by saha
                                                1.2,
                                        alignment: Alignment.centerRight,
                                        padding: const EdgeInsets.only(
                                            right: 5, left: 5),
                                        child: FittedBox(
                                          fit: BoxFit.fill,
                                          child: Text(double.parse(
                                                  addCartReviewController
                                                      .tableLength
                                                      .value[data]['PRICE'])
                                              .toStringAsFixed(2)),
                                        ),
                                      ),
                                      Container(
                                        height: GetPlatform.isAndroid
                                            ? ((widget.actualHeight - 40) /
                                                    17.9) *
                                                1.2
                                            : ((widget.actualHeight -
                                                    MediaQuery.of(context)
                                                        .padding
                                                        .bottom) /
                                                17.9),
                                        width: GetPlatform.isAndroid
                                            ? ((widget.actualHeight - 40) /
                                                    17.9) *
                                                1.3
                                            : ((widget.actualHeight -
                                                    MediaQuery.of(context)
                                                        .padding
                                                        .bottom) /
                                                13),
                                        alignment: Alignment.centerRight,
                                        //added by saha
                                        padding: GetPlatform.isAndroid
                                        ? const EdgeInsets.only(right: 1)
                                        : const EdgeInsets.only(right: 1),
                                        child: Text(
                                          double.parse(
                                                addCartReviewController
                                                    .tableLength
                                                    .value[data]['TOTAL'])
                                            .toStringAsFixed(2))
                                      ),
                                    ],
                                  ),
                                );
                              });
                        }),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                  border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                                top: BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                ),
                                right: BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                ),
                              )),
                              height: GetPlatform.isAndroid
                                  ? ((widget.actualHeight - 40) / 17.9) * 1
                                  : ((widget.actualHeight -
                                          MediaQuery.of(context).padding.bottom) /
                                      17.9),
                              width: GetPlatform.isAndroid
                                  ? ((widget.actualHeight - 40) / 17.9) * 7.2
                                  : ((widget.actualHeight -
                                              MediaQuery.of(context)
                                                  .padding
                                                  .bottom) /
                                          17.9) *
                                      7.51,
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.only(right: 10),
                              child: Text(
                                  languageController
                                          .languageResponse.value.discounts ??
                                      '',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                  border: Border(
                                top: BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                ),
                                bottom: BorderSide(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                              )),
                              height: GetPlatform.isAndroid
                                  ? ((widget.actualHeight - 40) / 17.9) * 1
                                  : ((widget.actualHeight -
                                          MediaQuery.of(context).padding.bottom) /
                                      17.9),
                              width: GetPlatform.isAndroid
                                  ? ((widget.actualHeight - 40) / 17.9) * 1.5
                                  : ((widget.actualHeight -
                                              MediaQuery.of(context)
                                                  .padding
                                                  .bottom) /
                                          17.9) *
                                      1.5,
        
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.only(right: 10),
                              // alignment: Alignment.centerRight,
        
                              child: Text(
                                  addCartReviewController.discount
                                      .toStringAsFixed(2),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 14)),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                  border: Border(
                                right: BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                ),
                                bottom: BorderSide(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                              )),
                              height: GetPlatform.isAndroid
                                  ? ((widget.actualHeight - 40) / 17.9) * 1
                                  : ((widget.actualHeight -
                                          MediaQuery.of(context).padding.bottom) /
                                      17.9),
                              width: GetPlatform.isAndroid
                                  ? ((widget.actualHeight - 40) / 17.9) * 7.2
                                  : ((widget.actualHeight -
                                              MediaQuery.of(context)
                                                  .padding
                                                  .bottom) /
                                          17.9) *
                                      7.51,
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.only(right: 10),
                              child: Text(
                                  languageController
                                          .languageResponse.value.taxes ??
                                      '',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                  border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                              )),
                              height: GetPlatform.isAndroid
                                  ? ((widget.actualHeight - 40) / 17.9) * 1
                                  : ((widget.actualHeight -
                                          MediaQuery.of(context).padding.bottom) /
                                      17.9),
                              width: GetPlatform.isAndroid
                                  ? ((widget.actualHeight - 40) / 17.9) * 1.5
                                  : ((widget.actualHeight -
                                              MediaQuery.of(context)
                                                  .padding
                                                  .bottom) /
                                          17.9) *
                                      1.5,
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.only(right: 10),
                              child: Text(
                                  addCartReviewController.taxes
                                      .toStringAsFixed(2),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 14)),
                            ),
                          ],
                        ),
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
                              height: GetPlatform.isAndroid
                                  ? ((widget.actualHeight - 40) / 17.9) * 1
                                  : ((widget.actualHeight -
                                          MediaQuery.of(context).padding.bottom) /
                                      17.9),
                              width: GetPlatform.isAndroid
                                  ? ((widget.actualHeight - 40) / 17.9) * 7.2
                                  : ((widget.actualHeight -
                                              MediaQuery.of(context)
                                                  .padding
                                                  .bottom) /
                                          17.9) *
                                      7.51,
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.only(right: 10),
                              child: Container(
                                child: Text(
                                    languageController.languageResponse.value
                                            .totalPayable ??
                                        '',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                            Container(
                              height: GetPlatform.isAndroid
                                  ? ((widget.actualHeight - 40) / 17.9) * 1
                                  : ((widget.actualHeight -
                                          MediaQuery.of(context).padding.bottom) /
                                      17.9),
                              width: GetPlatform.isAndroid
                                  ? ((widget.actualHeight - 40) / 17.9) * 1.5
                                  : ((widget.actualHeight -
                                              MediaQuery.of(context)
                                                  .padding
                                                  .bottom) /
                                          17.9) *
                                      1.5,
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.only(right: 6),
                              child: FittedBox(
                                //   alignment: Alignment.centerRight,
                                // padding: const EdgeInsets.only(right: 10),
                                child: Text(
                                    (addCartReviewController.total +
                                            addCartReviewController.taxes)
                                        .toStringAsFixed(2),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14)),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          decoration: const BoxDecoration(
                              border: Border(
                            top: BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                            bottom: BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                          )),
                          height: GetPlatform.isAndroid
                              ? ((widget.actualHeight - 40) / 17.9) * 1
                              : ((widget.actualHeight -
                                      MediaQuery.of(context).padding.bottom) /
                                  17.9),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () async {
                                  
          
           for (var element in addCartReviewController.tableLength.value) {
           updateProduct.add({
                        "PRODUCT_CODE": element['ITEMS_ID'],
                        "PRODUCT_QUANTITY": element['QUANTITY']
                      });
                     // print(updateProduct);
                    }
        
                    orderController.pendingUpdate(
                 updateProduct,languageController.languagenum.toString());
                 viewController.setView(PRODUCT);
                     headerController.setSubHeaderLabel(configureController.subheaderResponse.value);
                                   
                                },
                                child: Container(
                                  width: 140,
                                    decoration:  BoxDecoration(
                                       color: AppColors.subHeaderContainer,
                                        border: Border.all(color: Colors.blueAccent),
                                        borderRadius:const BorderRadius.all(
                                            Radius.circular(25))),
                                    child:const Padding(
                                      padding:  EdgeInsets.only(
                                          top: 8.0,
                                          bottom: 8.0,
                                          left: 30.0,
                                          right: 10.0),
                                      child: Text(
                                        // languageController.languageResponse.value
                                        //         .checkout ??
                                            'CLOSE',
                                        style:  TextStyle(
                                            color: Color.fromARGB(255, 11, 11, 11),
                                            fontSize: 20,
                                            ),
                                      ),
                                    )),
                              ),
                              InkWell(
                                //added by sahana
                                onTap: () async {
                                 // orderController.fetchPendingOrders(languageController.languagenum.toString());
                                  viewController.setView(PRODUCTNEWPAGE);
                                  headerController.setSubHeaderLabel('Main Category');
                                  for (var element in addCartReviewController.tableLength.value) {
                    updateProduct.add({
                        "PRODUCT_CODE": element['ITEMS_ID'],
                        "PRODUCT_QUANTITY": element['QUANTITY']
                      });
                     // print(updateProduct);
                    }
        
                    orderController.pendingUpdate(
                 updateProduct,languageController.languagenum.toString());
                                  // headerController.subHeaderLabel(configureController
                                  //  .subheaderResponse.value);
                                  // print("Add Tip");
                                  // paymentReviewController.paymentReview(
                                  //     languageController.languagenum.toString());
                                },
                                child: Container(
                                    decoration:  BoxDecoration(
                                        color: AppColors.subHeaderContainer,
                                        border: Border.all(color: Colors.blueAccent),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(25))),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0,
                                          bottom: 8.0,
                                          left: 20.0,
                                          right: 20.0),
                                      child: Text(
                                        languageController.languageResponse.value
                                                .continueText ??
                                            '',
                                        style: const TextStyle(
                                            color: Color.fromARGB(255, 9, 9, 9),
                                            fontSize: 20,
                                            ),
                                      ),
                                    )
                                    ),
                              ),
                              InkWell(
                                onTap: () async {
                                   //added by saha
                                  //headerController.setTimeChange();
                                  headerController.subHeaderLabel( 'Add Tips');
                                  print("Add Tip");
                                  paymentReviewController.paymentReview(
                                      languageController.languagenum.toString());
                                      configureController
                                                                  .fetchDetails(
                                                                      languageController
                                                                          .languagenum
                                                                          .toString());
                                   orderController.fetchShare();
                                },
                                child: Container(
                                    decoration:  BoxDecoration(
                                        color: AppColors.subHeaderContainer,
                                        border: Border.all(color: Colors.blueAccent),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(25))),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0,
                                          bottom: 8.0,
                                          left: 20.0,
                                          right: 20.0),
                                      child: Text(
                                        languageController.languageResponse.value
                                                .checkout ??
                                            '',
                                        style: const TextStyle(
                                            color: Color.fromARGB(255, 6, 6, 6),
                                            fontSize: 20,
                                            ),
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        GetX<KeyboardController>(
          init: KeyboardController(),
          initState: (_) {},
          builder: (controller) {
            return Positioned(
                bottom: 0,
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/images/keypad_patchs/keypad_base.png'),
                        fit: BoxFit.fill),
                  ),
                  child: keyboardWidget(context, controller),
                ));
          },
        ),
      ],
    );
  }

  keyboardWidget(BuildContext context, KeyboardController controller) {
    if (controller.changekeypad.value == SYMBOLSKEYBOARD) {
      return NumeralSpecialChar(
        actualHeight: widget.actualHeight,
        context: context,
        onValueChanged: (String) {
          // keyOperation(context);
        },
        size: const Size(100, 200),
      );
    } else if (controller.changekeypad.value == CAPITALKEYBOARD) {
      return AlphaCapitalLetters(
        actualHeight: widget.actualHeight,
        context: context,
        onValueChanged: (String) {
          // keyOperation(context);
        },
        size: const Size(100, 200),
      );
    } else if (controller.changekeypad.value == SMALLKEYBOARD) {
      return AlphaSmallLetters(
        actualHeight: widget.actualHeight,
        context: context,
        onValueChanged: (String) {
          // keyOperation(context);
        },
        size: const Size(100, 200),
      );
    } else {
      Container();
    }
  }

  Widget bottomContainer(double size) {
    return Expanded(
      child: Container(
        width: SizeConfig.screenWidth,
        height: GetPlatform.isAndroid
            ? ((widget.actualHeight - 40) / 17.9) * 1.8
            : ((widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                        17.9) /
                    12 -
                2,
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: AppColors.tableColor),
            top: BorderSide(color: AppColors.tableColor),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.centerRight,
                child: Text(
                  languageController.languageResponse.value.total ?? '',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),
            Container(
              color: AppColors.tableColor,
              // height: size.height * 0.81,
              // width: size.width * 0.0015,
            ),
            Container(
                width: GetPlatform.isAndroid
                    ? ((widget.actualHeight - 40) / 17.9) * 1.8
                    : ((widget.actualHeight -
                            MediaQuery.of(context).padding.bottom) /
                        17.9)),
          ],
        ),
      ),
    );
  }
}

Widget ReviewPage(Size size) => StatefulBuilder(
    builder: (builder, setState) => Stack(children: [
          //horizontal items
          Column(children: [
            //row header
            Container(
              width: SizeConfig.screenWidth,
              height: size.height / 12 + 3.9,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: AppColors.tableColor),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Row(
                  children: [
                    //cancel Box
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
                          child: Transform(
                              transform: Matrix4.rotationZ(0.174533 * 4.5),
                              alignment: FractionalOffset.center,
                              child: const Icon(
                                Icons.add,
                                color: Colors.redAccent,
                                size: 30,
                              ))),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    //item name
                    Container(
                      width: size.width * 0.35,
                      color: AppColors.headerContainer,
                      child: Container(
                        height: size.height / 12 + 3.9,
                        width: SizeConfig.screenWidth,
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 0),
                        child: Text(LanguageController()
                                .languageResponse
                                .value
                                .itemName ??
                            ''),
                      ),
                    ),
                    const SizedBox(
                      width: 0.5,
                    ),
                    //quantity
                    Container(
                      width: size.width * 0.1,
                      color: AppColors.headerContainer,
                      child: Container(
                        height: size.height / 12 + 3.9,
                        width: SizeConfig.screenWidth,
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 0),
                        child: Text(
                            LanguageController().languageResponse.value.qty ??
                                ''),
                      ),
                    ),
                    const SizedBox(
                      width: 0.5,
                    ),
                    //price
                    Container(
                      width: size.width * 0.1,
                      color: AppColors.headerContainer,
                      child: Container(
                        height: size.height / 12 + 3.9,
                        width: SizeConfig.screenWidth,
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 0),
                        child: Text(
                            LanguageController().languageResponse.value.price ??
                                ''),
                      ),
                    ),
                    const SizedBox(
                      width: 0.5,
                    ),
                    //tax
                    Container(
                      width: size.width * 0.1,
                      color: AppColors.headerContainer,
                      child: Container(
                        height: size.height / 12 + 3.9,
                        width: SizeConfig.screenWidth,
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 0),
                        child: Text(
                            LanguageController().languageResponse.value.taxes ??
                                ''),
                      ),
                    ),
                    const SizedBox(
                      width: 0.5,
                    ),
                    //disc
                    Container(
                      width: size.width * 0.1,
                      color: AppColors.headerContainer,
                      child: Container(
                        height: size.height / 12 + 3.9,
                        width: SizeConfig.screenWidth,
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 0),
                        child: Text(
                            LanguageController().languageResponse.value.disc ??
                                ''),
                      ),
                    ),
                    const SizedBox(
                      width: 0.5,
                    ),
                    //total
                    Expanded(
                      child: Container(
                        color: AppColors.headerContainer,
                        child: Container(
                          height: size.height / 12 + 3.9,
                          width: SizeConfig.screenWidth,
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(left: 0),
                          child: Text(LanguageController()
                                  .languageResponse
                                  .value
                                  .total ??
                              ''),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //Expanded
            Expanded(
              child: Row(
                children: [
                  SizedBox(
                    width: size.width * 0.725,
                  ),
                  Text(
                      '${LanguageController().languageResponse.value.total ?? ''} ₹'),
                  SizedBox(
                    width: size.width * 0.015,
                  ),
                  const Expanded(
                    child: Text(
                      '',
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            )
          ]),
          //Vertical lines
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: size.width * 0.07),
              Container(
                color: AppColors.tableColor,
                height: size.height * 0.925,
                width: size.width * 0.0015,
              ),
              //item name
              SizedBox(width: size.width * 0.348),
              Container(
                color: AppColors.tableColor,
                height: size.height * 0.925,
                width: size.width * 0.0015,
              ),
              //qty line
              SizedBox(width: size.width * 0.098),
              Container(
                color: AppColors.tableColor,
                height: size.height * 0.925,
                width: size.width * 0.0015,
              ),
              //qty line
              SizedBox(width: size.width * 0.1),
              Container(
                color: AppColors.tableColor,
                height: size.height * 0.925,
                width: size.width * 0.0015,
              ),
              //qty line
              SizedBox(width: size.width * 0.099),
              Container(
                color: AppColors.tableColor,
                height: size.height * 0.925,
                width: size.width * 0.0015,
              ),
              //qty line
              SizedBox(width: size.width * 0.098),
              Container(
                color: AppColors.tableColor,
                height: size.height,
                width: size.width * 0.0015,
              ),
            ],
          )
        ]));
