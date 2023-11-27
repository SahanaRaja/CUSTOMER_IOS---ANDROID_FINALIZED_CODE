import 'package:customer_assist/core/app_constants.dart';
import 'package:customer_assist/core/helpers/SharedPreference/prefs.dart';
import 'package:customer_assist/home/presentation/controllers/configure_controller.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/controllers/view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../google_map_tab.dart';

class ShopDetailsWidget extends StatefulWidget {
  final double actualHeight;
  const ShopDetailsWidget({Key? key, required this.actualHeight})
      : super(key: key);

  @override
  State<ShopDetailsWidget> createState() => _ShopDetailsWidgetState();
}

class _ShopDetailsWidgetState extends State<ShopDetailsWidget> {
  ConfigureController configureController = Get.find();
  LanguageController languageController = Get.find();
  ViewController viewController = Get.find();
  int indexValue = 0;
  List<bool> shopChecked = [];
  var shopid;
  @override
  void initState() {
    shopChecked = List.generate(
        configureController.letmeShopDetails.length, (index) => false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return SizedBox(
        //addedbysofiya
        width: GetPlatform.isAndroid
            ? (widget.actualHeight - 40) / 2
            : (widget.actualHeight - MediaQuery.of(context).padding.bottom),
        height: GetPlatform.isAndroid
            ? (widget.actualHeight) * .75
            : (widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                17.9 *
                14.5,

        child: Column(
          children: [
            Container(
                width: GetPlatform.isAndroid
                    ? (widget.actualHeight - 40) / 2
                    : (widget.actualHeight -
                            MediaQuery.of(context).padding.bottom) /
                        17.9 *
                        8.5,
                height: GetPlatform.isAndroid
                    ? (widget.actualHeight - 40) / 1.77
                    : (widget.actualHeight -
                            MediaQuery.of(context).padding.bottom) /
                        17.9 *
                        10.5,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(15))),
                child: GetX<ConfigureController>(
                  init: ConfigureController(),
                  initState: (_) {},
                  builder: (controller) {
                    if (controller.loadingController.isLoading) {}
                    return GoogleMapScreen(
                      actualHeight: GetPlatform.isAndroid
                          ? (widget.actualHeight - 40) / 1
                          : (widget.actualHeight -
                                  MediaQuery.of(context).padding.bottom) /
                              17.9 *
                              10.5,
                      longitude:
                          controller.letmeShopDetails[indexValue].longitude ??
                              '0',
                      latitude:
                          controller.letmeShopDetails[indexValue].latitude ??
                              '0',
                    );
                  },
                )),

            // GoogleMapScreen(
            //   actualHeight: GetPlatform.isAndroid
            //       ? (widget.actualHeight - 40) / 18.1
            //       : (widget.actualHeight -
            //               MediaQuery.of(context).padding.bottom) /
            //           17.9 *
            //           10.5,
            //   longitude: configureController.letmeShopDetails[0].longitude!,
            //   latitude: configureController.letmeShopDetails[0].latitude!,
            // ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: GetPlatform.isAndroid
                  ? (widget.actualHeight - 40) / 4.9
                  : (widget.actualHeight -
                          MediaQuery.of(context).padding.bottom) /
                      17.9 *
                      3.4,
              width: GetPlatform.isAndroid
                  ? (widget.actualHeight - 40)
                  : (widget.actualHeight -
                          MediaQuery.of(context).padding.bottom) /
                      17.9 *
                      9,
              child: PageView.builder(
                onPageChanged: ((value) {
                  setState(() {
                    indexValue = value;
                    print(indexValue);
                    print(configureController
                        .letmeShopDetails[indexValue].longitude!);
                    print(configureController
                        .letmeShopDetails[indexValue].latitude!);
                  });
                }),
                scrollDirection: Axis.horizontal,
                itemCount: configureController.letmeShopDetails.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Container(
                        //addedbysofi
                        width: GetPlatform.isAndroid
                            ? (widget.actualHeight - 40)
                            : (widget.actualHeight -
                                    MediaQuery.of(context).padding.bottom) /
                                17.9 *
                                8.5,
                        height: GetPlatform.isAndroid
                            ? (widget.actualHeight - 40) / 5
                            : (widget.actualHeight -
                                    MediaQuery.of(context).padding.bottom) /
                                17.9 *
                                3.2,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                            ),
                            color: Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15))),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 32.0, right: 0),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Prefs.setShopId(configureController
                                      .letmeShopDetails[index].shopId!);
                                    Prefs.setSuperUserShopId(true);

                                      //added by sahana
                                      configureController.subheaderResponse.value=  configureController
                                            .letmeShopDetails[index].shopName!.toString();
                                       print('---------->${configureController
                                            .letmeShopDetails[index].shopName!}');

                                 
                                  setState(() {
                                    shopChecked[index] = !shopChecked[index];
                                    configureController.updateShop(
                                        configureController
                                            .letmeShopDetails[index].shopId!,
                                        languageController.languagenum
                                            .toString());
                                 
                                    print('object---->');
                                  });
                                },
                                child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(),
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.grey,
                                              spreadRadius: 1,
                                              blurRadius: 1,
                                              offset: Offset(4, 4))
                                        ]),
                                    child: Center(
                                      child: shopChecked[index] == true
                                          ? const Icon(
                                              Icons.done,
                                              color: Colors.green,
                                              size: 25,
                                            )
                                          : const Icon(
                                              Icons.done,
                                              color: Colors.white,
                                              size: 25,
                                            ),
                                    )),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .05,
                              ),
                              Container(
                                width: GetPlatform.isAndroid
                                    ? (widget.actualHeight - 40) / 6
                                    : (widget.actualHeight -
                                            MediaQuery.of(context)
                                                .padding
                                                .bottom) /
                                        17.9 *
                                        2.5,
                                height: GetPlatform.isAndroid
                                    ? (widget.actualHeight - 40) / 6.5
                                    : (widget.actualHeight -
                                            MediaQuery.of(context)
                                                .padding
                                                .bottom) /
                                        17.9 *
                                        2.5,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15))),
                                child: GestureDetector(
                                  onTap: () {
                                    viewController.setView(VIEWSHOP);
                                  },
                                  child: Image.network(configureController
                                      .letmeShopDetails[index].imageUrl!),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0, top: 26),
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.space,
                                  children: [
                                    Container(
                                      width: GetPlatform.isAndroid
                                          ? (widget.actualHeight - 40) / 6.65
                                          : (widget.actualHeight -
                                                  MediaQuery.of(context)
                                                      .padding
                                                      .bottom) /
                                              17.9 *
                                              3.85,
                                      height: GetPlatform.isAndroid
                                          ? (widget.actualHeight - 40) / 25
                                          : (widget.actualHeight -
                                                  MediaQuery.of(context)
                                                      .padding
                                                      .bottom) /
                                              17.9 *
                                              0.76,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(configureController
                                            .letmeShopDetails[index].shopName!,textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      width: GetPlatform.isAndroid
                                          ? (widget.actualHeight - 40) / 6.65
                                          : (widget.actualHeight -
                                                  MediaQuery.of(context)
                                                      .padding
                                                      .bottom) /
                                              17.9 *
                                              3.85,
                                      height: GetPlatform.isAndroid
                                          ? (widget.actualHeight - 40) / 25
                                          : (widget.actualHeight -
                                                  MediaQuery.of(context)
                                                      .padding
                                                      .bottom) /
                                              17.9 *
                                              0.76,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(configureController
                                            .letmeShopDetails[index]
                                            .shopOpenTime!),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      width: GetPlatform.isAndroid
                                          ? (widget.actualHeight - 40) / 6.65
                                          : (widget.actualHeight -
                                                  MediaQuery.of(context)
                                                      .padding
                                                      .bottom) /
                                              17.9 *
                                              3.85,
                                      height: GetPlatform.isAndroid
                                          ? (widget.actualHeight - 40) / 25
                                          : (widget.actualHeight -
                                                  MediaQuery.of(context)
                                                      .padding
                                                      .bottom) /
                                              17.9 *
                                              0.76,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(configureController
                                            .letmeShopDetails[index]
                                            .mobileNumber!),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      // const SizedBox(height: 9)
                    ],
                  );
                },
              ),
            )
          ],
        ),
      );
    });
  }
}
