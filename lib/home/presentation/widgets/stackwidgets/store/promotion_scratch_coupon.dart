// ignore_for_file: must_be_immutable

import 'package:customer_assist/core/app_colors.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/controllers/options_controller.dart';
import 'package:customer_assist/home/presentation/controllers/shop_controller.dart';
import 'package:customer_assist/home/presentation/controllers/view_controller.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/sub_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/platform/platform.dart';
import 'package:get/instance_manager.dart';
import 'package:scratcher/scratcher.dart';

import '../../../../../core/app_constants.dart';

class PromotionScratchCoupon extends StatefulWidget {
  double actualHeight;
  PromotionScratchCoupon({Key? key, required this.actualHeight})
      : super(key: key);

  @override
  State<PromotionScratchCoupon> createState() => _PromotionScratchCouponState();
}

class _PromotionScratchCouponState extends State<PromotionScratchCoupon> {
  ShopController shopController = Get.find();
  OptionsController optionsController = Get.find();
  ViewController viewController = Get.find();
  var languageController = Get.put(LanguageController());
  int scratchView = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        // color: Colors.black,
        height: GetPlatform.isAndroid
            ? ((widget.actualHeight - 40) / 17.9) * 15.9
            : ((widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                    17.9) *
                15.5,
        // child: getScratchview(scratchView));
        child: Column(
          children: [
            Container(

            // margin: const EdgeInsets.only(right: 2),
           height: MediaQuery.of(context).size.height * 0.043,
              width: MediaQuery.of(context).size.width * 0.99,
              color: AppColors.subHeaderContainer,
            child: const Center(child: SubHeader())),
            // ...List.generate(
            //   shopController.companyOffer.value.status!.offer!.length,
            //   (index) => Image.network(
            //     shopController
            //         .companyOffer.value.status!.offer![0].promoTopImage!,
            //   ),
            // ),

            Container(
              height: 250,
              child: Image.network(
                shopController.companyOffer.value.status!.offer![0].offerImage!,
              ),
            ),

            Container(
              height: 250,
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Scratcher(
                  brushSize: 30,
                  threshold: 50,
                  color: Colors.grey,
                  onChange: (value) {
                    print("Scratch progress: $value%");
                    if (value > 85.00) {
                      shopController.updateCustomerCoupon([
                        {
                          "Company_Id":
                              "${shopController.companyOffer.value.status!.offer![scratchView].companyId}",
                          "PromoId":
                              "${shopController.companyOffer.value.status!.offer![scratchView].promoCode}",
                          "CouponNo":
                              "${shopController.companyOffer.value.status!.offer![scratchView].couponNo}",
                        }
                      ], languageController.languagenum.toString());
                    }
            
                    if (value > 98.00) {
                      shopController.companyOffer.value.status!.offer!.length;
                      if (scratchView <
                          shopController
                              .companyOffer.value.status!.offer!.length) {
                        setState(() {
                          scratchView++;
                        });
                      } else {
                        optionsController.setOptionList(NEWORDERCHANGE);
                        viewController.setView('');
                      }
                    }
                  },
                  onThreshold: () => print("Threshold reached, you won!"),
                  image: Image.network(
                    shopController.companyOffer.value.status!.offer![scratchView]
                        .offerImage!,
                  ),
                  child: Container(
                    height: GetPlatform.isAndroid
                        ? ((widget.actualHeight - 40) / 17.9) * 2
                        : ((widget.actualHeight -
                                    MediaQuery.of(context).padding.bottom) /
                                17.9) *
                            4,
                    width: 300,
                    color: Colors.white,
                    child: Center(
                      child: Text(
                        shopController.companyOffer.value.status!
                            .offer![scratchView].couponNo!,
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            Container(
              height: 320,
              width: double.infinity,
              child: Image.network(
                shopController.companyOffer.value.status!.offer![scratchView]
                    .promoBottomImage!,
              ),
            )
          ],
        ));
  }

  getScratchview(int scratchView) {
    Column(
      children: [
        // ...List.generate(
        //   shopController.companyOffer.value.status!.offer!.length,
        //   (index) => Image.network(
        //     shopController
        //         .companyOffer.value.status!.offer![0].promoTopImage!,
        //   ),
        // ),

        Image.network(
          shopController.companyOffer.value.status!.offer![0].offerImage!,
        ),

        Padding(
          padding: const EdgeInsets.all(3.0),
          child: Scratcher(
            brushSize: 30,
            threshold: 50,
            color: Colors.grey,
            onChange: (value) {
              print("Scratch progress: $value%");
              if (value > 85.00) {
                shopController.updateCustomerCoupon([
                  {
                    "Company_Id":
                        "${shopController.companyOffer.value.status!.offer![scratchView].companyId}",
                    "PromoId":
                        "${shopController.companyOffer.value.status!.offer![scratchView].promoCode}",
                    "CouponNo":
                        "${shopController.companyOffer.value.status!.offer![scratchView].couponNo}"
                  }
                ], languageController.languagenum.toString());
              }

              if (value == 100) {
                shopController.companyOffer.value.status!.offer!.length;
                if (scratchView <
                    shopController.companyOffer.value.status!.offer!.length) {
                  setState(() {
                    scratchView++;
                  });
                } else {
                  optionsController.setOptionList(NEWORDERCHANGE);
                  viewController.setView('');
                }
              }
            },
            onThreshold: () => print("Threshold reached, you won!"),
            image: Image.network(
              shopController
                  .companyOffer.value.status!.offer![scratchView].offerImage!,
            ),
            child: Container(
              height: GetPlatform.isAndroid
                  ? ((widget.actualHeight - 40) / 17.9) * 1.8
                  : ((widget.actualHeight -
                              MediaQuery.of(context).padding.bottom) /
                          17.9) *
                      4,
              width: 300,
              color: Colors.white,
              child: Center(
                child: Text(
                  shopController
                      .companyOffer.value.status!.offer![scratchView].couponNo!,
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),

        Image.network(
          shopController
              .companyOffer.value.status!.offer![scratchView].promoBottomImage!,
        )
      ],
    );
  }
}
