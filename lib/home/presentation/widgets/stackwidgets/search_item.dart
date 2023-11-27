import 'package:customer_assist/core/app_colors.dart';
import 'package:customer_assist/home/presentation/controllers/add_cart_review_controller.dart';
import 'package:customer_assist/home/presentation/controllers/configure_controller.dart';
import 'package:customer_assist/home/presentation/controllers/header_controller.dart';
import 'package:customer_assist/home/presentation/controllers/keyboard_controller.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/controllers/options_controller.dart';
import 'package:customer_assist/home/presentation/controllers/order_controller.dart';
import 'package:customer_assist/home/presentation/controllers/shop_controller.dart';
import 'package:customer_assist/home/presentation/controllers/view_controller.dart';
import 'package:customer_assist/home/presentation/widgets/keyboard/alpha_capital_letters.dart';
import 'package:customer_assist/home/presentation/widgets/keyboard/alpha_small_letters.dart';
import 'package:customer_assist/home/presentation/widgets/keyboard/numeral_special_char.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/sub_header.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../../core/app_constants.dart';
import '../../../../../core/helpers/SharedPreference/prefs.dart';

class SearchItem extends StatefulWidget {
  double actualHeight;
  SearchItem({Key? key, required this.actualHeight}) : super(key: key);

  @override
  State<SearchItem> createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {
  ScrollController scrollController = ScrollController();
  OptionsController optionsController = Get.find();
  var shopController = Get.put(ShopController());
  //ShopController shopController = Get.find();
  HeaderController headerController = Get.find();
  KeyboardController keyboardController = Get.find();
  ConfigureController configureController = Get.find();
  // ViewController viewController = Get.find();
  var viewController = Get.put(ViewController());
  AddCartReviewController addCartReviewController = Get.find();
  OrderController orderController = Get.find();
  LanguageController languageController = Get.find();
  final FocusNode _focus = FocusNode();
  final bool _isFocused = false;
  TextEditingController textcontroller = TextEditingController();
  TextEditingController searchcontroller = TextEditingController();
  List<TextEditingController> qtycontroller = [];
  //List<SubCategoryItems> items = [];

  int item = 0;
  double actualHeight = 0;
  final List<ScrollController> _controller =
      List.generate(200, (index) => ScrollController());
  int currentItemIndex = 0;
  //var ListofController = <dynamic>[];
  //int listindex = 0;
  var selectlist;
  var checklist;

  //int index = 0;

  @override
  void initState() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    keyboardController.setKeypad('');
    //viewController.setView(SMALLKEYBOARD);
    // for (var category in shopController
    //     .resitem[shopController.supercatagoryIndex.value].category!) {
    //   List<dynamic> tempsub = [];
    //   for (var subcategory in category.subcategory!) {
    //     var temp = List.generate(subcategory.resSubcategory!.length,
    //         (index) => TextEditingController());
    //     tempsub.add(temp);
    //   }
    //   ListofController.add(tempsub);
    // }

    setState(() {
      shopController.productdisplay.clear();

      selectlist =
          List.generate(shopController.productitem.length, (index) => false);
    });
    //print(ListofController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool obscureText = true;
    bool obscureText1 = true;
    bool obscureText2 = true;
    final FocusNode focus = FocusNode();
    bool isFocused = false;
    focus.addListener(() {
      if (focus.hasFocus) {
        setState(() {
          isFocused = true;
          print("focused");
        });
      }
    });

    return Padding(
      padding: GetPlatform.isAndroid
    ?  const EdgeInsets.only(top: 5)
    : const EdgeInsets.only(),
      child: Column(
        children: [
          Container(
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                 Container(
    
              // margin: const EdgeInsets.only(right: 2),
             height: MediaQuery.of(context).size.height * 0.043,
              width: MediaQuery.of(context).size.width * 0.99,
              color: AppColors.subHeaderContainer,
              child: Row(
               // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      viewController.setPreviousView();
                      keyboardController.setKeypad('');
                       headerController.setSubHeaderLabel(configureController.subheaderResponse.value);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 2,bottom: 2,left: 2),
                      height: 40,
                    width: 40,
                    child: RotatedBox(
                        
                            quarterTurns: DateTime.june,
                        child: optionsController.backNew),
                    ),
                  ),
                  SizedBox(width: 50,),
                  GetX<ShopController>(
                  init: ShopController(),
                  initState: (_) {},
                  builder: (_) {
                    return Container(
                      //margin: const EdgeInsets.only(top: 5),
                      height: 50,
                      //added by saha
                      width: MediaQuery.of(context).size.width * 0.63,
                      // decoration: BoxDecoration(
                      //     border: Border.all(),
                      //     color: AppColors.subHeaderContainer),
                      child: TextField(
                        readOnly: true,
                        textAlign: TextAlign.center,
                        showCursor: false,
                        controller: searchcontroller,
                        focusNode: focus,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.normal,
                          
                        ),
                        decoration: InputDecoration(
                          hintText: languageController
                                  .languageResponse.value.searchProduct ??
                              '',
                          //' Search Product...',
                          border: InputBorder.none,
                          filled: isFocused,
                          counterText: "",
                          contentPadding: const EdgeInsets.fromLTRB(1, 0, 0, 1),
                        ),
                        onTap: () {
                          setState(() {
                            keyboardController.setKeypad(CAPITALKEYBOARD);
                            keyboardController.controllerSetup(searchcontroller);
                            keyboardController.setMaximiumLength('50');
                            keyboardController.symbolTrue(true);
                            keyboardController.controllersetupforguest = "Search";
    
                            keyboardController.focusSetup(
                                focus, searchcontroller);
                            print('-------->baby');
                          });
                        },
                      ),
                    );
                  },
                ),
                  // Container(
                  //   width: 300,
                  //   //child: Center(child: SubHeader())
                  //   ),
                  SizedBox(width: 35,),
                  InkWell(
                    onTap: () {
                      //viewController.setView(SEARCHITEM);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 2,bottom: 2),
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.094,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 235, 131, 40)),
                      child: const Icon(
                        Icons.search_sharp,
                        color: Color.fromARGB(255, 11, 11, 11),
                        size: 35,
                      ),
                    ),
                  ),
                ],
              )),
                // GetX<ShopController>(
                //   init: ShopController(),
                //   initState: (_) {},
                //   builder: (_) {
                //     return Container(
                //       //margin: const EdgeInsets.only(top: 5),
                //       height: 50,
                //       //added by saha
                //       width: MediaQuery.of(context).size.width * 0.50,
                //       decoration: BoxDecoration(
                //           border: Border.all(),
                //           color: AppColors.subHeaderContainer),
                //       child: TextField(
                //         readOnly: true,
                //         textAlign: TextAlign.start,
                //         showCursor: false,
                //         controller: searchcontroller,
                //         focusNode: focus,
                //         style: const TextStyle(
                //           fontSize: 20,
                //           fontWeight: FontWeight.normal,
                //         ),
                //         decoration: InputDecoration(
                //           hintText: languageController
                //                   .languageResponse.value.searchProduct ??
                //               '',
                //           //' Search Product...',
                //           border: InputBorder.none,
                //           filled: isFocused,
                //           counterText: "",
                //           contentPadding: const EdgeInsets.fromLTRB(1, 0, 0, 1),
                //         ),
                //         onTap: () {
                //           setState(() {
                //             keyboardController.setKeypad(CAPITALKEYBOARD);
                //             keyboardController.controllerSetup(searchcontroller);
                //             keyboardController.setMaximiumLength('50');
                //             keyboardController.symbolTrue(true);
                //             keyboardController.controllersetupforguest = "Search";
    
                //             keyboardController.focusSetup(
                //                 focus, searchcontroller);
                //             print('-------->baby');
                //           });
                //         },
                //       ),
                //     );
                //   },
                // ),
    
                // InkWell(
                //   onTap: () {
                //     //              if(keyboardController.controllersetupforguest == "Search"){
    
                //     //      shopController
                //     //       .downloadProductItem(keyboardController.currentController.value.text);
    
                //     //       viewController.setView(SEARCHITEM);
                //     //   optionsController.optionIndexSetter(1);
                //     //   print('searchcontroller.text----->' +
                //     //       keyboardController.currentController.value.text);
                //     //  print('-------->');
                //     //   }
                //   },
                //   child: Container(
                //     //margin: const EdgeInsets.only(top: 5),
                //     height: 50,
                //     width: MediaQuery.of(context).size.width * 0.094,
                //     decoration: const BoxDecoration(
                //         color: Color.fromARGB(255, 235, 131, 40)),
                //     child: const Icon(
                //       Icons.search_sharp,
                //       color: Color.fromARGB(255, 11, 11, 11),
                //       size: 35,
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   width: MediaQuery.of(context).size.width * 0.025,
                // ),
                // //added by saha
                // //(optionsController.optionsKey.value == NEWORDERCHANGE)
                // // ?
                // InkWell(
                //   onTap: (() async {
                //     await Prefs.superUserLoggedIn.then((value) {
                //       if (value) {
                //         if (viewController.userSuboption.value ==
                //                 NEWORDERCHANGE ||
                //             optionsController.optionsKey.value == BROWSE) {
                //           setState(() {
                //             shopController.setReviewPage(true);
                //           });
                //           if (shopController.reviewPage.value) {
                //             headerController.subHeaderLabel(
                //                 configureController.subheaderResponse.value);
                //             viewController.setView(REVIEWPAGE);
                //             keyboardController.setEdit(false);
                //             optionsController.getShopList();
                //             optionsController.setOptionList(SHOP);
                //             viewController.setUserOption(SHOP);
                //             optionsController.setSetState();
                //             optionsController.hideShadow();
                //             keyboardController.setKeypad("");
                //             optionsController.optionIndexSetter(-1);
                //           }
                //         }
                //       } else {
                //         viewController.setView(ERROR);
                //         viewController.setErrorMessage(languageController
                //                 .languageResponse
                //                 .value
                //                 .youHaveClickedOnADDICONTapOnRegisterNewICON ??
                //             '');
                //         // 'You have clicked on CARTICON. Please login to view the cart details. Tap on Register New ICON to register. If you are already registered then go to Log-In page');
                //       }
    
                //       // }
                //     });
                //     if (shopController.reviewPage.value) {
                //       await addCartReviewController.getReviewCartItems(false);
    
                //       viewController.setView(REVIEWPAGE);
                //       keyboardController.setEdit(false);
                //       optionsController.getShopList();
                //       optionsController.setOptionList(SHOP);
                //       //added by saha
                //       headerController.setTimeChange();
                //       headerController.subHeaderLabel(
                //           configureController.subheaderResponse.value);
                //       optionsController.setSetState();
                //       optionsController.hideShadow();
                //       keyboardController.setKeypad("");
                //       optionsController.optionIndexSetter(-1);
                //     }
                //   }),
                //   child: Stack(children: [
                //     SizedBox(
                //       //margin: EdgeInsets.only(top: 5),
                //       height: 45,
                //       width: 80,
    
                //       child: optionsController.cart,
                //     ),
                //     GetX<AddCartReviewController>(
                //         init: AddCartReviewController(),
                //         initState: (_) {},
                //         builder: (controller) {
                //           return Positioned(
                //             top: 15,
                //             left: 45,
                //             child: Text(
                //               addCartReviewController.tableValue.value
                //                   .toString()
                //                   .padLeft(3, '0'),
                //               style: const TextStyle(
                //                   fontSize: 16,
                //                   color: Colors.black,
                //                   fontWeight: FontWeight.normal),
                //             ),
                //           );
                //         })
                //   ]),
                // )
                //:Container()
              ],
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 2, right: 2),
                height: GetPlatform.isAndroid
                    ? (widget.actualHeight - 40) /  17.9 *
                        15.5
                    // 18.1
                    : (widget.actualHeight -
                            MediaQuery.of(context).padding.bottom) /
                        17.9 *
                        15.5,
                decoration: BoxDecoration(border: Border.all(width: 1)),
                child: Container(
                  child: 
                  // GetX<ShopController>(
                  //   init: ShopController(),
                  //   initState: (_) {},
                  //   builder: (controller) {
                  //      qtycontroller = List.generate(
                  //         shopController.productitem.length,
                  //         (index) => TextEditingController());
                  //     return 
                      ListView.builder(
                          controller: _controller[currentItemIndex],
                          itemCount: shopController.productitem.length,
                          itemBuilder: (context, itemindex) {
                            return itemwidget(context, itemindex);
                          })
                  //   },
                  // ),
                ),
              ),
              GetX<KeyboardController>(
                init: KeyboardController(),
                initState: (_) {},
                builder: (controller) {
                  return Positioned(
                      bottom: 0,
                      child: Container(
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
            ],
          ),
        ],
      ),
    );
  }

  Future<void> refresh() {
    return Future.delayed(const Duration(seconds: 2));
  }

  itemwidget(BuildContext context, int itemindex) {
    // print("--------->" + viewController.userSuboption.value);

    return Container(
       // color: Colors.amber,
        child: Column(
          children: [
          const SizedBox(
            height: 3,
          ),
          Container(
            height: 160,
            width: double.infinity,
            decoration: BoxDecoration(border: Border.all()),
            //color: Colors.amber,
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                       Row(
                         children: [
                           Container(
                           // margin: EdgeInsets.only(top: 10),
                                      alignment: Alignment.centerRight,
                                      //color: Colors.amber,
                                      width: 90,
                                     height:
                                             MediaQuery.of(context).size.height * 0.04,
                                      child: const Text(
                                        'Stock',
                                        style: TextStyle(
                                            fontSize: 19,
                                            ),
                                      ),
                                    ),
                                    SizedBox(width: 7,),
                                    Container(
                                     // margin: EdgeInsets.only(top: 10),
                                  height: 25,
                                width: 25,
                                decoration: BoxDecoration(border: Border.all(),color: Color.fromARGB(255, 6, 224, 119)),
                                ),
                         ],
                       ),
                       Row(
                         children: [
                           Container(
                                      alignment: Alignment.centerRight,
                                      //color: Colors.amber,
                                      width: 90,
                                     height:
                                             MediaQuery.of(context).size.height * 0.04,
                                      child: const Text(
                                        'Pre Order',
                                        style: TextStyle(
                                            fontSize: 19,
                                            ),
                                      ),
                                    ),
                                    SizedBox(width: 7,),
                                    Container(
                                  height: 25,
                                width: 25,
                                decoration: BoxDecoration(border: Border.all()),
                                ),
                         ],
                       ),
                       Row(
                         children: [
                           Container(
                                      alignment: Alignment.centerRight,
                                      //color: Colors.amber,
                                      width: 90,
                                     height:
                                             MediaQuery.of(context).size.height * 0.04,
                                      child: const Text(
                                        'Alternate',
                                        style: TextStyle(
                                            fontSize: 19,
                                            ),
                                      ),
                                    ),
                                    SizedBox(width: 7,),
                                    Container(
                                  height: 25,
                                width: 25,
                                decoration: BoxDecoration(border: Border.all()),
                                ),
                         ],
                       ),
                       Row(
                         children: [
                           Container(
                                      alignment: Alignment.centerRight,
                                      //color: Colors.amber,
                                      width: 90,
                                     height: GetPlatform.isAndroid
                                     ? MediaQuery.of(context).size.height * 0.02
                                           :  MediaQuery.of(context).size.height * 0.03,
                                      child: const Text(
                                        'Select',
                                        style: TextStyle(
                                            fontSize: 19,
                                            ),
                                      ),
                                    ),
                                    SizedBox(width: 7,),
                                    InkWell(
                                      onTap: () {
                                         configureController.subheaderResponse.value = shopController.productitem[itemindex].productName!.toString();
                  headerController.setSubHeaderLabel(configureController.subheaderResponse.value);
                 selectlist[itemindex] != selectlist[itemindex];
                    if (selectlist[itemindex] == true) {
                      shopController.productdisplay
                          .remove(shopController.productitem[itemindex]);
                      selectlist[itemindex] = false;
                    } else {
                      shopController.productdisplay
                          .add(shopController.productitem[itemindex]);
                      selectlist[itemindex] = true;
                     
                    }
                     viewController.setView(ITEMVIEWPAGE);
                     keyboardController.setKeypad('');
                                        
                                      },
                                      child: Container(
                                         height: 25,
                                           width: 25,
                                       decoration: BoxDecoration(border: Border.all(),
                                       color: (itemindex == viewController.listindex - 1)
                                       ? const Color.fromARGB(255, 247, 213, 111)
                                            : Colors.white,),
                                                                    // child: Icon(Icons.done,color:
                                                                    //                                                       selectlist![itemindex] == itemindex
                                                                    //                                                           ? Colors.green
                                                                    //                                                           : Colors.white,
                                                                    //                                                   size: 25,),
                                         ),
                                    ),
                         ],
                       ),




                ],
              ),
              InkWell(
                onTap: () {
                  // shopController.setSubCatagoryPageIndex(shopController.subcatagoryIndex.value);
                  //         shopController.setItemIndex(itemindex);
                //   configureController.subheaderResponse.value = shopController.productitem[itemindex].productName!.toString();
                //   headerController.setSubHeaderLabel(configureController.subheaderResponse.value);
                //  selectlist[itemindex] != selectlist[itemindex];
                //     if (selectlist[itemindex] == true) {
                //       shopController.productdisplay
                //           .remove(shopController.productitem[itemindex]);
                //       selectlist[itemindex] = false;
                //     } else {
                //       shopController.productdisplay
                //           .add(shopController.productitem[itemindex]);
                //       selectlist[itemindex] = true;
                     
                //     }
                //      viewController.setView(ITEMVIEWPAGE);
                //      keyboardController.setKeypad('');
                     
                },
                child: Container(
                  padding:const  EdgeInsets.all(10),
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(20)),
                  child: Image.network(shopController.productitem[itemindex].imageUrl!.toString()),
                ),
              ),
              Column(
               // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: 38,
                    width: 180,
                   decoration:const  BoxDecoration(border: Border(bottom: BorderSide(),)),
                   child: Center(child: Text(shopController.productitem[itemindex].productName!.toString(),style: TextStyle(fontSize: 18),overflow: TextOverflow.ellipsis,)),
                  ),
                  Row(
                    children: [
                     Container(
                    height: 40,
                    width: 90,
                   decoration: BoxDecoration(border: Border(bottom: BorderSide(),right: BorderSide())),
                   child: Center(child: Text('SKU',style: TextStyle(fontSize: 18),overflow: TextOverflow.ellipsis,)),
                  ),
                   Container(
                    height: 40,
                    width: 90,
                   decoration: BoxDecoration(border: Border(bottom: BorderSide(),)),
                   child: Center(child: Text(shopController.productitem[itemindex].uom!,style: TextStyle(fontSize: 18),overflow: TextOverflow.ellipsis,)),
                  ),
                  ],
                  ),
                   Row(
                    children: [
                     Container(
                    height: 40,
                    width: 90,
                   decoration: BoxDecoration(border: Border(bottom: BorderSide(),right: BorderSide())),
                   child: Center(child: Text('MRP',style: TextStyle(fontSize: 18),overflow: TextOverflow.ellipsis,)),
                  ),
                   Container(
                    height: 40,
                    width: 90,
                   decoration: BoxDecoration(border: Border(bottom: BorderSide(),)),
                   child: Center(child: Row(
                     children: [
                       Container(
                        width: 40,
                         child: Text('₹',style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),textAlign: TextAlign.right,),
                       ),
                       Text(shopController.productitem[itemindex].productMrp!.toString(),style: TextStyle(fontSize: 18),overflow: TextOverflow.ellipsis,),
                     ],
                   )),
                  ),
                  ],),
                   Row(
                    children: [
                     Container(
                    height: 40,
                    width: 90,
                   decoration: BoxDecoration(border: Border(right: BorderSide())),
                   child: Center(child: Text('OP',style: TextStyle(fontSize: 18),overflow: TextOverflow.ellipsis,)),
                  ),
                   Container(
                    height: 40,
                    width: 90,
                   decoration: BoxDecoration(border: Border()),
                   child: Center(
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                      Container(
                        width: 40,

                        child: Text('₹',style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),textAlign: TextAlign.right,),
                      ),
                       Text(shopController.productitem[itemindex].productRate!.toString(),style: TextStyle(fontSize: 18),overflow: TextOverflow.ellipsis,),
                     ],
                   )),
                  ),
                  ],)


                ],
              )
            ],
            ),
          )
        //   Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //     children: [
        //       InkWell(
        //         onTap: () {
        //           setState(() {
        //             selectlist[itemindex] != selectlist[itemindex];
        //             if (selectlist[itemindex] == true) {
        //               shopController.productdisplay
        //                   .remove(shopController.productitem[itemindex]);
        //               selectlist[itemindex] = false;
        //             } else {
        //               shopController.productdisplay
        //                   .add(shopController.productitem[itemindex]);
        //               selectlist[itemindex] = true;
                     
        //             }
        //              viewController.setView(ITEMVIEWPAGE);
        //              keyboardController.setKeypad('');
        //           });

        //           //   shopController.setItemIndex(shopController.itemIndex.value);
        //           //   shopController.setSubCatagoryPageIndex(
        //           //  shopController.subcatagoryIndex.value);
        //           //        viewController.setView(ITEMVIEWPAGE);
        //           //       headerController
        //           //           .setSubHeaderLabel('Item');
        //           //           optionsController.optionIndexSetter(1);

        //           // configureController.subthirdheaderResponse.value =
        //           //     shopController.productitem[itemindex].productName!
        //           //         .toString();
        //           // print('---------->' +
        //           //     shopController.productitem[itemindex].productName
        //           //        );
        //         },
        //         child: SizedBox(
        //           //color: Colors.white,
        //           height: GetPlatform.isAndroid
        //               ? (widget.actualHeight -
        //                       MediaQuery.of(context).padding.bottom) /
        //                   18.5 *
        //                   1
        //               // 0.95
        //               : (widget.actualHeight -
        //                       MediaQuery.of(context).padding.bottom) /
        //                   18.5,

        //           // margin: EdgeInsets.only(left: 20, top: 20),
        //           child: Container(
        //             //added by saha
        //             margin: GetPlatform.isAndroid
        //                 ? const EdgeInsets.only(left: 20, top: 5, bottom: 10)
        //                 : const EdgeInsets.only(left: 20, top: 7, bottom: 10),
        //             height: 35,
        //             width: 35,
        //             decoration: BoxDecoration(
        //                 color: Colors.white,
        //                 // color:
        //                 // selectlist[index] == true
        //                 //     ? Colors.yellowAccent
        //                 //     : Colors.white,
        //                 border: Border.all(),
        //                 boxShadow: const [
        //                   BoxShadow(
        //                       color: Colors.grey,
        //                       spreadRadius: 1,
        //                       blurRadius: 1,
        //                       offset: Offset(4, 4))
        //                 ]),
        //           ),
        //         ),
        //       ),
        //       const SizedBox(width: 30),
        //       // RefreshIndicator(
        //       //   onRefresh: () {
        //       //     return  shopController.productitem[itemindex].productName!;

        //       //   },

        //       Container(
        //         //added by saha
        //         padding: GetPlatform.isAndroid
        //             ? const EdgeInsets.only(top: 15)
        //             : const EdgeInsets.only(top: 15),
        //         //padding: EdgeInsets.only(top: 25),
        //         height: GetPlatform.isAndroid ? 50 : 50,
        //         width: MediaQuery.of(context).size.width * 0.8,
        //         //color: Colors.amber,

        //         child: Text(
        //           shopController.productitem[itemindex].productName!.toString(),
        //           style: const TextStyle(
        //             fontSize: 20,
        //             overflow: TextOverflow.ellipsis,
        //           ),
        //         ),
        //       ),
        //     ],
        //   )
        ]
        ));
          }
        // );

        // );
  //}

  keyboardWidget(BuildContext context, KeyboardController controller) {
    if (viewController.viewKey.value == CLIENTPROFILE ||
        //  viewController.viewKey.value == PRODUCTPURCHASEPAGE ||
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
