// ignore_for_file: must_be_immutable

import 'package:auto_size_text/auto_size_text.dart';
import 'package:customer_assist/core/helpers/SharedPreference/prefs.dart';
import 'package:customer_assist/home/data/shopcoupon/models/shopping_products_model/subcategory.dart';
import 'package:customer_assist/home/presentation/controllers/add_cart_review_controller.dart';
import 'package:customer_assist/home/presentation/controllers/keyboard_controller.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/controllers/options_controller.dart';
import 'package:customer_assist/home/presentation/controllers/order_controller.dart';
import 'package:customer_assist/home/presentation/controllers/view_controller.dart';
import 'package:customer_assist/home/presentation/widgets/keyboard/alpha_capital_letters.dart';
import 'package:customer_assist/home/presentation/widgets/keyboard/alpha_small_letters.dart';
import 'package:customer_assist/home/presentation/widgets/keyboard/numeral_special_char.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../../core/app_colors.dart';
import '../../../../../core/app_constants.dart';
import '../../../../data/shopcoupon/models/shopping_products_model/item.dart';
import '../../../controllers/shop_controller.dart';

class SelectSubCatagoryList extends StatefulWidget {
  double actualHeight;
  SelectSubCatagoryList({Key? key, required this.actualHeight})
      : super(key: key);

  @override
  State<SelectSubCatagoryList> createState() => _SelectSubCatagoryListState();
}

class _SelectSubCatagoryListState extends State<SelectSubCatagoryList> {
  ScrollController scrollController = ScrollController();
  OptionsController optionsController = Get.find();
  ShopController shopController = Get.find();
  KeyboardController keyboardController = Get.find();
  ViewController viewController = Get.find();
  AddCartReviewController addCartReviewController = Get.find();
  OrderController orderController = Get.find();
  var languageController = Get.put(LanguageController());
  int item = 0;
  int currentItemIndex = 0;
  static const double padding = 16;
  final List<ScrollController> _controller =
      List.generate(200, (index) => ScrollController());
  final double _height = 150.0;
  Item? dropdownValue;
  Subcategory? subcatagoryValue;
  final FocusNode _focus = FocusNode();
  bool _isFocused = false;
  var ListofController = <dynamic>[];
  TextEditingController qtycontroller = TextEditingController();

