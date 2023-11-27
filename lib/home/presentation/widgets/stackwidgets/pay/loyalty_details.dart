import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/size_config.dart';
import '../../../controllers/payment_review_controller.dart';

class LoyaltyDetails extends StatefulWidget {
  final double actualHeight;

  const LoyaltyDetails({Key? key, required this.actualHeight})
      : super(key: key);
  @override
  State<LoyaltyDetails> createState() => _LoyaltyDetailsState();
}

class _LoyaltyDetailsState extends State<LoyaltyDetails> {
  var languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext buildcontext) {
    return SizedBox(
      height: ((widget.actualHeight - MediaQuery.of(context).padding.bottom) /
              17.9) *
          14,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              getSizedBox(
                  context,
                  languageController.languageResponse.value.headOfAccount ??
                      ''),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 8.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      languageController.languageResponse.value.amountIn ?? '',
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ),
                ),
              ),
            ],
          ),
          GetX<PaymentReviewController>(
            init: PaymentReviewController(),
            initState: (_) {},
            builder: (paymentController) {
              return SizedBox(
                height: ((widget.actualHeight -
                            MediaQuery.of(context).padding.bottom) /
                        17.9) *
                    13,
                child: ListView.builder(
                    itemCount: paymentController.loyaltyResponse.value.length,
                    itemBuilder: (buildcontext, data) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          getSizedBox(
                              context,
                              paymentController
                                  .loyaltyResponse.value[data].description!),
                          Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 25, right: 8.0),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  paymentController.loyaltyResponse.value[data]
                                      .conversionAmount!
                                      .toString(),
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
              );
            },
          )
        ],
      ),
    );
  }

  Container getSizedBox(BuildContext context, String value) {
    return Container(
      width: getProportionateScreenWidth(200),
      decoration: const BoxDecoration(
          border: Border(right: BorderSide(color: Colors.grey))),
      height: GetPlatform.isAndroid
          ? (widget.actualHeight - 40) / 18.1
          : (widget.actualHeight - MediaQuery.of(context).padding.bottom) /
              17.9,
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
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
            ? (widget.actualHeight - 40) / 18.2
            : (widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                17.9 *
                1,
        width: getProportionateScreenWidth(125),
        child: Center(child: Text(controller!)),
        // TextFormField(
        //   readOnly: true,
        //   showCursor: true,
        //   // focusNode: _focuss[index],
        //   onChanged: (value) {
        //     print("value $value");
        //   },
        //   onTap: () {},
        //   controller: controller,
        //   decoration: InputDecoration(
        //     border: InputBorder.none,
        //     // hintText: "Mail ID",
        //     // filled: _isFocus[index],
        //     fillColor: textFieldColor,
        //   ),
        //   style: const TextStyle(fontSize: 21),
        // ),
      ),
    );
  }
}
