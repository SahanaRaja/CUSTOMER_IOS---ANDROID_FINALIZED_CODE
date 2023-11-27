import 'package:customer_assist/core/app_colors.dart';
import 'package:customer_assist/core/app_constants.dart';
import 'package:customer_assist/core/utils/size_config.dart';
import 'package:customer_assist/home/presentation/controllers/add_cart_review_controller.dart';
import 'package:customer_assist/home/presentation/controllers/configure_controller.dart';
import 'package:customer_assist/home/presentation/controllers/header_controller.dart';
import 'package:customer_assist/home/presentation/controllers/keyboard_controller.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/controllers/options_controller.dart';
import 'package:customer_assist/home/presentation/controllers/order_controller.dart';
import 'package:customer_assist/home/presentation/controllers/payment_review_controller.dart';
import 'package:customer_assist/home/presentation/controllers/view_controller.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/sub_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/src/platform/platform.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReviewOrder extends StatefulWidget {
  final double actualHeight;
  const ReviewOrder({Key? key, required this.actualHeight})
      : super(key: key);

  @override
  State<ReviewOrder> createState() => _ReviewOrderState();
}

class _ReviewOrderState extends State<ReviewOrder> {
  TextEditingController retailVertical = TextEditingController();
  TextEditingController shoppingMode = TextEditingController();
  ConfigureController configureController = Get.find();
  AddCartReviewController addCartReviewController = Get.find();
 PaymentReviewController reviewController = Get.find();
  OptionsController optionsController = Get.find();
  ViewController viewController = Get.find();
  HeaderController headerController = Get.find();
  KeyboardController keyboardController = Get.find();
  var languageController = Get.put(LanguageController());
 TextEditingController shop = TextEditingController();
  TextEditingController shop1 = TextEditingController();
  TextEditingController shop2 = TextEditingController();
  TextEditingController shop3 = TextEditingController();
  TextEditingController shop4 = TextEditingController();
  TextEditingController shop5 = TextEditingController();
  TextEditingController shop6 = TextEditingController();
  TextEditingController shop7 = TextEditingController();
  TextEditingController shop8 = TextEditingController();
  TextEditingController deliveryTime = TextEditingController();
   TextEditingController deliveryAddress = TextEditingController();
  TextEditingController deliveryAddress1 = TextEditingController();
  TextEditingController deliveryAddress2 = TextEditingController();
  TextEditingController deliveryAddress3 = TextEditingController();
  TextEditingController deliveryAddress4 = TextEditingController();
  TextEditingController deliveryAddress5 = TextEditingController();
  TextEditingController deliveryAddress6 = TextEditingController();
  OrderController orderController = Get.find();
   var index = 0;
   String? storedMobileCode;
  @override
  void initState() {
    getStoredMobileCode().then((value) {
      setState(() {
        storedMobileCode = value;
      });
    });
    print(configureController.fetchdetails.value);
    if (configureController.fetchdetails.value.menu!.isNotEmpty) {
      initializeMethod();
    }
    super.initState();
  }

