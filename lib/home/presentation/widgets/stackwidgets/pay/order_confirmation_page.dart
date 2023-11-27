import 'package:customer_assist/core/app_colors.dart';
import 'package:customer_assist/core/app_constants.dart';
import 'package:customer_assist/home/data/configure/datasources/configure_data_remote_data_source.dart';
import 'package:customer_assist/home/presentation/controllers/header_controller.dart';
import 'package:customer_assist/home/presentation/controllers/keyboard_controller.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/controllers/order_controller.dart';
import 'package:customer_assist/home/presentation/controllers/pos_master_selection_controller.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/sub_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

class OrderConfirmation extends StatefulWidget {
  final double actualHeight;
  const OrderConfirmation({Key? key, required this.actualHeight})
      : super(key: key);

  @override
  State<OrderConfirmation> createState() => _OrderConfirmationState();
}

class _OrderConfirmationState extends State<OrderConfirmation> {
  OrderController orderController = Get.find();
  LanguageController languageController = Get.find();
  KeyboardController keyboardController = Get.find();
   HeaderController headerController = Get.find();
    var posMasterSelectionController = Get.put(PosMasterSelectionController());
     var pay = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
     padding: GetPlatform.isAndroid
         ?const EdgeInsets.only(top: 5)
         :const EdgeInsets.only(),
      color: Colors.white,
      height: GetPlatform.isAndroid
      ?((widget.actualHeight - MediaQuery.of(context).padding.bottom) /
              17.9) *
          17
      :((widget.actualHeight - MediaQuery.of(context).padding.bottom) /
              17.9) *
          17,
      child: Column(
        children: [
          Container(

          // margin: const EdgeInsets.only(right: 2),
          height: MediaQuery.of(context).size.height * 0.043,
              width: MediaQuery.of(context).size.width * 0.99,
              color: AppColors.subHeaderContainer,
          child: const Center(child: SubHeader())),
          SizedBox(
              height: ((widget.actualHeight -
                          MediaQuery.of(context).padding.bottom) /
                      14) *
                  1,
              child:  Center(
                  child: Text(
               // "Order Successfully Placed",
                 languageController
                                                    .languageResponse
                                                    .value
                                                    .orderSuccessfullyPlaced ??'',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ))),
          SizedBox(
              height: ((widget.actualHeight -
                          MediaQuery.of(context).padding.bottom) /
                      14) *
                  1,
              child: Center(
                  child: Text(
                "Your Order Number : ${orderController.deliveryCodeRespone.value.status!.orderId!}",
                style: const TextStyle(fontSize: 18),
              ))),
          // ${orderController.deliveryCodeRespone.value.status!.orderId!}
          // "),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30),
            child: SizedBox(
              height: ((widget.actualHeight -
                          MediaQuery.of(context).padding.bottom) /
                      14) *
                  2,
              child:  Text(
                 languageController
                                                    .languageResponse
                                                    .value
                                                    .yourOrderWillBeProcessed ??'',
               // "Your Order will be processed and details of shipment will be sent to your mail id.Please find the delivery confirmation QR Code together with a Delivery Security Code. You may use either of them to confirm your delivery",
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          QrImageView(
            data: orderController
                .deliveryCodeRespone.value.status!.deliveryCode!,
            version: QrVersions.auto,
            size: 200.0,
          ),
          SizedBox(
            height: ((widget.actualHeight -
                        MediaQuery.of(context).padding.bottom) /
                    17.9) *
                1,
            child:  Center(
              child: Text(
                 languageController
                                                    .languageResponse
                                                    .value
                                                    .deliverySecurityCode ??'',
               // "Delivery Security Code",
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: ((widget.actualHeight -
                        MediaQuery.of(context).padding.bottom) /
                    17.9) *
                1,
            child: Center(
              child: Text(
                orderController
                    .deliveryCodeRespone.value.status!.deliveryCode!,
                style: const TextStyle(
                    fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            // height: ((widget.actualHeight -
            //             MediaQuery.of(context).padding.bottom) /
            //         14) *
            //     1,
            child: Center(
              child: Column(
                children:  [
                  Text(
                     languageController
                                                    .languageResponse
                                                    .value
                                                    .thankYouForShoppingus ??'',
                    //"Thank you For Shopping us",
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                     languageController.languageResponse
                                                    .value
                                                    .pleaseVisitAgain ??'',
                   // 'Please visit again!',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: GetPlatform.isAndroid
                    ? 40
                   : 50,
                  ),
                  SizedBox(
                    height:35,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:  [
                       const Text('Pay Mode :',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                        ),
                        Text(
                          (posMasterSelectionController.payModeResponse
                              .value[pay]
                              .payCode ==
                               '35')
                        ? 'CARD'
                        : 'CASH',
                        style: const TextStyle(fontSize: 20),
                        ),
                        (posMasterSelectionController.payModeResponse
                              .value[pay]
                              .payCode ==
                               '35')
                         ? Container()
                      :  InkWell(
                          onTap: () {
                         
                          // optionsController.setSetState();
                          // keyboardController.setPicker('');
                          viewController.setView(PAYBYCASH);
                         // headerController.setTimeChange();
                           headerController.subHeaderLabel('Pay - By Cash');
                           
                          },
                          child: SizedBox(
                            height: 35,
                            width: 35,
                            child: optionsController.backNew,
                          ),
                        )
                        
                      ],
                    ),
                    
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
