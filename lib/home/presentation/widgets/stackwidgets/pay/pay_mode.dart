

import 'package:customer_assist/core/app_colors.dart';
import 'package:customer_assist/core/app_constants.dart';
import 'package:customer_assist/core/helpers/SharedPreference/prefs.dart';
import 'package:customer_assist/home/data/configure/datasources/configure_data_remote_data_source.dart';
import 'package:customer_assist/home/presentation/controllers/add_cart_review_controller.dart';
import 'package:customer_assist/home/presentation/controllers/configure_controller.dart';
import 'package:customer_assist/home/presentation/controllers/fetch_country_controller.dart';
import 'package:customer_assist/home/presentation/controllers/guest_fetchCountry_controller.dart';
import 'package:customer_assist/home/presentation/controllers/header_controller.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/controllers/options_controller.dart';
import 'package:customer_assist/home/presentation/controllers/order_controller.dart';
import 'package:customer_assist/home/presentation/controllers/owner_data_controller.dart';
import 'package:customer_assist/home/presentation/controllers/pay_by_card_controller.dart';
import 'package:customer_assist/home/presentation/controllers/payment_review_controller.dart';
import 'package:customer_assist/home/presentation/controllers/pos_master_selection_controller.dart';
import 'package:customer_assist/home/presentation/controllers/shop_controller.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/sub_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/platform/platform.dart';

class PayMode extends StatefulWidget {
  final double actualHeight;
  const PayMode({Key? key, required this.actualHeight})
      : super(key: key);


  @override
  State<PayMode> createState() => _PayModeState();
}

class _PayModeState extends State<PayMode> {
  double actualHeight = 0;
  var optionsController = Get.put(OptionsController());
  var guestCountryController = Get.put(GuestFetchCountryController());
  var fetchCountryController = Get.put(FetchCountryController());
  var languageController = Get.put(LanguageController());
  var addressController = Get.put(AddressController());
  var shopController = Get.put(ShopController());
  var posMasterSelectionController = Get.put(PosMasterSelectionController());
   var orderController = Get.put(OrderController());
    var reviewController = Get.put(PaymentReviewController());
    var payCardController = Get.put(PayByCardController());
     var headerController = Get.put(HeaderController());
      TextEditingController deliveryTime = TextEditingController();
      ConfigureController configureController = Get.find();
      var addCartReviewController = Get.put(AddCartReviewController());
  //var guestCountry = 0;
 
