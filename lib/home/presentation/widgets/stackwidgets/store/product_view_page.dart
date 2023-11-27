import 'package:customer_assist/core/app_colors.dart';
import 'package:customer_assist/core/helpers/SharedPreference/prefs.dart';
import 'package:customer_assist/home/presentation/controllers/add_cart_review_controller.dart';
import 'package:customer_assist/home/presentation/controllers/configure_controller.dart';
import 'package:customer_assist/home/presentation/controllers/header_controller.dart';
import 'package:customer_assist/home/presentation/controllers/keyboard_controller.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/controllers/options_controller.dart';
import 'package:customer_assist/home/presentation/controllers/order_controller.dart';
import 'package:customer_assist/home/presentation/controllers/shop_controller.dart';
import 'package:customer_assist/home/presentation/controllers/view_controller.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/first_row_widget.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/sub_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/app_constants.dart';
import '../../keyboard/alpha_capital_letters.dart';
import '../../keyboard/alpha_small_letters.dart';
import '../../keyboard/numeral_special_char.dart';

class ItemView extends StatefulWidget {
  double actualHeight;
  ItemView({
    Key? key,
    required this.actualHeight,
  }) : super(key: key);

  @override
  State<ItemView> createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
  OptionsController optionsController = Get.find();
  ShopController shopController = Get.find();
  var headerController = Get.put(HeaderController());
  ConfigureController configureController = Get.find();
  ViewController viewController = Get.find();
  LanguageController languageController = Get.find();
  AddCartReviewController addCartReviewController = Get.find();
  OrderController orderController = Get.find();
  KeyboardController keyboardController = Get.find();
   TextEditingController textEditingController = TextEditingController();
  //int index = 0;
  double actualHeight = 0;
  final FocusNode _focus = FocusNode();
  //final bool _isFocused = false;
  var ListofController = <dynamic>[];
  var checklist;
  double animateto = 0.0;
   String ans = "";
   String output = "";
   var operator = "";
  // final List<ScrollController> _controller =
  //     List.generate(100, (index) => ScrollController());
  List<TextEditingController> qtycontroller = [];