  @override
  void initState() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    keyboardController.setKeypad('');
    shopController.subcatagoryPageIndex;
    print('  - - - - ${viewController.searchoption.value}');
    //viewController.setView(SYMBOLSKEYBOARD);
    if (viewController.userSuboption.value == NEWORDERCHANGE ||
        optionsController.optionsKey.value == BROWSE) {
      if (viewController.searchoption.value == "search") {
        print("#######################");
        print(shopController.catagoryIndex.value);
        print(shopController.subcatagoryPageIndex.value);
        print(shopController.catagory[shopController.catagoryIndex.value]);
        print(shopController.catagory[shopController.catagoryIndex.value]
            .subcategory![shopController.subcatagoryPageIndex.value]);
        dropdownValue =
            shopController.catagory[shopController.catagoryIndex.value];
        subcatagoryValue = shopController
            .catagory[shopController.catagoryIndex.value]
            .subcategory![shopController.subcatagoryPageIndex.value];
      } else {
        dropdownValue =
            shopController.catagory[shopController.catagoryIndex.value];
        subcatagoryValue = shopController
            .catagory[shopController.catagoryIndex.value].subcategory![0];

        print(dropdownValue);
        print(subcatagoryValue);
      }
    } else {
      dropdownValue =
          shopController.allcatagory[shopController.catagoryIndex.value];
      subcatagoryValue = shopController
          .allcatagory[shopController.catagoryIndex.value].subcategory![0];
    }
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
    final List<bool> isFocus = List.generate(20, (index) => false);
    final List<FocusNode> focuss = List.generate(20, (index) => FocusNode());
    return Column(
      children: [
         (optionsController.optionsKey.value == BROWSE)
       ? firstrowwidget(context)
       : firstrowwidgetguest(context),
        //firstrowwidget(context),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: selectSubCategoryWidget(context),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: selectItems(context, currentItemIndex),
        ),
        Stack(
          children: [
            SizedBox(
              height: GetPlatform.isAndroid
                  ? ((widget.actualHeight - 40) / 4) * 2.45
                  : ((widget.actualHeight -
                              MediaQuery.of(context).padding.bottom) /
                          17.9) *
                      11,
              child: GetX<ShopController>(
                init: ShopController(),
                initState: (_) {},
                builder: (controller) {
                  return GridView.builder(
                      controller: _controller[currentItemIndex],
                      shrinkWrap: true,
                      itemCount: viewController.userSuboption.value ==
                                  NEWORDERCHANGE ||
                              optionsController.optionsKey.value == BROWSE
                          ? controller
                              .catagory[controller.catagoryIndex.value]
                              .subcategory![
                                  controller.subcatagoryPageIndex.value]
                              .items!
                              .length
                          : controller
                              .allcatagory[controller.catagoryIndex.value]
                              .subcategory![
                                  controller.subcatagoryPageIndex.value]
                              .items!
                              .length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        childAspectRatio: 3 / 1.8,
                        //1 / 1.8
                      ),
                      itemBuilder: (context, index) {
                        return itemwidget(context, index);
                      });
                },
              ),
            ),
            GetX<KeyboardController>(
              init: KeyboardController(),
              initState: (_) {},
              builder: (controller) {
                //print("MOBILENUMBER");
                return Positioned(
                    bottom: 0,
                    top: 280,
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
    );
  }

  get newitemCount => (15 / 3).round();
  itemwidget(BuildContext context, int itemindex) {
    _focus.addListener(() {
      if (_focus.hasFocus) {
        keyboardController.setKeypad(MOBILENUMBER);
        keyboardController.setMaximiumLength('50');
        setState(() {
          _isFocused = true;
        });
      }
    });
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/product_1.png'))),
      // color: Colors.grey,
      padding: const EdgeInsets.all(3.0),
      child: SizedBox(
          height: GetPlatform.isAndroid
              ? ((widget.actualHeight - 40) / 30) * 1.8
              : ((widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                  17.9),
          // decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(25), color: Colors.grey[300]),
          child: GetX<ShopController>(
            init: ShopController(),
            initState: (_) {},
            builder: (controller) {
              if (controller.loadingController.isLoading == true) {}
              return Column(
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: InkWell(
                          onTap: () {
                        //      if (optionsController.outlet == '321')
                        // //optionsController.optionsKey.value == BROWSE
                        //   {
                        //   controller.setsupercatagoryIndex(controller.subcatagoryIndex.value);
                        //   shopController.setItemIndex(itemindex);
                        //   optionsController.optionIndexSetter(3);
                        //   optionsController.setSetState();
                        //   viewController.setView(PRODUCTPURCHASEPAGE);
                        // } else {
                        //   controller.setSubCatagoryPageIndex(controller.subcatagoryIndex.value);
                        //   shopController.setItemIndex(itemindex);
                        //   optionsController.optionIndexSetter(4);
                        //   optionsController.setSetState();
                        //   viewController.setView(PRODUCTPURCHASEPAGE);
                        // }
                            // controller.setItemIndex(itemindex);
                            // optionsController.optionIndexSetter(3);
                            // optionsController.setSetState();
                            // viewController.setView(PRODUCTPURCHASEPAGE);
                          },
                          child: SizedBox(
                              //margin: EdgeInsets.only(left:1),
                              height: MediaQuery.of(context).size.height * 0.21,
                              width: MediaQuery.of(context).size.width * 0.46,
                              child: Container(
                                  height: 100,
                                  width: 150,
                                  margin: const EdgeInsets.only(
                                      left: 10, right: 10, top: 12, bottom: 11),
                                  // decoration: BoxDecoration(

                                  child: viewController.userSuboption.value ==
                                              NEWORDERCHANGE ||
                                          optionsController.optionsKey.value ==
                                              BROWSE
                                      ? (controller
                                                  .catagory[controller
                                                      .catagoryIndex.value]
                                                  .subcategory![controller
                                                      .subcatagoryPageIndex
                                                      .value]
                                                  .items![itemindex]
                                                  .imageUrl! !=
                                              ''
                                          ? Image.network(controller
                                              .catagory[controller.catagoryIndex.value]
                                              .subcategory![controller.subcatagoryPageIndex.value]
                                              .items![itemindex]
                                              .imageUrl!)
                                          : Container(
                                              height: GetPlatform.isAndroid
                                                  ? ((widget.actualHeight -
                                                              40) /
                                                          40) *
                                                      1.8
                                                  : ((widget.actualHeight -
                                                              MediaQuery.of(
                                                                      context)
                                                                  .padding
                                                                  .bottom) /
                                                          17.9) *
                                                      2.5,
                                            ))
                                      : (controller.allcatagory[controller.catagoryIndex.value].subcategory![controller.subcatagoryPageIndex.value].items![itemindex].imageUrl! != ''
                                          ? Image.network(controller.allcatagory[controller.catagoryIndex.value].subcategory![controller.subcatagoryPageIndex.value].items![itemindex].imageUrl!)
                                          : Container(
                                              height: GetPlatform.isAndroid
                                                  ? ((widget.actualHeight -
                                                              40) /
                                                          17.9) *
                                                      1.8
                                                  : ((widget.actualHeight -
                                                              MediaQuery.of(
                                                                      context)
                                                                  .padding
                                                                  .bottom) /
                                                          17.9) *
                                                      2.5,
                                            )))),
                        ),
                      ),
                      const SizedBox(
                        width: 1,
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: GetPlatform.isAndroid
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
                                    2,
                            width: GetPlatform.isAndroid
                                ? ((widget.actualHeight) * 0.7) / 3
                                : ((widget.actualHeight -
                                            MediaQuery.of(context)
                                                .padding
                                                .bottom) /
                                        17.9) *
                                    4.2,
                            // height: MediaQuery.of(context).size.height * 0.09,
                            // width: MediaQuery.of(context).size.height * 0.20,

                            child: Container(
                                //added by saha
                                margin: GetPlatform.isAndroid
                                    ? const EdgeInsets.only(top: 10)
                                    : const EdgeInsets.only(top: 0),
                                child: Center(
                                  child: AutoSizeText(
                                    viewController.userSuboption.value ==
                                                NEWORDERCHANGE ||
                                            optionsController
                                                    .optionsKey.value ==
                                                BROWSE
                                        ? controller
                                            .catagory[
                                                controller.catagoryIndex.value]
                                            .subcategory![controller
                                                .subcatagoryPageIndex.value]
                                            .items![itemindex]
                                            .productName!
                                        : controller
                                            .allcatagory[
                                                controller.catagoryIndex.value]
                                            .subcategory![controller
                                                .subcatagoryPageIndex.value]
                                            .items![itemindex]
                                            .productName!,
                                    style: const TextStyle(
                                      fontSize: 23,
                                    ),
                                    textAlign: TextAlign.center,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )),
                          ),
                          SizedBox(
                            height: GetPlatform.isAndroid
                                ? MediaQuery.of(context).size.height * 0.01
                                : MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 15),
                                height: GetPlatform.isAndroid
                                    ? ((widget.actualHeight -
                                                MediaQuery.of(context)
                                                    .padding
                                                    .bottom) /
                                            17.9) *
                                        1.48
                                    : ((widget.actualHeight -
                                            MediaQuery.of(context)
                                                .padding
                                                .bottom) /
                                        35.9),
                                child: Row(
                                  children: [
                                    Container(
                                      // added by saha
                                      margin: GetPlatform.isAndroid
                                          ? const EdgeInsets.only(top: 10)
                                          : const EdgeInsets.only(top: 0),
                                      child: AutoSizeText(
                                        viewController.userSuboption.value ==
                                                    NEWORDERCHANGE ||
                                                optionsController
                                                        .optionsKey.value ==
                                                    BROWSE
                                            ? controller
                                                .catagory[controller
                                                    .catagoryIndex.value]
                                                .subcategory![controller
                                                    .subcatagoryPageIndex.value]
                                                .items![itemindex]
                                                .totalReview!
                                                .toString()
                                            : controller
                                                .allcatagory[controller
                                                    .catagoryIndex.value]
                                                .subcategory![controller
                                                    .subcatagoryPageIndex.value]
                                                .items![itemindex]
                                                .totalReview!
                                                .toString(),
                                        style: const TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.start,
                                        //maxLines: 3,
                                        //overflow: TextOverflow.ellipsis,
                                        //averageRatings
                                      ),
                                    ),
                                    const SizedBox(width: 1),
                                    Container(
                                      // added by saha
                                      margin: GetPlatform.isAndroid
                                          ? const EdgeInsets.only(top: 10)
                                          : const EdgeInsets.only(top: 0),
                                      child: const Icon(
                                        Icons.star,
                                        size: 30,
                                        color: Colors.amber,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                //added by saha
                                width: GetPlatform.isAndroid
                                    ? MediaQuery.of(context).size.width * 0.07
                                    : MediaQuery.of(context).size.width * 0.12,
                              ),
                              SizedBox(
                                  height: GetPlatform.isAndroid
                                      ? ((widget.actualHeight - 40) / 17.9) *
                                          1.53
                                      : ((widget.actualHeight -
                                              MediaQuery.of(context)
                                                  .padding
                                                  .bottom) /
                                          35.9),
                                  child: Row(
                                    children: [
                                      AutoSizeText(
                                        viewController.userSuboption.value ==
                                                    NEWORDERCHANGE ||
                                                optionsController
                                                        .optionsKey.value ==
                                                    BROWSE
                                            ? controller
                                                .catagory[controller
                                                    .catagoryIndex.value]
                                                .subcategory![controller
                                                    .subcatagoryPageIndex.value]
                                                .items![itemindex]
                                                .averageRatings!
                                                .toString()
                                            : controller
                                                .allcatagory[controller
                                                    .catagoryIndex.value]
                                                .subcategory![controller
                                                    .subcatagoryPageIndex.value]
                                                .items![itemindex]
                                                .averageRatings!
                                                .toString(),
                                        style: const TextStyle(fontSize: 20),
                                        textAlign: TextAlign.start,
                                        //maxLines: 3,
                                        //overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(width: 4),
                                      const Text(
                                        "Ratings",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Color.fromARGB(
                                                255, 124, 125, 126)),
                                      )
                                    ],
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: GetPlatform.isAndroid
                                ? 01
                                : MediaQuery.of(context).size.height * 0.012,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                height: GetPlatform.isAndroid
                                    ? ((widget.actualHeight - 40) / 17.9) * 0.5
                                    : ((widget.actualHeight -
                                            MediaQuery.of(context)
                                                .padding
                                                .bottom) /
                                        35.9),
                                child: viewController.userSuboption.value ==
                                            NEWORDERCHANGE ||
                                        optionsController.optionsKey.value ==
                                            BROWSE
                                    ? Container(
                                        //added by saha
                                        margin: const EdgeInsets.only(
                                          bottom: 5,
                                        ),
                                        child: AutoSizeText(
                                          controller
                                              .catagory[controller
                                                  .catagoryIndex.value]
                                              .subcategory![controller
                                                  .subcatagoryPageIndex.value]
                                              .items![itemindex]
                                              .uom!,
                                          style: const TextStyle(fontSize: 20),
                                          textAlign: TextAlign.start,
                                          //maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      )
                                    : AutoSizeText(
                                        controller
                                            .allcatagory[
                                                controller.catagoryIndex.value]
                                            .subcategory![controller
                                                .subcatagoryPageIndex.value]
                                            .items![itemindex]
                                            .uom!,
                                        style: const TextStyle(fontSize: 25),
                                        textAlign: TextAlign.start,
                                        //maxLines: 3,
                                        // overflow: TextOverflow.ellipsis,
                                      ),
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                      //added by saha
                      height: GetPlatform.isAndroid
                          ? MediaQuery.of(context).size.height * 0.006
                          : MediaQuery.of(context).size.height * 0.001),
                  SizedBox(
                    height: GetPlatform.isAndroid
                        ? ((widget.actualHeight - 40) / 17.9) * 1
                        : ((widget.actualHeight -
                                MediaQuery.of(context).padding.bottom) /
                            //added by saha
                            19),
                    width: GetPlatform.isAndroid
                        ? ((widget.actualHeight) * 0.7) / 1.5
                        : ((widget.actualHeight -
                                    MediaQuery.of(context).padding.bottom) /
                                17.9) *
                            //added by saha
                            8.3,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: (() async {
                            await Prefs.superUserLoggedIn.then((value) {
                          if (value) {
                            if (viewController.userSuboption.value ==
                                    NEWORDERCHANGE ||
                                optionsController.optionsKey.value == BROWSE) {
                              print("add");
                              print("add");
                              addCartReviewController.addToCartReviewfinal(
                                  controller
                                      .resitem[shopController
                                          .supercatagoryIndex.value]
                                      .category![controller.catagoryIndex.value]
                                      .subcategory![controller.subcatagoryIndex.value]
                                      .resSubcategory![itemindex],
                                  ListofController[shopController.catagoryIndex
                                      .value][controller.subcatagoryIndex.value][itemindex]);
                                 
                          
                            } else {
                              addCartReviewController.addToCartReviewfinal(
                                  controller
                                      .resitem[0]
                                      .category![controller.catagoryIndex.value]
                                      .subcategory![controller.subcatagoryIndex.value]
                                      .resSubcategory![itemindex],
                                  ListofController[shopController.catagoryIndex
                                      .value][controller.subcatagoryIndex.value][itemindex]);
                              
                            }
                          } else {
                            viewController.setView(ERROR);
                            viewController.setErrorMessage(
                              languageController.languageResponse.value.youHaveClickedOnADDICONTapOnRegisterNewICON ?? ''
                                //'You have clicked on ADDICON to add that product to the cart. You must be  registered to use purchase function. Tap on Register New ICON to register. If you are already registered then go to Log-In page'
                                );
                          }
                        });}),
                          // onTap: (() async {
                          //   await Prefs.superUserLoggedIn.then((value) {
                          //     if (value) {
                          //       print(itemindex);
                          //       if (viewController.userSuboption.value ==
                          //           NEWORDERCHANGE) {
                          //         addCartReviewController.addToCartReview(
                          //             controller
                          //                 .catagory[
                          //                     controller.catagoryIndex.value]
                          //                 .subcategory![controller
                          //                     .subcatagoryPageIndex.value]
                          //                 .items![itemindex]);
                          //       } else {
                          //         addCartReviewController.addToShoppingList(
                          //             controller
                          //                 .catagory[
                          //                     controller.catagoryIndex.value]
                          //                 .subcategory![controller
                          //                     .subcatagoryPageIndex.value]
                          //                 .items![itemindex]);
                          //       }
                          //     } else {
                          //       viewController.setView(ERROR);
                          //       viewController.setErrorMessage(
                          //           'You have clicked on ADDICON to add that product to the cart. You must be  registered to use purchase function. Tap on Register New ICON to register. If you are already registered then go to Log-In page');
                          //     }
                          //   });
                          // }),
                          child: Container(
                              margin: const EdgeInsets.only(left: 3, top: 8),
                              height: 43,
                              width: 45,
                              decoration: BoxDecoration(
                                // color: Colors.grey[50],
                                border: Border.all(color: Colors.green),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.add,
                                  color: Colors.green,
                                  size: 45,
                                ),
                              )),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Container(
                            margin: const EdgeInsets.only(top: 8),
                            height: 45,
                            width: 62,
                            decoration: BoxDecoration(
                              // color: Colors.grey[50],
                              border: Border.all(color: Colors.black),
                            ),
                            child: Center(
                                child: TextField(
                              readOnly: true,
                              textAlign: TextAlign.center,
                              maxLength: 3,
                              controller: qtycontroller,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                filled: _isFocused,
                                hintText: 'QTY',
                                counterText: "",
                                contentPadding: const EdgeInsets.fromLTRB(1, 0, 0, 1),
                              ),
                              onTap: () {
                                keyboardController.setEdit(true);

                                keyboardController.setKeypad(SYMBOLSKEYBOARD);
                                keyboardController
                                    .controllerSetup(qtycontroller);
                                keyboardController.focusSetup(
                                    _focus, qtycontroller);
                                keyboardController.setMaximiumLength('50');
                                keyboardController.symbolTrue(true);
                                print("------>");
                              },
                            ))),
                        const SizedBox(
                          width: 1,
                        ),
                        InkWell(
                          onTap: () {
                            print(itemindex);
                            
                          },
                          child: Container(
                              margin: const EdgeInsets.only(top: 8),
                              height: 43,
                              width: 45,
                              decoration: BoxDecoration(
                                // color: Colors.grey[50],
                                border: Border.all(color: Colors.amber),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.local_offer_sharp,
                                  color: Colors.amber,
                                  size: 45,
                                ),
                              )),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        InkWell(
                          onTap: (() async {
                            await Prefs.superUserLoggedIn.then((value) {
                          if (value) {
                            //added by Gowshika
                            var isAdded = optionsController.outlet == '321'
                                        ? controller
                                            .resitem[shopController
                                                .supercatagoryIndex.value]
                                            .category![
                                                controller.catagoryIndex.value]
                                            .subcategory![controller.subcatagoryIndex.value]
                                            .resSubcategory![itemindex]
                                            .isWishlist
                                        : controller
                                            .resitem[0]
                                            .category![
                                                controller.catagoryIndex.value]
                                            .subcategory![controller.subcatagoryIndex.value]
                                            .resSubcategory![itemindex]
                                            .isWishlist;

                            orderController.whishListUpdate(
                                optionsController.outlet == '321'
                                    ? controller
                                        .resitem[shopController
                                            .supercatagoryIndex.value]
                                        .category![
                                            controller.catagoryIndex.value]
                                        .subcategory![controller.subcatagoryIndex.value]
                                        .resSubcategory![itemindex]
                                        .productCode!
                                        //added by sahana
                                    : controller
                                            .resitem[0]
                                            .category![
                                                controller.catagoryIndex.value]
                                            .subcategory![controller.subcatagoryIndex.value]
                                            .resSubcategory![itemindex]
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
                                 optionsController.outlet == '321'
                                        ? controller
                                            .resitem[shopController
                                                .supercatagoryIndex.value]
                                            .category![
                                                controller.catagoryIndex.value]
                                            .subcategory![controller.subcatagoryIndex.value]
                                            .resSubcategory![itemindex]
                                            .isWishlist = isAdded == 1 ? 0 : 1
                                        : controller
                                            .resitem[0]
                                            .category![
                                                controller.catagoryIndex.value]
                                            .subcategory![controller.subcatagoryIndex.value]
                                            .resSubcategory![itemindex]
                                            .isWishlist = isAdded == 1 ? 0 : 1;
                                            });
                                     print('favorite');
                            
                          } 
                           else {
                            viewController.setView(ERROR);
                            viewController.setErrorMessage(
                                'please login first to add this product to your WishList'
                            );
                          }
                         });
                            // await Prefs.superUserLoggedIn.then((value) {
                            //   if (value) {
                            //     orderController.whishListUpdate(
                            //         viewController.userSuboption.value == NEWORDERCHANGE ||
                            //                 optionsController.optionsKey.value ==
                            //                     BROWSE
                            //             ? controller
                            //                 .catagory[
                            //                     controller.catagoryIndex.value]
                            //                 .subcategory![itemindex]
                            //                 .items![itemindex]
                            //                 .productCode!
                            //             : controller
                            //                 .allcatagory[
                            //                     controller.catagoryIndex.value]
                            //                 .subcategory![itemindex]
                            //                 .items![itemindex]
                            //                 .productCode!,
                            //         (viewController.userSuboption.value ==
                            //                             NEWORDERCHANGE ||
                            //                         optionsController.optionsKey.value ==
                            //                             BROWSE
                            //                     ? controller
                            //                         .catagory[controller
                            //                             .catagoryIndex.value]
                            //                         .subcategory![itemindex]
                            //                         .items![itemindex]
                            //                         .isWishlist
                            //                     : controller
                            //                         .allcatagory[controller.catagoryIndex.value]
                            //                         .subcategory![itemindex]
                            //                         .items![itemindex]
                            //                         .isWishlist) ==
                            //                 1
                            //             ? '0'
                            //             : '1',
                            //         languageController.languagenum.toString());
                            //     // setState(() {
                            //     //   zeroList[itemindex] = true;
                            //     // });
                            //     print('favorite');
                            //     // shopController.fetchCatalogueProduct(
                            //     //     languageController.languagenum.toString());
                            //   } else {
                            //     viewController.setView(ERROR);
                            //     viewController.setErrorMessage(
                            //         'please login first to add this product to your WishList');
                            //   }
                            // });
                          }),
                          child: Container(
                              margin: const EdgeInsets.only(top: 8),
                              height: 43,
                              width: 45,
                              decoration: BoxDecoration(
                                // color: Colors.grey[50],
                                border: Border.all(
                                    color:
                                        const Color.fromARGB(255, 232, 38, 28)),
                              ),
                              child:  Center(
                                child: Icon(

                                  (optionsController.outlet == '321'
                                        ? controller
                                            .resitem[shopController
                                                .supercatagoryIndex.value]
                                            .category![
                                                controller.catagoryIndex.value]
                                            .subcategory![controller.subcatagoryIndex.value]
                                            .resSubcategory![itemindex]
                                            .isWishlist
                                        : controller
                                            .resitem[0]
                                            .category![
                                                controller.catagoryIndex.value]
                                            .subcategory![controller.subcatagoryIndex.value]
                                            .resSubcategory![itemindex]
                                            .isWishlist) ==
                                    1
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                                  color: Colors.red,
                                  size: 45,
                                ),
                              )),
                        ),
                        SizedBox(
                            //added by saha
                            width: GetPlatform.isAndroid
                                ? MediaQuery.of(context).size.width * 0.04
                                : MediaQuery.of(context).size.width * 0.04),
                        Row(children: [
                          Container(
                              //added by saha
                              margin: GetPlatform.isAndroid
                                  ? const EdgeInsets.only(left: 10, top: 10)
                                  : const EdgeInsets.only(left: 10, top: 5),
                              height: GetPlatform.isAndroid
                                  ? ((widget.actualHeight - 40) / 17.9) * 1.8
                                  : ((widget.actualHeight -
                                          MediaQuery.of(context)
                                              .padding
                                              .bottom) /
                                      35.9),
                              child: Row(
                                children: [
                                  const AutoSizeText("₹",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  AutoSizeText(
                                      viewController.userSuboption.value ==
                                                  NEWORDERCHANGE ||
                                              optionsController
                                                      .optionsKey.value ==
                                                  BROWSE
                                          ? controller
                                              .catagory[controller
                                                  .catagoryIndex.value]
                                              .subcategory![controller
                                                  .subcatagoryPageIndex.value]
                                              .items![itemindex]
                                              .productRate!
                                              .toString()
                                          : controller
                                              .allcatagory[controller
                                                  .catagoryIndex.value]
                                              .subcategory![controller
                                                  .subcatagoryPageIndex.value]
                                              .items![itemindex]
                                              .productRate!
                                              .toString(),
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.start,
                                      //maxLines: 3,
                                      overflow: TextOverflow.ellipsis),
                                ],
                              )),
                          SizedBox(
                              //added by saha
                              width: GetPlatform.isAndroid
                                  ? MediaQuery.of(context).size.width * 0.08
                                  : MediaQuery.of(context).size.width * 0.08),
                          Container(
                              //added by saha
                              margin: GetPlatform.isAndroid
                                  ? const EdgeInsets.only(left: 10, top: 10)
                                  : const EdgeInsets.only(left: 10, top: 5),
                              height: GetPlatform.isAndroid
                                  ? ((widget.actualHeight - 40) / 17.9) * 1.8
                                  : ((widget.actualHeight -
                                          MediaQuery.of(context)
                                              .padding
                                              .bottom) /
                                      35.9),
                              child: Row(
                                children: [
                                  const AutoSizeText("₹",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(
                                              255, 151, 152, 153))),
                                  AutoSizeText(
                                    viewController
                                                    .userSuboption.value ==
                                                NEWORDERCHANGE ||
                                            optionsController
                                                    .optionsKey.value ==
                                                BROWSE
                                        ? controller
                                            .catagory[
                                                controller.catagoryIndex.value]
                                            .subcategory![controller
                                                .subcatagoryPageIndex.value]
                                            .items![itemindex]
                                            .productMrp!
                                            .toString()
                                        : controller
                                            .allcatagory[
                                                controller.catagoryIndex.value]
                                            .subcategory![controller
                                                .subcatagoryPageIndex.value]
                                            .items![itemindex]
                                            .productMrp!
                                            .toString(),
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(255, 151, 152, 153)),
                                    textAlign: TextAlign.start,
                                    //maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              )),
                        ])
                      ],
                    ),
                  ),
                ],
              );
            },
          )),
    );
  }

  SizedBox firstrowwidget(BuildContext context) {
    return SizedBox(
      height: GetPlatform.isAndroid
          ? ((widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                  17.9) *
              1
          : ((widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                  17.9) *
              1,
      child: GetX<ShopController>(
        init: ShopController(),
        initState: (_) {},
        builder: (controller) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 1),
                child: Stack(
                  children: [
                    SizedBox(
                        width: 85,
                        height: GetPlatform.isAndroid
                            ? (widget.actualHeight - 40) / 18.1
                            : (widget.actualHeight -
                                    MediaQuery.of(context).padding.bottom) /
                                17.9,
                        child: optionsController.timer),
                    const Positioned(
                      top: 10,
                      left: 29,
                      child: Text(
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
              Container(
                height: 45,
                width: 300,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: AppColors.subHeaderContainer),
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    viewController.userSuboption.value == NEWORDERCHANGE ||
                            optionsController.optionsKey.value == BROWSE
                        ? SizedBox(
                            child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: DropdownButton<Item?>(
                              value: dropdownValue,
                              icon: optionsController.downarrow,
                              elevation: 16,
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.black),
                              onChanged: (Item? newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
                                  currentItemIndex = 0;
                                  controller.setCatagoryIndex(
                                      controller.catagory.indexOf(newValue));
                                  subcatagoryValue = controller
                                      .catagory[controller.catagoryIndex.value]
                                      .subcategory![0];
                                  print(controller.catagory.indexOf(newValue));
                                  // subcatagory(context, newValue.subcategory!.length);
                                });
                              },
                              items: controller.catagory
                                  .map<DropdownMenuItem<Item?>>((Item? value) {
                                return DropdownMenuItem<Item?>(
                                  value: value,
                                  child: Text(value!.categoryName!),
                                );
                              }).toList(),
                            ),
                          ))
                        : SizedBox(
                            child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: DropdownButton<Item?>(
                              value: dropdownValue,
                              icon: optionsController.downarrow,
                              //elevation: 16,
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.black),
                              onChanged: (Item? newValue) {
                                setState(() {
                                  dropdownValue = newValue!;

                                  controller.setCatagoryIndex(
                                      controller.allcatagory.indexOf(newValue));
                                  subcatagoryValue = controller
                                      .allcatagory[
                                          controller.catagoryIndex.value]
                                      .subcategory![0];
                                  print(
                                      controller.allcatagory.indexOf(newValue));
                                  // subcatagory(context, newValue.subcategory!.length);
                                });
                              },
                              items: controller.allcatagory
                                  .map<DropdownMenuItem<Item?>>((Item? value) {
                                return DropdownMenuItem<Item?>(
                                  value: value,
                                  child: Text(value!.categoryName!),
                                );
                              }).toList(),
                            ),
                          )),
                  ],
                )),
                // color: AppColors.subHeaderContainer,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 5.0, bottom: 5.0, left: 5, right: 3),
                child: Stack(
                  children: [
                    InkWell(
                      // added by bhava
                      onTap: (() async {
                        await Prefs.superUserLoggedIn.then((value) {
                          if (value) {
                            if (viewController.userSuboption.value ==
                                    NEWORDERCHANGE ||
                                optionsController.optionsKey.value == BROWSE) {
                              setState(() {
                                shopController.setReviewPage(true);
                              });
                              if (shopController.reviewPage.value) {
                                viewController.setView(REVIEWPAGE);
                                keyboardController.setEdit(false);
                                optionsController.getShopList();
                                optionsController.setOptionList(SHOP);
                                viewController.setUserOption(SHOP);
                                optionsController.setSetState();
                                optionsController.hideShadow();
                                keyboardController.setKeypad("");
                                optionsController.optionIndexSetter(-1);
                              }
                            }
                          } else {
                            viewController.setView(ERROR);
                            viewController.setErrorMessage(
                              languageController.languageResponse.value.youHaveClickedOnADDICONTapOnRegisterNewICON ?? '');
                                //'You have clicked on CARTICON. Please login to view the cart details. Tap on Register New ICON to register. If you are already registered then go to Log-In page');
                          }
                        });
                      }),
                      child: SizedBox(
                        width: 80,
                        height: GetPlatform.isAndroid
                            ? (widget.actualHeight - 40) / 18.1
                            : (widget.actualHeight -
                                    MediaQuery.of(context).padding.bottom) /
                                17.9,
                        child: optionsController.cart,
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: 43,
                      child: Text(
                        addCartReviewController.tableValue.value.toString().padLeft(3,'0'),
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }

  SizedBox firstrowwidgetguest(BuildContext context) {
    return SizedBox(
      height: GetPlatform.isAndroid
          ? ((widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                  17.9) *
              1
          : ((widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                  17.9) *
              1,
      child: GetX<ShopController>(
        init: ShopController(),
        initState: (_) {},
        builder: (controller) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 1),
                // child: Stack(
                //   children: [
                //     SizedBox(
                //         width: 85,
                //         height: GetPlatform.isAndroid
                //             ? (widget.actualHeight - 40) / 18.1
                //             : (widget.actualHeight -
                //                     MediaQuery.of(context).padding.bottom) /
                //                 17.9,
                //         child: optionsController.timer),
                //     const Positioned(
                //       top: 10,
                //       left: 29,
                //       child: Text(
                //         '00:00',
                //         style: TextStyle(
                //             fontSize: 16,
                //             color: Colors.black,
                //             fontWeight: FontWeight.normal),
                //       ),
                //     ),
                //   ],
                // ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 8),
                height: 45,
                width: 300,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: AppColors.subHeaderContainer),
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    viewController.userSuboption.value == NEWORDERCHANGE ||
                            optionsController.optionsKey.value == BROWSE
                        ? Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.only(left: 55),
                              child: DropdownButton<Item?>(
                                isExpanded: true,
                                value: dropdownValue,
                                icon: optionsController.downarrow,
                                elevation: 16,
                                style: const TextStyle(
                                    fontSize: 18, color: Colors.black),
                                onChanged: (Item? newValue) {
                                  setState(() {
                                    dropdownValue = newValue!;
                                    currentItemIndex = 0;
                                    controller.setCatagoryIndex(
                                        controller.catagory.indexOf(newValue));
                                    subcatagoryValue = controller
                                        .catagory[controller.catagoryIndex.value]
                                        .subcategory![0];
                                    print(controller.catagory.indexOf(newValue));
                                    // subcatagory(context, newValue.subcategory!.length);
                                  });
                                },
                                items: controller.catagory
                                    .map<DropdownMenuItem<Item?>>((Item? value) {
                                  return DropdownMenuItem<Item?>(
                                    value: value,
                                    child: Text(value!.categoryName!),
                                  );
                                }).toList(),
                              )),
                        )
                        : Expanded(
                          child: Container(
                             padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.only(left: 55),
                              child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: DropdownButton<Item?>(
                                value: dropdownValue,
                                icon: optionsController.downarrow,
                                //elevation: 16,
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.black),
                                onChanged: (Item? newValue) {
                                  setState(() {
                                    dropdownValue = newValue!;
                        
                                    controller.setCatagoryIndex(
                                        controller.allcatagory.indexOf(newValue));
                                    subcatagoryValue = controller
                                        .allcatagory[
                                            controller.catagoryIndex.value]
                                        .subcategory![0];
                                    print(
                                        controller.allcatagory.indexOf(newValue));
                                    // subcatagory(context, newValue.subcategory!.length);
                                  });
                                },
                                items: controller.allcatagory
                                    .map<DropdownMenuItem<Item?>>((Item? value) {
                                  return DropdownMenuItem<Item?>(
                                    value: value,
                                    child: Text(value!.categoryName!),
                                  );
                                }).toList(),
                              ),
                            )),
                        ),
                  ],
                )),
                // color: AppColors.subHeaderContainer,
              ),
              const Padding(
                padding: EdgeInsets.only(
                    top: 5.0, bottom: 5.0, left: 5, right: 3),
              //   child: Stack(
              //     children: [
              //       InkWell(
              //         // added by bhava
              //         onTap: (() async {
              //           await Prefs.superUserLoggedIn.then((value) {
              //             if (value) {
              //               if (viewController.userSuboption.value ==
              //                       NEWORDERCHANGE ||
              //                   optionsController.optionsKey.value == BROWSE) {
              //                 setState(() {
              //                   shopController.setReviewPage(true);
              //                 });
              //                 if (shopController.reviewPage.value) {
              //                   viewController.setView(REVIEWPAGE);
              //                   keyboardController.setEdit(false);
              //                   optionsController.getShopList();
              //                   optionsController.setOptionList(SHOP);
              //                   viewController.setUserOption(SHOP);
              //                   optionsController.setSetState();
              //                   optionsController.hideShadow();
              //                   keyboardController.setKeypad("");
              //                   optionsController.optionIndexSetter(-1);
              //                 }
              //               }
              //             } else {
              //               viewController.setView(ERROR);
              //               viewController.setErrorMessage(
              //                 languageController.languageResponse.value.youHaveClickedOnADDICONTapOnRegisterNewICON ?? '');
              //                   //'You have clicked on CARTICON. Please login to view the cart details. Tap on Register New ICON to register. If you are already registered then go to Log-In page');
              //             }
              //             ;
              //           });
              //         }),
              //         child: Container(
              //           width: 80,
              //           height: GetPlatform.isAndroid
              //               ? (widget.actualHeight - 40) / 18.1
              //               : (widget.actualHeight -
              //                       MediaQuery.of(context).padding.bottom) /
              //                   17.9,
              //           child: optionsController.cart,
              //         ),
              //       ),
              //       Positioned(
              //         top: 10,
              //         left: 43,
              //         child: Text(
              //           addCartReviewController.tableValue.value.toString().padLeft(3,'0'),
              //           style: const TextStyle(
              //               fontSize: 16,
              //               color: Colors.black,
              //               fontWeight: FontWeight.normal),
              //         ),
              //       ),
              //     ],
              //   ),
              )
            ],
          );
        },
      ),
    );
  }

  SizedBox selectSubCategoryWidget(BuildContext context) {
    return SizedBox(
        height: GetPlatform.isAndroid
            ? ((widget.actualHeight - 40) / 17.9) * 0.99
            : ((widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                    17.9) *
                1,
        child: GetX<ShopController>(
          init: ShopController(),
          initState: (_) {},
          builder: (controller) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 45,
                  width: GetPlatform.isAndroid
                      ? ((widget.actualHeight - 40) / 3) * 1.5
                      : ((widget.actualHeight -
                                  MediaQuery.of(context).padding.bottom) /
                              17.9) *
                          8.8,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: AppColors.subHeaderContainer),
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      viewController.userSuboption.value == NEWORDERCHANGE ||
                              optionsController.optionsKey.value == BROWSE
                          ? Expanded(
                            child: Container(
                               padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.only(left: 95),
                                child: DropdownButton<Subcategory?>(
                                  isExpanded: true,
                                value: subcatagoryValue,
                                icon: optionsController.downarrow,
                                elevation: 16,
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.black),
                                onChanged: (Subcategory? newValue) {
                                  setState(() {
                                    subcatagoryValue = newValue!;
                                    shopController.setSubCatagoryPageIndex(
                                        shopController
                                            .catagory[shopController
                                                .catagoryPageIndex.value]
                                            .subcategory!
                                            .indexOf(newValue));
                                    print(controller.setSubCatagoryPageIndex(
                                        controller
                                            .catagory[
                                                controller.catagoryIndex.value]
                                            .subcategory!
                                            .indexOf(newValue)));
                                    // subcatagory(context, newValue.subcategory!.length);
                                  });
                                },
                                items: controller
                                    .catagory[controller.catagoryIndex.value]
                                    .subcategory!
                                    .map<DropdownMenuItem<Subcategory?>>(
                                        (Subcategory? value) {
                                  return DropdownMenuItem<Subcategory?>(
                                    value: value,
                                    child: Text(value!.subcategoryName!),
                                  );
                                }).toList(),
                              )),
                          )
                          : SizedBox(
                              child: DropdownButton<Subcategory?>(
                              value: subcatagoryValue,
                              icon: optionsController.downarrow,
                              elevation: 16,
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.black),
                              onChanged: (Subcategory? newValue) {
                                setState(() {
                                  subcatagoryValue = newValue!;
                                  print(controller.setSubCatagoryPageIndex(
                                      controller
                                          .allcatagory[
                                              controller.catagoryIndex.value]
                                          .subcategory!
                                          .indexOf(newValue)));
                                  currentItemIndex = 0;
                                });
                              },
                              items: controller
                                  .allcatagory[controller.catagoryIndex.value]
                                  .subcategory!
                                  .map<DropdownMenuItem<Subcategory?>>(
                                      (Subcategory? value) {
                                return DropdownMenuItem<Subcategory?>(
                                  value: value,
                                  child: Text(value!.subcategoryName!),
                                );
                              }).toList(),
                            )),
                    ],
                  )),
                ),
              ],
            );
          },
        ));
  }

  SizedBox selectItems(BuildContext context, int subcatagoryIndex) {
    return SizedBox(
      height: GetPlatform.isAndroid
          ? ((widget.actualHeight - 40) / 17.9) * 1.1
          : ((widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                  17.9) *
              1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 47,
            // height: GetPlatform.isAndroid
            //     ? ((widget.actualHeight - 40) / 17.9) * 1.6
            //     : ((widget.actualHeight -
            //                 MediaQuery.of(context).padding.bottom) /
            //             17.9) *
            //         1,
            width: GetPlatform.isAndroid
                ? ((widget.actualHeight - 40) / 3) * 1.5
                : ((widget.actualHeight -
                            MediaQuery.of(context).padding.bottom) /
                        17.9) *
                    8.9,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                color: AppColors.subHeaderContainer),
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GetX<ShopController>(
                  init: ShopController(),
                  initState: (_) {},
                  builder: (controller) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 4, right: 4),
                          height: 45,
                          width: GetPlatform.isAndroid
                              ? ((widget.actualHeight - 40) / 17.9) * 8.8
                              : ((widget.actualHeight -
                                          MediaQuery.of(context)
                                              .padding
                                              .bottom) /
                                      17.9) *
                                  8.8,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              color: AppColors.subHeaderContainer),
                          child: Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      // item = item - 1 < 0 ? item : item - 1;
                                      _animateToIndex(
                                        subcatagoryIndex - 2,
                                        subcatagoryIndex,
                                        controller,
                                      );
                                      // jumptoItem(item);
                                    },
                                    child: SizedBox(
                                      width: 40,
                                      height: 40,
                                      child: optionsController.uparrow,
                                    ),
                                  ),
                                  Text(
                                    subcatagoryIndex < 2
                                        ? 0.toString()
                                        : subcatagoryIndex.toString(),
                                    style: const TextStyle(
                                        fontSize: 20, color: Colors.black),
                                  ),
                                ],
                              ),
                              FittedBox(
                                fit: BoxFit.contain,
                                child: Text(
                                  languageController
                                          .languageResponse.value.items ??
                                      '',
                                  style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    ((controller.catagory[controller.catagoryIndex.value].subcategory![controller.subcatagoryPageIndex.value].items!.length) -
                                                subcatagoryIndex) <
                                            2
                                        ? 0.toString()
                                        : viewController.userSuboption.value ==
                                                    NEWORDERCHANGE ||
                                                optionsController.optionsKey.value ==
                                                    BROWSE
                                            ? ((controller
                                                        .catagory[controller
                                                            .catagoryIndex
                                                            .value]
                                                        .subcategory![controller
                                                            .subcatagoryPageIndex
                                                            .value]
                                                        .items!
                                                        .length) -
                                                    (subcatagoryIndex < 2
                                                        ? 2
                                                        : subcatagoryIndex + 2))
                                                .toString()
                                            : ((controller
                                                        .allcatagory[controller.catagoryIndex.value]
                                                        .subcategory![controller.subcatagoryPageIndex.value]
                                                        .items!
                                                        .length) -
                                                    (subcatagoryIndex < 2 ? 2 : subcatagoryIndex + 2))
                                                .toString(),
                                    style: const TextStyle(
                                        fontSize: 20, color: Colors.black),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      // item = item + 1 >= newitemCount ? item : item + 1;
                                      // jumptoItem(item);

                                      _animateToIndex(subcatagoryIndex + 2,
                                          subcatagoryIndex, controller);
                                    },
                                    child: SizedBox(
                                      width: 40,
                                      height: 40,
                                      child: optionsController.downarrow,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                        ),
                      ],
                    );
                  },
                ),
              ],
            )),
            // color: AppColors.subHeaderContainer,
          ),
        ],
      ),
    );
  }

  void _animateToIndex(int index, int mainIndex, ShopController controller) {
    print(_controller[mainIndex]);
    _controller[mainIndex].animateTo(
      index * _height * 1.92,
      duration: const Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
    );
    print(index);
    print(controller.catagory[controller.catagoryIndex.value]
        .subcategory![controller.subcatagoryPageIndex.value].items!.length);
    print(currentItemIndex);
    setState(() {
      if (index >= 0) {
        if (index <=
            (viewController.userSuboption.value == NEWORDERCHANGE ||
                    optionsController.optionsKey.value == BROWSE
                ? controller
                        .catagory[controller.catagoryIndex.value]
                        .subcategory![controller.subcatagoryPageIndex.value]
                        .items!
                        .length -
                    1
                : controller
                        .allcatagory[controller.catagoryIndex.value]
                        .subcategory![controller.subcatagoryPageIndex.value]
                        .items!
                        .length -
                    1)) {
          currentItemIndex = index;
        }
      }
    });
  }

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
      print("CAPITALKEYBOARD");
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

  int i = -1;
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

  void jumptoItem(int item) {
    final width = scrollController.position.maxScrollExtent + 100;

    final value = item / newitemCount * width;
    final valueSpace = padding + value;
    final newValue = valueSpace > scrollController.position.maxScrollExtent
        ? scrollController.position.maxScrollExtent
        : valueSpace;
    scrollController.jumpTo(newValue);
  }
}