  @override
  void initState() {
   
    
    deliveryTime.text =
        configureController.fetchdetails.value.menu![4].subMenu![0].value!;
    super.initState();
  }
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
              child: Row(
                children: [
                 InkWell(
                    onTap: () {
                     viewController.setView(REVIEWORDER);
                     headerController.setSubHeaderLabel('Review Order');
                     
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      child: RotatedBox(
                      
                          quarterTurns: DateTime.june,
                      child: optionsController.backNew),
                      ),
                  ),
                  SizedBox(width: 130,),
                  // getSixedController3(context, 2,
                  //     controller:deliveryTime),
                  // Container(
                  //   height: MediaQuery.of(context).size.height * 0.043,
                  //  width: 60,
                  //  child: Center(child: Text('00.00',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),))
                  // ),
                  SizedBox(width: 230,),
                  SubHeader(),
                ],
              )),
          GetX<PosMasterSelectionController>(
              init: (posMasterSelectionController),
              initState: (_) {},
              builder: (_) {
                return SizedBox(
                    height: 810,
                    width: double.infinity,
                    //color: const Color.fromARGB(255, 210, 207, 207),
                    child: GridView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount:
                        posMasterSelectionController.payModeResponse.length,
                           // optionsController.paymodeicons.length,
                            // guestCountryController
                            //     .guestfetchcountryResponse.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: MediaQuery.of(context).size.width /
                              (MediaQuery.of(context).size.height / 3.3),
                        ),
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              posMasterSelectionController.payModeResponse[index].payActiveStatus == 'Y'
                              ?InkWell(
                                onTap: () async{
                                  if (posMasterSelectionController
                                                                        .payModeResponse
                                                                        .value[
                                                                            index]
                                                                        .payDescription ==
                                                                    'CASH') {
                                                                       print(posMasterSelectionController
                                                                      .payModeResponse
                                                                      .value[index]
                                                                      .payCode);
                                                                  orderController.orderInsertNew(
                                                                      await Prefs
                                                                          .orderId,
                                                                      '34',
                                                                      reviewController
                                                                          .discount
                                                                          .toString(),
                                                                      reviewController
                                                                          .convenienceFee
                                                                          .toString(),
                                                                      reviewController
                                                                          .totalPrice
                                                                          .toString(),
                                                                      reviewController
                                                                          .addTips
                                                                          .toString());
                                        //                                  for (var item in addCartReviewController
                                        //   .tableLength) {
                                        // print("hiiiiiiiiiiiiiiiiiiiiiiiiiiii$item");

                                        // addCartReviewController
                                        //     .deleteOrderedItem([item]);
                                        addCartReviewController
                                          .getReviewCartItems(false);
                                     // }
                                                                    }else if (posMasterSelectionController
                                                                        .payModeResponse
                                                                        [index]
                                                                        .payDescription ==
                                                                    'CARDS') {
                                                                  // headerController
                                                                  //     .subHeaderLabel(
                                                                  //         //'Pay - By Card'
                                                                  //         languageController.languageResponse.value.payByCard ??
                                                                  //             '');
                                                                  print(posMasterSelectionController
                                                                      .payModeResponse
                                                                      [index]
                                                                      .payCode);
                                                                  // viewController.setView(PAYBYCARD);
                                                                  //paymentpage
                                                                  payCardController
                                                                      .startPayment();}
                                                                     // headerController.setSubHeaderLabel('Order');
                                },
                                child: Container(
                                        height: 50,
                                        width: 50,
                                        margin:const EdgeInsets.all(10),
                                        //child:iconSize() ,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                // colorFilter:  ColorFilter.mode(
                                                //   const  Color.fromARGB(
                                                //             255, 251, 251, 251)
                                                //         .withOpacity(0.2),
                                                //     BlendMode.dstATop),
                                                image: NetworkImage(
                                                   posMasterSelectionController.payModeResponse[index].payImagepath  ),
                                                fit: BoxFit.cover)
                                                )
                                        ),
                              )
                              :Container(
                                      height: 50,
                                      width: 50,
                                      margin:const EdgeInsets.all(10),
                                      //child:iconSize() ,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              colorFilter:  ColorFilter.mode(
                                                const  Color.fromARGB(
                                                          255, 251, 251, 251)
                                                      .withOpacity(0.2),
                                                  BlendMode.dstATop),
                                              image: NetworkImage(
                                                 posMasterSelectionController.payModeResponse[index].payImagepath  ),
                                              fit: BoxFit.cover)
                                              )
                                      )
                                 
                             ,
                              Container(
                                  height: 35,
                                  width: 110,
                                  child: Center(
                                      child: Text(
                                    posMasterSelectionController.payModeResponse[index].payDescription,
                                    style: TextStyle(fontSize: 19,overflow: TextOverflow.ellipsis),
                                  )
                                  ))
                            ],
                          );
                        }));
              })
        ],
      ),
    );
  }

  SizedBox iconSize(controller, int index) {
    return SizedBox(
      width: 50,
      height: 50,
      child: controller,
    );
  }

  getSixedController3(BuildContext context, int index, {TextEditingController? controller}) {
    return Container(
     // padding: EdgeInsets.only(bottom: 6),
      //color: Colors.amber,
    //alignment: Alignment.centerLeft,
     // height: MediaQuery.of(context).size.height * 0.043,
     width: GetPlatform.isAndroid
        ? (widget.actualHeight - 40) / 17.9 * 5
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
}