  @override
  void initState() {
   

    actualHeight = widget.actualHeight;
    //shopController.selectedList.clear();
    checklist =
        List.generate(shopController.productdisplay.value.length, (index) => false);

    print(checklist);
    super.initState();
  }
 bool isTapped = false;
buttonPressed(String buttonText) {
  print(buttonText);

  if (buttonText == "<") {
    operator = "<";
    textEditingController.text = textEditingController.text.substring(0, textEditingController.text.length - 1);
  } else if (buttonText == "E") {
     buttonText;
  } else {
    textEditingController.text = textEditingController.text + buttonText;
    print(textEditingController.text);
  }

  setState(() {
    // ans = textEditingController.text;
    try {
      ans = double.parse(textEditingController.text).toString();
    } catch (e) {
      // Handle the case where the conversion fails (non-numeric string)
      ans = "Error";
    }
    // print(ans);
  });
}
  // void _scrollToIndex(index) {
  //   print('object');
  //   Scrollable.ensureVisible(
  //     index,
  //     duration: const Duration(milliseconds: 100),
  //     curve: Curves.easeInOut,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
      SizedBox(
          // color: Colors.red,
          width: MediaQuery.of(context).size.width,
          height: GetPlatform.isAndroid
              ? (widget.actualHeight - 40) /  17.9 *
                  17
              //1.37
              // 18.1
              : (widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                  17.9 *
                  17,
          child: Stack(
            alignment: Alignment.topCenter, children: [
            Column(
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
                      // headerController.setSubHeaderLabel(configureController.subheaderResponse.value);
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
                Container(
                  width: 300,
                  child: Center(child: SubHeader())
                  ),
                SizedBox(width: 35,),
                InkWell(
                  onTap: () {
                    viewController.setView(SEARCHITEM);
                     //keyboardController.setKeypad(CAPITALKEYBOARD);
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
           
            
               SizedBox(
                height: GetPlatform.isAndroid
                ? 5
               : 10),
              SizedBox(
                  height: GetPlatform.isAndroid
                      ? (widget.actualHeight - 40) -
                          (widget.actualHeight / 16.5) * 2.1
                          // 2 -
                          // 88
                      : (widget.actualHeight -
                              MediaQuery.of(context).padding.bottom) -
                          (widget.actualHeight / 16.5) *
                              // (optionsController.customscroll.value == 'true'
                              //        ? 0.41
                              //        : 0.39),
                              2.2,
                  // height: 695,
                  child: GetX<ShopController>(
                      init: ShopController(),
                      initState: (_) {},
                      builder: (shopController) {
                        // children: [
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: shopController.productdisplay.length,
                            itemBuilder: (BuildContext context, int itemindex) {
                              // _focus.addListener(() {
                              //   if (_focus.hasFocus) {
                              //     keyboardController.setKeypad(SYMBOLSKEYBOARD);
                              //     keyboardController.controllerSetup(
                              //         ListofController[itemindex]);
                              //     keyboardController.setMaximiumLength('50');
                              //     setState(() {
                              //       _isFocused = true;
                              //     });
                              //   }
                              // });
                              return Column(children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                   height: GetPlatform.isAndroid
                                    ? 430
                                    : 400,
                                    width: 470,
                                    decoration: BoxDecoration(
                                        border: Border.all(),
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: FittedBox(
                                      fit: BoxFit.contain,
                                      child: Image.network(shopController
                                              .productdisplay[itemindex]
                                              .imageUrl!
                                          ),
                                    )),
                                    SizedBox(height: 3,),
                          Container(
                             decoration: BoxDecoration(border: Border(bottom: BorderSide(),top: BorderSide())),
                            child: Row(
                             // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [ 
                                Container(
                                  alignment: Alignment.centerLeft,
                                  margin: GetPlatform.isAndroid

                                 ? EdgeInsets.only(left: 10)
                                 : EdgeInsets.only(left: 15),
                                  width: 70,
                                 height:
                                         MediaQuery.of(context).size.height * 0.05,
                                  child: const Text(
                                    'Stock',
                                    style: TextStyle(
                                        fontSize: 19,
                                        ),
                                  ),
                                ),
                                Container(
                                  height: 25,
                                width: 25,
                                decoration: BoxDecoration(border: Border.all(),color: Color.fromARGB(255, 6, 224, 119)),
                                ),
                                 SizedBox(width: 50,),
                                 Container(
                                  alignment: Alignment.centerLeft,
                                  //color: Colors.amber,
                                  width: 100,
                                 height:
                                         MediaQuery.of(context).size.height * 0.05,
                                  child: const Text(
                                    'Pre Order',
                                    style: TextStyle(
                                        fontSize: 19,
                                        ),
                                  ),
                                ),
                                Container(
                                  height: 25,
                                width: 25,
                                decoration: BoxDecoration(border: Border.all()),
                                ),
                                SizedBox(width: 50,),
                                 Container(
                                  alignment: Alignment.centerLeft,
                                  //color: Colors.amber,
                                  width: 100,
                                 height:
                                         MediaQuery.of(context).size.height * 0.05,
                                  child: const Text(
                                    'Alternate',
                                    style: TextStyle(
                                        fontSize: 19,
                                        ),
                                  ),
                                ),
                                Container(
                                  height: 25,
                                width: 25,
                                decoration: BoxDecoration(border: Border.all()),
                                )

                                
                              ],
                            ),
                          ),
                          Container(
                             decoration: BoxDecoration(border: Border(bottom: BorderSide())),
                            child: Row(
                              children: [
                                Container(
                                  alignment: Alignment.centerRight,
                                  //color: Colors.amber,
                                  width: 200,
                                 height:
                                         MediaQuery.of(context).size.height * 0.05,
                                  child: const Text(
                                    'SKU',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(width: 25),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  //color: Colors.amber,
                                  width: 200,
                                  height:
                                         MediaQuery.of(context).size.height * 0.05,
                                  child: Text(
                                    shopController.productdisplay[itemindex]
                                                 .uom!,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                               
                              ],
                            ),
                          ),
                          Container(
                             decoration: BoxDecoration(border: Border(bottom: BorderSide())),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                 Container(
                                  alignment: Alignment.centerLeft,
                                  //color: Colors.amber,
                                  width: 60,
                                 height:
                                         MediaQuery.of(context).size.height * 0.05,
                                  child: const Text(
                                    'MRP',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text('₹',style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),),
                                //const SizedBox(width: 25),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  //color: Colors.amber,
                                  width: 100,
                                 height:
                                         MediaQuery.of(context).size.height * 0.05,
                                  child: Text(
                                    shopController.productdisplay[itemindex]
                                                 .productMrp!.toString(),
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  //color: Colors.amber,
                                  width: 50,
                                 height:
                                         MediaQuery.of(context).size.height * 0.05,
                                  child: const Text(
                                    'OP.',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                 Text('₹',style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),),
                                //const SizedBox(width: 25),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  //color: Colors.amber,
                                  width: 50,
                                 height:
                                         MediaQuery.of(context).size.height * 0.05,
                                  child: Text(
                                    shopController.productdisplay[itemindex]
                                                 .productRate!.toString(),
                                    
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                             decoration: BoxDecoration(border: Border(bottom: BorderSide())),
                            child: Row(
                              children: [
                                Container(
                                  alignment: Alignment.centerRight,
                                  //color: Colors.amber,
                                  width: 200,
                                  height:
                                         MediaQuery.of(context).size.height * 0.05,
                                  child: const Text(
                                    'Rating',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                //const SizedBox(width: 25),
                                Container(
                                   alignment: Alignment.centerRight,
                                              width: 30,
                                              margin: const EdgeInsets.only(right: 5),
                                              child: 
                                              Text(
                                                  shopController.productdisplay[itemindex]
                                                 .totalReview!.toString(),
                                                style: const TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                Container(
                                    //alignment: Alignment.centerLeft,
                                    decoration: BoxDecoration(
                                        color:
                                            const Color.fromARGB(255, 40, 154, 241),
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    width: 30,
                                   height: GetPlatform.isAndroid
                                              ? MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.03
                                              : MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.03,
                          
                                    // const SizedBox(width: 2),
                                    child: Container(
                                      child: Center(
                                        child: const Icon(
                                          Icons.star,
                                          size: 30,
                                          color: Colors.amber,
                                        ),
                                      ),
                                    )),
                                     Text('/',style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),),
                                Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  alignment: Alignment.centerLeft,
                                  //color: Colors.amber,
                                  // width: ,
                                 height:
                                     MediaQuery.of(context).size.height * 0.05,
                                  child: Text(
                                     shopController.productdisplay[itemindex]
                                                 .averageRatings!.toString(),
                                   style: const TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold),
                                  ),
                                ),
                               
                              ],
                            ),
                          ),
                          const SizedBox(height:9 ,),
                          Container(
                             decoration: BoxDecoration(border: Border(bottom: BorderSide())),
                            height: 55,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                             Container(
                               margin: GetPlatform.isAndroid
                                   ? EdgeInsets.only(bottom: 7)
                                   :EdgeInsets.only(),
                                   // margin: EdgeInsets.only(top: 7),
                                    height: GetPlatform.isAndroid
                                        ? ((widget.actualHeight) * 0.7) / 1.9
                                        : ((widget.actualHeight -
                                                    MediaQuery.of(context)
                                                        .padding
                                                        .bottom) /
                                                17.9) *
                                            0.8,
                                    width: GetPlatform.isAndroid
                                        ? ((widget.actualHeight -
                                                    MediaQuery.of(context)
                                                        .padding
                                                        .bottom) /
                                                17.9) *
                                            1.5
                                        : ((widget.actualHeight -
                                                    MediaQuery.of(context)
                                                        .padding
                                                        .bottom) /
                                                17.9) *
                                            1.5,
                                    decoration: BoxDecoration(
                                        border: Border.all(width: 1.5)),
                                    child:  Center(
                                        child: TextFormField(
                                            //showCursor: true,
                                                                    readOnly: true,
                                                                    textAlign: TextAlign.center,
                                                                    //maxLength: 3,
                                                                    //focusNode: _focus,
                                                                    controller: textEditingController,
                                                                    style: const TextStyle(
                                                                      fontSize: 20,
                                                                      fontWeight: FontWeight.normal,
                                                                    ),
                                                                    decoration: InputDecoration(
                                                                      border: InputBorder.none,
                                                                      filled: isTapped,
                                                                      hintText: '1',
                                                                      fillColor: isTapped ?textFieldColor : Colors.white,
                                                                     // fillColor: textFieldColor,
                                                                      //focusColor: Colors.blue,
                                                                     // focusColor: Colors.black,
                                                                      counterText: "",
                                                                      contentPadding:
                                                                          const EdgeInsets.fromLTRB(0, 0, 5, 5),
                                                                    ),
                                                                   onTap: () {
                                            setState(() {
                                              isTapped = true;
                                            });
                                            // Handle tap event
                                          },
                                          onEditingComplete: () {
                                            setState(() {
                                              isTapped = false;
                                            });
                                            // Handle editing complete event
                                          },
                                         ))
                                    ),
                                       InkWell(
                                  onTap: ()async {
                                     await Prefs.superUserLoggedIn
                                              .then((value) {
                                            if (value) {
                                              
                                              print("add");
                                              print("add");
                                              addCartReviewController.addToCartReview(shopController.productdisplay[itemindex],textEditingController);
                                              
                                            } else {
                                              viewController.setView(INFO);
                                              viewController.setInfoMessage(
                                                  'You tried to add an Item to the shopping cart.As a Guest User you can only browse.You can buy a product only as a register user.We invite to registered yourself as a Member of the great community of "Retail Resonance - Customer" Application');
                                            }
                                          });
                                                   
                            //    viewController.setView(INFO);
                            //  viewController.setInfoMessage('You tried to add an Item to the shopping cart.As a Guest User you can only browse.You can buy a product only as a register user.We invite to registered yourself as a Member of the great community of "Retail Resonance - Customer" Application');
                              
                                                   
                                  },
                                  child: Container(
                                     margin: GetPlatform.isAndroid
                                   ? EdgeInsets.only(bottom: 7)
                                   :EdgeInsets.only(),
                                      //margin: EdgeInsets.only(top: 7),
                                      height: GetPlatform.isAndroid
                                                ? ((widget.actualHeight) * 0.7) /
                                                    2
                                                : ((widget.actualHeight -
                                                            MediaQuery.of(context)
                                                                .padding
                                                                .bottom) /
                                                        17.9) *
                                                    0.8,
                                      width: GetPlatform.isAndroid
                                          ? ((widget.actualHeight -
                                                      MediaQuery.of(context)
                                                          .padding
                                                          .bottom) /
                                                  17.9) *
                                              0.9
                                          : ((widget.actualHeight -
                                                      MediaQuery.of(context)
                                                          .padding
                                                          .bottom) /
                                                  17.9) *
                                              0.9,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.green, width: 1.5),
                                      ),
                                      child: const Center(
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.green,
                                          size: 40,
                                        ),
                                      )),
                                ),
                                
                                Container(
                                   margin: GetPlatform.isAndroid
                                   ? EdgeInsets.only(bottom: 7)
                                   :EdgeInsets.only(),
                                   // margin: EdgeInsets.only(top: 7),
                                    // padding: EdgeInsets.all(1),
                                    height: GetPlatform.isAndroid
                                        ? ((widget.actualHeight) * 0.7) / 2
                                        : ((widget.actualHeight -
                                                    MediaQuery.of(context)
                                                        .padding
                                                        .bottom) /
                                                17.9) *
                                            0.8,
                                    width: GetPlatform.isAndroid
                                        ? ((widget.actualHeight -
                                                    MediaQuery.of(context)
                                                        .padding
                                                        .bottom) /
                                                17.9) *
                                            0.89
                                        : ((widget.actualHeight -
                                                    MediaQuery.of(context)
                                                        .padding
                                                        .bottom) /
                                                17.9) *
                                            0.89,
                                    // height: 48,
                                    // width: 42,
                                    decoration: BoxDecoration(
                                      // color: Colors.grey[50],
                                      border: Border.all(
                                          color: Colors.amber, width: 1.5),
                                      // borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.local_offer_sharp,
                                        color: Colors.amber,
                                        size: 40,
                                      ),
                                    )),
                                InkWell(
                                  onTap: ()async {
                                    await Prefs.superUserLoggedIn
                                              .then((value) {
                                            if (value) {
                                              //added by Gowshika
                                              var isAdded = shopController
                                                  .productdisplay[itemindex]
                                                  .isWishlist;
                                
                                              orderController.whishListUpdate(
                                                  shopController
                                                      .productdisplay[itemindex]
                                                      .productCode!,
                                                  isAdded == 1 ? '0' : '1',
                                                  languageController.languagenum
                                                      .toString());
                                              setState(() {
                                                shopController
                                                        .productdisplay[itemindex]
                                                        .isWishlist =
                                                    isAdded == 1 ? 0 : 1;
                                              });
                                              print('favorite');
                                            } else {
                                              viewController.setView(INFO);
                                              viewController.setInfoMessage(
                                                  'please login first to add this product to your WishList');
                                            }
                                          });
                            //          viewController.setView(INFO);
                            //   viewController.setInfoMessage(
                            //  // languageController.languageResponse.value.youHaveClickedOnADDICONTapOnRegisterNewICON ??
                            //    'please login first to add this product to your WishList');
                              
                                  },
                                  child: Container(
                                     margin: GetPlatform.isAndroid
                                   ? EdgeInsets.only(bottom: 7)
                                   :EdgeInsets.only(),
                                     //margin: const EdgeInsets.only(top: 7),
                                      height: GetPlatform.isAndroid
                                          ? ((widget.actualHeight) * 0.7) / 2
                                          : ((widget.actualHeight -
                                                      MediaQuery.of(context)
                                                          .padding
                                                          .bottom) /
                                                  17.9) *
                                             0.8,
                                      width: GetPlatform.isAndroid
                                          ? ((widget.actualHeight -
                                                      MediaQuery.of(context)
                                                          .padding
                                                          .bottom) /
                                                  17.9) *
                                              0.89
                                          : ((widget.actualHeight -
                                                      MediaQuery.of(context)
                                                          .padding
                                                          .bottom) /
                                                  17.9) *
                                              0.89,
                                      decoration: BoxDecoration(
                                          // color: Colors.grey[50],
                                          border: Border.all(
                                              color: const Color.fromARGB(
                                                  255, 232, 38, 28),
                                              width: 1.5),
                                          boxShadow: const []),
                                      child:  Center(
                                          child: Icon(
                                           (shopController
                                                        .productdisplay[itemindex]
                                                        .isWishlist == 1
                                                    )
                                                    ?Icons.favorite
                                       : Icons.favorite_border_outlined,
                                        color: Colors.red,
                                        size: 40,
                                      ))),
                                ),
                                Container(
                                      height: GetPlatform.isAndroid
                                        ? ((widget.actualHeight) * 0.7) / 2
                                        : ((widget.actualHeight -
                                                    MediaQuery.of(context)
                                                        .padding
                                                        .bottom) /
                                                17.9) *
                                           0.8,
                                    width: GetPlatform.isAndroid
                                        ? ((widget.actualHeight -
                                                    MediaQuery.of(context)
                                                        .padding
                                                        .bottom) /
                                                17.9) *
                                            3
                                        : ((widget.actualHeight -
                                                    MediaQuery.of(context)
                                                        .padding
                                                        .bottom) /
                                                17.9) *
                                            3.5,
                                  child:  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text('Characteristics',style: TextStyle(fontSize: 19),),
                                    Container(height: 30,width: 30,
                                    child: RotatedBox(
                                      quarterTurns: DateTime.february,
                                      child: optionsController.backtriangle),)
                                    ],
                                  )
                                  )
                                
                              ],
                            ),
                          ),
                          SizedBox(height: 10,),
                            Container(
                              padding: const EdgeInsets.only(left: 0.3),
                              height: 120,
                              width: double.infinity,
                             // color: Color.fromARGB(255, 166, 164, 164),
                              child: Column(
                                //crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Flexible(
                                    flex: 1,
                                    child: SizedBox(
                                       height: 150,
                                      // width: double.infinity,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        // crossAxisAlignment:
                                        //     CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Flexible(
                                            flex: 1,
                                            child: CustomButtons("1"),
                                          ),
                                          Flexible(
                                              flex: 1, child: CustomButtons("2")),
                                          Flexible(
                                              flex: 1, child: CustomButtons("3")),
                                          Flexible(
                                              flex: 1, child: CustomButtons("4")),
                                          Flexible(
                                              flex: 1, child: CustomButtons("5")),
                                               Flexible(
                                              flex: 1, child: CustomButtons("<")),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: SizedBox(
                                      // height: double.infinity,
                                      // width: double.infinity,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Flexible(
                                              flex: 1, child: CustomButtons("6")),
                                          Flexible(
                                              flex: 1, child: CustomButtons("7")),
                                          Flexible(
                                              flex: 1, child: CustomButtons("8")),
                                          Flexible(
                                              flex: 1, child: CustomButtons("9")),
                                          Flexible(
                                              flex: 1, child: CustomButtons("0")),
                                               Flexible(
                                              flex: 1, child: CustomButtons("E")),
                                        ],
                                      ),
                                    ),
                                  ),
                                  
                                ],
                              ),
                            ),
                    
                          //CustomButtons('')
                              //   Row(
                              //     children: [
                              //       Container(
                              //         alignment: Alignment.centerRight,
                              //         //color: Colors.amber,
                              //         width: 200,
                              //         height:
                              //             MediaQuery.of(context).size.height *
                              //                 0.056,
                              //         child: const Text(
                              //           'SKU',
                              //           style: TextStyle(
                              //               fontSize: 25,
                              //               fontWeight: FontWeight.bold),
                              //         ),
                              //       ),
                              //       const SizedBox(width: 25),
                              //       Container(
                              //         alignment: Alignment.centerLeft,
                              //         //color: Colors.amber,
                              //         width: 200,
                              //         height:
                              //             MediaQuery.of(context).size.height *
                              //                 0.056,
                              //         child: Text(
                              //           shopController.productdisplay[itemindex]
                              //                   .uom! ,
                              //           style: const TextStyle(
                              //               fontSize: 25,
                              //               fontWeight: FontWeight.bold),
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              //   Row(
                              //     children: [
                              //       Container(
                              //         alignment: Alignment.centerRight,
                              //         //color: Colors.amber,
                              //         width: 200,
                              //         height:
                              //             MediaQuery.of(context).size.height *
                              //                 0.056,
                              //         child: const Text(
                              //           'MRP',
                              //           style: TextStyle(
                              //               fontSize: 25,
                              //               fontWeight: FontWeight.bold),
                              //         ),
                              //       ),
                              //       const SizedBox(width: 25),
                              //       Container(
                              //         alignment: Alignment.centerLeft,
                              //         //color: Colors.amber,
                              //         width: 200,
                              //         height:
                              //             MediaQuery.of(context).size.height *
                              //                 0.056,
                              //         child: Text(
                              //           shopController.productdisplay[itemindex]
                              //               .productMrp!.toString()
                              //               ,
                              //           style: const TextStyle(
                              //               fontSize: 25,
                              //               fontWeight: FontWeight.bold),
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              //   Row(
                              //     children: [
                              //       Container(
                              //         alignment: Alignment.centerRight,
                              //         //color: Colors.amber,
                              //         width: 200,
                              //         height:
                              //             MediaQuery.of(context).size.height *
                              //                 0.056,
                              //         child: const Text(
                              //           'Offer',
                              //           style: TextStyle(
                              //               fontSize: 25,
                              //               fontWeight: FontWeight.bold),
                              //         ),
                              //       ),
                              //       const SizedBox(width: 25),
                              //       Container(
                              //         alignment: Alignment.centerLeft,
                              //         //color: Colors.amber,
                              //         width: 200,
                              //         height:
                              //             MediaQuery.of(context).size.height *
                              //                 0.056,
                              //         child: Text(
                              //           shopController.productdisplay[itemindex]
                              //               .productRate!.toString()
                              //               ,
                              //           style: const TextStyle(
                              //               fontSize: 25,
                              //               fontWeight: FontWeight.bold),
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              //   Row(
                              //     children: [
                              //       Container(
                              //         alignment: Alignment.centerRight,
                              //         //color: Colors.amber,
                              //         width: 200,
                              //         height:
                              //             MediaQuery.of(context).size.height *
                              //                 0.056,
                              //         child: const Text(
                              //           'Rating',
                              //           style: TextStyle(
                              //               fontSize: 25,
                              //               fontWeight: FontWeight.bold),
                              //         ),
                              //       ),
                              //       const SizedBox(width: 25),
                              //       Row(
                              //         mainAxisAlignment:
                              //             MainAxisAlignment.spaceBetween,
                              //         children: [
                              //           Container(
                              //               alignment: Alignment.centerLeft,
                              //               decoration: BoxDecoration(
                              //                   color: const Color.fromARGB(
                              //                       255, 40, 154, 241),
                              //                   borderRadius:
                              //                       BorderRadius.circular(25)),
                              //               width: 110,
                              //               height: GetPlatform.isAndroid
                              //                   ? MediaQuery.of(context)
                              //                           .size
                              //                           .height *
                              //                       0.047
                              //                   : MediaQuery.of(context)
                              //                           .size
                              //                           .height *
                              //                       0.047,

                              //               // const SizedBox(width: 2),
                              //               child: Row(
                              //                 children: [
                              //                   Container(
                              //                     width: 50,
                              //                     margin:
                              //                         const EdgeInsets.only(left: 15),
                              //                     child: Text(
                              //                       shopController
                              //                           .productdisplay[
                              //                               itemindex]
                              //                           .averageRatings!
                              //                           ,
                              //                       style: const TextStyle(
                              //                           fontSize: 25,
                              //                           fontWeight:
                              //                               FontWeight.bold),
                              //                     ),
                              //                   ),
                              //                   Container(
                              //                     child: const Icon(
                              //                       Icons.star,
                              //                       size: 40,
                              //                       color: Colors.amber,
                              //                     ),
                              //                   ),
                              //                 ],
                              //               )),
                              //           Container(
                              //             margin: const EdgeInsets.only(left: 10),
                              //             alignment: Alignment.centerLeft,
                              //             //color: Colors.amber,
                              //             // width: ,
                              //             height: GetPlatform.isAndroid
                              //                 ? MediaQuery.of(context)
                              //                         .size
                              //                         .height *
                              //                     0.0595
                              //                 : MediaQuery.of(context)
                              //                         .size
                              //                         .height *
                              //                     0.0595,
                              //             child: Text(
                              //               shopController
                              //                   .productdisplay[itemindex]
                              //                   .totalReview!.toString()
                              //                   ,
                              //               style: const TextStyle(
                              //                 fontSize: 20,
                              //               ),
                              //             ),
                              //           ),
                              //           const SizedBox(width: 4),
                              //           Container(
                              //             //margin: EdgeInsets.only(bottom: 15),
                              //             //padding: EdgeInsets.only(bottom: 12),
                              //             child: const Text(
                              //               "Ratings",
                              //               style: TextStyle(
                              //                   fontSize: 20,
                              //                   color: Color.fromARGB(
                              //                       255, 124, 125, 126)),
                              //             ),
                              //           )
                              //         ],
                              //       ),
                              //     ],
                              //   ),
                              //   const SizedBox(
                              //     height: 5,
                              //   ),
                              //   SizedBox(
                              //     height: 50,
                              //     child: Row(
                              //       mainAxisAlignment:
                              //           MainAxisAlignment.spaceEvenly,
                              //       children: [
                              //         InkWell(
                              //           onTap: (() async {
                              //             await Prefs.superUserLoggedIn
                              //                 .then((value) {
                              //               if (value) {
                                              
                              //                 print("add");
                              //                 print("add");
                              //                 addCartReviewController.addToCartReview(shopController.productdisplay[itemindex]);
                                              
                              //               } else {
                              //                 viewController.setView(INFO);
                              //                 viewController.setInfoMessage(
                              //                     'You tried to add an Item to the shopping cart.As a Guest User you can only browse.You can buy a product only as a register user.We invite to registered yourself as a Member of the great community of "Retail Resonance - Customer" Application');
                              //               }
                              //             });
                              //           }),
                              //           child: Container(
                              //               margin: const EdgeInsets.only(top: 0),
                              //               height: GetPlatform.isAndroid
                              //                   ? ((widget.actualHeight) * 0.7) /
                              //                       2
                              //                   : ((widget.actualHeight -
                              //                               MediaQuery.of(context)
                              //                                   .padding
                              //                                   .bottom) /
                              //                           17.9) *
                              //                       0.8,
                              //               width: GetPlatform.isAndroid
                              //                   ? ((widget.actualHeight -
                              //                               MediaQuery.of(context)
                              //                                   .padding
                              //                                   .bottom) /
                              //                           17.9) *
                              //                       0.9
                              //                   : ((widget.actualHeight -
                              //                               MediaQuery.of(context)
                              //                                   .padding
                              //                                   .bottom) /
                              //                           17.9) *
                              //                       0.9,
                              //               decoration: BoxDecoration(
                              //                 border: Border.all(
                              //                     color: Colors.green,
                              //                     width: 1.5),
                              //               ),
                              //               child: const Center(
                              //                 child: Icon(
                              //                   Icons.add,
                              //                   color: Colors.green,
                              //                   size: 40,
                              //                 ),
                              //               )),
                              //         ),
                              //         Container(
                              //             //margin: EdgeInsets.only(top: 7),
                              //             height: GetPlatform.isAndroid
                              //                 ? ((widget.actualHeight) * 0.7) /
                              //                     1.9
                              //                 : ((widget.actualHeight -
                              //                             MediaQuery.of(context)
                              //                                 .padding
                              //                                 .bottom) /
                              //                         17.9) *
                              //                     0.8,
                              //             width: GetPlatform.isAndroid
                              //                 ? ((widget.actualHeight -
                              //                             MediaQuery.of(context)
                              //                                 .padding
                              //                                 .bottom) /
                              //                         17.9) *
                              //                     1.5
                              //                 : ((widget.actualHeight -
                              //                             MediaQuery.of(context)
                              //                                 .padding
                              //                                 .bottom) /
                              //                         17.9) *
                              //                     1.5,
                              //             decoration: BoxDecoration(
                              //                 border: Border.all(width: 1.5)),
                              //             child: Center(
                              //                 child: TextField(
                              //               readOnly: true,
                              //               textAlign: TextAlign.center,
                              //               maxLength: 3,
                              //               //controller:  qtycontroller[itemindex],
                              //               style: const TextStyle(
                              //                 fontSize: 20,
                              //                 fontWeight: FontWeight.normal,
                              //               ),
                              //               decoration: InputDecoration(
                              //                 border: InputBorder.none,
                              //                 filled: _isFocused,
                              //                 hintText: "000",
                              //                 counterText: "",
                              //                 contentPadding:
                              //                     const EdgeInsets.fromLTRB(0, 0, 5, 0),
                              //               ),
                              //               onTap: () {
                              //                 // _scrollToIndex(context);
                                
                              //                 // animateto =
                              //                 //     (_controller[itemindex].offset);
                              //                 // //setState(()
                              //                 // optionsController
                              //                 //     .customscroll.value = 'false';
                              //                 keyboardController.setEdit(true);
                                
                              //                 keyboardController
                              //                     .setKeypad(SYMBOLSKEYBOARD);
                              //                 keyboardController.controllerSetup(
                              //                     ListofController[itemindex]);
                              //                 keyboardController.focusSetup(
                              //                     _focus,
                              //                     ListofController[itemindex]);
                              //                 keyboardController
                              //                     .setMaximiumLength('50');
                              //                 keyboardController.symbolTrue(true);
                              //                 print("------>");
                              //               },
                              //             ))),
                              //         Container(
                              //             // margin: EdgeInsets.only(top: 7),
                              //             // padding: EdgeInsets.all(1),
                              //             height: GetPlatform.isAndroid
                              //                 ? ((widget.actualHeight) * 0.7) / 2
                              //                 : ((widget.actualHeight -
                              //                             MediaQuery.of(context)
                              //                                 .padding
                              //                                 .bottom) /
                              //                         17.9) *
                              //                     0.8,
                              //             width: GetPlatform.isAndroid
                              //                 ? ((widget.actualHeight -
                              //                             MediaQuery.of(context)
                              //                                 .padding
                              //                                 .bottom) /
                              //                         17.9) *
                              //                     0.89
                              //                 : ((widget.actualHeight -
                              //                             MediaQuery.of(context)
                              //                                 .padding
                              //                                 .bottom) /
                              //                         17.9) *
                              //                     0.89,
                              //             // height: 48,
                              //             // width: 42,
                              //             decoration: BoxDecoration(
                              //               // color: Colors.grey[50],
                              //               border: Border.all(
                              //                   color: Colors.amber, width: 1.5),
                              //               // borderRadius: BorderRadius.circular(5),
                              //             ),
                              //             child: const Center(
                              //               child: Icon(
                              //                 Icons.local_offer_sharp,
                              //                 color: Colors.amber,
                              //                 size: 40,
                              //               ),
                              //             )),
                              //         InkWell(
                              //           onTap: () async {
                              //             await Prefs.superUserLoggedIn
                              //                 .then((value) {
                              //               if (value) {
                              //                 //added by Gowshika
                              //                 var isAdded = shopController
                              //                     .productdisplay[itemindex]
                              //                     .isWishlist;
                                
                              //                 orderController.whishListUpdate(
                              //                     shopController
                              //                         .productdisplay[itemindex]
                              //                         .productCode!,
                              //                     isAdded == 1 ? '0' : '1',
                              //                     languageController.languagenum
                              //                         .toString());
                              //                 setState(() {
                              //                   shopController
                              //                           .productdisplay[itemindex]
                              //                           .isWishlist =
                              //                       isAdded == 1 ? 0 : 1;
                              //                 });
                              //                 print('favorite');
                              //               } else {
                              //                 viewController.setView(INFO);
                              //                 viewController.setInfoMessage(
                              //                     'please login first to add this product to your WishList');
                              //               }
                              //             });
                              //           },
                              //           child: Container(
                              //               // margin: const EdgeInsets.only(top: 7),
                              //               height: GetPlatform.isAndroid
                              //                   ? ((widget.actualHeight) * 0.7) /
                              //                       2
                              //                   : ((widget.actualHeight -
                              //                               MediaQuery.of(context)
                              //                                   .padding
                              //                                   .bottom) /
                              //                           17.9) *
                              //                       0.8,
                              //               width: GetPlatform.isAndroid
                              //                   ? ((widget.actualHeight -
                              //                               MediaQuery.of(context)
                              //                                   .padding
                              //                                   .bottom) /
                              //                           17.9) *
                              //                       0.89
                              //                   : ((widget.actualHeight -
                              //                               MediaQuery.of(context)
                              //                                   .padding
                              //                                   .bottom) /
                              //                           17.9) *
                              //                       0.89,
                              //               decoration: BoxDecoration(
                              //                   // color: Colors.grey[50],
                              //                   border: Border.all(
                              //                       color: const Color.fromARGB(
                              //                           255, 232, 38, 28),
                              //                       width: 1.5),
                              //                   boxShadow: const []),
                              //               child: Center(
                              //                   child: Icon(
                              //                 shopController
                              //                             .productdisplay[
                              //                                 itemindex]
                              //                             .isWishlist ==
                              //                         1
                              //                     ? Icons.favorite
                              //                     : Icons
                              //                         .favorite_border_outlined,
                              //                 // Icons.favorite_border_outlined,
                              //                 color: Colors.red,
                              //                 size: 40,
                              //               ))),
                              //         ),
                              //         Container(
                              //             // margin: EdgeInsets.only(top: 7),
                              //             // padding: EdgeInsets.all(1),
                              //             height: GetPlatform.isAndroid
                              //                 ? ((widget.actualHeight) * 0.7) / 2
                              //                 : ((widget.actualHeight -
                              //                             MediaQuery.of(context)
                              //                                 .padding
                              //                                 .bottom) /
                              //                         17.9) *
                              //                     0.8,
                              //             width: GetPlatform.isAndroid
                              //                 ? ((widget.actualHeight -
                              //                             MediaQuery.of(context)
                              //                                 .padding
                              //                                 .bottom) /
                              //                         17.9) *
                              //                     0.89
                              //                 : ((widget.actualHeight -
                              //                             MediaQuery.of(context)
                              //                                 .padding
                              //                                 .bottom) /
                              //                         17.9) *
                              //                     0.89,
                              //             // height: 48,
                              //             // width: 42,
                              //             decoration: BoxDecoration(
                              //               // color: Colors.grey[50],
                              //               border: Border.all(
                              //                   color: Colors.green, width: 1.5),
                              //               // borderRadius: BorderRadius.circular(5),
                              //             ),
                              //             child: const Center(
                              //               child: Text(
                              //                 'N',
                              //                 style: TextStyle(
                              //                     fontSize: 30,
                              //                     color: Colors.green,
                              //                     fontWeight: FontWeight.bold),
                              //               ),
                              //               //color: Colors.green,
                              //             )),
                              //       ],
                              //     ),
                              //   )
                             ]);
                            });
                      }
                      )
                      )
            ]
            )
          ]
          )),
      //if (optionsController.customscroll.value == 'true')
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
        )
      // : Container();
    ]);
  }
   Widget CustomButtons(String buttonText) {
    return Container(
      //padding: const EdgeInsets.only(left: 3, top: 10),
      height: 50,
      width: 70,
      decoration: BoxDecoration(color: AppColors.headerContainer,borderRadius: BorderRadius.circular(5)),
      //color: const Color.fromARGB(255, 77, 74, 74),
     // child: Padding(
        //padding: const EdgeInsets.all(3.0),
        // child: FloatingActionButton(
        //     shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(15.0),
        //         side: const BorderSide(
        //             color: Colors.grey, width: 5, style: BorderStyle.none)),
        //     onPressed: () => buttonPressed(buttonText),
        //     backgroundColor: Colors.grey[350],
            child: InkWell(
              onTap: () {
                buttonPressed(buttonText);
              },
              child: Center(
                child: Text(
                  buttonText,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)
                      ),
                
              ),
            ));
     // ),
    //);
  }
   Widget CustomsButtons() {
    return Container(
      //padding: const EdgeInsets.only(left: 3, top: 10),
      height: 50,
      width: 70,
      decoration: BoxDecoration(color: AppColors.headerContainer,borderRadius: BorderRadius.circular(5)),
      //color: const Color.fromARGB(255, 77, 74, 74),
     // child: Padding(
        //padding: const EdgeInsets.all(3.0),
        // child: FloatingActionButton(
        //     shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(15.0),
        //         side: const BorderSide(
        //             color: Colors.grey, width: 5, style: BorderStyle.none)),
        //     onPressed: () => buttonPressed(buttonText),
        //     backgroundColor: Colors.grey[350],
            child: InkWell(
              onTap: () {
                
              },
              child: Center(
                child:RotatedBox(
                                      quarterTurns: DateTime.july,
                                      child: optionsController.arrow)
                
              ),
            ));
     
    }
  //  Widget CustomButtons(String buttonText) {
  //     return Container(
  //     child:  Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: <Widget>[
  //           // Text(
  //           //   'Selected Number:',
  //           //   style: TextStyle(fontSize: 18),
  //           // ),
  //           // Text(
  //           //   '$selectedNumber',
  //           //   style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
  //           // ),
  //           // SizedBox(height: 20),
  //           Row(
  //             children: [
  //               Container(
  //                 width: 400,
  //                // color: Colors.amber,
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                   children: List.generate(5, (index) {
  //                     final number = index + 1;
  //                     return InkWell(
  //                       onTap: () {
                          
  //                       },
  //                       child: Container(
  //                         height: 50,
  //                         width: 70,
  //                         decoration: BoxDecoration(color: AppColors.headerContainer,borderRadius: BorderRadius.circular(5)),
                          
  //                         // onPressed: () {
  //                         //   //updateTextField(number);
  //                         // },
  //                         child: Center(child: Text('$number')),
  //                       ),
  //                     );
  //                   }),
                    
  //                 ),
  //               ),
  //                Container(
  //                     height: 50,
  //                     width: 70,
  //                     decoration: BoxDecoration(color: AppColors.headerContainer,borderRadius: BorderRadius.circular(5)),
                      
  //                     // onPressed: () {
  //                     //   //updateTextField(number);
  //                     // },
  //                     //child: Center(child: Text('$number')),
  //                   ),
  //             ],
  //           ),
           
  //           SizedBox(height: 10,),
            
  //           Row(
  //             children: [
  //               Container(
  //                 width: 400,
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                   children: List.generate(5, (index) {
  //                     final number = index + 6; // Start from 6 for the second row
  //                     return InkWell(
  //                       onTap: () {
                          
  //                       },
  //                       child: Container(
  //                         height: 50,
  //                         width: 70,
  //                         decoration: BoxDecoration(color: AppColors.headerContainer,borderRadius: BorderRadius.circular(5)),
                          
  //                         // onPressed: () {
  //                         //   //updateTextField(number);
  //                         // },
  //                         child: Center(child: Text('$number')),
  //                       ),
  //                     );
  //                   }),
  //                 ),
  //               ),
  //               Container(
  //                     height: 50,
  //                     width: 70,
  //                     decoration: BoxDecoration(color: AppColors.headerContainer,borderRadius: BorderRadius.circular(5)),
                      
  //                     // onPressed: () {
  //                     //   //updateTextField(number);
  //                     // },
  //                     //child: Center(child: Text('$number')),
  //                   ),
  //             ],
  //           ),
  //         ],
  //       ),
  //     );
  //   }

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
}
