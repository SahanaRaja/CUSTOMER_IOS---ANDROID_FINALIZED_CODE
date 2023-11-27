import 'package:customer_assist/home/presentation/controllers/add_cart_review_controller.dart';
import 'package:customer_assist/home/presentation/controllers/configure_controller.dart';
import 'package:customer_assist/home/presentation/controllers/header_controller.dart';
import 'package:customer_assist/home/presentation/controllers/keyboard_controller.dart';
import 'package:customer_assist/home/presentation/controllers/loading_controller.dart';
import 'package:customer_assist/home/presentation/controllers/options_controller.dart';
import 'package:customer_assist/home/presentation/controllers/shop_controller.dart';
import 'package:customer_assist/home/presentation/controllers/view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/app_constants.dart';
import '../../controllers/order_controller.dart';

class FirstRowWidget extends StatelessWidget {
  final double actualHeight;
  final String header;
  final bool arrow;
  const FirstRowWidget({
    Key? key,
    required this.actualHeight,
    required this.header,
    required this.arrow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ShopController shopController = Get.find();
    OptionsController optionsController = Get.find();
    ViewController viewController = Get.find();
    HeaderController headerController = Get.find();
    KeyboardController keyboardController = Get.find();
    AddCartReviewController addCartReviewController = Get.find();
    OrderController orderController = Get.find();
    ConfigureController configureController = Get.find();
    
    return SizedBox(
      height: GetPlatform.isAndroid
          ? ((actualHeight - MediaQuery.of(context).padding.bottom) / 17.9) * 1
          : ((actualHeight - MediaQuery.of(context).padding.bottom) / 17.9) * 1,
      child: Row(
       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          (viewController.viewKey.value != PRODUCTNEWPAGE &&
          viewController.viewKey.value != PRODUCTSUBCATEGORY &&
          viewController.viewKey.value != CATALOG  &&
          viewController.viewKey.value != SHOPLIST &&
          viewController.viewKey.value != DIRECTICONACCESS
          )
        ?  leftIcon(
            viewController,
            shopController,
            addCartReviewController,
            optionsController,
            headerController,
            orderController,
            configureController
          )
          :
          Container(
            width:89
          ),
          // added by sahana
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.022 ,
          ),
          Container(
           // margin: ,
            height: 50,
            width: 285,
            decoration: BoxDecoration(
                //border: Border.all(color: Colors.black),
                color: AppColors.subHeaderContainer),
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FittedBox(
                  fit: BoxFit.cover,
                  child: thirdheaderWidget()
                ),
                arrow == true
                    ? SizedBox(
                        width: 40,
                        height: 40,
                        child: optionsController.downarrow,
                      )
                    : Container(),
              ],
            )),
          ),
          // added by sahana
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.02 ,
          ),
        // (optionsController.optionsKey.value == GUEST) 
        // ? Container()
         
        //  : 
        (viewController.viewKey.value != PRODUCTNEWPAGE &&
      
          viewController.viewKey.value != PRODUCTSUBCATEGORY &&
          viewController.viewKey.value != CATALOG &&
          viewController.viewKey.value != SHOPLIST&&
          viewController.viewKey.value != DIRECTICONACCESS
        )
        ? InkWell(
            onTap: (() {
              shopController.setReviewPage(true);
              //added by saha
              headerController.setTimeChange();
              headerController.subHeaderLabel(configureController
                  .subheaderResponse.value);
              if (shopController.reviewPage.value) {
                //optionsController.getShopList();
                optionsController.setSetState();
                viewController.setView(REVIEWPAGE);
                keyboardController.setEdit(false);
                headerController.subHeaderLabel(configureController
                  .subheaderResponse.value);
                  optionsController.getReviewcart();
                optionsController.setOptionList(REVIEWCART);
                optionsController.optionIndexSetter(0);
                //optionsController.setOptionList(SHOP);

                //viewController.setUserOption(SHOP);

                optionsController.hideShadow();
                keyboardController.setKeypad("");
                // optionsController.optionIndexSetter(-1);
              }
            }),
            child: Padding(
              padding: const EdgeInsets.only(  left: 1),
              child: Stack(
                children: [
                Container(
                    width: 80,
                    //height: 60,
                    
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: shopController.reviewPage.value
                              ? Colors.grey
                              : Colors.white,
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(4, 4))
                    ]),
                    height: GetPlatform.isAndroid
                        ? (actualHeight - 40) / 18.1
                        : (actualHeight -
                                MediaQuery.of(context).padding.bottom) /
                            17.9,
                    child: optionsController.cart,
                  ),
                  //added by sahana
                 
                   
                     GetX<AddCartReviewController>(
                    init: AddCartReviewController(),
                    initState: (_) {},
                    builder: (controller) {
                      return
                  Positioned(
                    top: 15,
                    left: 42,
                    child: Text(
                      // viewController.viewKey.value == REVIEWPAGE
                      //     ? addCartReviewController.tabletotalvalue.value
                      //         .toString().padLeft(3,'0')
                      //     :
                      addCartReviewController.tableValue.value
                          .toString()
                          .padLeft(3, '0'),
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.normal),
                    ),
                  );}
                  )

                  
                 
                ],
              ),
            ),
          )
          :Container()
        ],
      ),
    );
  }

  Widget leftIcon(
      ViewController viewController,
      ShopController shopController,
      AddCartReviewController addCartReviewController,
      OptionsController optionsController,
      HeaderController headerController,
      OrderController orderController,
      ConfigureController configureController) {
        LoadingController loadingController = Get.find();
    if (viewController.viewKey.value == SHOPEDIT) {
      return InkWell(
          onTap: ()async {
            // for (var listdate in shopController.catalogueResponse) {
            //   print(listdate.productcode);
            //   shopController.shoppingOutlets.add({
            //     "Product_Selected": listdate.productcode,
            //     "product_qty": listdate.qty
            //   });
            //   shopController.fetchShoppingOutlets(
            //     shopController.shoppingOutlets, '1');
            // viewController.setView(SHOPFILTER);
            // }
            print(shopController.catalogueResponse.value);
          for (var i = 0;
              i < shopController.catalogueResponse.length;
              i++) {
            await addCartReviewController.addToCartshop(
              shopController.catalogueResponse[i]);
           
            
          }
          await addCartReviewController.getReviewCartItems(true);
          headerController.subHeaderLabel(configureController.subheaderResponse.value);
          viewController.setView(REVIEWPAGE);
            optionsController.getReviewcart();
                optionsController.setOptionList(REVIEWCART);
                optionsController.optionIndexSetter(0);
            
          },
          child: SizedBox(
              width: 90, height: 45, child: optionsController.reorder
              )
              );
    } else if (viewController.viewKey.value == LISTSHOPPING) {
      return InkWell(
        onTap: () {
          viewController.setView(SHOPEDIT);
          headerController.setThirdHeaderLabel('Edited List');
        },
        child: const SizedBox(
            width: 90, height: 45, child: Icon(Icons.arrow_forward_ios)),
      );
    } else if (viewController.viewKey.value == SHOPFILTER) {
      return InkWell(
        onTap: () async {
          print(shopController.catalogueResponse.value);
          for (var i = 0;
              i < shopController.catalogueResponse.length;
              i++) {
            await addCartReviewController.addToCartshop(
              shopController.catalogueResponse[i]);
           
            
          }
          await addCartReviewController.getReviewCartItems(true);
          headerController.subHeaderLabel(configureController.subheaderResponse.value);
          viewController.setView(REVIEWPAGE);
        },
        child:
            SizedBox(width: 90, height: 45, child: optionsController.reorder),
      );
    } else if (viewController.viewKey.value == WISHITEMS) {
      // viewController.userSuboption.value == WISHITEMS;
      return InkWell(
        onTap: () {
          viewController.setView(WISHLISTEDIT);
          headerController.setSubHeaderLabel('Edited Wishlist');
        },
        child: const SizedBox(
            width: 90, height: 45, child: Icon(Icons.arrow_forward_ios)),
      );
    } else if (viewController.viewKey.value == WISHLISTEDIT) {
      return InkWell(
        onTap: () async {
           
          print(orderController.whishlistEditResponse.value);
          for (var i = 0;
              i < orderController.whishlistEditResponse.length;
              i++) {
           await addCartReviewController
                .addToCartwish(orderController.whishlistEditResponse[i]);
          }
           
          await addCartReviewController.getReviewCartItems(false);
         headerController.subHeaderLabel(
            configureController.subheaderResponse.value);
            viewController.setView(REVIEWPAGE);
            optionsController.getReviewcart();
                optionsController.setOptionList(REVIEWCART);
                optionsController.optionIndexSetter(0);
         
        },
        child:
            SizedBox(width: 90, height: 45, child: optionsController.reorder),
      );
    } else if (viewController.viewKey.value == PENDINGORDERS) {
      //viewController.userSuboption.value == PENDINGORDERS;
      return InkWell(
        onTap: () {
          viewController.setView(PENDINGEDIT);
        },
        child: const SizedBox(
            width: 85, height: 45, child: Icon(Icons.arrow_forward_ios)),
      );
    } else if (viewController.viewKey.value == PENDINGEDIT) {
      return InkWell(
        onTap: () async {
          print(orderController.pendingEditsResponse.value);
          for (var i = 0;
              i < orderController.pendingEditsResponse.length;
              i++) {
           await addCartReviewController
                .addToCarpending(orderController.pendingEditsResponse[i]);
          }
          await addCartReviewController.getReviewCartItems(false);
          viewController.setView(REVIEWPAGE);
         headerController.subHeaderLabel(
            configureController.subheaderResponse.value);
            optionsController.getReviewcart();
                optionsController.setOptionList(REVIEWCART);
                optionsController.optionIndexSetter(0);
        },
        child:
            SizedBox(width: 85, height: 45, child: optionsController.reorder),
      );
    } 
    // else if (viewController.viewKey.value == OLDORDERS) {
    //   //viewController.userSuboption.value == OLDORDERS;
    //   return InkWell(
    //     onTap: () {
    //       viewController.setView(MYORDERSTATUS);
    //     },
    //     child: const SizedBox(
    //         width: 85, height: 45, child: Icon(Icons.arrow_forward_ios)),
    //   );
    // } 
    // else if (viewController.viewKey.value == MYORDERSTATUS) {
    //   return InkWell(
    //     onTap: () {
    //       viewController.setView(MYORDERITEMS);
    //     },
    //     child: SizedBox(
    //         width: 85, height: 45, child: Icon(Icons.arrow_forward_ios)),
    //   );
    // } 
    else if (viewController.viewKey.value == MYORDERITEMS) {
      return InkWell(
        onTap: ()async {
          loadingController.setLoading(true);
          for (var i = 0; i < orderController.myOrderEditResponse.length; i++) {
            await addCartReviewController
                .getData(orderController.myOrderEditResponse[i].orderId);

            print("------->${addCartReviewController.orderitemsbyid.toList()}");
            for (var temp in addCartReviewController.orderitemsbyid) {
               addCartReviewController.addToCarOldOrders(temp);
            }
          }
          await addCartReviewController.getReviewCartItems(false);
          viewController.setView(REVIEWPAGE);
          loadingController.setLoading(false);
          optionsController.getReviewcart();
                optionsController.setOptionList(REVIEWCART);
                optionsController.optionIndexSetter(0);
        },
        child:
            SizedBox(width: 90, height: 45, child: optionsController.reorder),
      );
    } 
    else {
      return Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Stack(
            children: [
              InkWell(
                onTap: () {},
                child: SizedBox(
                    width: 85,
                    height: 47,
                    // height: GetPlatform.isAndroid
                    //     ? (actualHeight - 40) / 18.1
                    //     : (actualHeight -
                    //             MediaQuery.of(context).padding.bottom) /
                    //         17.9,
                    child: optionsController.timer),
              ),
              const Positioned(
                top: 15,
                left: 32,
                child: Text(
                  // "",
                  '00:00',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }


  
  thirdheaderWidget () {
    return GetX<HeaderController>(
      init: HeaderController(),
      initState: (_) {},
      builder: (controller) {
        return SizedBox(
          width: 270,
          child: Center(
            child: Text(
              controller.subThirdHeaderLabel.value,
              style: const TextStyle(
                  fontSize: 20, color: Colors.black,overflow: TextOverflow.ellipsis),
            ),
          ),
        );
      },
    );
}
}