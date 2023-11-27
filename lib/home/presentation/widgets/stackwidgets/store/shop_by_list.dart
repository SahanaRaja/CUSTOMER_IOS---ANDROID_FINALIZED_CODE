import 'dart:io';

import 'package:customer_assist/home/presentation/controllers/add_cart_review_controller.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/controllers/options_controller.dart';
import 'package:customer_assist/home/presentation/controllers/shop_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/platform/platform.dart';
import 'package:get/instance_manager.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../../data/shopcoupon/models/shopping_products_model/sub_category_items.dart';

class ShopByList extends StatefulWidget {
  final double actualHeight;
  const ShopByList({Key? key, required this.actualHeight}) : super(key: key);

  @override
  State<ShopByList> createState() => _ShopByListState();
}

class _ShopByListState extends State<ShopByList> {
  OptionsController optionsController = Get.find();
  ShopController shopController = Get.find();
  AddCartReviewController addCartReviewController = Get.find();
  List<bool> shopByList = [];
  @override
  void initState() {
    shopByList = List.generate(
        shopController.shopByListResponse.value.length, (index) => false);
    super.initState();
  }

  var languageController = Get.put(LanguageController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
              color: Colors.black,
              height: ((widget.actualHeight -
                          MediaQuery.of(context).padding.bottom) /
                      17.9) *
                  2.9,
              child: QRViewExample(
                  actualHeight: ((widget.actualHeight -
                              MediaQuery.of(context).padding.bottom) /
                          17.9) *
                      3.9,
                  actualWidth: ((widget.actualHeight -
                              MediaQuery.of(context).padding.bottom) /
                          17.9) *
                      9)
              // child: imageFile!.path != ''
              //     ? Image.file(
              //         imageFile!,
              //         width: 150.w,
              //       )
              //     : Container(),
              ),
        ),
        SizedBox(
          height:
              ((widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                  17.9),
          child: Center(
            child: Text(
              languageController.languageResponse.value.productBarcodeScan ??
                  '',
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        //   child: Container(
        //     decoration: BoxDecoration(
        //       color: Colors.white,
        //       border: Border.all(color: Colors.grey[500]!),
        //     ),
        //     height:
        //         ((widget.actualHeight - MediaQuery.of(context).padding.bottom) /
        //                 17.9) *
        //             8,
        //     child: const Center(
        //       child: Text(
        //         'PRODUCT IMAGE',
        //         style: TextStyle(color: Colors.black),
        //       ),
        //     ),
        //   ),
        // ),

        SizedBox(
          height:
              ((widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                      17.9) *
                  10,
          // child: itemwidget(context, 10),
          child: ListView.builder(
              itemCount: shopController.shopByListResponse.value.length,
              itemBuilder: (context, data) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              shopByList[data] = !shopByList[data];
                            });
                            if (shopByList[data] == true) {
                              var itemValues = SubCategoryItems(
                                  productCode: shopController.shopByListResponse
                                      .value[data].productCode,
                                  productMrp: shopController.shopByListResponse
                                      .value[data].productMrp,
                                  productName: shopController.shopByListResponse
                                      .value[data].productName,
                                  productRate: shopController.shopByListResponse
                                      .value[data].productRate,
                                  tax1: shopController
                                      .shopByListResponse.value[data].tax1,
                                  tax2: shopController
                                      .shopByListResponse.value[data].tax2,
                                  tax3: shopController
                                      .shopByListResponse.value[data].tax3,
                                  tax4: shopController
                                      .shopByListResponse.value[data].tax4,
                                  tax5: shopController
                                      .shopByListResponse.value[data].tax5,
                                  tax6: shopController
                                      .shopByListResponse.value[data].tax6,
                                  imageUrl: shopController
                                      .shopByListResponse.value[data].imageUrl,
                                  discountValue: shopController
                                      .shopByListResponse
                                      .value[data]
                                      .discountValue);

                              // addCartReviewController
                              //     .addToCartReview(itemValues);
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
                              child: Center(
                                child: Icon(
                                  Icons.done,
                                  color: shopByList[data] == true
                                      ? Colors.grey
                                      : Colors.white,
                                  size: 25,
                                ),
                              )),
                        ),
                        itemWidget(context, data),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: 65,
                              height: 65,
                              child: optionsController.increase,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 65,
                              height: 65,
                              child: optionsController.weighItem,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 65,
                              height: 65,
                              child: optionsController.decrease,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: GetPlatform.isAndroid
                                  ? (widget.actualHeight - 40) / 18.1
                                  : (widget.actualHeight -
                                          MediaQuery.of(context)
                                              .padding
                                              .bottom) /
                                      17.9 *
                                      2.8,
                              height: GetPlatform.isAndroid
                                  ? (widget.actualHeight - 40) / 18.1
                                  : (widget.actualHeight -
                                          MediaQuery.of(context)
                                              .padding
                                              .bottom) /
                                      17.9 *
                                      0.8,
                              decoration: BoxDecoration(
                                color: Colors.yellow[200],
                                border: Border.all(
                                  color: Colors.black,
                                ),
                              ),
                              child: Center(
                                  child: Text(languageController
                                          .languageResponse.value.qtyRequired ??
                                      '')),
                            ),
                            const SizedBox(
                              height: 108,
                            ),
                            Container(
                              width: GetPlatform.isAndroid
                                  ? (widget.actualHeight - 40) / 18.1
                                  : (widget.actualHeight -
                                          MediaQuery.of(context)
                                              .padding
                                              .bottom) /
                                      17.9 *
                                      2.8,
                              height: GetPlatform.isAndroid
                                  ? (widget.actualHeight - 40) / 18.1
                                  : (widget.actualHeight -
                                          MediaQuery.of(context)
                                              .padding
                                              .bottom) /
                                      17.9 *
                                      0.8,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 128, 247, 132),
                                border: Border.all(
                                  color: Colors.black,
                                ),
                              ),
                              child: Center(
                                  child: Text(languageController
                                          .languageResponse.value.qtyPicked ??
                                      '')),
                            )
                          ],
                        )
                      ],
                    ),

                    // SizedBox(
                    //   width: GetPlatform.isAndroid
                    //       ? (widget.actualHeight - 40) / 18.1
                    //       : (widget.actualHeight -
                    //               MediaQuery.of(context).padding.bottom) /
                    //           17.9 *
                    //           8.5,
                    //   height: GetPlatform.isAndroid
                    //       ? (widget.actualHeight - 40) / 18.1
                    //       : (widget.actualHeight -
                    //               MediaQuery.of(context).padding.bottom) /
                    //           17.9 *
                    //           4,
                    //   // decoration: BoxDecoration(
                    //   //     border: Border.all(
                    //   //       color: Colors.black,
                    //   //     ),
                    //   //     color: Colors.white,
                    //   //     borderRadius:
                    //   //         const BorderRadius.all(Radius.circular(15))),
                    //   child: Padding(
                    //     padding: const EdgeInsets.only(left: 38.0, right: 10),
                    //     child:
                    //
                    // Row(
                    //       children: [
                    //         Container(
                    //             height: 30,
                    //             width: 30,
                    //             decoration: BoxDecoration(
                    //                 color: Colors.white,
                    //                 border: Border.all(),
                    //                 boxShadow: const [
                    //                   BoxShadow(
                    //                       color: Colors.grey,
                    //                       spreadRadius: 1,
                    //                       blurRadius: 1,
                    //                       offset: Offset(4, 4))
                    //                 ]),
                    //             child: const Center(
                    //               child: Icon(
                    //                 Icons.done,
                    //                 color: Colors.green,
                    //                 size: 25,
                    //               ),
                    //             )),
                    //         const SizedBox(
                    //           width: 15,
                    //         ),

                    //         // SizedBox(
                    //         //   width: GetPlatform.isAndroid
                    //         //       ? (widget.actualHeight - 40) / 18.1
                    //         //       : (widget.actualHeight -
                    //         //               MediaQuery.of(context)
                    //         //                   .padding
                    //         //                   .bottom) /
                    //         //           17.9 *
                    //         //           5,
                    //         //   height: GetPlatform.isAndroid
                    //         //       ? (widget.actualHeight - 40) / 18.1
                    //         //       : (widget.actualHeight -
                    //         //               MediaQuery.of(context)
                    //         //                   .padding
                    //         //                   .bottom) /
                    //         //           17.9 *
                    //         //           4,
                    //         //   child: itemwidget(context, data),
                    //         // ),
                    //         Padding(
                    //           padding:
                    //               const EdgeInsets.only(left: 15.0, top: 10),
                    //           child: Column(
                    //             mainAxisAlignment:
                    //                 MainAxisAlignment.spaceEvenly,
                    //             children: [
                    //               Container(
                    //                 width: GetPlatform.isAndroid
                    //                     ? (widget.actualHeight - 40) / 18.1
                    //                     : (widget.actualHeight -
                    //                             MediaQuery.of(context)
                    //                                 .padding
                    //                                 .bottom) /
                    //                         17.9 *
                    //                         4,
                    //                 height: GetPlatform.isAndroid
                    //                     ? (widget.actualHeight - 40) / 18.1
                    //                     : (widget.actualHeight -
                    //                             MediaQuery.of(context)
                    //                                 .padding
                    //                                 .bottom) /
                    //                         17.9 *
                    //                         0.8,
                    //                 decoration: BoxDecoration(
                    //                   border: Border.all(
                    //                     color: Colors.black,
                    //                   ),
                    //                 ),
                    //               ),
                    //               Container(
                    //                 width: GetPlatform.isAndroid
                    //                     ? (widget.actualHeight - 40) / 18.1
                    //                     : (widget.actualHeight -
                    //                             MediaQuery.of(context)
                    //                                 .padding
                    //                                 .bottom) /
                    //                         17.9 *
                    //                         4,
                    //                 height: GetPlatform.isAndroid
                    //                     ? (widget.actualHeight - 40) / 18.1
                    //                     : (widget.actualHeight -
                    //                             MediaQuery.of(context)
                    //                                 .padding
                    //                                 .bottom) /
                    //                         17.9 *
                    //                         0.8,
                    //                 decoration: BoxDecoration(
                    //                   border: Border.all(
                    //                     color: Colors.black,
                    //                   ),
                    //                 ),
                    //               )
                    //             ],
                    //           ),
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    // )
                  ],
                );
              }),
        )
      ],
    );
  }

  itemWidget(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: GetPlatform.isAndroid
            ? ((widget.actualHeight - 40) / 17.9) * 1.8
            : ((widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                    17.9) *
                4.6,
        width: GetPlatform.isAndroid
            ? ((widget.actualHeight - 40) / 17.9) * 1.8
            : ((widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                    17.9) *
                3,
        decoration: BoxDecoration(color: Colors.grey[300]),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: GetPlatform.isAndroid
                    ? ((widget.actualHeight - 40) / 17.9) * 1.8
                    : ((widget.actualHeight -
                                MediaQuery.of(context).padding.bottom) /
                            17.9) *
                        2.5,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(shopController
                            .shopByListResponse.value[index].imageUrl!)),
                    border: Border.all(color: Colors.black),
                    color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            FittedBox(
                child: Text(shopController
                    .shopByListResponse.value[index].productName!)),
            const SizedBox(
              height: 10,
            ),
            Text(shopController.shopByListResponse.value[index].uom!),
            const SizedBox(
              height: 10,
            ),
            Text(shopController.shopByListResponse.value[index].productMrp!
                .toString()),

            // Container(
            //     height: 30,
            //     width: 30,
            //     decoration: BoxDecoration(
            //         color: Colors.grey[50],
            //         border: Border.all(color: Colors.green),
            //         boxShadow: const [
            //           BoxShadow(
            //               color: Colors.grey,
            //               spreadRadius: 1,
            //               blurRadius: 1,
            //               offset: Offset(4, 4))
            //         ]),
            //     child: const Center(
            //       child: Icon(
            //         Icons.add,
            //         color: Colors.green,
            //         size: 25,
            //       ),
            //     ))
          ],
        ),
      ),
    );
  }
}

class QRViewExample extends StatefulWidget {
  final double actualHeight;
  final double actualWidth;
  const QRViewExample(
      {Key? key, required this.actualHeight, required this.actualWidth})
      : super(key: key);

  @override
  _QRViewExampleState createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'BARCODE');
  var languageController = Get.put(LanguageController());
  Barcode? result;
  QRViewController? controller;

  final String _scanBarcode = 'Unknown';

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.actualHeight,
      width: widget.actualWidth,
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child:
                // (_scanBarcode != null) ? scanBarcodeNormal() : Container()
                QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: Colors.red,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
              ),
              onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: (result != null)
                  ? Text(
                      'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
                  : const Text('Scan a code'),
            ),
          )
        ],
      ),
    );
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                languageController.languageResponse.value.noPermission ?? '')),
      );
    }
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      controller.pauseCamera();
      final String qrCode = scanData.code!;
      print("QRCODE::$qrCode");

      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
