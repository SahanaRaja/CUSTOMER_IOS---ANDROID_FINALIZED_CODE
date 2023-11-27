import 'package:customer_assist/core/app_constants.dart';
import 'package:customer_assist/home/presentation/controllers/keyboard_controller.dart';
import 'package:customer_assist/home/presentation/controllers/shop_controller.dart';
import 'package:customer_assist/home/presentation/widgets/keyboard/alpha_capital_letters.dart';
import 'package:customer_assist/home/presentation/widgets/keyboard/alpha_small_letters.dart';
import 'package:customer_assist/home/presentation/widgets/keyboard/numeral_special_char.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShopAtStoreWeigh extends StatefulWidget {
  final double actualHeight;
  final TextEditingController firstController;
  const ShopAtStoreWeigh({Key? key, required this.actualHeight,required this.firstController})
      : super(key: key);

  @override
  State<ShopAtStoreWeigh> createState() => _ShopAtStoreWeighState();
}

class _ShopAtStoreWeighState extends State<ShopAtStoreWeigh> {
  TextEditingController firstController =TextEditingController();
  var keyboardController = Get.put(KeyboardController());
  ShopController shopController = Get.find();
  final FocusNode _focuss = FocusNode();
  
  final bool _isFocuse = false;
  
   var checklist;
    var index = 0 ;
   @override
  void initState() {
    shopController.selectedList.clear();
    checklist = List.generate(
        shopController.productweight.value.length, (index) => false);

    print(checklist);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(

      children:[ 
        Column(
        children: [
          GetX<ShopController>(
            init: ShopController(),
            initState: (_) {},
            builder: (shopController) {
              // children: [
              return
           ListView.builder(
              shrinkWrap: true,
              itemCount:
              shopController.productweight.value.length,
              itemBuilder: (buildContext, data) {
          return 
          Container(
            margin: const EdgeInsets.only(left: 5,right: 5,top: 5),
            height: 170,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(),borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: GetPlatform.isAndroid
                      ? (widget.actualHeight -
                              MediaQuery.of(context).padding.bottom) /
                          17.9 *
                          2.9
                      : (widget.actualHeight -
                              MediaQuery.of(context).padding.bottom) /
                          17.9 *
                          2.9,
                  height: GetPlatform.isAndroid
                      ? (widget.actualHeight -
                              MediaQuery.of(context).padding.bottom) /
                          17.9 *
                          2.9
                      : (widget.actualHeight -
                              MediaQuery.of(context).padding.bottom) /
                          17.9 *
                          2.9,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                       image: DecorationImage(
                                                    image: NetworkImage(
                                                      shopController
                                                          .productweight[
                                                              data]
                                                          .imageurl!,
                                                    ),
                                                    fit: BoxFit.fill
                                                    ),
                      ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0,top:15 ),
                  child: Column(
                    
                    children: [
                      Container(
                        width: GetPlatform.isAndroid
                            ? (widget.actualHeight -
                                    MediaQuery.of(context).padding.bottom) /
                                17.9 *
                                4.5
                            : (widget.actualHeight -
                                    MediaQuery.of(context).padding.bottom) /
                                17.9 *
                                4.5,
                        height: GetPlatform.isAndroid
                            ? (widget.actualHeight -
                                    MediaQuery.of(context).padding.bottom) /
                                17.9 *
                                0.80
                            : (widget.actualHeight -
                                    MediaQuery.of(context).padding.bottom) /
                                17.9 *
                                0.80,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                        child: Center(
                          child: Text(
                                        shopController.productweight
                                            .value[data].productname?? '',
                                        style: const TextStyle(
                                          fontSize: 20,
                                            overflow: TextOverflow.ellipsis),
                                      ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: GetPlatform.isAndroid
                            ? (widget.actualHeight -
                                    MediaQuery.of(context).padding.bottom) /
                                17.9 *
                                4.5
                            : (widget.actualHeight -
                                    MediaQuery.of(context).padding.bottom) /
                                17.9 *
                                4.5,
                        height: GetPlatform.isAndroid
                            ? (widget.actualHeight -
                                    MediaQuery.of(context).padding.bottom) /
                                17.9 *
                                0.80
                            : (widget.actualHeight -
                                    MediaQuery.of(context).padding.bottom) /
                                17.9 *
                                0.80,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                        child: Center(
                          child: Text(
                                        shopController.productweight
                                            .value[data].netweight ??'',
                                        style: const TextStyle(
                                          fontSize: 20,
                                            overflow: TextOverflow.ellipsis),
                                      ),
                        ),
                      ),
                      //sizedBoxController(widget.firstController, _focuss, _isFocuse),
                     
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: GetPlatform.isAndroid
                            ? (widget.actualHeight -
                                    MediaQuery.of(context).padding.bottom) /
                                17.9 *
                                4.5
                            : (widget.actualHeight -
                                    MediaQuery.of(context).padding.bottom) /
                                17.9 *
                                4.5,
                        height: GetPlatform.isAndroid
                            ? (widget.actualHeight -
                                    MediaQuery.of(context).padding.bottom) /
                                17.9 *
                                0.80
                            : (widget.actualHeight -
                                    MediaQuery.of(context).padding.bottom) /
                                17.9 *
                                0.80,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                        child: Center(
                          child: Text(
                                        shopController.productweight
                                            .value[data].productRate!.toString(),
                                        style: const TextStyle(
                                           fontSize: 20),
                                      ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
          });})
          
        ],
      ),
      GetX<KeyboardController>(
                init: KeyboardController(),
                initState: (_) {},
                builder: (controller) {
                  return Positioned(
                   // top: 450,
                      bottom: 0,
                      child: Container(
                        height: 310,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/keypad_patchs/keypad_base.png'),
                              fit: BoxFit.fill),
                        ),
                        child: keyboardWidget(context, controller),
                      ));
                },
              ),
      ]
    );
  }
  keyboardWidget(BuildContext context, KeyboardController controller) {
    if (controller.changekeypad.value == SYMBOLSKEYBOARD) {
      return NumeralSpecialChar(
        actualHeight: widget.actualHeight,
        context: context,
        onValueChanged: (String) {
          // keyOperation(context);
        },
        size: const Size(100, 200),
      );
    } else if (controller.changekeypad.value == CAPITALKEYBOARD) {
      return AlphaCapitalLetters(
        actualHeight: widget.actualHeight,
        context: context,
        onValueChanged: (String) {
          // keyOperation(context);
        },
        size: const Size(100, 200),
      );
    } else if (controller.changekeypad.value == SMALLKEYBOARD) {
      return AlphaSmallLetters(
        actualHeight: widget.actualHeight,
        context: context,
        onValueChanged: (String) {
          // keyOperation(context);
        },
        size: const Size(100, 200),
      );
    } else {
      Container();
    }
  }
  

  SizedBox sizedBoxController(controller, FocusNode focus, bool status) {
    return SizedBox(
      child: Container(
        width: GetPlatform.isAndroid
                            ? (widget.actualHeight - 40) / 18.1
                            : (widget.actualHeight -
                                    MediaQuery.of(context).padding.bottom) /
                                17.9 *
                                4.5,
                        height: GetPlatform.isAndroid
                            ? (widget.actualHeight - 40) / 18.1
                            : (widget.actualHeight -
                                    MediaQuery.of(context).padding.bottom) /
                                17.9 *
                                0.80,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
        child: Center(
          child: TextFormField(
            readOnly: true,
            showCursor: false,
            focusNode: focus,
            
            onTap: () {
             // print('*****************');
              
                  keyboardController.symbolTrue(true);
                  keyboardController.setKeypad(SYMBOLSKEYBOARD);
                  keyboardController.controllerSetup(controller);
                  keyboardController.focusSetup(focus, controller);
            
                  print(">>>>>>>>>>>>>${widget.firstController.text}");
                  //reviewController.setCashPaid(int.parse(widget.firstController.text));
              
            
            },
            controller: controller,
            decoration: InputDecoration(
              // hintText: "Mail ID",
              border: InputBorder.none,
              filled: status,
              fillColor: textFieldColor,
            ),
            style: const TextStyle(fontSize: 20,),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
}
}
