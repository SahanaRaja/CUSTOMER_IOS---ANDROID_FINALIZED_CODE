import 'dart:developer';
import 'dart:io';

import 'package:customer_assist/core/app_colors.dart';
import 'package:customer_assist/home/presentation/controllers/header_controller.dart';
import 'package:customer_assist/home/presentation/controllers/keyboard_controller.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/controllers/options_controller.dart';
import 'package:customer_assist/home/presentation/controllers/shop_controller.dart';
import 'package:customer_assist/home/presentation/controllers/view_controller.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/sub_header.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class RestaurantQrcodeTab extends StatefulWidget {
  final double actualHeight;

  const RestaurantQrcodeTab({Key? key, required this.actualHeight})
      : super(key: key);

  @override
  State<RestaurantQrcodeTab> createState() => _RestaurantQrcodeTabState();
}

class _RestaurantQrcodeTabState extends State<RestaurantQrcodeTab> {
  var padder = false;

  HeaderController headerController = Get.find();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Container(
    
              // margin: const EdgeInsets.only(right: 2),
             height: MediaQuery.of(context).size.height * 0.043,
              width: MediaQuery.of(context).size.width * 0.99,
              color: AppColors.subHeaderContainer,
              child: const Center(child: SubHeader())),
              SizedBox(height: 2,),
        SizedBox(
            width: double.infinity,
            height: GetPlatform.isAndroid
                ? (((widget.actualHeight - 40) / 17.9) * 14)
                : ((widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                        17.9) *
                    14,
            child: StatefulBuilder(builder: (buildcontext, setState) {
              return Stack(
                children: [
                 
                  Positioned(
                      child: SizedBox(
                          height: (((widget.actualHeight - 40) / 17.9) * 14),
                          width: MediaQuery.of(context).size.width,
                          child: const QRViewExample())),
                ],
              );
            })),
      ],
    );
  }
}

class QRViewExample extends StatefulWidget {
  const QRViewExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  final Permission _permission = const PermissionWithService.private(1);
  PermissionStatus _permissionStatus = PermissionStatus.denied;
  ShopController shopcontroller = Get.find();
  KeyboardController keyboardController = Get.find();
  ViewController viewController = Get.find();
  OptionsController optioncontroller = Get.find();
  LanguageController languageController = Get.find();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // if (result != null) {
    //   String search = result!.code!.split("_")[1];
    //   shopcontroller.downloadRestaurantProduct(search);
    //   controller!.stopCamera();
    //   controller!.dispose();
    //   viewController.setView("Shopselectioncond");
    // }
    super.didChangeDependencies();
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    // if (result != null) {
    //   String search = result!.code!.split("_")[1];
    //   shopcontroller.downloadRestaurantProduct(search);
    //   controller!.stopCamera();
    //   controller!.dispose();
    //   viewController.setView("Shopselectioncond");
    // }

