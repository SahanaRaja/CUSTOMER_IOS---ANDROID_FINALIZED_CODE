// ignore_for_file: must_be_immutable

import 'package:customer_assist/core/app_colors.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/controllers/shop_controller.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/sub_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/platform/platform.dart';
import 'package:get/instance_manager.dart';

class PromotionPage extends StatefulWidget {
  double actualHeight;
  PromotionPage({Key? key, required this.actualHeight}) : super(key: key);

  @override
  State<PromotionPage> createState() => _PromotionPageState();
}

class _PromotionPageState extends State<PromotionPage> {
  ShopController shopController = Get.find();
  LanguageController languageController = Get.find();
  var selectPromotion = [];
  // var promotList = [];

  @override
  void initState() {
    shopController.promoList.clear();
    selectPromotion = List.generate(
        shopController
            .companyCouponResponse.value.status!.companyCoupon!.length,
        (index) => false);
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
        SizedBox(
          height: GetPlatform.isAndroid
              // added by bhava
              ? ((widget.actualHeight - 40) / 17.9) * 14.2
              : ((widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                      17.9) *
                  15.5,
          child: ListView.builder(
              itemCount: shopController
                  .companyCouponResponse.value.status!.companyCoupon!.length,
              itemBuilder: (context, data) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: GetPlatform.isAndroid
                        ? (widget.actualHeight - 40) / 18.1
                        : (widget.actualHeight -
                                MediaQuery.of(context).padding.bottom) /
                            17.9 *
                            5,
                    height: GetPlatform.isAndroid
                        // added by bhava

                        ? (widget.actualHeight - 40) / 5.6
                        : (widget.actualHeight -
                                MediaQuery.of(context).padding.bottom) /
                            17.9 *
                            3.06,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(Radius.circular(15))),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                 width: 100,
                                  height: 100,
                                child: Image.network(
                                  shopController.companyCouponResponse.value.status!
                                      .companyCoupon![data].companyUrl!,
                                 
                                ),
                              ),
                              SizedBox(width: 20,),
                              Column(
                                children: [
                                  Container(
                                     width: 200,
                                  //height: 200,
                                    child: Text(
                                        shopController
                                            .companyCouponResponse
                                            .value
                                            .status!
                                            .companyCoupon![data]
                                            .companyName!,
                                        style: const TextStyle(
                                            fontSize: 25, color: Colors.grey)),
                                  ),
                                  Container(
                                     width: 200,
                                    child: Text(
                                        shopController.companyCouponResponse.value
                                            .status!.companyCoupon![data].promoName!,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: Colors.black)),
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: (() {
                                  setState(() {
                                    selectPromotion[data] = !selectPromotion[data];

                                    if (selectPromotion[data] == true) {
                                      var contains = shopController.promoList.where(
                                          (element) =>
                                              element['Company_Id'] ==
                                              shopController
                                                  .companyCouponResponse
                                                  .value
                                                  .status!
                                                  .companyCoupon![data]
                                                  .companyId);

                                      if (contains.isEmpty) {
                                        shopController.promoList.add({
                                          "Company_Id":
                                              "${shopController.companyCouponResponse.value.status!.companyCoupon![data].companyId}",
                                          "Promo_Id":
                                              "${shopController.companyCouponResponse.value.status!.companyCoupon![data].promoId}"
                                        });
                                      } else {
                                        shopController.promoList.remove({
                                          "Company_Id":
                                              "${shopController.companyCouponResponse.value.status!.companyCoupon![data].companyId}",
                                          "Promo_Id":
                                              "${shopController.companyCouponResponse.value.status!.companyCoupon![data].promoId}"
                                        });
                                      }
                                      print(shopController.promoList);
                                    }
                                      shopController
                                                  .fetchCompanyCustomerOffer(
                                                      shopController.promoList,
                                                      languageController.languagenum
                                                          .toString());
                                  });
                                }),
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
                                        color: selectPromotion[data] == true
                                            ? Colors.green
                                            : Colors.white,
                                        size: 25,
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