  void initializeMethod() {
    print(configureController.fetchdetails.value);
    print(configureController.fetchdetails.value.menu![5].subMenu![0].value);

    try {
      if (configureController.fetchdetails.value.menu![5].subMenu![0].value! !=
          '') {
        deliveryAddress.text = ('${configureController
                .fetchdetails.value.menu![5].subMenu![0].value!
                .split(',')[0]},${configureController
                .fetchdetails.value.menu![5].subMenu![0].value!
                .split(',')[1]}');
        deliveryAddress1.text = configureController
                .fetchdetails.value.menu![5].subMenu![0].value!
                .split(',')[2];
        deliveryAddress2.text = configureController
            .fetchdetails.value.menu![5].subMenu![0].value!
            .split(',')[3];
        deliveryAddress3.text = configureController
            .fetchdetails.value.menu![5].subMenu![0].value!
            .split(',')[4];
        deliveryAddress4.text = configureController
            .fetchdetails.value.menu![5].subMenu![0].value!
            .split(',')[5];
         deliveryAddress5.text = configureController
            .fetchdetails.value.menu![5].subMenu![0].value!
            .split(',')[6];
          deliveryAddress6.text =  ('${configureController
                .fetchdetails.value.menu![5].subMenu![0].value!
                .split(',')[7]},${configureController
                .fetchdetails.value.menu![5].subMenu![0].value!
                .split(',')[8]}');
        //     +
        // ',' +
        // configureController.fetchdetails.value.menu![5].subMenu![0].value!
        //     .split(',')[5]);
      }
    } catch (e) {
      print(e.toString());
    }
    // print(
    //     "Values::${configureController.fetchdetails.value.menu![3].subMenu![0].value!}");
    if (configureController.fetchdetails.value.menu![3].subMenu![0].value! !=
        ' ') {
      shop.text = configureController
          .fetchdetails.value.menu![3].subMenu![0].value!
          .split(',')[0];
      shop1.text = configureController
              .fetchdetails.value.menu![3].subMenu![0].value!
              .split(',')[1];

      shop2.text = configureController
              .fetchdetails.value.menu![3].subMenu![0].value!
              .split(',')[2];
      // ('${configureController
      //         .fetchdetails.value.menu![3].subMenu![0].value!
      //         .split(',')[3]},${configureController.fetchdetails.value.menu![3].subMenu![0].value!
      //         .split(',')[4]}');
      shop3.text = configureController
              .fetchdetails.value.menu![3].subMenu![0].value!
              .split(',')[3];

       shop4.text = configureController
              .fetchdetails.value.menu![3].subMenu![0].value!
              .split(',')[4];  
        shop5.text = configureController
              .fetchdetails.value.menu![3].subMenu![0].value!
              .split(',')[5];  

               shop6.text = configureController
              .fetchdetails.value.menu![3].subMenu![0].value!
              .split(',')[6]; 
               shop7.text = configureController
              .fetchdetails.value.menu![3].subMenu![0].value!
              .split(',')[7]; 
               shop8.text = configureController
              .fetchdetails.value.menu![3].subMenu![0].value!
              .split(',')[8];       
      // ('${configureController
      //         .fetchdetails.value.menu![3].subMenu![0].value!
      //         .split(',')[5]},${configureController.fetchdetails.value.menu![3].subMenu![0].value!
      //         .split(',')[6]}');
    } else {
      print('EMPTY');
    }

    shoppingMode.text =
        configureController.fetchdetails.value.menu![0].subMenu![0].value!;
    retailVertical.text =
        configureController.fetchdetails.value.menu![1].subMenu![0].value!;
    // deliveryMode.text =
    //     configureController.fetchdetails.value.menu![2].subMenu![0].value!;
    // deliveryAddress.text =
    //     configureController.fetchdetails.value.menu![5].subMenu![0].value! ??
    //         ' ';xwxs
    deliveryTime.text =
        configureController.fetchdetails.value.menu![4].subMenu![0].value!;
    // shop.text =
    //     configureController.fetchdetails.value.menu![3].subMenu![0].value!;
    // if (configureController.fetchdetails.value.menu![0].subMenu![0].value! ==
    //     'SHOP FROM HOME') {
    //   optionController.setShoppingMode('0');
    //   Prefs.setDeliveryType('H');
    // } else {
    //   optionController.setShoppingMode('1');
    //   Prefs.setDeliveryType('S');
    // }

   // checkCountry();
  }

  //   shoppingMode.text =
  //       configureController.fetchdetails.value.menu![0].subMenu![0].value!;
  //   retailVertical.text =
  //       configureController.fetchdetails.value.menu![1].subMenu![0].value!;
  //   deliveryMode.text =
  //       configureController.fetchdetails.value.menu![2].subMenu![0].value!;
  //   // deliveryAddress.text =
  //   //     configureController.fetchdetails.value.menu![5].subMenu![0].value! ??
  //   //         ' ';
  //   deliveryTime.text =
  //       configureController.fetchdetails.value.menu![4].subMenu![0].value!;
  //   // shop.text =
  //   //     configureController.fetchdetails.value.menu![3].subMenu![0].value!;
  //   if (configureController.fetchdetails.value.menu![0].subMenu![0].value! ==
  //       'SHOP FROM HOME') {
  //     optionController.setShoppingMode('1');
  //     Prefs.setDeliveryType('H');
  //   } else {
  //     optionController.setShoppingMode('0');
  //     Prefs.setDeliveryType('S');
  //   }

