import 'package:auto_size_text/auto_size_text.dart';
import 'package:customer_assist/core/app_constants.dart';
import 'package:customer_assist/core/helpers/SharedPreference/prefs.dart';
import 'package:customer_assist/home/data/shopcoupon/models/shopping_products_model/resItem.dart';
import 'package:customer_assist/home/presentation/controllers/add_cart_review_controller.dart';
import 'package:customer_assist/home/presentation/controllers/configure_controller.dart';
import 'package:customer_assist/home/presentation/controllers/header_controller.dart';
import 'package:customer_assist/home/presentation/controllers/keyboard_controller.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/controllers/loading_controller.dart';
import 'package:customer_assist/home/presentation/controllers/options_controller.dart';
import 'package:customer_assist/home/presentation/controllers/order_controller.dart';
import 'package:customer_assist/home/presentation/controllers/shop_controller.dart';
import 'package:customer_assist/home/presentation/controllers/view_controller.dart';
import 'package:customer_assist/home/presentation/widgets/keyboard/alpha_capital_letters.dart';
import 'package:customer_assist/home/presentation/widgets/keyboard/alpha_small_letters.dart';
import 'package:customer_assist/home/presentation/widgets/keyboard/numeral_special_char.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../../../../core/app_colors.dart';

class SelectCatagoryList extends StatefulWidget {
  double actualHeight;
  final ViewController viewcontroller;
  final KeyboardController keyboardController;
  final TextEditingController qtycontroller;
  SelectCatagoryList(
      {Key? key,
      required this.actualHeight,
      required this.viewcontroller,
      required this.keyboardController,
      required this.qtycontroller})
      : super(key: key);

  @override
  State<SelectCatagoryList> createState() => _SelectCatagoryListState();
}

class _SelectCatagoryListState extends State<SelectCatagoryList> {
  ScrollController scrollController = ScrollController();
  OptionsController optionsController = Get.find();
  ShopController shopController = Get.find();
  HeaderController headerController = Get.find();
  KeyboardController keyboardController = Get.find();
  ViewController viewController = Get.find();
  AddCartReviewController addCartReviewController = Get.find();
  OrderController orderController = Get.find();
  LanguageController languageController = Get.find();
  ConfigureController configureController = Get.find();
  LoadingController loadingController = Get.find();
  final FocusNode _focus = FocusNode();
  bool _isFocused = false;
  TextEditingController qtycontroller = TextEditingController();
  int item = 0;
  var ListofController = <dynamic>[];

  late VideoPlayerController _vediocontroller;

  static const double padding = 16;
  final List<ScrollController> _controller =
      List.generate(100, (index) => ScrollController());

  ScrollController categoryscroll = ScrollController();
  final List<int> currentItemIndex = List.generate(100, (index) => 0);
  final double _height = 80.0;
  double animateto = 0.0;
  RestaurantItem? dropdownValue;
  RestaurantItem? resdropdownValue;
  List<bool> zeroList = <bool>[].obs;
  var reviewIdCheck;
  final List<String> widetList = [''];

  bool isvisible = true;

  @override
  void initState() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    keyboardController.setKeypad('');

    categoryscroll.addListener(() {
      if (categoryscroll.position.keepScrollOffset) {
        if (categoryscroll.position.pixels > 0) {
          if (isvisible) {
            setState(() {
              isvisible = false;
              _vediocontroller.pause();
            });
          }
        }
      } else {
        if (!isvisible) {
          _vediocontroller.pause();

          isvisible = false;
        }
      }
    });

