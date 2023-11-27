// ignore_for_file: must_be_immutable, prefer_const_constructors
// import 'package:flutter/material.dart';

// class CouponPage extends StatefulWidget {
//   double actualHeight;
//   CouponPage({Key? key, required this.actualHeight}) : super(key: key);

//   @override
//   State<CouponPage> createState() => _CouponPageState();
// }

// class _CouponPageState extends State<CouponPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // color: Colors.amber,
//       child: Column(
//         children: [
//           Container(
//             color: const Color.fromARGB(255, 210, 207, 207),
//             height: 55,
//             width: double.infinity,
//             child: Center(
//                 child: Text(
//               "Coupons",
//               style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black),
//             )),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:customer_assist/core/app_colors.dart';
import 'package:customer_assist/home/presentation/controllers/header_controller.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/controllers/options_controller.dart';
import 'package:customer_assist/home/presentation/controllers/shop_controller.dart';
import 'package:customer_assist/home/presentation/controllers/view_controller.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/sub_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/platform/platform.dart';
import 'package:get/instance_manager.dart';

import '../../../../../core/app_constants.dart';

class CouponPage extends StatefulWidget {
  double actualHeight;
  CouponPage({Key? key, required this.actualHeight}) : super(key: key);

  @override
  State<CouponPage> createState() => _CouponPageState();
}

class _CouponPageState extends State<CouponPage> {
  ShopController shopController = Get.find();
  OptionsController optionsController = Get.find();
  ViewController viewController = Get.find();
  var languaggeController = Get.put(LanguageController());
  var headerController = Get.put(HeaderController());
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
              SizedBox(height: 5,),
          Container(
            color: AppColors.couponColor,
            height: GetPlatform.isAndroid
                ? ((widget.actualHeight - 40) / 17.9) * 15.5
                //  1.8
                : ((widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                        17.9) *
                    15.4,
            child: Padding(
              padding: const EdgeInsets.all(35.0),
              child: Center(
                  child: Column(
                children: [
                  
                  SizedBox(
                    height: GetPlatform.isAndroid
                        ? ((widget.actualHeight - 40) / 17.9) * 1
                        // 1.8
                        : ((widget.actualHeight -
                                    MediaQuery.of(context).padding.bottom) /
                                17.9) *
                            2,
                  ),
                  Text(
                    shopController.shoppingResponse.value.status!.message1!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white, fontSize: 35),
                  ),
                  SizedBox(
                    height: GetPlatform.isAndroid
                        ? ((widget.actualHeight - 40) / 17.9) * 1.8
                        : ((widget.actualHeight -
                                    MediaQuery.of(context).padding.bottom) /
                                17.9) *
                            1.5,
                  ),
                  Text(
                    shopController.shoppingResponse.value.status!.message2!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white, fontSize: 35),
                  ),
                  SizedBox(
                    height: GetPlatform.isAndroid
                        ? ((widget.actualHeight - 40) / 17.9) * 1.8
                        : ((widget.actualHeight -
                                    MediaQuery.of(context).padding.bottom) /
                                17.9) *
                            2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                           viewController.setView(PRODUCTNEWPAGE);
                      viewController.setUserOption(CLIENT);
                      headerController.setSubHeaderLabel('Main Category');
                         // optionsController.setOptionList(NEWORDERCHANGE);
                          //  headerController.setSubHeaderLabel('By Direct Item Search');
                          //   viewController.setView(SEARCHITEM);
                          //   optionsController.optionIndexSetter(0);
                          //   optionsController.setSetState();
                          // viewController.setView('');
                        },
                        child: Container(
                          height: GetPlatform.isAndroid
                              ? ((widget.actualHeight - 40) / 17.9) * 0.9
                              // 1.8
                              : ((widget.actualHeight -
                                          MediaQuery.of(context).padding.bottom) /
                                      17.9) *
                                  0.8,
                          width: GetPlatform.isAndroid
                              ? ((widget.actualHeight - 40) / 17.9) * 2.9
                              // 1.8
                              : ((widget.actualHeight -
                                          MediaQuery.of(context).padding.bottom) /
                                      17.9) *
                                  3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.grey[50],
                              border: Border.all(color: Colors.white),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.grey,
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: Offset(4, 4))
                              ]),
                          child: Center(
                            child: Text(
                              languaggeController.languageResponse.value.notNow ?? '',
                              style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (() {
                          shopController.fetchCouponValues(
                              languaggeController.languagenum.toString());
                        }),
                        child: Container(
                          height: GetPlatform.isAndroid
                              ? ((widget.actualHeight - 40) / 17.9) * 0.9
                              // 1.8
                              : ((widget.actualHeight -
                                          MediaQuery.of(context).padding.bottom) /
                                      17.9) *
                                  0.8,
                          width: GetPlatform.isAndroid
                              ? ((widget.actualHeight - 40) / 17.9) * 2.9
                              // 1.8
                              : ((widget.actualHeight -
                                          MediaQuery.of(context).padding.bottom) /
                                      17.9) *
                                  3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.grey[50],
                              border: Border.all(color: Colors.white),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.grey,
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: Offset(4, 4))
                              ]),
                          child: Center(
                            child: Text(
                              languaggeController.languageResponse.value.yesSym ?? '',
                              style: const TextStyle(
                                  color: Colors.green,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )),
            ),
          ),
        ],
      ),
    );
  }
}
