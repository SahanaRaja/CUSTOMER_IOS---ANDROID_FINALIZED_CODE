import 'package:customer_assist/home/presentation/controllers/order_controller.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/widgets/keyboard/alpha_capital_letters.dart';
import 'package:customer_assist/home/presentation/widgets/keyboard/alpha_small_letters.dart';
import 'package:customer_assist/home/presentation/widgets/keyboard/numeral_special_char.dart';
import 'package:ensure_visible_when_focused/ensure_visible_when_focused.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../../core/app_constants.dart';
import '../../../../core/utils/size_config.dart';
import '../../controllers/keyboard_controller.dart';
import '../../controllers/view_controller.dart';

class ReviewRatingPage extends StatefulWidget {
  final double actualHeight;

  const ReviewRatingPage({
    Key? key,
    required this.actualHeight,
  }) : super(key: key);

  @override
  State<ReviewRatingPage> createState() => _ReviewRatingPageState();
}

class _ReviewRatingPageState extends State<ReviewRatingPage> {
  TextEditingController commentsController = TextEditingController();
  TextEditingController productcommentsController = TextEditingController();
  FocusNode commentsNode = FocusNode();
  FocusNode commentNode = FocusNode();
  ScrollController scrollController = ScrollController(); //add by gowshi
  OrderController orderController = Get.find();

  var languageController = Get.put(LanguageController());
  // added by bhava
  KeyboardController keyboardController = Get.find();
  ViewController viewController = Get.find();

  bool value1 = true;
  bool value2 = false;
  var ratings = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: GetPlatform.isAndroid
          ? (widget.actualHeight - 40) - (widget.actualHeight / 16.5) * 2 - 88
          : (widget.actualHeight - MediaQuery.of(context).padding.bottom) -
              (widget.actualHeight / 16.5) ,
              
      child: Stack(
        children: [
          ListView(
            shrinkWrap: true,
            controller: scrollController,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  addHeightBox(),
                  
                  addMenuButtons(),
                  addHeightBox(),
                  value1 ? storeWidget(context) : productWidget(context),
                 // addHeightBox(),
                  // addCommentBox(),
                  addBottomSpace(),
                //const SizedBox(height: 45,),
                   
                 const Text('Every review earns Loyality Points for you!',style: TextStyle(fontSize: 18,color: Colors.green),),
                 
                  
                ],
              )
            ],
          ),
          addKeyboard(),
        ],
      ),
    );
  }//add by gowshi

  Widget addMenuButtons() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      height: getHeight(context) ,
      width: getHeight(context) * 6,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        decoration: BoxDecoration(
          color: Colors.grey[600],
          borderRadius: const BorderRadius.all(Radius.circular(30)),
        ),
        child: Row(
          children: [
            Expanded(
              child: FractionallySizedBox(
                heightFactor: 1,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      value1 = true;
                      value2 = false;
                    });
                  },
                  //Monthly
                  child: Container(
                    decoration: BoxDecoration(
                      color: value1 ? Colors.white : Colors.grey[800],
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                    ),
                    child: Center(
                        child: Text(
                      languageController.languageResponse.value.store ?? '',
                      style: TextStyle(
                          fontSize: 21,
                          color: value1 ? Colors.grey[600] : Colors.white),
                    )),
                  ),
                ),
              ),
            ),
            Expanded(
              child: FractionallySizedBox(
                heightFactor: 1,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      value2 = true;
                      value1 = false;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: value2 ? Colors.white : Colors.grey[800],
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                    ),
                    child: Center(
                        child: Text(
                      languageController.languageResponse.value.product ?? '',
                      style: TextStyle(
                          fontSize: 21,
                          color: value2 ? Colors.grey[600] : Colors.white),
                    )),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget addHeightBox() {
    return SizedBox(
      height: getHeight(context)*1.19,
    );
  }

  Widget addKeyboard() {
    return GetX<KeyboardController>(
      builder: (controller) {
        return Positioned(
          bottom: 0,
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image:
                      AssetImage('assets/images/keypad_patchs/keypad_base.png'),
                  fit: BoxFit.fill),
            ),
            child: keyboardWidget(context, controller),
          ),
        );
      },
    );
  }

  storeWidget(BuildContext buildContext) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      child: Column(
        children: [
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: orderController.fetchStoreReviewResponse.value.length,
              itemBuilder: (buildContext, data) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        sizedTextView(
                            buildContext,
                            orderController.fetchStoreReviewResponse.value[data]
                                .reviewName!),
                        sizedRatingView(),
                        
                        // Container(
                        //   height:50,
                        //   width: 50 ,
                        //   color: Colors.amber,
                        // )
                      ],
                    ),
                  ],
                );
              }),
              addHeightBox(),
              addCommentBox(),
        ],
      ),
    );
  }

  productWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      child: Column(
        children: [
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount:
                  orderController.fetchProductReviewResponse.value.length,
              itemBuilder: (context, data) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    sizedTextView(
                        context,
                        orderController.fetchProductReviewResponse.value[data]
                            .reviewName!),
                    sizedRatingViewproduct(),
                  ],
                );
              }),
              addHeightBox(),
              addCommentBox2()

          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [sizedTextView(context, 'Packaging'), sizedRatingView()],
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [sizedTextView(context, 'Cost'), sizedRatingView()],
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [sizedTextView(context, 'Variety'), sizedRatingView()],
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     sizedTextView(context, 'Nutritional Value'),
          //     sizedRatingView()
          //   ],
          // ),
        ],
      ),
    );
  }

  RatingBar sizedRatingView() {
    return RatingBar.builder(
      itemSize: 28,
      //initialRating: 3,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      glow: false,
      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        
        setState(() {
          ratings = rating.toInt();
          // Prefs.setRatings(orderController.fetchProductReviewResponse.value[data]
          //                   .rating!.toString());
        });
        print(">>>>>>>>>>>>>>>>$ratings");
      },
    );
  }
   RatingBar sizedRatingViewproduct() {
    return RatingBar.builder(
      itemSize: 28,
     // initialRating: 3,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      glow: false,
      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }

  //add by gowshi
  Widget addCommentBox() {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: Container(
          height: getHeight(context) * 3,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey[500]!),
              boxShadow: const [
                BoxShadow(color: Colors.black45, offset: Offset(3, 5))
              ]),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: EnsureVisibleWhenFocused(
              focusNode: commentsNode,
              child: TextFormField(
                focusNode: commentsNode,
                readOnly: true,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText:
                        languageController.languageResponse.value.comments ??
                            ''),
                // added by bhava
                onTap: () {
                  keyboardController.setKeypad(CAPITALKEYBOARD);
                  keyboardController.controllerSetup(commentsController);
                  keyboardController.symbolTrue(true);
                   keyboardController.controllersetupforguest = "Storecomment";

                  scrollToBottom();
                },
                maxLines: 4,
                controller: commentsController,
              ),
            ),
          ),
        ),
      ),
    );
  }
