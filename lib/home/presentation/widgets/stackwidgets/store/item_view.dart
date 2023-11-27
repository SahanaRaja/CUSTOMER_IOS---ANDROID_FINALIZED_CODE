import 'package:customer_assist/core/app_colors.dart';
import 'package:customer_assist/core/app_urls.dart';
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

class ProductView extends StatefulWidget {
  double actualHeight;
  ProductView({
    Key? key,
    required this.actualHeight,
  }) : super(key: key);

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  OptionsController optionsController = Get.find();
  ShopController shopController = Get.find();
  var headerController = Get.put(HeaderController());
  ConfigureController configureController = Get.find();
  ViewController viewController = Get.find();
  LanguageController languageController = Get.find();
  var keyboardController = Get.put(KeyboardController());
   AddCartReviewController addCartReviewController = Get.find();
   OrderController orderController = Get.find();
     var currentController = TextEditingController().obs;
     TextEditingController textEditingController = TextEditingController();
  int index = 0;
   String ans = "";
   String output = "";
   var operator = "";
   var ListofController = <dynamic>[];
   final FocusNode _focus = FocusNode();
  bool _isFocused = false;

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
// buttonPressed(String buttonText) {
   
//   print(buttonText);
//    if (buttonText == "<") {
//       operator = "<";
//       output = output.substring(0, output.length - 1);
//     } else if(buttonText == "E")
//       {
//       output = buttonText;
       
//       }else{
      
//        output = output + buttonText;
//      print(output);

//     }
 
//    setState(() {
//       // ans = double.parse(_output).toString();
//       ans = output.toString();
//     });

// }
controllerSetup(TextEditingController controller) {
    currentController.value = controller;
  }
@override
  void initState() {
   
    // TODO: implement initState
    for (var category in shopController
        .resitem[shopController.supercatagoryIndex.value].category!) {
      List<dynamic> tempsub = [];
      for (var subcategory in category.subcategory!) {
        var temp = List.generate(subcategory.resSubcategory!.length,
            (index) => TextEditingController());
        tempsub.add(temp);
      }
      ListofController.add(tempsub);
    }
    
    super.initState();
  }
  
  
  @override
  Widget build(BuildContext context ) {
    return Stack(
      children: [
      Padding(
      padding: GetPlatform.isAndroid
    ? const EdgeInsets.only(top: 5)
    : const EdgeInsets.only(),
        child: SizedBox(
            // color: Colors.red,
            width: MediaQuery.of(context).size.width,
            height: GetPlatform.isAndroid
                ? (widget.actualHeight - 40) /  17.9 *
                    16.8
                //1.37
                // 18.1
                : (widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                    17.9 *
                    17,
           // height: widget.actualHeight * 0.75,
            child: Stack(
              alignment: Alignment.topCenter, children: [
              Column(children: [
                 Container(
      
              // margin: const EdgeInsets.only(right: 2),
             height: MediaQuery.of(context).size.height * 0.043,
              width: MediaQuery.of(context).size.width * 0.99,
              color: AppColors.subHeaderContainer,
              child: Row(
              
                children: [
                  InkWell(
                    onTap: () {

                      viewController.setView(PRODUCTVIEW);
                       headerController.setSubHeaderLabel(configureController.subheaderResponse.value);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 2,bottom: 2,left: 2),
                      height: 40,
                      width: 40,
                       child: RotatedBox(
                        quarterTurns: DateTime.june,
                        child: optionsController.backNew
                        ),
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
                 : 5),
                SizedBox(
                   height: GetPlatform.isAndroid
                        ? (widget.actualHeight - 40) -
                            (widget.actualHeight / 16.5) * 2.2
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
                    width: double.infinity,
                    child: 
                    ListView(
                      children: [
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                                height: GetPlatform.isAndroid
                                      ? 430
                                      : 400,
                                width: 470,
                                decoration: BoxDecoration(
                                    border: Border.all(),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50)),
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: optionsController
                                                                              .outlet ==
                                                                          '63'
                                                                      ? (shopController.resitem[shopController.supercatagoryIndex.value].category![shopController.catagoryIndex.value].subcategory![shopController.subcatagoryPageIndex.value].resSubcategory![shopController.itemIndex.value].imageUrl! !=
                                                                              ''
                                                                          ? Image.network(shopController
                                                                              .resitem[shopController
                                                                                  .supercatagoryIndex
                                                                                  .value]
                                                                              .category![shopController
                                                                                  .catagoryIndex
                                                                                  .value]
                                                                              .subcategory![shopController
                                                                                  .subcatagoryPageIndex
                                                                                  .value]
                                                                              .resSubcategory![shopController
                                                                                  .itemIndex
                                                                                  .value]
                                                                              .imageUrl!)
                                                                          : Container(
                                                                              height: GetPlatform.isAndroid
                                                                                  ? ((widget.actualHeight - 40) / 2) * 1.8
                                                                                  : ((widget.actualHeight - MediaQuery.of(context).padding.bottom) / 17.9) * 2.8,
                                                                            ))
                                                                      : ( //addedbysofiya
                                                                          shopController.resitem[0].category![shopController.catagoryIndex.value].subcategory![shopController.subcatagoryPageIndex.value].resSubcategory![shopController.itemIndex.value].imageUrl! !=
                                                                                  ''
                                                                              ? Image.network(//addedbysofiya
                                                                                  shopController.resitem[0].category![shopController.catagoryIndex.value].subcategory![shopController.subcatagoryPageIndex.value].resSubcategory![shopController.itemIndex.value].imageUrl!)
                                                                              : Container(
                                                                                  height: GetPlatform.isAndroid ? ((widget.actualHeight - 40) / 2) * 1.8 : ((widget.actualHeight - MediaQuery.of(context).padding.bottom) / 17.9) * 2.8,
                                                                                )),
                                ),
                                        
                                        ),
                                        SizedBox(height: 3,),
                            Container(
                               decoration: BoxDecoration(border: Border(bottom: BorderSide(),top: BorderSide())),
                              child: Row(
                               //mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [ 
                                  Container(
                                    margin: GetPlatform.isAndroid
      
                                   ? EdgeInsets.only(left: 10)
                                   : EdgeInsets.only(left: 15),
                                    alignment: Alignment.centerLeft,
                                    //color: Colors.amber,
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
                                     optionsController
                                                                                  .outlet ==
                                                                              '63'
                                                                          ? shopController
                                                                              .resitem[shopController
                                                                                  .supercatagoryIndex
                                                                                  .value]
                                                                              .category![shopController
                                                                                  .catagoryIndex
                                                                                  .value]
                                                                              .subcategory![shopController
                                                                                  .subcatagoryPageIndex
                                                                                  .value]
                                                                              .resSubcategory![shopController
                                                                                  .itemIndex
                                                                                  .value]
                                                                              .uom!
                                                                          : shopController
                                                                              .resitem[
                                                                                  0]
                                                                              .category![shopController
                                                                                  .catagoryIndex
                                                                                  .value]
                                                                              .subcategory![shopController
                                                                                  .subcatagoryPageIndex
                                                                                  .value]
                                                                              .resSubcategory![shopController
                                                                                  .itemIndex
                                                                                  .value]
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
                                      optionsController
                                                                                .outlet ==
                                                                            '63'
                                                                        ? shopController
                                                                            .resitem[shopController
                                                                                .supercatagoryIndex
                                                                                .value]
                                                                            .category![shopController
                                                                                .catagoryIndex
                                                                                .value]
                                                                            .subcategory![shopController
                                                                                .subcatagoryPageIndex
                                                                                .value]
                                                                            .resSubcategory![shopController
                                                                                .itemIndex
                                                                                .value]
                                                                            .productMrp!
                                                                            .toString()
                                                                        : shopController
                                                                            .resitem[
                                                                                0]
                                                                            .category![shopController
                                                                                .catagoryIndex
                                                                                .value]
                                                                            .subcategory![shopController
                                                                                .subcatagoryPageIndex
                                                                                .value]
                                                                            .resSubcategory![shopController
                                                                                .itemIndex
                                                                                .value]
                                                                            .productMrp!
                                                                            .toString(),
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
                                    width: 55,
                                   height:
                                           MediaQuery.of(context).size.height * 0.05,
                                    child: FittedBox(
                                      fit: BoxFit.fill,
                                      child: Text(
                                        optionsController.outlet == '63'
                                                                          ? shopController
                                                                              .resitem[shopController
                                                                                  .supercatagoryIndex
                                                                                  .value]
                                                                              .category![shopController
                                                                                  .catagoryIndex
                                                                                  .value]
                                                                              .subcategory![shopController
                                                                                  .subcatagoryPageIndex
                                                                                  .value]
                                                                              .resSubcategory![shopController
                                                                                  .itemIndex
                                                                                  .value]
                                                                              .productRate!
                                                                              .toString()
                                                                          : shopController
                                                                              .resitem[
                                                                                  0]
                                                                              .category![shopController
                                                                                  .catagoryIndex
                                                                                  .value]
                                                                              .subcategory![shopController
                                                                                  .subcatagoryPageIndex
                                                                                  .value]
                                                                              .resSubcategory![shopController
                                                                                  .itemIndex
                                                                                  .value]
                                                                              .productRate!
                                                                              .toString(),
                                        
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
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
                                                   optionsController.outlet ==
                                                                                  '63'
                                                                              ? shopController
                                                                                  .resitem[shopController
                                                                                      .supercatagoryIndex.value]
                                                                                  .category![shopController
                                                                                      .catagoryIndex.value]
                                                                                  .subcategory![shopController
                                                                                      .subcatagoryPageIndex.value]
                                                                                  .resSubcategory![shopController
                                                                                      .itemIndex.value]
                                                                                  .totalReview!
                                                                                  .toString()
                                                                              : shopController
                                                                                  .resitem[0]
                                                                                  .category![shopController.catagoryIndex.value]
                                                                                  .subcategory![shopController.subcatagoryPageIndex.value]
                                                                                  .resSubcategory![shopController.itemIndex.value]
                                                                                  .totalReview!
                                                                                  .toString(),
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
                                      width: GetPlatform.isAndroid
                                      ? 30
                                      : 30,
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
                                        child:const  Center(
                                          child:  Icon(
                                            Icons.star,
                                            size: 30,
                                            color: Colors.amber,
                                          ),
                                        ),
                                      )),
                                    const   Text('/',style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    alignment: Alignment.centerLeft,
                                   
                                   height:
                                       MediaQuery.of(context).size.height * 0.05,
                                    child: Text(
                                      optionsController.outlet ==
                                                                            '63'
                                                                        ? shopController
                                                                            .resitem[shopController
                                                                                .supercatagoryIndex.value]
                                                                            .category![shopController
                                                                                .catagoryIndex.value]
                                                                            .subcategory![shopController
                                                                                .subcatagoryPageIndex.value]
                                                                            .resSubcategory![shopController
                                                                                .itemIndex.value]
                                                                            .averageRatings!
                                                                            .toString()
                                                                        : shopController
                                                                            .resitem[0]
                                                                            .category![shopController.catagoryIndex.value]
                                                                            .subcategory![shopController.subcatagoryPageIndex.value]
                                                                            .resSubcategory![shopController.itemIndex.value]
                                                                            .averageRatings!
                                                                            .toString(),
                                     style: const TextStyle(
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  // const SizedBox(width: 4),
                                  // Container(
                                 
                                  //   child: const Text(
                                  //     "Ratings",
                                  //     style: TextStyle(
                                  //         fontSize: 20,
                                  //         color: Color.fromARGB(
                                  //             255, 124, 125, 126)),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                            const SizedBox( height : 9,),
                            Container(
                               decoration: BoxDecoration(border: Border(bottom: BorderSide())),
                              height: 55,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                               Container(
                                     margin: GetPlatform.isAndroid
                                     ? EdgeInsets.only(bottom: 7)
                                     : EdgeInsets.only(),
                                      height: GetPlatform.isAndroid
                                          ? ((widget.actualHeight) * 0.7) / 17.9 * 2
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
                                           // showCursor: true,
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
                                                                      fillColor: isTapped ? textFieldColor : Colors.white,
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
                                                                  )
                          )
                          ),
                                         InkWell(
                                    onTap: ()async {
                                      await Prefs.superUserLoggedIn.then((value) {
                            if (value) {
                              // var addons =  shopController.fetchAddOns(
                              // //'A2174',
                              // controller.resitem[shopController
                              //                     .supercatagoryIndex.value]
                              //                 .category![
                              //                     controller.catagoryIndex.value]
                              //                 .subcategory![subcatagoryIndex]
                              //                 .resSubcategory![itemindex]
                              //                 .productCode!,
                              // languageController.languagenum.toString()
                              //  );
                              // if(addons = true){
                              //   shopController.fetchAddOns(
                              // //'A2174',
                              // controller.resitem[shopController
                              //                     .supercatagoryIndex.value]
                              //                 .category![
                              //                     controller.catagoryIndex.value]
                              //                 .subcategory![subcatagoryIndex]
                              //                 .resSubcategory![itemindex]
                              //                 .productCode!,
                              // languageController.languagenum.toString()
                              //  );
                              // }
                              //  else{
                                print(textEditingController);
                              if (optionsController.outlet =='63') {
                                print("add");
                                print("add");
      
                                addCartReviewController.addToCartReviewfinal(
                                    shopController
                                        .resitem[shopController
                                            .supercatagoryIndex.value]
                                        .category![shopController.catagoryIndex.value]
                                        .subcategory![shopController.subcatagoryIndex.value]
                                        .resSubcategory![shopController.itemIndex.value],
                                         textEditingController);
                                   // ListofController[textEditingController.text.toString()]);
                              } else {
                                addCartReviewController.addToCartReviewfinal(
                                    shopController
                                        .resitem[0]
                                        .category![shopController.catagoryIndex.value]
                                        .subcategory![shopController.subcatagoryIndex.value]
                                        .resSubcategory![shopController.itemIndex.value],
                                        textEditingController
                                    // ListofController[shopController.catagoryIndex
                                    //     .value][shopController.subcatagoryIndex.value][shopController.itemIndex.value]
                                        );
                              }
                              //}
                            } else {
                              viewController.setView(INFO);
                              viewController.setInfoMessage(
                                  'You tried to add an Item to the shopping cart.As a Guest User you can only browse.You can buy a product only as a register user.We invite to registered yourself as a Member of the great community of "Retail Resonance - Customer" Application');
                              // viewController.setView(ERROR);
                              // viewController.setErrorMessage(
                              // // languageController.languageResponse.value.youHaveClickedOnADDICONTapOnRegisterNewICON ??
                              // // ''
                              // 'You have clicked on ADDICON to add that product to the cart. You must be  registered to use purchase function. Tap on Register New ICON to register. If you are already registered then go to Log-In page'
                              // );
                            }
                          });
                              //    viewController.setView(INFO);
                              //  viewController.setInfoMessage('You tried to add an Item to the shopping cart.As a Guest User you can only browse.You can buy a product only as a register user.We invite to registered yourself as a Member of the great community of "Retail Resonance - Customer" Application');
                                
                                                     
                                    },
                                    child: Container(
                                        margin: GetPlatform.isAndroid
                                     ? EdgeInsets.only(bottom: 7)
                                     :EdgeInsets.only(),
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
                                      await Prefs.superUserLoggedIn.then((value) {
                            if (value) {
                              //added by Gowshika
                              var isAdded = optionsController.outlet == '63'
                                  ? shopController
                                      .resitem[
                                          shopController.supercatagoryIndex.value]
                                      .category![shopController.catagoryIndex.value]
                                      .subcategory![shopController.subcatagoryIndex.value]
                                      .resSubcategory![shopController.itemIndex.value]
                                      .isWishlist
                                  : shopController
                                      .resitem[0]
                                      .category![shopController.catagoryIndex.value]
                                      .subcategory![shopController.subcatagoryIndex.value]
                                      .resSubcategory![shopController.itemIndex.value]
                                      .isWishlist;
      
                              orderController.whishListUpdate(
                                  optionsController.outlet == '63'
                                      ? shopController
                                          .resitem[shopController
                                              .supercatagoryIndex.value]
                                          .category![
                                              shopController.catagoryIndex.value]
                                          .subcategory![shopController.subcatagoryIndex.value]
                                          .resSubcategory![shopController.itemIndex.value]
                                          .productCode!
                                      //added by sahana
                                      : shopController
                                          .resitem[0]
                                          .category![
                                              shopController.catagoryIndex.value]
                                          .subcategory![shopController.subcatagoryIndex.value]
                                          .resSubcategory![shopController.itemIndex.value]
                                          .productCode!,
                                  // controller
                                  //     .catagory[
                                  //         controller.catagoryIndex.value]
                                  //     .subcategory![subcatagoryIndex]
                                  //     .items![itemindex]
                                  //     .productCode!,
                                  isAdded == 1 ? '0' : '1',
                                  languageController.languagenum.toString());
                              setState(() {
                                optionsController.outlet == '63'
                                    ? shopController
                                        .resitem[shopController
                                            .supercatagoryIndex.value]
                                        .category![shopController.catagoryIndex.value]
                                        .subcategory![shopController.subcatagoryIndex.value]
                                        .resSubcategory![shopController.itemIndex.value]
                                        .isWishlist = isAdded == 1 ? 0 : 1
                                    : shopController
                                        .resitem[0]
                                        .category![shopController.catagoryIndex.value]
                                        .subcategory![shopController.subcatagoryIndex.value]
                                        .resSubcategory![shopController.itemIndex.value]
                                        .isWishlist = isAdded == 1 ? 0 : 1;
                              });
                              print('favorite');
                            } else {
                              viewController.setView(INFO);
                              viewController.setInfoMessage(
                                  'please login first to add this product to your WishList');
                            }
                          });},
                                    child: Container(
                                       margin: GetPlatform.isAndroid
                                     ? EdgeInsets.only(bottom: 7)
                                     :EdgeInsets.only(),
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
                                           (optionsController.outlet == '63'
                                          ? shopController
                                              .resitem[shopController
                                                  .supercatagoryIndex.value]
                                              .category![
                                                  shopController.catagoryIndex.value]
                                              .subcategory![shopController.subcatagoryIndex.value]
                                              .resSubcategory![shopController.itemIndex.value]
                                              .isWishlist
                                          : shopController
                                              .resitem[0]
                                              .category![
                                                  shopController.catagoryIndex.value]
                                              .subcategory![shopController.subcatagoryIndex.value]
                                              .resSubcategory![shopController.itemIndex.value]
                                              .isWishlist) ==
                                      1
                                  ? Icons.favorite
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
                            SizedBox(height: 15,),
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
                          ]
                          )
                      ],
                        // controller: _controller[currentItemIndex],
                        //shrinkWrap: true,
                        //itemCount: shopController.productview.length,
                        // gridDelegate:
                        //     const SliverGridDelegateWithFixedCrossAxisCount(
                        //   crossAxisCount: 1,
                        //   childAspectRatio: 3 / 1.8,
                        //1 / 1.8
                        //),
                        //itemBuilder: (context, itemindex) {
                           //itemwidget(context, itemindex);
                        )
                        )
              ])
            ])),
      )
    ]);
  }

  
    Widget CustomButtons(String buttonText) {

    return Container(
      
      height: 50,
      width: 70,
      decoration: BoxDecoration(color: AppColors.headerContainer,borderRadius: BorderRadius.circular(5)),
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
    
  }
  
     


}