  //   checkCountry();
  // }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: GetPlatform.isAndroid
          ? (widget.actualHeight - 40) / 17.9 * 17 //addedbysofiya
          : (widget.actualHeight - MediaQuery.of(context).padding.bottom) /
              17.9 *
              19,
              child: Padding(
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
                          child: Row(
                children: [
                  Container(
                   height: MediaQuery.of(context).size.height * 0.043,
                   width: 50,
                   child: optionsController.timerNew,
                  ),
                  //  getSixedController3(context, 2,
                  //     controller:deliveryTime),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.043,
                   width: 60,
                   child: Center(child: Text('00.00',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),))
                  ),
                  SizedBox(width: 50,),
                  SubHeader(),
                ],
                          )
                          ),
                        Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  getSizedBox(
                      context,
                      //languageController.languageResponse.value.purchaseCost ??
                          'Retail Vertical'),
                          getSixedController(context, 2,
                      controller: retailVertical),
                  
                ],
                          ),  
                          Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  getSizedBox(
                      context,
                      //languageController.languageResponse.value.purchaseCost ??
                          'Amount Payable'),
                          getSixedController1(context, 2,
                      controller: (addCartReviewController.total
                                  + addCartReviewController.taxes+
                              reviewController.addTips)
                          .toStringAsFixed(2),
                          )
                  
                ],
                          ),  
                          Container(
              
                          // margin: const EdgeInsets.only(right: 2),
                          height: MediaQuery.of(context).size.height * 0.048,
                          width: GetPlatform.isAndroid
                          ? MediaQuery.of(context).size.width * 0.99
                         : MediaQuery.of(context).size.width * 0.99,
                          color: const Color.fromARGB(255, 210, 207, 207),
                          child: Row(
                children: [
                  getSizedBox2(
                      context,
                      //languageController.languageResponse.value.purchaseCost ??
                          'Shop'),
                   getSizedBox2(
                      context,
                      //languageController.languageResponse.value.purchaseCost ??
                          'Delivery to'),
                ],
                          ),
                         ) ,
                         Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  getSixedController2(context, 2,
                      controller: shop),
                      Container(
                    //margin: EdgeInsets.only(left: 10),
                    padding: EdgeInsets.only(left: 10),
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.grey),right: BorderSide(color: Colors.grey))),
                     height: MediaQuery.of(context).size.height * 0.056,
                   width: GetPlatform.isAndroid
                      ? (widget.actualHeight - 40) / 17.9 * 4.3
                      : (widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                          17.9 * 4.56,
                        child: Text(configureController.fetchdetails.value.firstName!,style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),))
                      //     getSixedController2(context, 2,
                      // controller: configureController.fetchdetails.value.firstName),
                  
                ],
                          ), 
                          Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  getSixedController2(context, 2,
                      controller:shop1),
                          getSixedController2(context, 2,
                      controller:deliveryAddress),
                  
                ],
                          ), 
                          Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  getSixedController2(context, 2,
                      controller:shop2),
                          getSixedController2(context, 2,
                      controller:deliveryAddress5),
                  
                ],
                          ), 
                          Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  getSixedController2(context, 2,
                      controller:shop3),
                          getSixedController2(context, 2,
                      controller:deliveryAddress1),
                  
                ],
                          ), 
                          Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  getSixedController2(context, 2,
                      controller:shop7),
                          getSixedController2(context, 2,
                      controller:deliveryAddress2),
                  
                ],
                          ), 
                          Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  getSixedController2(context, 2,
                      controller:shop4),
                          getSixedController2(context, 2,
                      controller:deliveryAddress3),
                  
                ],
                          ), 
                          Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  getSixedController2(context, 2,
                      controller:shop8),
                      Container(
                        padding: EdgeInsets.only(left: 5),
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.grey),right: BorderSide(color: Colors.grey))),
                     height: MediaQuery.of(context).size.height * 0.056,
                   width: GetPlatform.isAndroid
                      ? (widget.actualHeight - 40) / 17.9 * 4.3
                      : (widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                          17.9 * 4.56,
                        child: Row(
                          children: [
                            Text(orderController.fetchShareResponse.value.status!.deviceId!,style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),),
                        //  Text( storedMobileCode!,style: const TextStyle(
                        //   //orderController.fetchShareResponse.value.status!.deviceId??
                        //   fontSize: 20,
                        //   fontWeight: FontWeight.normal,
                        // ),),
                          ],
                        ))
                      //     getSixedController2(context, 2,
                      // controller:deliveryAddress4),
                  
                ]
                          ), 
                          Container(
              
                          // margin: const EdgeInsets.only(right: 2),
                          height: MediaQuery.of(context).size.height * 0.043,
                          width: MediaQuery.of(context).size.width * 0.99,
                          color: const Color.fromARGB(255, 210, 207, 207),
                         child: Row(
                          children: [
                Container(
                  margin: EdgeInsets.only(left: 50),
                  child: Text('Delivery - ', style: const TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 15, 14, 14))
                  )),
                  SizedBox(width: 2,),
                  dateWidget(
                                      configureController.normalDelivery[0]
                                          .deliveryData![1].deliveryDate!,
                                      'E'),
                                  dateWidget(
                                      configureController.normalDelivery[0]
                                          .deliveryData![1].deliveryDate!,
                                      'MMM d'),
                                       SizedBox(width: 4,),
                                       Text(':', style: const TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 15, 14, 14))
                  ),
                   SizedBox(width: 4,),
                     getSixedController3(context, 2,
                      controller:deliveryTime),
                
                         ],)
                        
                          ), 
                           SizedBox(
                        height: GetPlatform.isAndroid
                ? (widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                    17.9 *
                    2.8
                : (widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                    17.9 *
                    2.7,
                      ),
                          Container(
                       
                        height: GetPlatform.isAndroid
                ? (widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                    17.9
                : (widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                    17.9,
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                InkWell(
                  onTap: () async {
                    viewController.setView(DELIVERYTIMEPAGE);
              
                   headerController.setSubHeaderLabel('Choose Delivery Time');
                  },
                  child: Container(
                    padding: EdgeInsets.only(top: 10),
                    height: 60,
                    width: 50,
                      decoration: const BoxDecoration(
                      ),
                      child: RotatedBox(
              
                            quarterTurns: DateTime.june,
                        child: optionsController.backNew)),
                ),
                SizedBox(width: 115,),
                           InkWell(
                onTap: () {
                 // keyboardController.setPicker(PAY);
                  viewController.setView(PAYMODE);
                  headerController.setSubHeaderLabel('Pay');
                  configureController.shopname.value = configureController
          .fetchdetails.value.menu![3].subMenu![0].value!
          .split(',')[0];
                  // optionsController.getPayModeIcons();
                  // optionsController.setSetState();
                    reviewController.setConvenienceFee(reviewController
                        .updatePaymentResponse
                        .value
                        .status!
                        .items!
                        .tax![0]
                        .taxvalue!);
                    reviewController.setDiscount(reviewController
                        .updatePaymentResponse
                        .value
                        .status!
                        .items!
                        .tax![0]
                        .taxvalue!);
              
                    reviewController.setTotalPayable(reviewController
                            .updatePaymentResponse
                            .value
                            .status!
                            .items!
                            .totalvalue! +
                        reviewController.addTips);
                    optionsController.setState();
                },
                 child: Container(
                  height: 40,
                  width: 150,
                                      decoration:  BoxDecoration(
                                          color: AppColors.subHeaderContainer,
                                          border: Border.all(color: Colors.blueAccent),
                                          borderRadius:const BorderRadius.all(
                                              Radius.circular(25))),
                                      child: Center(
                                        child: Text(
                                          languageController.languageResponse.value
                                                  .pay ??
                                              '',
                                          style:  TextStyle(
                                              color: Color.fromARGB(255, 6, 6, 6),
                                              fontSize: 20,
                                              ),
                                        ),
                                      )),
                           ),
                                    SizedBox(width: 115,),
                InkWell(
                  onTap: () async {
                  
                  },
                  child: Container(
                      padding: EdgeInsets.only(top: 10),
                    height: 60,
                    width: 50,
                  decoration: const BoxDecoration(
                  ),
                  // child: RotatedBox(
              
                  //       quarterTurns: DateTime.april,
                  //   child: optionsController.backNew)
                    )
                ),
                          ],
                        ),
                      )
                  ],
                  
                  
                ),
              ),
    );
    
  }
 Container getSizedBox(BuildContext context, String value) {
    return Container(
      //width: getProportionateScreenWidth(200),
      decoration: const BoxDecoration(
          border: Border(right: BorderSide(color: Colors.grey),bottom: BorderSide(color: Colors.grey))),
      height: MediaQuery.of(context).size.height * 0.056,
       width: GetPlatform.isAndroid
          ? (widget.actualHeight - 40) / 17.9 * 4.3
          : (widget.actualHeight - MediaQuery.of(context).padding.bottom) /
              17.9 * 4.56,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            // "123456",
            value,
            style: const TextStyle(
                fontSize: 20, color: Color.fromARGB(255, 37, 36, 36)),
          ),
        ),
      ),
    );
  }
  getSixedController1(BuildContext context, int index, {String? controller}) {
    return Container(
      decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: Colors.grey),right: BorderSide(color: Colors.grey))),
      height: MediaQuery.of(context).size.height * 0.056,
      width: GetPlatform.isAndroid
      ? (widget.actualHeight - 40) / 17.9 * 4.3
      : (widget.actualHeight - MediaQuery.of(context).padding.bottom) /
          17.9 * 4.52,
      child: Container(
          padding: const EdgeInsets.only(left: 8.0),
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
             const Text('₹',style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),),
                                        SizedBox(width: 5,),
              Text(
                controller!,
                style: const TextStyle(
                    fontSize: 20,
                   ),
              ),
            ],
          )
          ),
    );
  }
  getSixedController(BuildContext context, int index, {TextEditingController? controller}) {
    return Container(
      decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: Colors.grey),right: BorderSide(color: Colors.grey))),
       height: MediaQuery.of(context).size.height * 0.056,
     width: GetPlatform.isAndroid
        ? (widget.actualHeight - 40) / 17.9 * 4.3
        : (widget.actualHeight - MediaQuery.of(context).padding.bottom) /
            17.9 * 4.52,
      child: Container(
          padding: const EdgeInsets.only(left: 8.0),
          alignment: Alignment.centerLeft,
          child: TextFormField(
          readOnly: true,
          showCursor: false,
          // focusNode: _focuss[index],
          onChanged: (value) {
            print("value $value");
          },
          onTap: () {},
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            // hintText: "Mail ID",
            // filled: _isFocus[index],
            //fillColor: textFieldColor,
          ),
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal,
          ),
        ),
          ),
    );
  }
  Container getSizedBox2(BuildContext context, String value) {
    return Container(
      //width: getProportionateScreenWidth(200),
      decoration: const BoxDecoration(
          border: Border(right: BorderSide(color: Colors.grey),bottom: BorderSide(color: Colors.grey))),
     height: MediaQuery.of(context).size.height * 0.048,
       width: GetPlatform.isAndroid
          ? (widget.actualHeight - 40) / 17.9 * 4.27
          : (widget.actualHeight - MediaQuery.of(context).padding.bottom) /
              17.9 * 4.52,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            // "123456",
            value,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 15, 14, 14)),
          ),
        ),
      ),
    );
  }
  getSixedController2(BuildContext context, int index, {TextEditingController? controller}) {
    return Container(
      decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: Colors.grey),right: BorderSide(color: Colors.grey))),
       height: MediaQuery.of(context).size.height * 0.056,
     width: GetPlatform.isAndroid
        ? (widget.actualHeight - 40) / 17.9 * 4.3
        : (widget.actualHeight - MediaQuery.of(context).padding.bottom) /
            17.9 * 4.56,
      child: Container(
          padding: const EdgeInsets.only(left: 8.0),
          alignment: Alignment.centerLeft,
          child: TextFormField(
          readOnly: true,
          showCursor: false,
          // focusNode: _focuss[index],
          onChanged: (value) {
            print("value $value");
          },
          onTap: () {},
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            // hintText: "Mail ID",
            // filled: _isFocus[index],
            //fillColor: textFieldColor,
          ),
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal,
          ),
        ),
          ),
    );
  }
  getSixedController3(BuildContext context, int index, {TextEditingController? controller}) {
    return Container(
      padding: EdgeInsets.only(bottom: 6),
      //color: Colors.amber,
    //alignment: Alignment.centerLeft,
     // height: MediaQuery.of(context).size.height * 0.043,
     width: GetPlatform.isAndroid
        ? (widget.actualHeight - 40) / 17.9 * 3
        : (widget.actualHeight - MediaQuery.of(context).padding.bottom) /
            17.9 * 3,
      child: Center(
        child: TextFormField(
        readOnly: true,
        showCursor: false,
        // focusNode: _focuss[index],
        onChanged: (value) {
          print("value $value");
        },
        onTap: () {},
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          // hintText: "Mail ID",
          // filled: _isFocus[index],
          //fillColor: textFieldColor,
        ),
           style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 15, 14, 14))
          ),
      ),
    );
  }
   Widget dateWidget(var data, String format) {
    return Text(
      DateFormat(format).format(DateFormat("dd/MM/yyyy").parse(data)),
      style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 15, 14, 14)),
    );
  }

  Future<String?> getStoredMobileCode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("mobile");
  }
}