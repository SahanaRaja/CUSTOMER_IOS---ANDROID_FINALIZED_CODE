import 'package:customer_assist/core/app_colors.dart';
import 'package:customer_assist/core/helpers/SharedPreference/prefs.dart';
import 'package:customer_assist/home/presentation/controllers/add_cart_review_controller.dart';
import 'package:customer_assist/home/presentation/controllers/configure_controller.dart';
import 'package:customer_assist/home/presentation/controllers/header_controller.dart';
import 'package:customer_assist/home/presentation/controllers/keyboard_controller.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/controllers/options_controller.dart';
import 'package:customer_assist/home/presentation/controllers/payment_review_controller.dart';
import 'package:customer_assist/home/presentation/controllers/view_controller.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/first_row_widget.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/sub_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/app_constants.dart';
import '../../../../../core/utils/size_config.dart';

class ReviewPayment extends StatefulWidget {
  final double actualHeight;

  const ReviewPayment({Key? key, required this.actualHeight}) : super(key: key);

  @override
  State<ReviewPayment> createState() => _ReviewPaymentState();
}

class _ReviewPaymentState extends State<ReviewPayment> {
  // TextEditingController lastName = TextEditingController();
  PaymentReviewController reviewController = Get.find();
  OptionsController optionsController = Get.find();
  ViewController viewController = Get.find();
  HeaderController headerController = Get.find();
  KeyboardController keyboardController = Get.find();
  ConfigureController configureController = Get.find();
  var languageController = Get.put(LanguageController());
  AddCartReviewController addCartReviewController = Get.find();
  @override
  Widget build(BuildContext context) {
    print(addCartReviewController.total
                                + addCartReviewController.taxes+
                            reviewController.addTips
                        );
    return Padding(
       padding: GetPlatform.isAndroid
         ?const EdgeInsets.only(top: 5)
         :const EdgeInsets.only(),
      child: Column(
        children: [
          Column(
            children: [
               Container(
    
              // margin: const EdgeInsets.only(right: 2),
             height: MediaQuery.of(context).size.height * 0.043,
              width: MediaQuery.of(context).size.width * 0.99,
              color: AppColors.subHeaderContainer,
              child: const Center(child: SubHeader())),
              
              // FirstRowWidget(
              //   actualHeight: widget.actualHeight,
              //   header:
              //       languageController.languageResponse.value.reviewPayment ?? '',
              //   arrow: false,
              // ),
              const SizedBox(height: 2,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.yellow[300],
                    child: getSizedBox(
                        context,
                        languageController.languageResponse.value.headOfAccount ??
                            ''),
                  ),
                  Container(
                    height: GetPlatform.isAndroid
        ? MediaQuery.of(context).size.height * 0.050
        : MediaQuery.of(context).size.height * 0.059,
                    width: 220,
                    color: Colors.yellow[300],
                    child: const Center(
                      child: Padding(
                        padding: 
                        EdgeInsets.only(left: 98),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Amount',
                            // languageController.languageResponse.value.amount ??
                            // '',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // getSixedController(context, 2, controller: LastName),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  getSizedBox(
                      context,
                      languageController.languageResponse.value.purchaseCost ??
                          ''),
                  getSixedController(context, 2,
                      controller:
                      addCartReviewController.total
                      //  reviewController
                      //     .updatePaymentResponse.value.status!.items!.totalvalue!
                          .toStringAsFixed(2)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  getSizedBox(context,
                      languageController.languageResponse.value.plusTaxes ?? ''),
                  getSixedController(context, 2,
                      controller: addCartReviewController.taxes
                          .toStringAsFixed(2)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  getSizedBox(
                      context,
                      languageController
                              .languageResponse.value.plusDeliveryCharges ??
                          ''),
                  getSixedController(context, 2,
                      controller: reviewController
                          .updatePaymentResponse.value.status!.normalValue!
                          .toStringAsFixed(2)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  getSizedBox(
                      context,
                      languageController
                              .languageResponse.value.plusConvenienceFee ??
                          ''),
                           SizedBox(
                            width: GetPlatform.isAndroid
                            ? MediaQuery.of(context).size.width/3.1
                            :MediaQuery.of(context).size.width /2.9
                          ),
                const  Text(
                    '0.00',
                    textAlign: TextAlign.end,
                  )
                  // getSixedController(context, 2,
                  //     controller: reviewController.updatePaymentResponse.value
                  //             .status!.items!.tax!.isNotEmpty
                  //         ? (reviewController.updatePaymentResponse.value.status!
                  //                     .items!.tax![0].taxid! ==
                  //                 7
                  //             ? reviewController.updatePaymentResponse.value
                  //                 .status!.items!.tax![0].taxvalue!
                  //                 .toString()
                  //             : '0')
                  //         : '0'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  getSizedBox(context,
                      languageController.languageResponse.value.plusTips ?? ''),
                  getSixedController(context, 2,
                      controller: reviewController.addTips.toStringAsFixed(2)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  getSizedBox(
                      context,
                      languageController.languageResponse.value.lessdiscounts ??
                          ''),
                          SizedBox(
                            width: GetPlatform.isAndroid
                            ? MediaQuery.of(context).size.width/3.1
                            : MediaQuery.of(context).size.width /2.9
                          ),
                const  Text(
                    '0.00',
                    textAlign: TextAlign.end,
                  )
                  // getSixedController(context, 2,
                  //     controller: reviewController.updatePaymentResponse.value
                  //             .status!.items!.tax!.isNotEmpty
                  //         ? (reviewController.updatePaymentResponse.value.status!
                  //                     .items!.tax![0].taxid! ==
                  //                 8
                  //             ? reviewController.updatePaymentResponse.value
                  //                 .status!.items!.tax![0].taxvalue!
                  //                 .toString()
                  //             : '0')
                  //         : '0'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  getSizedBox(
                      context,
                      languageController
                              .languageResponse.value.lessCouponsAppiled ??
                          ''),
                  getSixedController(context, 2,
                      controller: reviewController
                          .updatePaymentResponse.value.status!.couponValue!),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  getSizedBox(
                      context,
                      languageController.languageResponse.value.totalPayable ??
                          ''),
                  getSixedController(context, 2,
                      controller: (
                        // reviewController.updatePaymentResponse.value
                        //           .status!.items!.totalvalue! 
                        addCartReviewController.total
                                  + addCartReviewController.taxes+
                              reviewController.addTips)
                          .toStringAsFixed(2)),
                         
                ],
              ),
            ],
          ),
          SizedBox(
            height: GetPlatform.isAndroid
                ? (widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                    17.9 *
                    5.5
                : (widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                    17.9 *
                    4.3,
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
                InkWell(
                  onTap: () async {
                    viewController.setView(ADDTIP);
    
                   headerController.setSubHeaderLabel('Add Tips');
                  },
                  child: Container(
                    padding: GetPlatform.isAndroid
                    ? EdgeInsets.only()
                   : EdgeInsets.only(top: 10),
                    height: 60,
                    width: 50,
                      decoration: const BoxDecoration(
                      ),
                      child: RotatedBox(
                             quarterTurns: DateTime.june,
                        child: optionsController.backNew)),
                ),
                SizedBox(width: 370,),
                InkWell(
                  onTap: () async {
                    configureController
                   .fetchDeliveryTime(languageController.languagenum.toString());
                   storeCalculatedValueToPreferences();
                  // viewController.setView(DELIVERYTIMEPAGE);
                    
                    
                    // storeCalculatedValueToPreferences();
                  // optionsController.setSetState();
                  //   reviewController.setConvenienceFee(reviewController
                  //       .updatePaymentResponse
                  //       .value
                  //       .status!
                  //       .items!
                  //       .tax![0]
                  //       .taxvalue!);
                  //   reviewController.setDiscount(reviewController
                  //       .updatePaymentResponse
                  //       .value
                  //       .status!
                  //       .items!
                  //       .tax![0]
                  //       .taxvalue!);
    
                  //   reviewController.setTotalPayable(reviewController
                  //           .updatePaymentResponse
                  //           .value
                  //           .status!
                  //           .items!
                  //           .totalvalue! +
                  //       reviewController.addTips);
                  //   optionsController.setState();
                  },
                  child: Container(
                       padding: GetPlatform.isAndroid
                    ? EdgeInsets.only()
                   : EdgeInsets.only(top: 10),
                    height: 60,
                    width: 50,
                  decoration: const BoxDecoration(
                  ),
                  child: RotatedBox(
    
                        quarterTurns: DateTime.april,
                    child: optionsController.backNew))
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container getSizedBox(BuildContext context, String value) {
    return Container(
      //width: getProportionateScreenWidth(200),
      decoration: const BoxDecoration(
          border: Border(right: BorderSide(color: Colors.grey))),
      height: GetPlatform.isAndroid
      ? MediaQuery.of(context).size.height * 0.050
      : MediaQuery.of(context).size.height * 0.056,
       width: GetPlatform.isAndroid
          ? (widget.actualHeight - 40) / 17.9 * 4.7
          : (widget.actualHeight - MediaQuery.of(context).padding.bottom) /
              17.9 * 4.9,
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            // "123456",
            value,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
        ),
      ),
    );
  }

  getSixedController(BuildContext context, int index, {String? controller}) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: SizedBox(
        height: GetPlatform.isAndroid
      ? MediaQuery.of(context).size.height * 0.050
      : MediaQuery.of(context).size.height * 0.056,
       width: GetPlatform.isAndroid
          ? (widget.actualHeight - 40) / 17.9 * 3.5
          : (widget.actualHeight - MediaQuery.of(context).padding.bottom) /
              17.9 * 4,
        child: Container(
            padding: const EdgeInsets.only(right: 20),
            alignment: Alignment.centerRight,
            child: Text(
              controller!,
              // style: const TextStyle(
              //     fontSize: 16,
              //     fontWeight: FontWeight.bold,
              // color: Colors.grey),
            )
            ),
      ),
    );
  }

  

Future<void> storeCalculatedValueToPreferences() async {
  double total = addCartReviewController.total;
  double taxes = addCartReviewController.taxes;
  double tips = reviewController.addTips.toDouble();
  
  double calculatedValue = total + taxes + tips;
  String calculatedValueString = calculatedValue.toStringAsFixed(2);

  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // await prefs.setString('calculatedValue', calculatedValueString);
   Prefs.setOrderAmount(double.parse(calculatedValueString));
  print("????????????$Prefs.orderAmount");
  print('Calculated value stored: $calculatedValueString');
}

}
