import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/controllers/payment_review_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/size_config.dart';

class GiftCardsPage extends StatefulWidget {
  final double actualHeight;

  const GiftCardsPage({Key? key, required this.actualHeight}) : super(key: key);

  @override
  State<GiftCardsPage> createState() => _GiftCardsPageState();
}

class _GiftCardsPageState extends State<GiftCardsPage> {
  PaymentReviewController paymentReviewController = Get.find();
  var languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
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
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              getSizedBox(context,
                  languageController.languageResponse.value.billAmount ?? ''),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 8.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      paymentReviewController.totalPrice.toString(),
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