Widget addCommentBox2() {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: Container(
          height: getHeight(context) * 3,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey[500]!),
              boxShadow: const [
                BoxShadow(color: Colors.black45, offset: Offset(3, 5))
              ]),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: EnsureVisibleWhenFocused(
              focusNode: commentNode,
              child: TextFormField(
                focusNode: commentNode,
                readOnly: true,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText:
                        languageController.languageResponse.value.comments ??
                            ''),
                // added by bhava
                onTap: () {
                  keyboardController.setKeypad(CAPITALKEYBOARD);
                  keyboardController.controllerSetup(productcommentsController);
                  keyboardController.symbolTrue(true);
                   keyboardController.controllersetupforguest = "productcomment";

                  scrollToBottom();
                },
                maxLines: 4,
                controller: productcommentsController,
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget addBottomSpace() {
    return SizedBox(height: MediaQuery.of(context).size.height * 0.30
    );
  }
//add by gowshi
  void scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 200), () {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    });
  }

  sizedTextView(BuildContext context, String textValues) {
    return SizedBox(
      width:
          (widget.actualHeight - MediaQuery.of(context).padding.bottom) / 4.8,
      height: (widget.actualHeight - MediaQuery.of(context).padding.bottom) /
          17.9 *
          1,
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Text(
          textValues,
          style: TextStyle(
            fontSize: 21,
            color: Colors.grey[600],
          ),
          textAlign: TextAlign.end,
        ),
      ),
    );
  }

  // added by bhava
  keyboardWidget(BuildContext context, KeyboardController controller) {
    if (viewController.viewKey.value == CLIENTPROFILE ||
        viewController.viewKey.value == PRODUCTPURCHASEPAGE ||
        viewController.viewKey.value == FAMILYMEMBERS ||
        viewController.viewKey.value == ADDFAMILYADDRESS) return;
    if (controller.changekeypad.value == SYMBOLSKEYBOARD) {
      return NumeralSpecialChar(
        actualHeight: widget.actualHeight,
        context: context,
        onValueChanged: (String) {
          keyOperation(context);
        },
        size: const Size(100, 200),
      );
    } else if (controller.changekeypad.value == CAPITALKEYBOARD) {
      return AlphaCapitalLetters(
        actualHeight: widget.actualHeight,
        context: context,
        onValueChanged: (String) {
          keyOperation(context);
        },
        size: const Size(100, 200),
      );
    } else if (controller.changekeypad.value == SMALLKEYBOARD) {
      return AlphaSmallLetters(
        actualHeight: widget.actualHeight,
        context: context,
        onValueChanged: (String) {
          keyOperation(context);
        },
        size: const Size(100, 200),
      );
    } else {
      Container();
    }
  }

  // added by bhava
  Future<void> keyOperation(context) async {
    if (keyboardController.specialKeypad.value == 'DEL') {
      keyboardController.currentController.value =
          keyboardController.currentController.value.text.substring(
                  0, keyboardController.currentController.value.text.length - 1)
              as TextEditingController;
    } else if (keyboardController.specialKeypad.value == 'CLR') {
      keyboardController.currentController.value.clear();
    } else if (keyboardController.specialKeypad.value == 'SPACE') {
      keyboardController.currentController.value.text =
          "${keyboardController.currentController.value.text} ";
    } else if (keyboardController.specialKeypad.value == 'NEXT') {
    } else {}
  }
}
