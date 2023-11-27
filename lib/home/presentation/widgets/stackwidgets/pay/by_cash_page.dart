import 'package:customer_assist/core/app_colors.dart';
import 'package:customer_assist/core/app_constants.dart';
import 'package:customer_assist/home/presentation/controllers/header_controller.dart';
import 'package:customer_assist/home/presentation/controllers/keyboard_controller.dart';
import 'package:customer_assist/home/presentation/controllers/options_controller.dart';
import 'package:customer_assist/home/presentation/controllers/order_controller.dart';
import 'package:customer_assist/home/presentation/controllers/payment_review_controller.dart';
import 'package:customer_assist/home/presentation/controllers/view_controller.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/sub_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ByCashPage extends StatefulWidget {
  final double actualHeight;
  final TextEditingController firstController;

  const ByCashPage(
      {Key? key, required this.actualHeight, required this.firstController})
      : super(key: key);

  @override
  State<ByCashPage> createState() => _ByCashPageState();
}

class _ByCashPageState extends State<ByCashPage> {
  final FocusNode _focuss = FocusNode();
  final bool _isFocuse = false;
  KeyboardController keyboardController = Get.find();
  ViewController viewController = Get.find();
  PaymentReviewController reviewController = Get.find();
  var orderController = Get.put(OrderController());
  HeaderController headerController = Get.find();
  OptionsController optionsController = Get.find();


  final bool _isFocused = false;

  bool yes = false;
  bool no = false;

//  void initializeValues() {
//   if (viewController.balancecheck == '1') {
//       yes = true;
//       no = false;
//     } else {
//       yes = false;
//       no = true;
//     }
//  }
  @override
  Widget build(BuildContext context) {
    return GetX<PaymentReviewController>(
        init: PaymentReviewController(),
        initState: (_) {},
        builder: (_) {
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
              child: Row(
                children: [
                   InkWell(
                    onTap: () {
                     viewController.setView(ORDERCONFIRMATION);
                     headerController.setSubHeaderLabel('Order Confirmation');
                     
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
                 const SubHeader(),
                ],
              )),
                // SizedBox(height:
                //    MediaQuery.of(context).size.height * 0.056,),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.056,
                  child: Row(
                    children: [
                      Container(
                          alignment: Alignment.centerRight,
                          width: 250,
                          child: const Text(
                            'Bill Amount',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          )),
                      const SizedBox(
                        width: 35,
                      ),
                      getSixedController(context, 2,
                          controller: (reviewController.updatePaymentResponse
                                      .value.status!.items!.totalvalue! +
                                  reviewController.addTips)
                              .toStringAsFixed(2)),
                      //const Text('₹',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.056,
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          alignment: Alignment.centerRight,
                          width: 250,
                          child: const Text(
                            'Cash Paid',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          )),
                      const SizedBox(
                        width: 35,
                      ),
                      const Text('₹',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                      const SizedBox(
                        width: 5,
                      ),
                      SizedBox(
                        child: sizedBoxController(
                            widget.firstController, _focuss, _isFocuse),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.056,
                  child: GetX<PaymentReviewController>(
                    init: PaymentReviewController(),
                    initState: (_) {},
                    builder: (controller) {
                      return Row(
                        //mainAxisAlignment: MainAxisAl;
          
                        //ignment.spaceEvenly,
                        children: [
                          Container(
                              alignment: Alignment.centerRight,
                              width: 250,
                              child: const Text(
                                'Balance to get',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              )),
                          const SizedBox(
                            width: 35,
                          ),
                          //Text('₹',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold)),
                          getSixedController1(context, 2,
                              controller: (controller.cashpaid -
                                      controller.updatePaymentResponse.value
                                          .status!.items!.totalvalue! +
                                      reviewController.addTips)
                                  .toStringAsFixed(2)),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.056,
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          alignment: Alignment.centerRight,
                          width: 250,
                          child: const Text(
                            'Balance Received',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          )),
                      const SizedBox(
                        width: 35,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            yes = !yes;
                            no = false;
                            viewController.balancecheck = '1';
                          });
                        },
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            border: Border.all(),
                            color: viewController.balancecheck == '1'
                                ? Colors.yellowAccent
                                : Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text('Yes',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                      const SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            no = !no;
                            yes = false;
                            viewController.balancecheck = '0';
                          });
                        },
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            border: Border.all(),
                            color: viewController.balancecheck == '0'
                                ? Colors.yellowAccent
                                : Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text('No',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.056,
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          alignment: Alignment.centerRight,
                          width: 250,
                          child: const Text(
                            'Close Transaction',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          )),
                      const SizedBox(
                        width: 35,
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(border: Border.all()),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text('Yes',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  SizedBox sizedBoxController(controller, FocusNode focus, bool status) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.050,
      width: 150,
      //width: GetPlatform.isAndroid ? 220 : 215,
      child: TextFormField(
        readOnly: true,
        showCursor: false,
        focusNode: focus,
        onTap: () {
          keyboardController.symbolTrue(true);
          keyboardController.setKeypad(SYMBOLSKEYBOARD);
          keyboardController.controllerSetup(controller);
          keyboardController.focusSetup(focus, controller);

          print(">>>>>>>>>>>>>${widget.firstController.text}");
          reviewController.setCashPaid(int.parse(widget.firstController.text));
        },
        controller: controller,
        decoration: InputDecoration(
          // hintText: "Mail ID",
          border: InputBorder.none,
          filled: status,
          fillColor: textFieldColor,
        ),
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }

  getSixedController(BuildContext context, int index, {String? controller}) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.056,
      // width: getProportionateScreenWidth(160),
      child: Container(
          padding: const EdgeInsets.only(right: 20),
          alignment: Alignment.centerRight,
          child: Text(
            ('₹ $controller'),
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              // color: Colors.grey
            ),
          )),
    );
  }

  getSixedController1(BuildContext context, int index, {String? controller}) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.056,
      // width: getProportionateScreenWidth(160),
      child: Container(
          padding: const EdgeInsets.only(right: 20),
          alignment: Alignment.centerRight,
          child: Text(
            ('₹ $controller'),
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              // color: Colors.grey
            ),
          )),
    );
  }
}