    _vediocontroller = VideoPlayerController.network(
        'https://www.retailresonance.com/retailresonancev2/AdvertisementVideos/PEPSODENTDIGITALICE%20CREAM.mp4')
      //'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize().then((_) {
        (isvisible) ? _vediocontroller.play() : _vediocontroller.pause();
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {
          //_vediocontroller.play();
          _vediocontroller.value.isPlaying
              ? _vediocontroller.play()
              : _vediocontroller.pause();
        });
      });

    if (optionsController.outlet == '57' 
    //|| optionsController.outlet == '202'
    ) {
      dropdownValue = shopController
          .resitem[0].category![shopController.catagoryIndex.value];
    } else {
      print('Restaurant********');
      resdropdownValue = shopController
          .resitem[shopController.supercatagoryIndex.value]
          .category![shopController.catagoryIndex.value];
    }
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
    print(ListofController);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      categoryscroll.animateTo(
        shopController.subcatagoryPageIndex * _height * 3.4,
        duration: const Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
      );
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _vediocontroller.dispose();
  }

  @override
  void didChangeDependencies() {
    setState(() {
      if (optionsController.outlet == '57' 
      // ||
      //     optionsController.outlet == '202'
          ) {
        dropdownValue = shopController.resitem[0].category![0];
      } else {
        resdropdownValue = shopController
            .resitem[shopController.supercatagoryIndex.value]
            .category![shopController.catagoryIndex.value];
      }
    });

    super.didChangeDependencies();
  }

  int? _destinationIndex;

  void _scrollToIndex(index) {
    print('object');
    Scrollable.ensureVisible(
      index,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeInOut,
    );
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
    print("--++__++${optionsController.customscroll.value}");
    return Column(
      children: [
        (optionsController.optionsKey.value == BROWSE)
            ? firstrowwidgetguest(context)
            : firstrowwidget(context),
        const SizedBox(
          height: 5,
        ),
        SingleChildScrollView(
          child: GetX<OptionsController>(
            init: OptionsController(),
            initState: (_) {},
            builder: (controller) {
              return Stack(children: [
                Column(
                  children: [
                    if (optionsController.customscroll.value == 'true')
                      //if(isvisible)
                      // if(optionsController.isvisible.value == 'true')
                      Visibility(
                        visible: isvisible,
                        child: Container(
                          height: GetPlatform.isAndroid
                              ? ((widget.actualHeight) * 0.7) / 2.3
                              : ((widget.actualHeight -
                                          MediaQuery.of(context)
                                              .padding
                                              .bottom) /
                                      17.9) *
                                  6.5,
                          width: GetPlatform.isAndroid
                              ? ((widget.actualHeight) * 0.7)
                              : ((widget.actualHeight -
                                          MediaQuery.of(context)
                                              .padding
                                              .bottom) /
                                      17.9) *
                                  // 6,
                                  10,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 168, 167, 167),
                                  width: 4),
                              color: Colors.grey[300]),
                          child:
                              // Center(child: Text('Advertisement'))

                              _vediocontroller.value.isInitialized
                                  ? AspectRatio(
                                      aspectRatio:
                                          _vediocontroller.value.aspectRatio,
                                      child: VideoPlayer(_vediocontroller),
                                    )
                                  : Container(),
                        ),
                      ),
                    (isvisible)
                        ? SizedBox(
                            height: GetPlatform.isAndroid
                                ? ((widget.actualHeight - 40)) *
                                    (optionsController.customscroll.value ==
                                            'true'
                                        ? 0.41
                                        : 0.39)
                                // 1.8
                                : ((widget.actualHeight -
                                            MediaQuery.of(context)
                                                .padding
                                                .bottom) /
                                        17.9) *
                                    6.5,

                            // 65,
                            child: GetX<ShopController>(
                              init: ShopController(),
                              initState: (_) {},
                              builder: (controller) {
                                print(controller.catagoryIndex);
                                print(controller.subcatagoryPageIndex);

                                return ListView.builder(
                                  // physics: const NeverScrollableScrollPhysics(),
                                  controller: categoryscroll,

                                  itemCount: optionsController.outlet == '63'
                                      ? controller
                                          .resitem[shopController
                                              .supercatagoryIndex.value]
                                          .category![
                                              controller.catagoryIndex.value]
                                          .subcategory!
                                          .length
                                      : controller
                                          .resitem[0]
                                          .category![
                                              controller.catagoryIndex.value]
                                          .subcategory!
                                          .length,
                                  itemBuilder: (context, subcatagoryIndex) {
                                    return subcatagory(
                                        context, subcatagoryIndex);
                                  },
                                );
                              },
                            ),
                          )
                        : Stack(children: [
                            SizedBox(
                              height: GetPlatform.isAndroid
                                  ? ((widget.actualHeight -
                                              MediaQuery.of(context)
                                                  .padding
                                                  .bottom) /
                                          17.9) *
                                      12.6
                                  //  ((widget.actualHeight - 40)) *
                                  //      (optionsController.customscroll.value == 'true'
                                  //          ? 0.41
                                  //          : 0.39)
                                  // 1.8
                                  : ((widget.actualHeight -
                                              MediaQuery.of(context)
                                                  .padding
                                                  .bottom) /
                                          17.9) *
                                      13,
                              child: GetX<ShopController>(
                                init: ShopController(),
                                initState: (_) {},
                                builder: (controller) {
                                  print(controller.catagoryIndex);
                                  print(controller.subcatagoryPageIndex);
                                  _vediocontroller.pause();
                                  // print(controller
                                  //     .resitem[0]
                                  //     .category![controller.catagoryIndex.value]
                                  //     .subcategory!
                                  //     .length);
                                  // print(controller.resitem[0]
                                  //     .category![controller.catagoryIndex.value].subcategory!);
                                  return ListView.builder(
                                    controller: categoryscroll,

                                    // builder(
                                    itemCount:

                                        // ?
                                        optionsController.outlet == '63'
                                            ? controller
                                                .resitem[shopController
                                                    .supercatagoryIndex.value]
                                                .category![controller
                                                    .catagoryIndex.value]
                                                .subcategory!
                                                .length
                                            : controller
                                                .resitem[0]
                                                .category![controller
                                                    .catagoryIndex.value]
                                                .subcategory!
                                                .length,
                                    itemBuilder: (context, subcatagoryIndex) {
                                      //       if (
                                      //   optionsController.isvisible.value == 'false') {
                                      // categoryscroll.animateTo(
                                      //   animateto,
                                      //   duration: const Duration(seconds: 1),
                                      //   curve: Curves.fastOutSlowIn,
                                      //   );}
                                      // print("----->" +
                                      //     shopController.catagoryIndex.value.toString());
                                      return subcatagory(
                                          context, subcatagoryIndex);
                                    },
                                  );
                                },
                              ),
                            ),

                            // if (optionsController.customscroll.value == 'true')
                            GetX<KeyboardController>(
                              init: KeyboardController(),
                              initState: (_) {},
                              builder: (controller) {
                                return Positioned(
                                    bottom: 0,
                                    top: 350,
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/keypad_patchs/keypad_base.png'),
                                            fit: BoxFit.fill),
                                      ),
                                      child:
                                          keyboardWidget(context, controller),
                                    ));
                              },
                            )
                          ]),
                  ],
                ),
              ]);
            },
          ),
        ),
      ],
    );
  }

  get newitemCount => (15 / 1).round();

  itemwidget(BuildContext context, int itemindex, int subcatagoryIndex) {
    // print(shopController
    //     .resitem[0]
    //     .category![shopController.catagoryIndex.value]
    //     .subcategory![subcatagoryIndex]
    //     .resSubcategory!);
    // print(ListofController);
    // print(ListofController[shopController.catagoryIndex.value][subcatagoryIndex]
    //     [itemindex]);

    _focus.addListener(() {
      if (_focus.hasFocus) {
        keyboardController.setKeypad(SYMBOLSKEYBOARD);
        keyboardController.controllerSetup(
            ListofController[shopController.catagoryIndex.value]
                [subcatagoryIndex][itemindex]);
        keyboardController.setMaximiumLength('50');
        setState(() {
          _isFocused = true;
        });
      }
    });

    return Container(
      height: GetPlatform.isAndroid
          ? ((widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                  17.9) *
              5
          : ((widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                  17.9) *
              5,
      width: GetPlatform.isAndroid
          ? ((widget.actualHeight) * 0.7) * 0.20
          : ((widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                  17.9) *
              0.5,
      //color: Color.fromARGB(255, 219, 23, 23),
      padding: const EdgeInsets.all(1.0),
      child: Container(
        height: GetPlatform.isAndroid
            ? ((widget.actualHeight) * 0.7) * 5
            : ((widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                    17.9) *
                5,
        width: GetPlatform.isAndroid
            ? ((widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                17.9)
            : ((widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                17.9),
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/product_1.png'))),
        child: GetX<ShopController>(
          init: ShopController(),
          initState: (_) {},
          builder: (controller) {
            return Column(
              children: [
                // const SizedBox(
                //   height: 5,
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        // shopController.headername.value = optionsController.outlet == '63'
                        //               ? controller
                        //                   .resitem[shopController
                        //                       .supercatagoryIndex.value]
                        //                   .category![
                        //                       controller.catagoryIndex.value]
                        //                   .subcategory![subcatagoryIndex]
                        //                   .resSubcategory![itemindex]
                        //                   .productName!
                        //               : controller
                        //                   .resitem[0]
                        //                   .category![
                        //                       controller.catagoryIndex.value]
                        //                   .subcategory![subcatagoryIndex]
                        //                   .resSubcategory![itemindex]
                        //                   .productName!;

                        if (optionsController.outlet == '63')
                        //optionsController.optionsKey.value == BROWSE
                        {
                          controller.setsupercatagoryIndex(subcatagoryIndex);
                          shopController.setItemIndex(itemindex);
                          optionsController.optionIndexSetter(3);
                          optionsController.setSetState();
                          viewController.setView(PRODUCT);
                        } else {
                          controller.setSubCatagoryPageIndex(subcatagoryIndex);
                          shopController.setItemIndex(itemindex);
                          optionsController.optionIndexSetter(4);
                          optionsController.setSetState();
                          viewController.setView(PRODUCT);
                        }
                      },
                      child: SizedBox(
                          // margin: EdgeInsets.only(left: 6),
                          height: GetPlatform.isAndroid
                              ? ((widget.actualHeight - MediaQuery.of(context).padding.bottom) / 17.9) *
                                  3
                              : ((widget.actualHeight - MediaQuery.of(context).padding.bottom) / 17.9) *
                                  4.2,
                          width: GetPlatform.isAndroid
                              ? ((widget.actualHeight) * 0.7) * 0.3
                              : ((widget.actualHeight - MediaQuery.of(context).padding.bottom) / 17.9) *
                                  4,
                          //color: Colors.amber,
                          // height: MediaQuery.of(context).size.height * 0.21,
                          // width: MediaQuery.of(context).size.width * 0.46,
                          child: SizedBox(
                              height: GetPlatform.isAndroid
                                  ? ((widget.actualHeight - MediaQuery.of(context).padding.bottom) / 17.9) *
                                      10
                                  : ((widget.actualHeight -
                                              MediaQuery.of(context)
                                                  .padding
                                                  .bottom) /
                                          17.9) *
                                      4.2,
                              width: GetPlatform.isAndroid
                                  ? ((widget.actualHeight) * 0.7) * 2
                                  : ((widget.actualHeight -
                                              MediaQuery.of(context)
                                                  .padding
                                                  .bottom) /
                                          17.9) *
                                      4,
                              // margin: EdgeInsets.only(
                              //     left: 10, right: 10, top: 12, bottom: 11),
                              child: optionsController.outlet == '63'
                                  ? (controller
                                              .resitem[shopController.supercatagoryIndex.value]
                                              .category![controller.catagoryIndex.value]
                                              .subcategory![subcatagoryIndex]
                                              .resSubcategory![itemindex]
                                              .imageUrl! !=
                                          ''
                                      ? Image.network(controller.resitem[shopController.supercatagoryIndex.value].category![controller.catagoryIndex.value].subcategory![subcatagoryIndex].resSubcategory![itemindex].imageUrl!.toString())
                                      : Container(
                                          height: GetPlatform.isAndroid
                                              ? ((widget.actualHeight - 40) /
                                                      2) *
                                                  1.8
                                              : ((widget.actualHeight -
                                                          MediaQuery.of(context)
                                                              .padding
                                                              .bottom) /
                                                      17.9) *
                                                  2.8,
                                        ))
                                  : (controller.resitem[0].category![controller.catagoryIndex.value].subcategory![subcatagoryIndex].resSubcategory![itemindex].imageUrl! != ''
                                      ? Image.network(controller.resitem[0].category![controller.catagoryIndex.value].subcategory![subcatagoryIndex].resSubcategory![itemindex].imageUrl!.toString())
                                      : Container(
                                          height: GetPlatform.isAndroid
                                              ? ((widget.actualHeight - 40) /
                                                      2) *
                                                  1.8
                                              : ((widget.actualHeight -
                                                          MediaQuery.of(context)
                                                              .padding
                                                              .bottom) /
                                                      17.9) *
                                                  2.8,
                                        )))),
                    ),
                    // ),
                    // const SizedBox(
                    //   width: 1,
                    // ),
                    Column(
                      children: [
                        SizedBox(
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
                          width: GetPlatform.isAndroid
                              ? ((widget.actualHeight) * 0.7) / 3
                              : ((widget.actualHeight -
                                          MediaQuery.of(context)
                                              .padding
                                              .bottom) /
                                      17.9) *
                                  4.2,
                          // height: MediaQuery.of(context).size.height * 0.08,
                          // width: 210,
                          child: Container(
                              // padding: EdgeInsets.all(10),
                              //added by saha
                              margin: const EdgeInsets.only(top: 10),
                              // added by saha
                              child: Center(
                                child: Text(
                                  optionsController.outlet == '63'
                                      ? controller
                                          .resitem[shopController
                                              .supercatagoryIndex.value]
                                          .category![
                                              controller.catagoryIndex.value]
                                          .subcategory![subcatagoryIndex]
                                          .resSubcategory![itemindex]
                                          .productName!
                                      : controller
                                          .resitem[0]
                                          .category![
                                              controller.catagoryIndex.value]
                                          .subcategory![subcatagoryIndex]
                                          .resSubcategory![itemindex]
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
                              ? MediaQuery.of(context).size.height * 0.02
                              : MediaQuery.of(context).size.height * 0.02,
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
                                      1.53
                                  : ((widget.actualHeight -
                                          MediaQuery.of(context)
                                              .padding
                                              .bottom) /
                                      35.9),
                              child: Row(
                                children: [
                                  Container(
                                    child: AutoSizeText(
                                      optionsController.outlet == '63'
                                          ? controller
                                              .resitem[shopController
                                                  .supercatagoryIndex.value]
                                              .category![controller
                                                  .catagoryIndex.value]
                                              .subcategory![subcatagoryIndex]
                                              .resSubcategory![itemindex]
                                              .totalReview!
                                              .toString()
                                          : controller
                                              .resitem[0]
                                              .category![controller
                                                  .catagoryIndex.value]
                                              .subcategory![subcatagoryIndex]
                                              .resSubcategory![itemindex]
                                              .averageRatings!
                                              .toString(),
                                      style: const TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const SizedBox(width: 2),
                                  Container(
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
                              width: MediaQuery.of(context).size.width * 0.12,
                            ),
                            SizedBox(
                              height: GetPlatform.isAndroid
                                  ? ((widget.actualHeight -
                                              MediaQuery.of(context)
                                                  .padding
                                                  .bottom) /
                                          17.9) *
                                      1.53
                                  : ((widget.actualHeight -
                                          MediaQuery.of(context)
                                              .padding
                                              .bottom) /
                                      35.9),
                              child: Row(
                                children: [
                                  AutoSizeText(
                                    optionsController.outlet == '63'
                                        ? controller
                                            .resitem[shopController
                                                .supercatagoryIndex.value]
                                            .category![
                                                controller.catagoryIndex.value]
                                            .subcategory![subcatagoryIndex]
                                            .resSubcategory![itemindex]
                                            .totalReview!
                                            .toString()
                                        : controller
                                            .resitem[0]
                                            .category![
                                                controller.catagoryIndex.value]
                                            .subcategory![subcatagoryIndex]
                                            .resSubcategory![itemindex]
                                            .averageRatings!
                                            .toString(),
                                    style: const TextStyle(
                                        fontSize: 20,
                                        color:
                                            Color.fromARGB(255, 124, 125, 126)),
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(width: 4),
                                  const Text(
                                    "Ratings",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color:
                                            Color.fromARGB(255, 124, 125, 126)),
                                  )
                                ],
                              ),
                            ),
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
                              //color: Colors.red,

                              height: GetPlatform.isAndroid
                                  ? ((widget.actualHeight - 40) / 17.9) * 0.5
                                  : ((widget.actualHeight -
                                          MediaQuery.of(context)
                                              .padding
                                              .bottom) /
                                      35.9),
                              // child: Padding(
                              //   padding: const EdgeInsets.only(left: 20.0),
                              child: Container(
                                padding: const EdgeInsets.only(
                                  left: 20.0,
                                ),
                                child: AutoSizeText(
                                  optionsController.outlet == '63'
                                      ? controller
                                          .resitem[shopController
                                              .supercatagoryIndex.value]
                                          .category![
                                              controller.catagoryIndex.value]
                                          .subcategory![subcatagoryIndex]
                                          .resSubcategory![itemindex]
                                          .uom!
                                      : controller
                                          .resitem[0]
                                          .category![
                                              controller.catagoryIndex.value]
                                          .subcategory![subcatagoryIndex]
                                          .resSubcategory![itemindex]
                                          .uom!,
                                  style: const TextStyle(fontSize: 20),
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              // ),
                            ),
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.35),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.005),
                SizedBox(
                  height: GetPlatform.isAndroid
                      ? ((widget.actualHeight - 40) / 17.9) * 1
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
                      //old APi(downloadShopProduct)
                      // onTap: (() async {
                      //   await Prefs.superUserLoggedIn.then((value) {
                      //     if (value) {
                      //       if (viewController.userSuboption.value ==
                      //               NEWORDERCHANGE ||
                      //           optionsController.optionsKey.value == BROWSE) {
                      //         print("add");
                      //         addCartReviewController.addToCartReview(
                      //           controller
                      //             .catagory[controller.catagoryIndex.value]
                      //             .subcategory![
                      //                 controller.subcatagoryPageIndex.value]
                      //             .items![itemindex]);
                      //       } else {
                      //         addCartReviewController.addToShoppingList(
                      //             controller
                      //                 .catagory[controller.catagoryIndex.value]
                      //                 .subcategory![
                      //                     controller.subcatagoryPageIndex.value]
                      //                 .items![itemindex]);
                      //       }
                      //     } else {
                      //       viewController.setView(ERROR);
                      //       viewController.setErrorMessage(
                      //           'You have clicked on ADDICON to add that product to the cart. You must be  registered to use purchase function. Tap on Register New ICON to register. If you are already registered then go to Log-In page');
                      //     }
                      //   });
                      // }),
                      //new APi(downloadShopProductRestaurant)
                      onTap: (() async {
                        //added by bhava
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
                                      .subcategory![subcatagoryIndex]
                                      .resSubcategory![itemindex],
                                  ListofController[shopController.catagoryIndex
                                      .value][subcatagoryIndex][itemindex]);
                            } else {
                              addCartReviewController.addToCartReviewfinal(
                                  controller
                                      .resitem[0]
                                      .category![controller.catagoryIndex.value]
                                      .subcategory![subcatagoryIndex]
                                      .resSubcategory![itemindex],
                                  ListofController[shopController.catagoryIndex
                                      .value][subcatagoryIndex][itemindex]);
                            }
                            // }
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
                      }),
                      child: Container(
                          margin: const EdgeInsets.only(left: 1),
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
                          decoration: BoxDecoration(
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
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.009,
                    ),
                    SizedBox(
                        height: GetPlatform.isAndroid
                            ? ((widget.actualHeight) * 0.7) / 1.9
                            : ((widget.actualHeight -
                                        MediaQuery.of(context).padding.bottom) /
                                    17.9) *
                                0.8,
                        width: GetPlatform.isAndroid
                            ? ((widget.actualHeight) * 0.7) / 13.2
                            : ((widget.actualHeight -
                                        MediaQuery.of(context).padding.bottom) /
                                    17.9) *
                                0.9,
                        child: Center(
                            child: TextField(
                          readOnly: true,
                          textAlign: TextAlign.center,
                          maxLength: 3,
                          controller: ListofController[shopController
                              .catagoryIndex
                              .value][subcatagoryIndex][itemindex],
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            filled: _isFocused,
                            hintText: "QTY",
                            counterText: "",
                            contentPadding:
                                const EdgeInsets.fromLTRB(0, 0, 5, 0),
                          ),
                          onTap: () async {
                            _scrollToIndex(context);

                            animateto = (_controller[subcatagoryIndex].offset);

                            optionsController.customscroll.value = 'false';

                            keyboardController.setEdit(true);

                            keyboardController.setKeypad(SYMBOLSKEYBOARD);
                            keyboardController.controllerSetup(ListofController[
                                    shopController.catagoryIndex.value]
                                [subcatagoryIndex][itemindex]);
                            keyboardController.focusSetup(
                                _focus,
                                ListofController[shopController.catagoryIndex
                                    .value][subcatagoryIndex][itemindex]);
                            keyboardController.setMaximiumLength('50');
                            keyboardController.symbolTrue(true);
                          },
                        ))),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.009,
                    ),
                    InkWell(
                      onTap: (() {
                        setState(() {
                          isvisible = !isvisible;
                        });
                      }),
                      child: Container(
                          margin: const EdgeInsets.all(0.1),
                          padding: const EdgeInsets.all(1),
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
                          // height: 48,
                          // width: 42,
                          decoration: BoxDecoration(
                            // color: Colors.grey[50],
                            border: Border.all(color: Colors.amber),
                            // borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.local_offer_sharp,
                              color: Colors.amber,
                              size: 40,
                            ),
                          )),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.003,
                    ),
                    InkWell(
                      onTap: (() async {
                        // added by bhava

                        await Prefs.superUserLoggedIn.then((value) {
                          if (value) {
                            //added by Gowshika
                            var isAdded = optionsController.outlet == '63'
                                ? controller
                                    .resitem[
                                        shopController.supercatagoryIndex.value]
                                    .category![controller.catagoryIndex.value]
                                    .subcategory![subcatagoryIndex]
                                    .resSubcategory![itemindex]
                                    .isWishlist
                                : controller
                                    .resitem[0]
                                    .category![controller.catagoryIndex.value]
                                    .subcategory![subcatagoryIndex]
                                    .resSubcategory![itemindex]
                                    .isWishlist;

                            orderController.whishListUpdate(
                                optionsController.outlet == '63'
                                    ? controller
                                        .resitem[shopController
                                            .supercatagoryIndex.value]
                                        .category![
                                            controller.catagoryIndex.value]
                                        .subcategory![subcatagoryIndex]
                                        .resSubcategory![itemindex]
                                        .productCode!
                                    //added by sahana
                                    : controller
                                        .resitem[0]
                                        .category![
                                            controller.catagoryIndex.value]
                                        .subcategory![subcatagoryIndex]
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
                              optionsController.outlet == '63'
                                  ? controller
                                      .resitem[shopController
                                          .supercatagoryIndex.value]
                                      .category![controller.catagoryIndex.value]
                                      .subcategory![subcatagoryIndex]
                                      .resSubcategory![itemindex]
                                      .isWishlist = isAdded == 1 ? 0 : 1
                                  : controller
                                      .resitem[0]
                                      .category![controller.catagoryIndex.value]
                                      .subcategory![subcatagoryIndex]
                                      .resSubcategory![itemindex]
                                      .isWishlist = isAdded == 1 ? 0 : 1;
                            });
                            print('favorite');
                          } else {
                            viewController.setView(ERROR);
                            viewController.setErrorMessage(
                                'please login first to add this product to your WishList');
                          }
                        });
                      }),
                      // onTap: (() async {
                      //   // added by bhava
                      //   await Prefs.superUserLoggedIn.then((value) {
                      //     if (value) {

                      //       orderController.whishListUpdate(
                      //           optionsController.outlet == '63'
                      //               ? controller
                      //                   .resitem[shopController
                      //                       .supercatagoryIndex.value]
                      //                   .category![
                      //                       controller.catagoryIndex.value]
                      //                   .subcategory![subcatagoryIndex]
                      //                   .resSubcategory![itemindex]
                      //                   .productCode!
                      //               : controller
                      //                   .catagory[
                      //                       controller.catagoryIndex.value]
                      //                   .subcategory![subcatagoryIndex]
                      //                   .items![itemindex]
                      //                   .productCode!,
                      //           (optionsController.outlet == '63'
                      //                       ? controller
                      //                           .resitem[shopController
                      //                               .supercatagoryIndex.value]
                      //                           .category![controller
                      //                               .catagoryIndex.value]
                      //                           .subcategory![subcatagoryIndex]
                      //                           .resSubcategory![itemindex]
                      //                           .isWishlist
                      //                       : controller
                      //                           .catagory[controller
                      //                               .catagoryIndex.value]
                      //                           .subcategory![subcatagoryIndex]
                      //                           .items![itemindex]
                      //                           .isWishlist) ==
                      //                   1
                      //               ? '0'
                      //               : '1',
                      //           languageController.languagenum.toString());

                      //       print('favorite');

                      //     } else {
                      //       viewController.setView(ERROR);
                      //       viewController.setErrorMessage(
                      //           'please login first to add this product to your WishList');
                      //     }
                      //   });
                      // }),
                      child: Container(
                          margin: const EdgeInsets.only(top: 2),
                          // padding: EdgeInsets.all(1),
                          // height: 44,
                          // width: 42,
                          height: GetPlatform.isAndroid
                              ? ((widget.actualHeight) * 0.7) / 2
                              : ((widget.actualHeight -
                                          MediaQuery.of(context)
                                              .padding
                                              .bottom) /
                                      17.9) *
                                  0.8,
                          width: GetPlatform.isAndroid
                              ? ((widget.actualHeight) * 0.7) / 13.6
                              : ((widget.actualHeight -
                                          MediaQuery.of(context)
                                              .padding
                                              .bottom) /
                                      17.9) *
                                  0.89,
                          decoration: BoxDecoration(
                              // color: Colors.grey[50],
                              border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 232, 38, 28)),
                              boxShadow: const []),
                          child: Center(
                              child: Icon(
                            (optionsController.outlet == '63'
                                        ? controller
                                            .resitem[shopController
                                                .supercatagoryIndex.value]
                                            .category![
                                                controller.catagoryIndex.value]
                                            .subcategory![subcatagoryIndex]
                                            .resSubcategory![itemindex]
                                            .isWishlist
                                        : controller
                                            .resitem[0]
                                            .category![
                                                controller.catagoryIndex.value]
                                            .subcategory![subcatagoryIndex]
                                            .resSubcategory![itemindex]
                                            .isWishlist) ==
                                    1
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                            color: Colors.red,
                            size: 43,
                          ))),
                    ),
                    SizedBox(
                      width: GetPlatform.isAndroid
                          ? MediaQuery.of(context).size.width * 0.02
                          : MediaQuery.of(context).size.width * 0.04,
                    ),
                    Row(children: [
                      SizedBox(
                        height: GetPlatform.isAndroid
                            ? ((widget.actualHeight -
                                    MediaQuery.of(context).padding.bottom)) /
                                35
                            : ((widget.actualHeight -
                                    MediaQuery.of(context).padding.bottom) /
                                35.9),
                        child: Row(
                          children: [
                            Padding(
                              padding: GetPlatform.isAndroid
                                  ? const EdgeInsets.only(left: 20.0)
                                  : const EdgeInsets.only(
                                      left: 0.0), //addedbysofiya(24mar)
                              child: const Text("₹",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromARGB(255, 20, 20, 20),
                                      fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(
                              //color: Colors.red,
                              width: 90,
                              child: AutoSizeText(
                                  optionsController.outlet == '63'
                                      ? controller
                                          .resitem[shopController
                                              .supercatagoryIndex.value]
                                          .category![
                                              controller.catagoryIndex.value]
                                          .subcategory![subcatagoryIndex]
                                          .resSubcategory![itemindex]
                                          .productRate!
                                          .toString()
                                      : controller
                                          .resitem[0]
                                          .category![
                                              controller.catagoryIndex.value]
                                          .subcategory![subcatagoryIndex]
                                          .resSubcategory![itemindex]
                                          .productRate!
                                          .toString(),
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                          width: GetPlatform.isAndroid
                              ? MediaQuery.of(context).size.width * 0.01
                              : MediaQuery.of(context).size.width *
                                  0.04), //addedbysofiya(24mar)
                      SizedBox(
                          height: GetPlatform.isAndroid
                              ? ((widget.actualHeight - 40) * 17.9) / 50
                              : ((widget.actualHeight -
                                      MediaQuery.of(context).padding.bottom) /
                                  35.9),
                          child: Row(
                            children: [
                              const AutoSizeText("₹",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 92, 90, 90))),
                              //added by saha
                              SizedBox(
                                //color: Colors.red,
                                width: 90,
                                child: AutoSizeText(
                                  optionsController.outlet == '63'
                                      ? controller
                                          .resitem[shopController
                                              .supercatagoryIndex.value]
                                          .category![
                                              controller.catagoryIndex.value]
                                          .subcategory![subcatagoryIndex]
                                          .resSubcategory![itemindex]
                                          .productMrp!
                                          .toString()
                                      : controller
                                          .resitem[0]
                                          .category![
                                              controller.catagoryIndex.value]
                                          .subcategory![subcatagoryIndex]
                                          .resSubcategory![itemindex]
                                          .productMrp!
                                          .toString(),
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 92, 90, 90)),
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          )),
                    ])
                  ]),
                )
              ],
            );
          },
        ),
      ),
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
            padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5),
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
            height: 50,
            width: 286,
            //margin: EdgeInsets.only(left: 6),
            padding: const EdgeInsets.only(left: 25),
            decoration: BoxDecoration(
                //border: Border.all(color: Colors.black),
                color: AppColors.subHeaderContainer),
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                optionsController.outlet == '63'
                    ? SizedBox(
                        child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: DropdownButton<RestaurantItem?>(
                          value: resdropdownValue,
                          icon: optionsController.downarrow,
                          elevation: 16,
                          style: const TextStyle(
                              fontSize: 16, color: Colors.black),
                          onChanged: (RestaurantItem? newValue) {
                            setState(() {
                              resdropdownValue = newValue!;
                              shopController.setCatagoryIndex(shopController
                                  .resitem[
                                      shopController.supercatagoryIndex.value]
                                  .category!
                                  .indexOf(newValue));
                            });
                          },
                          items: shopController
                              .resitem[shopController.supercatagoryIndex.value]
                              .category!
                              .map<DropdownMenuItem<RestaurantItem?>>(
                                  (RestaurantItem? value) {
                            return DropdownMenuItem<RestaurantItem?>(
                              value: value,
                              child: Text(
                                value!.categoryName!,
                                overflow: TextOverflow.ellipsis,
                              ),
                            );
                          }).toList(),
                        ),
                      ))
                    : SizedBox(
                        child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: DropdownButton<RestaurantItem?>(
                          value: dropdownValue,
                          icon: optionsController.downarrow,
                          elevation: 16,
                          style: const TextStyle(
                              fontSize: 20, color: Colors.black),
                          onChanged: (RestaurantItem? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                              shopController.setCatagoryIndex(shopController
                                  .resitem[0].category!
                                  .indexOf(newValue));
                            });
                          },
                          // added by bhava
                          // items: shopController.resitem[0].category!
                          items: shopController
                              .resitem[shopController.supercatagoryIndex.value]
                              .category!
                              .map<DropdownMenuItem<RestaurantItem?>>(
                                  (RestaurantItem? value) {
                            return DropdownMenuItem<RestaurantItem?>(
                              value: value,
                              child: Text(value!.categoryName!),
                            );
                          }).toList(),
                        ),
                      ))
              ],
            )),
          ),
          InkWell(
            onTap: (() async {
              await Prefs.superUserLoggedIn.then((value) {
                if (value) {
                  if (viewController.userSuboption.value == NEWORDERCHANGE ||
                      optionsController.optionsKey.value == BROWSE) {
                    setState(() {
                      shopController.setReviewPage(true);
                    });
                    if (shopController.reviewPage.value) {
                      headerController.subHeaderLabel(
                          configureController.subheaderResponse.value);
                      viewController.setView(REVIEWPAGE);
                      keyboardController.setEdit(false);
                      optionsController.getReviewcart();
                      optionsController.setOptionList(REVIEWCART);
                      viewController.setUserOption(SHOP);
                      optionsController.setSetState();
                      optionsController.hideShadow();
                      keyboardController.setKeypad("");
                      optionsController.optionIndexSetter(0);
                    }
                  }
                } else {
                  viewController.setView(ERROR);
                  viewController.setErrorMessage(
                      'You have clicked on CARTICON. Please login to view the cart details. Tap on Register New ICON to register. If you are already registered then go to Log-In page');
                }
              });
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
            padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5),
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
            height: 50,
            width: 286,
            margin: const EdgeInsets.only(left: 6),
            padding: const EdgeInsets.only(left: 25),
            decoration: BoxDecoration(
                // border: Border.all(color: Colors.black),
                color: AppColors.subHeaderContainer),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                optionsController.outlet == '63'
                    ? Expanded(
                        child: DropdownButton<RestaurantItem?>(
                        isExpanded: true,
                        value: resdropdownValue,
                        icon: optionsController.downarrow,
                        elevation: 16,
                        style:
                            const TextStyle(fontSize: 20, color: Colors.black),
                        onChanged: (RestaurantItem? newValue) {
                          setState(() {
                            resdropdownValue = newValue!;
                            shopController.setCatagoryIndex(shopController
                                .resitem[
                                    shopController.supercatagoryIndex.value]
                                .category!
                                .indexOf(newValue));
                          });
                        },
                        items: shopController
                            .resitem[shopController.supercatagoryIndex.value]
                            .category!
                            .map<DropdownMenuItem<RestaurantItem?>>(
                                (RestaurantItem? value) {
                          return DropdownMenuItem<RestaurantItem?>(
                            value: value,
                            child: Text(
                              value!.categoryName!,
                              overflow: TextOverflow.ellipsis,
                            ),
                          );
                        }).toList(),
                      ))
                    : Container(
                        padding: const EdgeInsets.only(left: 10),
                        child: DropdownButton<RestaurantItem?>(
                          // isExpanded: true,
                          value: dropdownValue,
                          icon: optionsController.downarrow,
                          elevation: 16,
                          style: const TextStyle(
                              fontSize: 20, color: Colors.black),
                          onChanged: (RestaurantItem? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                              shopController.setCatagoryIndex(shopController
                                  .resitem[0].category!
                                  .indexOf(newValue));
                            });
                          },

                          items: shopController
                              .resitem[shopController.supercatagoryIndex.value]
                              .category!
                              .map<DropdownMenuItem<RestaurantItem?>>(
                                  (RestaurantItem? value) {
                            return DropdownMenuItem<RestaurantItem?>(
                              value: value,
                              child: Text(value!.categoryName!),
                            );
                          }).toList(),
                        ))
              ],
            ),
          ),
          InkWell(
            onTap: (() async {
              // added by bhava
              await Prefs.superUserLoggedIn.then((value) {
                if (value) {
                  if (viewController.userSuboption.value == NEWORDERCHANGE ||
                      optionsController.optionsKey.value == BROWSE) {
                    setState(() {
                      shopController.setReviewPage(true);
                    });
                    if (shopController.reviewPage.value) {
                      headerController.subHeaderLabel(
                          configureController.subheaderResponse.value);
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
                  viewController.setErrorMessage(languageController
                          .languageResponse
                          .value
                          .youHaveClickedOnADDICONTapOnRegisterNewICON ??
                      '');
                  // 'You have clicked on CARTICON. Please login to view the cart details. Tap on Register New ICON to register. If you are already registered then go to Log-In page');
                }

                // }
              });

              if (shopController.reviewPage.value) {
                await addCartReviewController.getReviewCartItems(false);

                viewController.setView(REVIEWPAGE);
                keyboardController.setEdit(false);
                optionsController.getShopList();
                optionsController.setOptionList(SHOP);
                //added by saha
                headerController.setTimeChange();
                headerController.subHeaderLabel(
                    configureController.subheaderResponse.value);
                optionsController.setSetState();
                optionsController.hideShadow();
                keyboardController.setKeypad("");
                optionsController.optionIndexSetter(-1);
              }
            }),
            child: const Padding(
              padding:
                  EdgeInsets.only(top: 5.0, bottom: 5.0, left: 1, right: 5),
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

  subcatagory(BuildContext context, int subcatagoryIndex) {
    return GetX<ShopController>(
      init: ShopController(),
      initState: (_) {},
      builder: (controller) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 9),
              height: 45,
              width: GetPlatform.isAndroid
                  ? ((widget.actualHeight - 40))
                  : ((widget.actualHeight -
                              MediaQuery.of(context).padding.bottom) /
                          17.9) *
                      9.1,
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
                          _animateToIndex(
                              currentItemIndex[subcatagoryIndex] - 1,
                              subcatagoryIndex,
                              controller,
                              subcatagoryIndex);
                          //  jumptoItem(item);
                        },
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.grey,
                          size: 40,
                        ),
                      ),
                      Text(
                        currentItemIndex[subcatagoryIndex] < 1
                            ? 0.toString()
                            : currentItemIndex[subcatagoryIndex].toString(),
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      '${optionsController.outlet == '63' ? controller.resitem[shopController.supercatagoryIndex.value].category![shopController.catagoryIndex.value].subcategory![subcatagoryIndex].subcategoryName! : controller.resitem[0].category![shopController.catagoryIndex.value].subcategory![subcatagoryIndex].subcategoryName}',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        ((optionsController.outlet == '63'
                                        ? controller
                                            .resitem[shopController
                                                .supercatagoryIndex.value]
                                            .category![shopController
                                                .catagoryIndex.value]
                                            .subcategory![subcatagoryIndex]
                                            .resSubcategory!
                                            .length
                                        : controller
                                            .resitem[0]
                                            .category![shopController
                                                .catagoryIndex.value]
                                            .subcategory![subcatagoryIndex]
                                            .resSubcategory!
                                            .length) -
                                    currentItemIndex[subcatagoryIndex]) <
                                1
                            ? 0.toString()
                            : optionsController.outlet == '63'
                                ? ((controller.resitem[shopController.supercatagoryIndex.value].category![shopController.catagoryIndex.value].subcategory![subcatagoryIndex].resSubcategory!.length) -
                                        (currentItemIndex[subcatagoryIndex] < 1
                                            ? 1
                                            : currentItemIndex[subcatagoryIndex] +
                                                1))
                                    .toString()
                                : ((controller
                                            .resitem[0]
                                            .category![shopController
                                                .catagoryIndex.value]
                                            .subcategory![subcatagoryIndex]
                                            .resSubcategory!
                                            .length) -
                                        (currentItemIndex[subcatagoryIndex] < 1 ? 1 : currentItemIndex[subcatagoryIndex] + 1))
                                    .toString(),
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // print(' ++++++++' +
                          //   currentItemIndex[subcatagoryIndex].toString());
                          // print(subcatagoryIndex);

                          _animateToIndex(
                              currentItemIndex[subcatagoryIndex] + 1,
                              subcatagoryIndex,
                              controller,
                              subcatagoryIndex);
                        },
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                ],
              )),
            ),
            SizedBox(
                height: GetPlatform.isAndroid
                    ? ((widget.actualHeight - 40) * 0.32)
                    : ((widget.actualHeight -
                                MediaQuery.of(context).padding.bottom) /
                            17.9) *
                        5.4,
                child: PageView.builder(
                    itemCount: optionsController.outlet == '63'
                        ? controller
                            .resitem[shopController.supercatagoryIndex.value]
                            .category![shopController.catagoryIndex.value]
                            .subcategory![subcatagoryIndex]
                            .resSubcategory!
                            .length
                        : controller
                            .resitem[0]
                            .category![controller.catagoryIndex.value]
                            .subcategory![subcatagoryIndex]
                            .resSubcategory!
                            .length,
                    itemBuilder: (context, index) {
                      print("+++++++++$animateto");
                      if (animateto != 0.0 &&
                          optionsController.customscroll.value == 'false') {
                        _controller[subcatagoryIndex].animateTo(
                          animateto,
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastOutSlowIn,
                        );
                      }
                      return GridView.builder(
                        scrollDirection: Axis.horizontal,
                        controller: _controller[subcatagoryIndex],
                        shrinkWrap: true,
                        itemCount: optionsController.outlet == '63'
                            ? controller
                                .resitem[
                                    shopController.supercatagoryIndex.value]
                                .category![shopController.catagoryIndex.value]
                                .subcategory![subcatagoryIndex]
                                .resSubcategory!
                                .length
                            : controller
                                .resitem[0]
                                .category![shopController.catagoryIndex.value]
                                .subcategory![subcatagoryIndex]
                                .resSubcategory!
                                .length,
                        itemBuilder: (context, data) {
                          return itemwidget(context, data, subcatagoryIndex);
                        },
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          childAspectRatio: 0.62,
                        ),
                      );
                    }))
          ],
        );
      },
    );
  }

  void _animateToIndex(int index, int mainIndex, ShopController controller,
      int subcatagoryIndex) {
    // index = index + 1;
    // print(_controller.toList());
    _controller[mainIndex].animateTo(
      index * _height * 6,
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
    setState(() {
      if (index >= 0) {
        // print(controller
        //     .resitem[0]
        //     .category![shopController.catagoryIndex.value]
        //     .subcategory![subcatagoryIndex]
        //     .resSubcategory!
        //     .length);
        // print(index <=
        //     (optionsController.outlet == '63'
        //         ? controller
        //             .resitem[shopController.supercatagoryIndex.value]
        //             .category![shopController.catagoryIndex.value]
        //             .subcategory![subcatagoryIndex]
        //             .resSubcategory!
        //             .length
        //         : controller
        //             .resitem[0]
        //             .category![shopController.catagoryIndex.value]
        //             .subcategory![subcatagoryIndex]
        //             .resSubcategory!
        //             .length));
        if (index <=
            (optionsController.outlet == '63'
                ? controller
                    .resitem[shopController.supercatagoryIndex.value]
                    .category![shopController.catagoryIndex.value]
                    .subcategory![subcatagoryIndex]
                    .resSubcategory!
                    .length
                : controller
                    .resitem[0]
                    .category![shopController.catagoryIndex.value]
                    .subcategory![subcatagoryIndex]
                    .resSubcategory!
                    .length)) {
          currentItemIndex[mainIndex] = index;
        }
      }
    });
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

  keyboardWidget(BuildContext context, KeyboardController controller) {
    if (viewController.viewKey.value == CLIENTPROFILE ||
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
