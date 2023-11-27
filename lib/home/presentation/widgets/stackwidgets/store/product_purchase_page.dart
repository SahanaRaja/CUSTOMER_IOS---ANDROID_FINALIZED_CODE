// ignore_for_file: must_be_immutable, non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:customer_assist/core/helpers/SharedPreference/prefs.dart';
import 'package:customer_assist/home/presentation/controllers/add_cart_review_controller.dart';
import 'package:customer_assist/home/presentation/controllers/keyboard_controller.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/controllers/options_controller.dart';
import 'package:customer_assist/home/presentation/controllers/order_controller.dart';
import 'package:customer_assist/home/presentation/controllers/shop_controller.dart';
import 'package:customer_assist/home/presentation/controllers/view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/app_colors.dart';
import '../../../../../core/app_constants.dart';
import '../../../../../core/app_style.dart';
import '../../../../data/shopcoupon/models/shop_nutrition/shop_nutrition.dart';
import '../../keyboard/alpha_capital_letters.dart';
import '../../keyboard/alpha_small_letters.dart';
import '../../keyboard/numeral_special_char.dart';

class ProductPurchasePage extends StatefulWidget {
  double actualHeight;
  ProductPurchasePage({Key? key, required this.actualHeight}) : super(key: key);

  @override
  State<ProductPurchasePage> createState() => _ProductPurchasePageState();
}

class _ProductPurchasePageState extends State<ProductPurchasePage>
    with SingleTickerProviderStateMixin {
  final TextEditingController manufacturer = TextEditingController();
  final TextEditingController brand = TextEditingController();
  final TextEditingController sku = TextEditingController();
  final TextEditingController price = TextEditingController();
  KeyboardController keyboardController = Get.find();
  OptionsController optionsController = Get.find();
  ShopController shopController = Get.find();
  OrderController orderController = Get.find();
  ViewController viewController = Get.find();
  AddCartReviewController addCartReviewController = Get.find();
  var languageController = Get.put(LanguageController());
  final FocusNode _focuss = FocusNode();
  //late var _isFocus = false;
  TabController? _tabController;
  ShopNutrition? nutritions;
  int _selectedTab = 0;
  var whishlist = false;
  //inal FocusNode _focus = FocusNode();
  //added by saha
  final bool _isFocused = false;
  TextEditingController qtycontroller = TextEditingController();
  var ListofController = <dynamic>[];

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 4);

    // print(
    // "Print WhishList ${shopController.catagory[shopController.catagoryIndex.value].subcategory![shopController.subcatagoryPageIndex.value].items![shopController.itemIndex.value].isWishlist}");
    // nutritions = (shopController
    //         .catagory[shopController.catagoryIndex.value]
    //         .subcategory![shopController.subcatagoryPageIndex.value]
    //         .items![shopController.itemIndex.value]
    //         .nutritionsInfo!
    //         .isEmpty
    //     ? ShopNutrition.fromJson(shopController
    //         .catagory[shopController.catagoryIndex.value]
    //         .subcategory![shopController.subcatagoryPageIndex.value]
    //         .items![shopController.itemIndex.value]
    //         .nutritionsInfo!
    //         .replaceAll("'", '"'))
    //     : "") as ShopNutrition?;
    // print("Nutritions$nutritions");
    _tabController!.addListener(() {
      if (!_tabController!.indexIsChanging) {
        setState(() {
          _selectedTab = _tabController!.index;
        });
      }
    });
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

    return Stack(
      children: [
        SizedBox(
          height: GetPlatform.isAndroid
              ? (widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                  17.9 *
                  13.5
              // 13.5

              // 18.1
              : (widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                  17.9 *
                  14,
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Column(
                    children: [
                      (optionsController.optionsKey.value == BROWSE)
       ? firstrowwidget(context)
       : firstrowwidgetguest(context),
                     // firstrowwidget(context),
                      DefaultTabController(
                          length: 3,
                          child: SizedBox(
                            height: GetPlatform.isAndroid
                                ? (widget.actualHeight -
                                        MediaQuery.of(context).padding.bottom) /
                                    17.9 *
                                    // modified by dharani
                                    12.5
                                : ((widget.actualHeight -
                                            MediaQuery.of(context)
                                                .padding
                                                .bottom) /
                                        17.9) *
                                    // modified by dharani
                                    13,
                            child: Column(
                              children: <Widget>[
                                Material(
                                  color: Colors.grey.shade300,
                                  child: TabBar(
                                    unselectedLabelColor: Colors.blue,
                                    labelColor: Colors.blue,
                                    indicatorColor: Colors.blue,
                                    controller: _tabController,
                                    labelPadding: const EdgeInsets.all(0.0),
                                    tabs: [
                                      _getTab(
                                          0,
                                          Center(
                                              child: Text(languageController
                                                      .languageResponse
                                                      .value
                                                      .manufacturer ??
                                                  ''))),
                                      _getTab(
                                          1,
                                          Center(
                                              child: Text(languageController
                                                      .languageResponse
                                                      .value
                                                      .ingredients ??
                                                  ''))),
                                      _getTab(
                                          2,
                                          Center(
                                              child: Text(languageController
                                                      .languageResponse
                                                      .value
                                                      .nutrition ??
                                                  ''))),
                                      // _getTab(
                                      //     3,
                                      //     Center(
                                      //         child: Text(languageController
                                      //                 .languageResponse
                                      //                 .value
                                      //                 .offers ??
                                      //             ''))),
                                    ],
                                  ),
                                ),
                                Container(
                                    height: GetPlatform.isAndroid
                                        ? 
                                        (widget.actualHeight -
                                                MediaQuery.of(context)
                                                    .padding
                                                    .bottom) /
                                            17.9 *
                                            5.5
                                        // 5.5
                                        // 1.8
                                        : ((widget.actualHeight -
                                                    MediaQuery.of(context)
                                                        .padding
                                                        .bottom) /
                                                17.9) *
                                            5.8,
                                    //5.6,
                                    color: Colors.grey,
                                    padding: const EdgeInsets.all(7.0),
                                    //7.0
                                    child: Container(
                                        decoration: const BoxDecoration(
                                            // modified by dharani
                                            // borderRadius:
                                            //     BorderRadius.circular(35),
                                            // color: Colors.grey[300]
                                            image: DecorationImage(
                                                fit: BoxFit.fill,
                                                // modified by dharani
                                                image: AssetImage(
                                                    'assets/images/product_1.png'))),
                                        child: GetX<ShopController>(
                                            init: ShopController(),
                                            initState: (_) {},
                                            builder: (controller) {
                                              return Column(children: [
                                                // const SizedBox(
                                                //   height: 1,
                                                // ),

                                                // padding: EdgeInsets.only(left: 1 ,right:1,top:1),

                                                Row(
                                                  // mainAxisAlignment:
                                                  //     MainAxisAlignment
                                                  //         .spaceEvenly,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .only(),
                                                      child: InkWell(
                                                        
                                                        child: Container(
                                                             //color: Colors.amber,
                                                            //added by saha
                                                            margin: GetPlatform
                                                                    .isAndroid
                                                                // modified by dharani
                                                                ? const EdgeInsets
                                                                        .only(
                                                                    left: 1,
                                                                    bottom: 30,
                                                                    top: 40
                                                                    )
                                                                : const EdgeInsets
                                                                        .only(
                                                                    left: 5,
                                                                    top: 5),
                                                            height: GetPlatform
                                                                    .isAndroid
                                                                ?((widget.actualHeight - MediaQuery.of(context).padding.bottom) / 17.9) *
                                                                    3
                                                                // ((widget.actualHeight) *
                                                                //         0.7) /
                                                                //     3
                                                                : ((widget.actualHeight -
                                                                            MediaQuery.of(context)
                                                                                .padding
                                                                                .bottom) /
                                                                        17.9) *
                                                                    //added by saha
                                                                    4.4,
                                                            // 4.2,
                                                            width: GetPlatform
                                                                    .isAndroid
                                                                ? ((widget.actualHeight) *
                                                                        0.7) /
                                                                    // 2.89
                                                                    // modified by dharani
                                                                    3
                                                                : ((widget.actualHeight -
                                                                            MediaQuery.of(context).padding.bottom) /
                                                                        17.9) *
                                                                    // modified by dharani
                                                                    4.2,
                                                            // modified by dharani
                                                            // decoration: BoxDecoration(
                                                            //     border: Border.all(
                                                            // color:
                                                            //     const Color.fromARGB(
                                                            //         255,
                                                            //         168,
                                                            //         167,
                                                            //         167),
                                                            //     width: 3
                                                            //     ),
                                                            // borderRadius: BorderRadius.circular(35),
                                                            // color: Colors.white),
                                                            //elevation: 20,
                                                            child: SizedBox(
                                                              height: GetPlatform
                                                                      .isAndroid
                                                                  ?  ((widget.actualHeight - MediaQuery.of(context).padding.bottom) / 17.9) *
                                                                    10
                                                                  // ((widget.actualHeight) *
                                                                  //         0.7) /
                                                                  //     3
                                                                  : ((widget.actualHeight -
                                                                              MediaQuery.of(context).padding.bottom) /
                                                                          17.9) *
                                                                      4.2,
                                                              width: GetPlatform
                                                                      .isAndroid
                                                                  ? ((widget.actualHeight) *
                                                                          0.7) /
                                                                      4
                                                                  : ((widget.actualHeight -
                                                                              MediaQuery.of(context).padding.bottom) /
                                                                          17.9) *
                                                                      4,
                                                              // color: Colors.amber,
                                                              // margin:
                                                              //     const EdgeInsets
                                                              //             .only(
                                                              //         left: 10,
                                                              //         right: 10,
                                                              //         top: 12,
                                                              //         bottom:
                                                              //             12),
                                                              // modified by dharani
                                                              // decoration:
                                                              //     BoxDecoration(
                                                              //         border: Border.all(
                                                              //             color: const Color.fromARGB(
                                                              //                 255,
                                                              //                 232,
                                                              //                 231,
                                                              //                 231),
                                                              //             width:
                                                              //                 1),
                                                              //         borderRadius:
                                                              //             BorderRadius.circular(
                                                              //                 15),
                                                              //         boxShadow: const [
                                                              //           BoxShadow(
                                                              //             color:
                                                              //                 Colors.grey,
                                                              //             offset: Offset(
                                                              //                 0.0,
                                                              //                 0.0), //(x,y)
                                                              //             blurRadius:
                                                              //                 1.0,
                                                              //           ),
                                                              //         ],
                                                              //         color: Colors
                                                              //             .white),

                                                              //padding: EdgeInsets.only(left: 10 ,right:10),
                                                              child: optionsController
                                                                          .outlet ==
                                                                      '321'
                                                                  ? (controller.resitem[shopController.supercatagoryIndex.value].category![shopController.catagoryIndex.value].subcategory![shopController.subcatagoryPageIndex.value].resSubcategory![shopController.itemIndex.value].imageUrl! !=
                                                                          ''
                                                                      ? Image.network(controller
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
                                                                      controller.resitem[0].category![controller.catagoryIndex.value].subcategory![shopController.subcatagoryPageIndex.value].resSubcategory![shopController.itemIndex.value].imageUrl! !=
                                                                              ''
                                                                          ? Image.network(//addedbysofiya
                                                                              controller.resitem[0].category![shopController.catagoryIndex.value].subcategory![shopController.subcatagoryPageIndex.value].resSubcategory![shopController.itemIndex.value].imageUrl!)
                                                                          : Container(
                                                                              height: GetPlatform.isAndroid ? ((widget.actualHeight - 40) / 2) * 1.8 : ((widget.actualHeight - MediaQuery.of(context).padding.bottom) / 17.9) * 2.8,
                                                                            )),
                                                              // child: Container(
                                                              //     height: 50,
                                                              //     width: 80,
                                                              //     child: Text("20% OFF"),
                                                              //     decoration: BoxDecoration(
                                                              //       borderRadius: BorderRadius.only(
                                                              //         topLeft: Radius.circular(20),
                                                              //         bottomRight: Radius.circular(20)
                                                              //       )
                                                              //     ),
                                                              //    ),
                                                            )),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    Column(
                                                      children: [
                                                        Container(
                                                          child: SizedBox(
                                                            height: GetPlatform.isAndroid
                              ? ((widget.actualHeight -
                                          MediaQuery.of(context)
                                              .padding
                                              .bottom) /
                                      17.9) *
                                  1.6
                              : ((widget.actualHeight -
                                          MediaQuery.of(context)
                                              .padding
                                              .bottom) /
                                      17.9) *
                                  2,
                                                            // MediaQuery.of(
                                                            //             context)
                                                            //         .size
                                                            //         .height *
                                                            //     0.09,
                                                            //added by saha
                                                            width: GetPlatform
                                                                    .isAndroid
                                                                ? ((widget.actualHeight) *
                                                                        0.7) /
                                                                    3
                                                                : ((widget.actualHeight -
                                                                            MediaQuery.of(context).padding.bottom) /
                                                                        17.9) *
                                                                    4.2,
                                                            //width: 210,
                                                            // height: GetPlatform.isAndroid
                                                            //         ? ((widget.actualHeight - 40) / 17.9) * 1.8
                                                            //         : ((widget.actualHeight -
                                                            //                 MediaQuery.of(context).padding.bottom) /
                                                            //             60.9),
                                                            child: Container(
                                                                //added by saha
                                                                margin: GetPlatform
                                                                        .isAndroid
                                                                    ? const EdgeInsets
                                                                        .only(
                                                                            // modified by dharani
                                                                            top:
                                                                                10)
                                                                    : const EdgeInsets
                                                                        .only(
                                                                            top:
                                                                                0),
                                                                child: Center(
                                                                  child: Text(
                                                                     optionsController
                                                                                .outlet ==
                                                                            '321'
                                                                     ? controller
                                          .resitem[shopController
                                              .supercatagoryIndex.value]
                                          .category![
                                              shopController.catagoryIndex.value]
                                          .subcategory![shopController.subcatagoryIndex.value]
                                          .resSubcategory![shopController.itemIndex.value]
                                          .productName!
                                      : controller
                                          .resitem[0]
                                          .category![
                                              shopController.catagoryIndex.value]
                                          .subcategory![shopController.subcatagoryIndex.value]
                                          .resSubcategory![shopController.itemIndex.value]
                                          .productName!,
                                                                   /* optionsController
                                                                                .outlet ==
                                                                            '321'
                                                                        ? controller
                                                                            .resitem[shopController
                                                                                .supercatagoryIndex
                                                                                .value]
                                                                            .category![controller
                                                                                .catagoryIndex
                                                                                .value]
                                                                            .subcategory![shopController
                                                                                .subcatagoryIndex
                                                                                .value]
                                                                            .resSubcategory![shopController
                                                                                .itemIndex
                                                                                .value]
                                                                            .productName!
                                                                        : controller
                                                                            .resitem[
                                                                                0]
                                                                            .category![controller
                                                                                .catagoryIndex
                                                                                .value]
                                                                            .subcategory![shopController
                                                                                .subcatagoryIndex
                                                                                .value]
                                                                            .resSubcategory![shopController
                                                                                .itemIndex
                                                                                .value]
                                                                            .productName!,*/
                                                                    style:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          23,
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    maxLines: 3,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                  ),
                                                                )),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                         height: GetPlatform.isAndroid
                              ? MediaQuery.of(context).size.height * 0.02
                              : MediaQuery.of(context).size.height * 0.02,
                                                        ),
                                                        Row(
                                                          children: [
                                                            SizedBox(
                                                              // color: Colors.red,
                                                              height: GetPlatform
                                                                      .isAndroid
                                                                  ? ((widget.actualHeight -
                                              MediaQuery.of(context)
                                                  .padding
                                                  .bottom) /
                                          17.9) *
                                      1.53
                                                                  // ((widget.actualHeight -
                                                                  //             40) /
                                                                  //         17.9) *
                                                                  //     // modified by dharani
                                                                  //     .5
                                                                  // 1.1
                                                                  : ((widget.actualHeight -
                                                                          MediaQuery.of(context)
                                                                              .padding
                                                                              .bottom) /
                                                                      35.9),
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    optionsController.outlet ==
                                                                            '321'
                                                                        ? controller
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
                                                                        : controller
                                                                            .resitem[0]
                                                                            .category![shopController.catagoryIndex.value]
                                                                            .subcategory![shopController.subcatagoryPageIndex.value]
                                                                            .resSubcategory![shopController.itemIndex.value]
                                                                            .totalReview!
                                                                            .toString(),
                                                                    style: const TextStyle(
                                                                        fontSize:
                                                                            25,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    //maxLines: 3,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                  ),
                                                                  const SizedBox(
                                                                      width: 1),
                                                                  Container(
                                                                    child:
                                                                        const Icon(
                                                                      Icons
                                                                          .star,
                                                                      size: 30,
                                                                      color: Colors
                                                                          .amber,
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.10,
                                                            ),
                                                            SizedBox(
                                                                height: GetPlatform
                                                                        .isAndroid
                                                                    ? ((widget.actualHeight -
                                              MediaQuery.of(context)
                                                  .padding
                                                  .bottom) /
                                          17.9) *
                                      1.53
                                                                    //  ((widget.actualHeight -
                                                                    //         40) /
                                                                    //     17.9) // modified by bhava

                                                                    : ((widget.actualHeight -
                                                                            MediaQuery.of(context).padding.bottom) /
                                                                        35.9),

                                                                //totalReview
                                                                child: Row(
                                                                  children: [
                                                                    Text(
                                                                      optionsController.outlet ==
                                                                              '321'
                                                                          ? controller
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
                                                                          : controller
                                                                              .resitem[0]
                                                                              .category![shopController.catagoryIndex.value]
                                                                              .subcategory![shopController.subcatagoryPageIndex.value]
                                                                              .resSubcategory![shopController.itemIndex.value]
                                                                              .averageRatings!
                                                                              .toString(),
                                                                      style: const TextStyle(
                                                                          fontSize:
                                                                              20),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      //maxLines: 3,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                    ),
                                                                    const SizedBox(
                                                                        width:
                                                                            4),
                                                                    const Text(
                                                                      "Ratings",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              20,
                                                                          color: Color.fromARGB(
                                                                              255,
                                                                              124,
                                                                              125,
                                                                              126)),
                                                                    )
                                                                  ],
                                                                )),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                             height: GetPlatform.isAndroid
                                                            ? 0
                                                            : MediaQuery.of(context).size.height * 0.012,
                                                      ),
                                                        
                                                        Row(
                                                          children: [
                                                            Container(
                                                              // modified by dharani
                                                              // color:
                                                              //     Colors.amber,
                                                              child: SizedBox(
                                                                height: GetPlatform
                                                                        .isAndroid
                                                                    ? ((widget.actualHeight - 40) / 17.9) * 0.5
                                                                    // ((widget.actualHeight -
                                                                    //             40) /
                                                                    //         17.9) *
                                                                    //     // modified by dharani
                                                                    //     1.8
                                                                    : ((widget.actualHeight -
                                                                            MediaQuery.of(context).padding.bottom) /
                                                                        35.9),
                                                                child: Text(
                                                                  optionsController
                                                                              .outlet ==
                                                                          '321'
                                                                      ? controller
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
                                                                      : controller
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
                                                                      fontSize:
                                                                          20),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  //maxLines: 3,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                                //added by saha
                                                                width: GetPlatform
                                                                        .isAndroid
                                                                    ? MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.35
                                                                    : MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.30),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                // modified by dharani
                                                // const SizedBox(
                                                //   height: 1,
                                                // ),
                                                SizedBox(
                                                 // margin: EdgeInsets.only(bottom: 6),
                                                height: GetPlatform.isAndroid
                                              ? ((widget.actualHeight - 40) / 17.9) * 0.88
                                              : ((widget.actualHeight -
                                                      MediaQuery.of(context).padding.bottom) /
                                                  20),
                                          width: GetPlatform.isAndroid
                                              ? ((widget.actualHeight) * 0.7) / 1.5
                                              : ((widget.actualHeight -
                                                      MediaQuery.of(context).padding.bottom) /
                                                  2.15),
                                                  child: Row(children: [
                                                    InkWell(
                                                      onTap: (() async {
                                                        await Prefs
                                                            .superUserLoggedIn
                                                            .then((value) {
                                                          if (value) {
                                                            if (viewController
                                                                        .userSuboption
                                                                        .value ==
                                                                    NEWORDERCHANGE ||
                                                                optionsController
                                                                        .optionsKey
                                                                        .value ==
                                                                    BROWSE) {
                                                              print("add");
                                                              print("add");
                                                              addCartReviewController.addToCartReviewfinal(
                                                                  controller
                                                                          .resitem[shopController
                                                                              .supercatagoryIndex
                                                                              .value]
                                                                          .category![shopController
                                                                              .catagoryIndex
                                                                              .value]
                                                                          .subcategory![shopController
                                                                              .subcatagoryIndex
                                                                              .value]
                                                                          .resSubcategory![
                                                                      shopController
                                                                          .itemIndex
                                                                          .value],
                                                                  ListofController[shopController.catagoryIndex.value]
                                                                          [controller.subcatagoryIndex.value]
                                                                      [controller.itemIndex.value]);
                                                            } else {
                                                              addCartReviewController.addToCartReviewfinal(
                                                                  controller
                                                                          .resitem[0]
                                                                          .category![shopController
                                                                              .catagoryIndex
                                                                              .value]
                                                                          .subcategory![shopController
                                                                              .subcatagoryIndex
                                                                              .value]
                                                                          .resSubcategory![
                                                                      shopController
                                                                          .itemIndex
                                                                          .value],
                                                                  ListofController[shopController
                                                                          .catagoryIndex
                                                                          .value][controller.subcatagoryIndex.value]
                                                                      [controller.itemIndex.value]);
                                                            }
                                                          } else {
                                                            viewController
                                                                .setView(ERROR);
                                                            viewController
                                                                .setErrorMessage(
                                                                   languageController.languageResponse.value.youHaveClickedOnADDICONTapOnRegisterNewICON ?? '');
                                                          }
                                                        });
                                                        // await Prefs
                                                        //     .superUserLoggedIn
                                                        //     .then((value) {
                                                        //   if (value) {
                                                        //     if (viewController
                                                        //             .userSuboption
                                                        //             .value ==
                                                        //         NEWORDERCHANGE) {
                                                        //       print("add");
                                                        //       addCartReviewController.addToCartReview(controller
                                                        //               .catagory[controller
                                                        //                   .catagoryIndex
                                                        //                   .value]
                                                        //               .subcategory![
                                                        //                   controller
                                                        //                       .subcatagoryPageIndex
                                                        //                       .value]
                                                        //               .items![
                                                        //           shopController
                                                        //               .itemIndex
                                                        //               .value]);
                                                        //     } else {
                                                        //       addCartReviewController.addToShoppingList(controller
                                                        //               .catagory[controller
                                                        //                   .catagoryIndex
                                                        //                   .value]
                                                        //               .subcategory![
                                                        //                   controller
                                                        //                       .subcatagoryPageIndex
                                                        //                       .value]
                                                        //               .items![
                                                        //           shopController
                                                        //               .itemIndex
                                                        //               .value]);
                                                        //     }
                                                        //   } else {
                                                        //     viewController
                                                        //         .setView(ERROR);
                                                        //     viewController
                                                        //         .setErrorMessage(
                                                        //             'please login first to add this product to cart');
                                                        //   }
                                                        // });
                                                      }),
                                                      child: Container(
                                                        
                                                  height: GetPlatform.isAndroid
                                                      ? ((widget.actualHeight) * 0.7) / 2
                                                      : ((widget.actualHeight -
                                                                  MediaQuery.of(context)
                                                                      .padding
                                                                      .bottom) /
                                                              17.9) *
                                                          2,
                                                  width: GetPlatform.isAndroid
                                                      ? ((widget.actualHeight) * 0.7) / 15
                                                      : ((widget.actualHeight -
                                                                  MediaQuery.of(context)
                                                                      .padding
                                                                      .bottom) /
                                                              17.9) *
                                                          0.9,
                                                          // // modified by dharani
                                                          margin: GetPlatform
                                                                  .isAndroid
                                                              ? const EdgeInsets
                                                                      .only(
                                                                  left: 5,
                                                                 
                                                                   bottom: 6
                                                                  )
                                                              : const EdgeInsets
                                                                  .only(
                                                                  left: .1,
                                                                  bottom: 5,
                                                                  // bottom: 6
                                                                ),
                                                         
                                                          decoration:
                                                              BoxDecoration(
                                                                  // modified by dharani
                                                                  // color:
                                                                  //     Colors.grey[50],
                                                                  border: Border.all(
                                                                      color: Colors
                                                                          .green),
                                                                  boxShadow: const []),
                                                          child: const Center(
                                                            child: Icon(
                                                              Icons.add,
                                                              color: Colors.green,
                                                              size: 45,
                                                            ),
                                                          )),
                                                    ),
                                                    // modified by dharani
                                                     SizedBox(
                                                      width: MediaQuery.of(context).size.width * 0.009,
                                                    ),
                                                    InkWell(
                                                      onTap: (() {
                                                        //added by saha
                                                        keyboardController
                                                            .setEdit(true);
                                                
                                                        keyboardController
                                                            .setKeypad(
                                                                SYMBOLSKEYBOARD);
                                                        keyboardController
                                                            .controllerSetup(
                                                                qtycontroller);
                                                        keyboardController
                                                            .focusSetup(focus,
                                                                qtycontroller);
                                                        keyboardController
                                                            .setMaximiumLength(
                                                                '50');
                                                        keyboardController
                                                            .symbolTrue(true);
                                                        print("------>");
                                                        //viewController.setView('');
                                                      }),
                                                      // modified by dharani
                                                      child: Container(
                                                          // modified by dharani
                                                          margin: const EdgeInsets
                                                              .only(
                                                            //bottom: 8.3,
                                                            bottom: 6
                                                          ),
                                                         height: GetPlatform.isAndroid
                                                              ? ((widget.actualHeight) * 0.7) / 2.3
                                                              : ((widget.actualHeight -
                                                                          MediaQuery.of(context).padding.bottom) /
                                                                      17.9) *
                                                                  0.8,
                                                          width: GetPlatform.isAndroid
                                                              ? ((widget.actualHeight) * 0.7) / 13
                                                              : ((widget.actualHeight -
                                                                          MediaQuery.of(context).padding.bottom) /
                                                                      17.9) *
                                                                  0.9,
                                                          decoration:
                                                              BoxDecoration(
                                                            // modified by dharani
                                                            // color:
                                                            //     Colors.grey[50],
                                                            border: Border.all(
                                                                color:
                                                                    Colors.black),
                                                          ),
                                                          child: Center(
                                                              child: TextField(
                                                            readOnly: true,
                                                            textAlign:
                                                                TextAlign.center,
                                                            maxLength: 3,
                                                            controller:
                                                                qtycontroller,
                                                            style: const TextStyle(
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                            ),
                                                            decoration:
                                                                InputDecoration(
                                                              border: InputBorder
                                                                  .none,
                                                              filled: isFocused,
                                                              hintText: 'QTY',
                                                              counterText: "",
                                                              contentPadding:
                                                                  const EdgeInsets
                                                                      .fromLTRB(
                                                                          1,
                                                                          0,
                                                                          0,
                                                                          1),
                                                            ),
                                                            //   filled: _isFocused,
                                                            //   hintText: 'QTY',
                                                            //   counterText: "",
                                                            //   contentPadding:
                                                            //       const EdgeInsets
                                                            //               .fromLTRB(
                                                            //           1, 0, 0, 1),
                                                            // ),
                                                          ))),
                                                    ),
                                                    // modified by dharani
                                                    const SizedBox(
                                                      width: 0.5,
                                                    ),
                                                    InkWell(
                                                      onTap: (() {}),
                                                      child: Container(
                                                          // modified by dharani
                                                          margin: const EdgeInsets.only(
                                                              bottom: 6),
                                                         height: GetPlatform.isAndroid
                              ? ((widget.actualHeight) * 0.7) / 2
                              : ((widget.actualHeight -
                                          MediaQuery.of(context)
                                              .padding
                                              .bottom) /
                                      17.9) *
                                  0.8,
                          width: GetPlatform.isAndroid
                              ? ((widget.actualHeight) * 0.7) / 13.2
                              : ((widget.actualHeight -
                                          MediaQuery.of(context)
                                              .padding
                                              .bottom) /
                                      17.9) *
                                  0.89,
                                                          // modified by dharani
                                                          decoration:
                                                              BoxDecoration(
                                                                  // color:
                                                                  //     Colors.grey[50],
                                                                  border: Border.all(
                                                                      color: Colors
                                                                          .amber),
                                                                  boxShadow: const []),
                                                          child: const Center(
                                                            child: Icon(
                                                              Icons
                                                                  .local_offer_sharp,
                                                              color: Colors.amber,
                                                              size: 40,
                                                            ),
                                                          )),
                                                    ),
                                                    // modified by dharani
                                                    const SizedBox(
                                                      width: 1.5,
                                                    ),
                                                    InkWell(
                                                      onTap: (() async {
                                                        await Prefs
                                                            .superUserLoggedIn
                                                            .then((value) {
                                                          if (value) {
                                                            //added by Gowshika
                                                            var isAdded = optionsController.outlet ==
                                                                    '321'
                                                                ? controller
                                                                    .resitem[shopController
                                                                        .supercatagoryIndex
                                                                        .value]
                                                                    .category![shopController
                                                                        .catagoryIndex
                                                                        .value]
                                                                    .subcategory![
                                                                        shopController
                                                                            .subcatagoryIndex
                                                                            .value]
                                                                    .resSubcategory![
                                                                        shopController
                                                                            .itemIndex
                                                                            .value]
                                                                    .isWishlist
                                                                : controller
                                                                    .resitem[0]
                                                                    .category![shopController
                                                                        .catagoryIndex
                                                                        .value]
                                                                    .subcategory![
                                                                        shopController
                                                                            .subcatagoryIndex
                                                                            .value]
                                                                    .resSubcategory![shopController.itemIndex.value]
                                                                    .isWishlist;
                                                
                                                            orderController
                                                                .whishListUpdate(
                                                                    optionsController
                                                                                .outlet ==
                                                                            '321'
                                                                        ? controller
                                                                            .resitem[shopController
                                                                                .supercatagoryIndex
                                                                                .value]
                                                                            .category![shopController
                                                                                .catagoryIndex
                                                                                .value]
                                                                            .subcategory![shopController
                                                                                .subcatagoryIndex
                                                                                .value]
                                                                            .resSubcategory![shopController
                                                                                .itemIndex
                                                                                .value]
                                                                            .productCode!
                                                                        //added by sahana
                                                                        : controller
                                                                            .resitem[
                                                                                0]
                                                                            .category![shopController
                                                                                .catagoryIndex
                                                                                .value]
                                                                            .subcategory![shopController
                                                                                .subcatagoryIndex
                                                                                .value]
                                                                            .resSubcategory![shopController
                                                                                .itemIndex
                                                                                .value]
                                                                            .productCode!,
                                                                    // controller
                                                                    //     .catagory[
                                                                    //         controller.catagoryIndex.value]
                                                                    //     .subcategory![subcatagoryIndex]
                                                                    //     .items![itemindex]
                                                                    //     .productCode!,
                                                                    isAdded == 1
                                                                        ? '0'
                                                                        : '1',
                                                                    languageController
                                                                        .languagenum
                                                                        .toString());
                                                            setState(() {
                                                              optionsController.outlet ==
                                                                      '321'
                                                                  ? controller
                                                                      .resitem[shopController
                                                                          .supercatagoryIndex
                                                                          .value]
                                                                      .category![shopController
                                                                          .catagoryIndex
                                                                          .value]
                                                                      .subcategory![shopController
                                                                          .subcatagoryIndex
                                                                          .value]
                                                                      .resSubcategory![shopController
                                                                          .itemIndex
                                                                          .value]
                                                                      .isWishlist = isAdded ==
                                                                          1
                                                                      ? 0
                                                                      : 1
                                                                  : controller
                                                                      .resitem[0]
                                                                      .category![controller.catagoryIndex.value]
                                                                      .subcategory![controller.subcatagoryIndex.value]
                                                                      .resSubcategory![shopController.itemIndex.value]
                                                                      .isWishlist = isAdded == 1 ? 0 : 1;
                                                            });
                                                            print('favorite');
                                                          } else {
                                                            viewController
                                                                .setView(ERROR);
                                                            viewController
                                                                .setErrorMessage(
                                                                    'please login first to add this product to your WishList');
                                                          }
                                                        });
                                                        // await Prefs
                                                        //     .superUserLoggedIn
                                                        //     .then((value) {
                                                        //   if (value) {
                                                        //     orderController.whishListUpdate(
                                                        //         viewController
                                                        //                     .userSuboption
                                                        //                     .value ==
                                                        //                 NEWORDERCHANGE
                                                        //             ? controller
                                                        //                 .catagory[controller
                                                        //                     .catagoryIndex
                                                        //                     .value]
                                                        //                 .subcategory![shopController
                                                        //                     .subcatagoryPageIndex
                                                        //                     .value]
                                                        //                 .items![shopController
                                                        //                     .itemIndex
                                                        //                     .value]
                                                        //                 .productCode!
                                                        //             : controller
                                                        //                 .allcatagory[controller
                                                        //                     .catagoryIndex
                                                        //                     .value]
                                                        //                 .subcategory![shopController
                                                        //                     .subcatagoryPageIndex
                                                        //                     .value]
                                                        //                 .items![shopController
                                                        //                     .itemIndex
                                                        //                     .value]
                                                        //                 .productCode!,
                                                        //         (viewController.userSuboption.value == NEWORDERCHANGE ? controller.catagory[controller.catagoryIndex.value].subcategory![shopController.subcatagoryPageIndex.value].items![shopController.itemIndex.value].isWishlist : controller.allcatagory[controller.catagoryIndex.value].subcategory![shopController.subcatagoryPageIndex.value].items![shopController.itemIndex.value].isWishlist) ==
                                                        //                 1
                                                        //             ? '0'
                                                        //             : '1',
                                                        //         languageController
                                                        //             .languagenum
                                                        //             .toString());
                                                
                                                        //     print('favorite');
                                                        //     shopController
                                                        //         .fetchCatalogueProduct(
                                                        //             languageController
                                                        //                 .languagenum
                                                        //                 .toString());
                                                        //   } else {
                                                        //     viewController
                                                        //         .setView(ERROR);
                                                        //     viewController
                                                        //         .setErrorMessage(
                                                        //             'please login first to add this product to your WishList');
                                                        //   }
                                                        // });
                                                      }),
                                                      child: Container(
                                                          // modified by dharani
                                                          margin: const EdgeInsets.only(
                                                              bottom: 6),
                                                         height: GetPlatform.isAndroid
                              ? ((widget.actualHeight) * 0.7) / 2
                              : ((widget.actualHeight -
                                          MediaQuery.of(context)
                                              .padding
                                              .bottom) /
                                      17.9) *
                                  0.8,
                          width: GetPlatform.isAndroid
                              ? ((widget.actualHeight) * 0.7) / 13.5
                              : ((widget.actualHeight -
                                          MediaQuery.of(context)
                                              .padding
                                              .bottom) /
                                      17.9) *
                                  0.89,
                                                          decoration:
                                                              BoxDecoration(
                                                                  // modified by dharani
                                                                  // color:
                                                                  //     Colors.grey[50],
                                                                  border: Border.all(
                                                                      color: const Color
                                                                              .fromARGB(
                                                                          255,
                                                                          232,
                                                                          38,
                                                                          28)),
                                                                  boxShadow: const []),
                                                          child: Center(
                                                              child: Icon(
                                                            (optionsController.outlet ==
                                                                            '321'
                                                                        ? controller
                                                                            .resitem[shopController
                                                                                .supercatagoryIndex
                                                                                .value]
                                                                            .category![shopController
                                                                                .catagoryIndex
                                                                                .value]
                                                                            .subcategory![shopController
                                                                                .subcatagoryIndex
                                                                                .value]
                                                                            .resSubcategory![shopController
                                                                                .itemIndex
                                                                                .value]
                                                                            .isWishlist
                                                                        : controller
                                                                            .resitem[
                                                                                0]
                                                                            .category![shopController
                                                                                .catagoryIndex
                                                                                .value]
                                                                            .subcategory![shopController
                                                                                .subcatagoryIndex
                                                                                .value]
                                                                            .resSubcategory![shopController
                                                                                .itemIndex
                                                                                .value]
                                                                            .isWishlist) ==
                                                                    1
                                                                ? Icons.favorite
                                                                : Icons
                                                                    .favorite_border_outlined,
                                                            // (viewController.userSuboption
                                                            //                     .value ==
                                                            //                 NEWORDERCHANGE
                                                            //             ? controller
                                                            //                 .catagory[controller
                                                            //                     .catagoryIndex
                                                            //                     .value]
                                                            //                 .subcategory![shopController
                                                            //                     .subcatagoryPageIndex
                                                            //                     .value]
                                                            //                 .items![shopController
                                                            //                     .itemIndex
                                                            //                     .value]
                                                            //                 .isWishlist
                                                            //             : controller
                                                            //                 .allcatagory[controller
                                                            //                     .catagoryIndex
                                                            //                     .value]
                                                            //                 .subcategory![shopController
                                                            //                     .subcatagoryPageIndex
                                                            //                     .value]
                                                            //                 .items![shopController
                                                            //                     .itemIndex
                                                            //                     .value]
                                                            //                 .isWishlist) ==
                                                            //         1
                                                            //     ? Icons.favorite
                                                            //     : Icons
                                                            //         .favorite_border_outlined,
                                                            color: Colors.red,
                                                            size: 40,
                                                          ))),
                                                    ),
                                                    const SizedBox(
                                                      width: 30,
                                                    ),
                                                    Row(children: [
                                                      SizedBox(
                                                        height: GetPlatform
                                                                .isAndroid
                                                            ?  ((widget.actualHeight -
                                                                MediaQuery.of(context).padding.bottom)) /
                                                            35
                                                            // ((widget.actualHeight -
                                                            //             40) /
                                                            //         17.9) *
                                                            //     1.8
                                                            : ((widget.actualHeight -
                                                                    MediaQuery.of(
                                                                            context)
                                                                        .padding
                                                                        .bottom) /
                                                                35.9),
                                                        child: Row(
                                                          children: [
                                                            const Text("₹",
                                                                style: TextStyle(
                                                                    fontSize: 20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                            Text(
                                                                optionsController.outlet == '321'
                                                                    ? controller
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
                                                                    : controller
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
                                                                textAlign: TextAlign.start,
                                                                overflow: TextOverflow.ellipsis),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                          //added by saha
                                                          width: GetPlatform
                                                                  .isAndroid
                                                              ? MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.16
                                                              : MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.10),
                                                      SizedBox(
                                                          height: GetPlatform
                                                                  .isAndroid
                                                              ? ((widget.actualHeight -
                                                                          40) /
                                                                      17.9) *
                                                                  1.8
                                                              : ((widget.actualHeight -
                                                                      MediaQuery.of(
                                                                              context)
                                                                          .padding
                                                                          .bottom) /
                                                                  35.9),
                                                          child: Row(
                                                            children: [
                                                              const Text("₹",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          20,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: Color
                                                                          .fromARGB(
                                                                              255,
                                                                              151,
                                                                              152,
                                                                              153))),
                                                              Text(
                                                                optionsController
                                                                            .outlet ==
                                                                        '321'
                                                                    ? controller
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
                                                                    : controller
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
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            151,
                                                                            152,
                                                                            153)),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                //maxLines: 3,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ),
                                                            ],
                                                          )),
                                                    ])
                                                  ]),
                                                )
                                              ]);
                                            }))

                                    //  Image.network(shopController
                                    //       .catagory[shopController
                                    //           .catagoryIndex.value]
                                    //       .subcategory![shopController
                                    //           .subcatagoryPageIndex.value]
                                    //       .items![
                                    //           shopController.itemIndex.value]
                                    //       .imageUrl!),

                                    ),
                                //added by saha
                                SizedBox(
                                    height: GetPlatform.isAndroid
                                        ? ((widget.actualHeight -
                                                MediaQuery.of(context)
                                                    .padding
                                                    .bottom)) /
                                            //0.2
                                            17.9 *
                                            0.80
                                        : ((widget.actualHeight -
                                                    MediaQuery.of(context)
                                                        .padding
                                                        .bottom) /
                                                17.9) *
                                            1,
                                    width: GetPlatform.isAndroid
                                        ? ((widget.actualHeight - 40))
                                        : ((widget.actualHeight -
                                                    MediaQuery.of(context)
                                                        .padding
                                                        .bottom) /
                                                17.9) *
                                            9.5,
                                    child: TabBarView(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        controller: _tabController,
                                        children: [
                                          Container(
                                            height: GetPlatform.isAndroid
                                                ? ((widget.actualHeight -
                                                        MediaQuery.of(context)
                                                            .padding
                                                            .bottom)) /
                                                    //0.2
                                                    17.9 *
                                                    0.80
                                                : ((widget.actualHeight -
                                                            MediaQuery.of(
                                                                    context)
                                                                .padding
                                                                .bottom) /
                                                        17.9) *
                                                    5,
                                            width: GetPlatform.isAndroid
                                                ? ((widget.actualHeight - 40))
                                                : ((widget.actualHeight -
                                                            MediaQuery.of(
                                                                    context)
                                                                .padding
                                                                .bottom) /
                                                        17.9) *
                                                    9.5,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black),
                                                color: AppColors
                                                    .subHeaderContainer),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                //added by saha
                                                Text(
                                                  languageController
                                                          .languageResponse
                                                          .value
                                                          .manufacturer ??
                                                      '',
                                                  style:
                                                      const TextStyle(fontSize: 23),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: GetPlatform.isAndroid
                                                ? ((widget.actualHeight -
                                                        MediaQuery.of(context)
                                                            .padding
                                                            .bottom)) /
                                                    17.9 *
                                                    0.80
                                                : ((widget.actualHeight -
                                                            MediaQuery.of(
                                                                    context)
                                                                .padding
                                                                .bottom) /
                                                        17.9) *
                                                    5,
                                            width: GetPlatform.isAndroid
                                                ? ((widget.actualHeight - 40))
                                                : ((widget.actualHeight -
                                                            MediaQuery.of(
                                                                    context)
                                                                .padding
                                                                .bottom) /
                                                        17.9) *
                                                    9.5,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black),
                                                color: AppColors
                                                    .subHeaderContainer),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                //added by saha
                                                Text(
                                                  languageController
                                                          .languageResponse
                                                          .value
                                                          .ingredients ??
                                                      '',
                                                  style:
                                                      const TextStyle(fontSize: 23),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: GetPlatform.isAndroid
                                                ? ((widget.actualHeight -
                                                        MediaQuery.of(context)
                                                            .padding
                                                            .bottom)) /
                                                    17.9 *
                                                    0.80
                                                : ((widget.actualHeight -
                                                            MediaQuery.of(
                                                                    context)
                                                                .padding
                                                                .bottom) /
                                                        17.9) *
                                                    5,
                                            width: GetPlatform.isAndroid
                                                ? ((widget.actualHeight - 40))
                                                : ((widget.actualHeight -
                                                            MediaQuery.of(
                                                                    context)
                                                                .padding
                                                                .bottom) /
                                                        17.9) *
                                                    9.5,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black),
                                                color: AppColors
                                                    .subHeaderContainer),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                //added by saha
                                                Text(
                                                  languageController
                                                          .languageResponse
                                                          .value
                                                          .nutrition ??
                                                      '',
                                                  style:
                                                      const TextStyle(fontSize: 23),
                                                ),
                                              ],
                                            ),
                                          )
                                        ])),
                                Expanded(
                                  child: TabBarView(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    controller: _tabController,
                                    children: [
                                      Container(
                                          color: Colors.grey,
                                          padding: const EdgeInsets.all(7.0),
                                          child: Container(
                                            height: GetPlatform.isAndroid
                                                ? ((widget.actualHeight - 40) /
                                                        4) *
                                                    2.9
                                                // 1.8
                                                : ((widget.actualHeight -
                                                            MediaQuery.of(
                                                                    context)
                                                                .padding
                                                                .bottom) /
                                                        17.9) *
                                                    5.3,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(35),
                                                color: Colors.grey[300]),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    sizedBoxText(
                                                        languageController
                                                                .languageResponse
                                                                .value
                                                                .brand ??
                                                            ''),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Container(
                                                      padding: const EdgeInsets.only(
                                                          top: 20, left: 20),
                                                      child: Text(
                                                          optionsController.outlet == '321'
                                                              ? shopController
                                                                  .resitem[shopController
                                                                      .supercatagoryIndex
                                                                      .value]
                                                                  .category![shopController
                                                                      .catagoryIndex
                                                                      .value]
                                                                  .subcategory![
                                                                      shopController
                                                                          .subcatagoryPageIndex
                                                                          .value]
                                                                  .resSubcategory![
                                                                      shopController
                                                                          .itemIndex
                                                                          .value]
                                                                  .brandName!
                                                                  .toString()
                                                              : shopController
                                                                  .resitem[0]
                                                                  .category![shopController
                                                                      .catagoryIndex
                                                                      .value]
                                                                  .subcategory![shopController.subcatagoryPageIndex.value]
                                                                  .resSubcategory![shopController.itemIndex.value]
                                                                  .brandName!
                                                                  .toString(),
                                                          style: const TextStyle(
                                                            fontSize: 20,
                                                          )),
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      sizedBoxText(
                                                          languageController
                                                                  .languageResponse
                                                                  .value
                                                                  .sku ??
                                                              ''),
                                                      const SizedBox(
                                                        width: 7,
                                                      ),
                                                      Container(
                                                        padding:
                                                            const EdgeInsets.only(
                                                                top: 20,
                                                                left: 20),
                                                        child: Text(
                                                            optionsController.outlet ==
                                                                    '321'
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
                                                                    .toString()
                                                                : shopController
                                                                    .resitem[0]
                                                                    .category![shopController
                                                                        .catagoryIndex
                                                                        .value]
                                                                    .subcategory![shopController
                                                                        .subcatagoryPageIndex
                                                                        .value]
                                                                    .resSubcategory![
                                                                        shopController
                                                                            .itemIndex
                                                                            .value]
                                                                    .uom!
                                                                    .toString(),
                                                            style: const TextStyle(
                                                              fontSize: 20,
                                                            )),
                                                      )
                                                    ]),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      sizedBoxText(
                                                          languageController
                                                                  .languageResponse
                                                                  .value
                                                                  .price ??
                                                              ''),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      Container(
                                                        padding:
                                                            const EdgeInsets.only(
                                                                top: 20,
                                                                left: 20),
                                                        child: Text(
                                                            optionsController.outlet ==
                                                                    '321'
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
                                                                    .resitem[0]
                                                                    .category![shopController
                                                                        .catagoryIndex
                                                                        .value]
                                                                    .subcategory![shopController
                                                                        .subcatagoryPageIndex
                                                                        .value]
                                                                    .resSubcategory![
                                                                        shopController
                                                                            .itemIndex
                                                                            .value]
                                                                    .productRate!
                                                                    .toString(),
                                                            style: const TextStyle(
                                                              fontSize: 20,
                                                            )),
                                                      )
                                                    ])
                                              ],
                                            ),
                                          )),
                                      Container(
                                        color: Colors.grey,
                                        padding: const EdgeInsets.all(7.0),
                                        child: Container(
                                          height: GetPlatform.isAndroid
                                              ? ((widget.actualHeight - 40) /
                                                      30) *
                                                  1.8
                                              : ((widget.actualHeight -
                                                      MediaQuery.of(context)
                                                          .padding
                                                          .bottom) /
                                                  17.9),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(35),
                                              color: Colors.grey[300]),
                                          child: shopController
                                                      .resitem[shopController
                                                          .supercatagoryIndex
                                                          .value]
                                                      .category![shopController
                                                          .catagoryIndex.value]
                                                      .subcategory![shopController
                                                          .subcatagoryPageIndex
                                                          .value]
                                                      .resSubcategory![
                                                          shopController
                                                              .itemIndex.value]
                                                      .isIngredientsInfo!
                                                      .toUpperCase() ==
                                                  'Y'
                                              ? Center(
                                                  child: Text(shopController
                                                      .resitem[shopController
                                                          .supercatagoryIndex
                                                          .value]
                                                      .category![shopController
                                                          .catagoryIndex.value]
                                                      .subcategory![shopController
                                                          .subcatagoryPageIndex
                                                          .value]
                                                      .resSubcategory![
                                                          shopController
                                                              .itemIndex.value]
                                                      .isIngredientsInfo!),
                                                )
                                              : Center(
                                                  child: Text(languageController
                                                          .languageResponse
                                                          .value
                                                          .noIngredientsFound ??
                                                      ''),
                                                ),
                                        ),
                                      ),
                                      Container(
                                        color: Colors.grey,
                                        padding: const EdgeInsets.all(7.0),
                                        child: Container(
                                          height: GetPlatform.isAndroid
                                              ? ((widget.actualHeight - 40) /
                                                      30) *
                                                  1.8
                                              : ((widget.actualHeight -
                                                      MediaQuery.of(context)
                                                          .padding
                                                          .bottom) /
                                                  17.9),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(35),
                                              color: Colors.grey[300]),
                                          child: shopController
                                                      .resitem[shopController
                                                          .supercatagoryIndex
                                                          .value]
                                                      .category![shopController
                                                          .catagoryIndex.value]
                                                      .subcategory![shopController
                                                          .subcatagoryPageIndex
                                                          .value]
                                                      .resSubcategory![
                                                          shopController
                                                              .itemIndex.value]
                                                      .nutritionsInfo!
                                                      .toUpperCase() ==
                                                  'Y'
                                              ? const Center(
                                                  child: Text(
                                                    "nutritions!.qtyQuantityPerServing.toString()"
                                                    // [
                                                    // 'QtyQuantity per serving'],
                                                    ,
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                )
                                              : Center(
                                                  child: Text(languageController
                                                          .languageResponse
                                                          .value
                                                          .noNutritionFound ??
                                                      ''),
                                                ),
                                        ),
                                      ),
                                      Container(
                                        color: Colors.grey,
                                        padding: const EdgeInsets.all(7.0),
                                        child: Container(
                                          height: GetPlatform.isAndroid
                                              ? ((widget.actualHeight - 40) /
                                                      30) *
                                                  1.8
                                              : ((widget.actualHeight -
                                                      MediaQuery.of(context)
                                                          .padding
                                                          .bottom) /
                                                  17.9),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              color: Colors.grey[300]),
                                          child: shopController
                                                      .resitem[shopController
                                                          .supercatagoryIndex
                                                          .value]
                                                      .category![shopController
                                                          .catagoryIndex.value]
                                                      .subcategory![shopController
                                                          .subcatagoryPageIndex
                                                          .value]
                                                      .resSubcategory![
                                                          shopController
                                                              .itemIndex.value]
                                                      .isOfferItem!
                                                      .toUpperCase() ==
                                                  'Y'
                                              ? Center(
                                                  child: Text(shopController
                                                      .resitem[shopController
                                                          .supercatagoryIndex
                                                          .value]
                                                      .category![shopController
                                                          .catagoryIndex.value]
                                                      .subcategory![shopController
                                                          .subcatagoryPageIndex
                                                          .value]
                                                      .resSubcategory![
                                                          shopController
                                                              .itemIndex.value]
                                                      .offerDescription!),
                                                )
                                              : Center(
                                                  child: Text(languageController
                                                          .languageResponse
                                                          .value
                                                          .noOffersFound ??
                                                      ''),
                                                ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                  GetX<KeyboardController>(
                    init: KeyboardController(),
                    initState: (_) {},
                    builder: (controller) {
                      return Positioned(
                          bottom: 0,
                          top: 80,
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
        ),
      ],
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

  InkWell tab_title(String picker, String textValue) {
    return InkWell(
      onTap: () {
        keyboardController.setframe(picker);
      },
      child: Positioned(
          top: 10,
          child: Text(
            textValue,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blue[700]),
          )),
    );
  }

  _getTab(index, child) {
    return Tab(
      child: SizedBox.expand(
        child: Container(
          child: child,
          decoration: BoxDecoration(
              color:
                  (_selectedTab == index ? Colors.white : Colors.grey.shade300),
              borderRadius: _generateBorderRadius(index)),
        ),
      ),
    );
  }

  _generateBorderRadius(index) {
    if ((index + 1) == _selectedTab) {
      return const BorderRadius.only(bottomRight: Radius.circular(10.0));
    } else if ((index - 1) == _selectedTab) {
      return const BorderRadius.only(bottomLeft: Radius.circular(10.0));
    } else {
      return BorderRadius.zero;
    }
  }

  Row middlewidget(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(children: [
          leftfields(
              context, languageController.languageResponse.value.picture ?? ''),
          SizedBox(
            height: GetPlatform.isAndroid
                ? ((widget.actualHeight - 40) / 17.9) * 1.8
                : ((widget.actualHeight -
                            MediaQuery.of(context).padding.bottom) /
                        17.9) *
                    1,
          ),
          leftfields(
              context, languageController.languageResponse.value.offers ?? ''),
          SizedBox(
            height: GetPlatform.isAndroid
                ? ((widget.actualHeight - 40) / 17.9) * 1.8
                : ((widget.actualHeight -
                            MediaQuery.of(context).padding.bottom) /
                        17.9) *
                    1,
          ),
          leftfields(context,
              languageController.languageResponse.value.ingredients ?? ''),
          SizedBox(
            height: GetPlatform.isAndroid
                ? ((widget.actualHeight - 40) / 17.9) * 1.8
                : ((widget.actualHeight -
                            MediaQuery.of(context).padding.bottom) /
                        17.9) *
                    1,
          ),
          leftfields(context,
              languageController.languageResponse.value.nutrition ?? ''),
        ]),
        Column(children: [
          Container(
            width: GetPlatform.isAndroid
                ? (widget.actualHeight - 40) / 18.1
                : (widget.actualHeight -
                        MediaQuery.of(context).padding.bottom) /
                    17.9 *
                    7.48,
            height: GetPlatform.isAndroid
                ? (widget.actualHeight - 40) / 18.1
                : (widget.actualHeight -
                        MediaQuery.of(context).padding.bottom) /
                    17.9 *
                    7.0,
            decoration: BoxDecoration(border: Border.all(width: 1.0)),
          ),
        ]),
      ],
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 1),
            child: Stack(
              children: [
                SizedBox(
                    width: 85,
                    // decoration:
                    //     BoxDecoration(border: Border.all(color: Colors.black)),
                    height: GetPlatform.isAndroid
                        ? (widget.actualHeight - 40) / 18.1
                        : (widget.actualHeight -
                                MediaQuery.of(context).padding.bottom) /
                            17.9,
                    child: optionsController.timer
                    // const Center(
                    //   child: Text(
                    //     '00:00',
                    //     style: TextStyle(fontSize: 20, color: Colors.black),
                    //   ),
                    // )
                    ),
                const Positioned(
                  top: 10,
                  left: 32,
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
                GetX<ShopController>(
                  init: ShopController(),
                  initState: (_) {},
                  builder: (controller) {
                    return Container(
                      //fit: BoxFit.fitWidth,
                      child: Flexible(
                        child: Text(
                          //added by saha
                          optionsController.outlet == '321'
                              ? controller
                                  .resitem[
                                      shopController.supercatagoryIndex.value]
                                  .category![controller.catagoryIndex.value]
                                  .subcategory![
                                      controller.subcatagoryIndex.value]
                                  .resSubcategory![
                                      shopController.itemIndex.value]
                                  .productName!
                              : controller
                                  .resitem[0]
                                  .category![controller.catagoryIndex.value]
                                  .subcategory![
                                      controller.subcatagoryIndex.value]
                                  .resSubcategory![
                                      shopController.itemIndex.value]
                                  .productName!,
                          //controller
                          // .catagory[controller.catagoryIndex.value]
                          // .subcategory![
                          //     controller.subcatagoryPageIndex.value]
                          // .items![controller.itemIndex.value]
                          // .productName!,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    );
                  },
                ),
                // SizedBox(
                //   width: 40,
                //   height: 40,
                //   child: optionsController.downarrow,
                // ),
              ],
            )),
            // color: AppColors.subHeaderContainer,
          ),
          InkWell(
            onTap: (() {
              setState(() {
                shopController.setReviewPage(true);
              });
              if (shopController.reviewPage.value) {
                viewController.setView(REVIEWPAGE);
                keyboardController.setEdit(false);
                optionsController.getShopList();
                optionsController.setOptionList(SHOP);
                //viewController.setUserOption(SHOP);
                optionsController.setSetState();
                optionsController.hideShadow();
                keyboardController.setKeypad("");
                optionsController.optionIndexSetter(-1);
              }
            }),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 5.0, bottom: 5.0, left: 1, right: 5),
              child: Stack(
                children: [
                  SizedBox(
                    width: 80,
                    height: GetPlatform.isAndroid
                        ? (widget.actualHeight - 40) / 18.1
                        : (widget.actualHeight -
                                MediaQuery.of(context).padding.bottom) /
                            17.9,
                    child: optionsController.cart,
                  ),
                  GetX<AddCartReviewController>(
                    init: AddCartReviewController(),
                    initState: (_) {},
                    builder: (controller) {
                      return Positioned(
                        top: 10,
                        left: 42,
                        child: Text(
                          //added by saha
                          controller.tableValue.value
                              .toString()
                              .padLeft(3, '0'),
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.normal),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
         
        ],
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 1),
            // child: Stack(
            //   children: [
            //     SizedBox(
            //         width: 85,
            //         // decoration:
            //         //     BoxDecoration(border: Border.all(color: Colors.black)),
            //         height: GetPlatform.isAndroid
            //             ? (widget.actualHeight - 40) / 18.1
            //             : (widget.actualHeight -
            //                     MediaQuery.of(context).padding.bottom) /
            //                 17.9,
            //         child: optionsController.timer
            //         // const Center(
            //         //   child: Text(
            //         //     '00:00',
            //         //     style: TextStyle(fontSize: 20, color: Colors.black),
            //         //   ),
            //         // )
            //         ),
            //     const Positioned(
            //       top: 10,
            //       left: 32,
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
            margin: const EdgeInsets.only(left: 5),
            height: 45,
            width: 300,
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
                    return Container(
                      //fit: BoxFit.fitWidth,
                      child: Flexible(
                        child: Text(
                          //added by saha
                          optionsController.outlet == '321'
                              ? controller
                                  .resitem[
                                      shopController.supercatagoryIndex.value]
                                  .category![controller.catagoryIndex.value]
                                  .subcategory![
                                      controller.subcatagoryIndex.value]
                                  .resSubcategory![
                                      shopController.itemIndex.value]
                                  .productName!
                              : controller
                                  .resitem[0]
                                  .category![controller.catagoryIndex.value]
                                  .subcategory![
                                      controller.subcatagoryIndex.value]
                                  .resSubcategory![
                                      shopController.itemIndex.value]
                                  .productName!,
                          //controller
                          // .catagory[controller.catagoryIndex.value]
                          // .subcategory![
                          //     controller.subcatagoryPageIndex.value]
                          // .items![controller.itemIndex.value]
                          // .productName!,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    );
                  },
                ),
                // SizedBox(
                //   width: 40,
                //   height: 40,
                //   child: optionsController.downarrow,
                // ),
              ],
            )),
            // color: AppColors.subHeaderContainer,
          ),
          InkWell(
            onTap: (() {
              setState(() {
                shopController.setReviewPage(true);
              });
              if (shopController.reviewPage.value) {
                viewController.setView(REVIEWPAGE);
                keyboardController.setEdit(false);
                optionsController.getShopList();
                optionsController.setOptionList(SHOP);
                //viewController.setUserOption(SHOP);
                optionsController.setSetState();
                optionsController.hideShadow();
                keyboardController.setKeypad("");
                optionsController.optionIndexSetter(-1);
              }
            }),
            child: const Padding(
              padding: EdgeInsets.only(
                  top: 5.0, bottom: 5.0, left: 1, right: 5),
              // child: Stack(
              //   children: [
              //     SizedBox(
              //       width: 80,
              //       height: GetPlatform.isAndroid
              //           ? (widget.actualHeight - 40) / 18.1
              //           : (widget.actualHeight -
              //                   MediaQuery.of(context).padding.bottom) /
              //               17.9,
              //       child: optionsController.cart,
              //     ),
              //     GetX<AddCartReviewController>(
              //       init: AddCartReviewController(),
              //       initState: (_) {},
              //       builder: (controller) {
              //         return Positioned(
              //           top: 10,
              //           left: 42,
              //           child: Text(
              //             //added by saha
              //             controller.tableValue.value
              //                 .toString()
              //                 .padLeft(3, '0'),
              //             style: const TextStyle(
              //                 fontSize: 16,
              //                 color: Colors.black,
              //                 fontWeight: FontWeight.normal),
              //           ),
              //         );
              //       },
              //     ),
              //   ],
              // ),
            ),
          ),
         
        ],
      ),
    );
  }



  leftfields(BuildContext context, String fieldName) {
    return Container(
        width: 87,
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.black,
              // width: 0.5,
            ),
            bottom: BorderSide(
              color: Colors.black,
              // width: 0.5,
            ),
            right: BorderSide(
                // color: Colors.black,
                // width: 0.5,
                ),
          ),
        ),
        height: GetPlatform.isAndroid
            ? (widget.actualHeight - 40) / 18.1
            : (widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                17.9 *
                1,
        child: Center(
          child: Text(
            fieldName,
            style: TextStyle(fontSize: 16, color: Colors.blue[800]),
          ),
        ));
  }

  sizedBoxText(String text) {
    return SizedBox(
      width:
          (widget.actualHeight - MediaQuery.of(context).padding.bottom) / 5.4,
      // width: getProportionateScreenWidth(150),
      // height: GetPlatform.isAndroid
      //     ? (widget.actualHeight - 40) / 18.1
      //     : (actualHeight - MediaQuery.of(context).padding.bottom) / 17.9,
      child: Padding(
        //added by saha
        padding: GetPlatform.isAndroid
            ? const EdgeInsets.only(right: 8.0, top: 20)
            : const EdgeInsets.only(right: 8.0, top: 20),
        child: Text(
          text,
          style: normalTextStyle,
          textAlign: TextAlign.end,
        ),
      ),
    );
  }

  SizedBox sizedBoxController(controller) {
    return SizedBox(
      height: GetPlatform.isAndroid
          ? (widget.actualHeight - 40) / 18.1
          : (widget.actualHeight - MediaQuery.of(context).padding.bottom) /
              17.9,
      width: 250,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          controller,
          style: const TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
      // TextFormField(
      //   readOnly: true,
      //   showCursor: true,

      //   controller: controller,
      //   decoration: InputDecoration(
      //     // hintText: "Mail ID",
      //     border: InputBorder.none,
      //     fillColor: textFieldColor,
      //   ),
      //   style: normalTextStyle,
      // ),
    );
  }
}