    return Column(
      children: <Widget>[
        Expanded(
          flex: 4, child: _buildQrView(context)),
        Expanded(
          flex: 1,
          child: FittedBox(
            fit: BoxFit.contain,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // if (result != null) Text(
                //     //'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
                //     '  ${result!.code}') else const Text('Scan a code'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // Container(
                    //   margin: const EdgeInsets.all(8),
                    //   child: ElevatedButton(
                    //       onPressed: () async {
                    //         await controller?.toggleFlash();
                    //         setState(() {});
                    //       },
                    //       child: FutureBuilder(
                    //         future: controller?.getFlashStatus(),
                    //         builder: (context, snapshot) {
                    //           return Text('Flash: ${snapshot.data}');
                    //         },
                    //       )),
                    // ),
                    Container(
                      margin: const EdgeInsets.all(8),
                      child: ElevatedButton(
                          onPressed: () async {
                            await controller?.flipCamera();
                            setState(() {});
                          },
                          child: FutureBuilder(
                            future: controller?.getCameraInfo(),
                            builder: (context, snapshot) {
                              if (snapshot.data != null) {
                                return Text(
                                    '${languageController.languageResponse.value.cameraFacing ?? ''} ${describeEnum(snapshot.data!)}');
                              } else {
                                return  Text(
                                  languageController
                                            .languageResponse.value.loading ??
                                        ''
                                  //'loading'
                                  );
                              }
                            },
                          )),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.all(8),
                      child: ElevatedButton(
                        onPressed: () async {
                          await controller?.pauseCamera();
                        },
                        child:
                             Text(
                               languageController.languageResponse.value.pause ??
                                '',
                             // 'pause', 
                            style: const TextStyle(fontSize: 20)),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(8),
                      child: ElevatedButton(
                        onPressed: () async {
                          await controller?.resumeCamera();
                        },
                        child:  Text(
                          languageController.languageResponse.value.resume ??
                                '',
                          //'resume',
                            style: const TextStyle(fontSize: 20)),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() async {
        result = scanData;


        await router(result);
        viewController.setView('Shopselectioncond');
      });
    });;
  }

  router(Barcode? result) {
    if (result != null) {
      String search = result.code!.split("_")[1];
      viewController.qrvalue = search;
      shopcontroller.downloadRestaurantProduct(search);
      controller!.stopCamera();
      controller!.dispose();
    }
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(content: Text(
           languageController.languageResponse.value.noPermission ?? ''
          //'no Permission'
          )),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void checkServiceStatus(
      BuildContext context, PermissionWithService permission) async {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text((await permission.serviceStatus).toString()),
    ));
  }

  Future<void> requestPermission(Permission permission) async {
    final status = await permission.request();

    setState(() {
      print(status);
      _permissionStatus = status;
      print(_permissionStatus);
    });
  }
}


















// import 'dart:developer';
// import 'dart:io';

// import 'package:customer_assist/home/presentation/controllers/header_controller.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';

// class RestaurantQrcodeTab extends StatefulWidget {
//   final double actualHeight;

//   const RestaurantQrcodeTab({Key? key, required this.actualHeight})
//       : super(key: key);

//   @override
//   State<RestaurantQrcodeTab> createState() => _RestaurantQrcodeTabState();
// }

// class _RestaurantQrcodeTabState extends State<RestaurantQrcodeTab> {
//   var padder = false;
//   Barcode? result;
//   QRViewController? controller;
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

//   HeaderController headerController = Get.find();
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void reassemble() {
//     super.reassemble();
//     if (Platform.isAndroid) {
//       controller!.pauseCamera();
//     }
//     controller!.resumeCamera();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//         width: double.infinity,
//         height: GetPlatform.isAndroid
//             ? (((widget.actualHeight - 40) / 17.9) * 14)
//             : ((widget.actualHeight - MediaQuery.of(context).padding.bottom) /
//                     17.9) *
//                 14,
//         child: StatefulBuilder(builder: (buildcontext, setState) {
//           return Stack(
//             children: [
//               Positioned(
//                 top: widget.actualHeight / 12,
//                 child: Column(
//                   children: [
//                     Container(
//                         width: 500,
//                         height: 98,
//                         margin: const EdgeInsets.only(bottom: 36.5),
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 50, vertical: 30),
//                         child: QRViewExample()),
//                     SizedBox(
//                       height: GetPlatform.isAndroid
//                           ? (((widget.actualHeight - 40) / 17.9) * 2)
//                           : ((widget.actualHeight -
//                                       MediaQuery.of(context).padding.bottom) /
//                                   17.9) *
//                               0.0,
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           );
//         }));
//   }
// }

// class QRViewExample extends StatefulWidget {
//   const QRViewExample({Key? key}) : super(key: key);

//   @override
//   State<StatefulWidget> createState() => _QRViewExampleState();
// }

// class _QRViewExampleState extends State<QRViewExample> {
//   Barcode? result;
//   QRViewController? controller;
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

//   @override
//   void reassemble() {
//     super.reassemble();
//     if (Platform.isAndroid) {
//       controller!.pauseCamera();
//     }
//     controller!.resumeCamera();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         Expanded(flex: 4, child: _buildQrView(context)),
//         Expanded(
//           flex: 1,
//           child: FittedBox(
//             fit: BoxFit.contain,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: <Widget>[
//                 if (result != null)
//                   Text(
//                       'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
//                 else
//                   const Text('Scan a code'),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: <Widget>[
//                     Container(
//                       margin: const EdgeInsets.all(8),
//                       child: ElevatedButton(
//                           onPressed: () async {
//                             await controller?.toggleFlash();
//                             setState(() {});
//                           },
//                           child: FutureBuilder(
//                             future: controller?.getFlashStatus(),
//                             builder: (context, snapshot) {
//                               return Text('Flash: ${snapshot.data}');
//                             },
//                           )),
//                     ),
//                     Container(
//                       margin: const EdgeInsets.all(8),
//                       child: ElevatedButton(
//                           onPressed: () async {
//                             await controller?.flipCamera();
//                             setState(() {});
//                           },
//                           child: FutureBuilder(
//                             future: controller?.getCameraInfo(),
//                             builder: (context, snapshot) {
//                               if (snapshot.data != null) {
//                                 return Text(
//                                     'Camera facing ${describeEnum(snapshot.data!)}');
//                               } else {
//                                 return const Text('loading');
//                               }
//                             },
//                           )),
//                     )
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: <Widget>[
//                     Container(
//                       margin: const EdgeInsets.all(8),
//                       child: ElevatedButton(
//                         onPressed: () async {
//                           await controller?.pauseCamera();
//                         },
//                         child:
//                             const Text('pause', style: TextStyle(fontSize: 20)),
//                       ),
//                     ),
//                     Container(
//                       margin: const EdgeInsets.all(8),
//                       child: ElevatedButton(
//                         onPressed: () async {
//                           await controller?.resumeCamera();
//                         },
//                         child: const Text('resume',
//                             style: TextStyle(fontSize: 20)),
//                       ),
//                     )
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         )
//       ],
//     );
//   }

//   Widget _buildQrView(BuildContext context) {
//     // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
//     var scanArea = (MediaQuery.of(context).size.width < 400 ||
//             MediaQuery.of(context).size.height < 400)
//         ? 150.0
//         : 300.0;
//     // To ensure the Scanner view is properly sizes after rotation
//     // we need to listen for Flutter SizeChanged notification and update controller
//     return QRView(
//       key: qrKey,
//       onQRViewCreated: _onQRViewCreated,
//       overlay: QrScannerOverlayShape(
//           borderColor: Colors.red,
//           borderRadius: 10,
//           borderLength: 30,
//           borderWidth: 10,
//           cutOutSize: scanArea),
//       onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
//     );
//   }

//   void _onQRViewCreated(QRViewController controller) {
//     setState(() {
//       this.controller = controller;
//     });
//     controller.scannedDataStream.listen((scanData) {
//       setState(() {
//         result = scanData;
//       });
//     });
//   }

//   void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
//     log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
//     if (!p) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('no Permission')),
//       );
//     }
//   }

//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }


