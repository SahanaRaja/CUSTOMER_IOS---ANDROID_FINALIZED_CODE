import 'package:customer_assist/core/app_constants.dart';
import 'package:customer_assist/home/presentation/controllers/configure_controller.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/controllers/options_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectStoreWidget extends StatefulWidget {
  final double actualHeight;
  const SelectStoreWidget({Key? key, required this.actualHeight})
      : super(key: key);

  @override
  State<SelectStoreWidget> createState() => _SelectStoreWidgetState();
}

class _SelectStoreWidgetState extends State<SelectStoreWidget> {
  ConfigureController configureController = Get.find();
  var languageConroller = Get.put(LanguageController());
  List<bool> store = [];

  @override
  void initState() {
    store =
        List.generate(configureController.shopDetails.length, (index) => false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //addedbysofiya
      height: GetPlatform.isAndroid
          ? (widget.actualHeight) * .75
          : (widget.actualHeight - MediaQuery.of(context).padding.bottom) /
              17.9 *
              14,
      child: ItemListWidgets(
        actualHeight: widget.actualHeight,
        storeChecked: store,
      ),
    );
  }
}

class ItemListWidgets extends StatefulWidget {
  final double actualHeight;
  final List<bool> storeChecked;

  const ItemListWidgets(
      {Key? key, required this.actualHeight, required this.storeChecked})
      : super(key: key);

  @override
  State<ItemListWidgets> createState() => _ItemListWidgetsState();
}

class _ItemListWidgetsState extends State<ItemListWidgets> {
  ConfigureController configureController = Get.find();
  var languageConroller = Get.put(LanguageController());
  var optionsController = Get.put(OptionsController());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        itemCount: configureController.shopDetails.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              SizedBox(
                  height: GetPlatform.isAndroid
                      ? (widget.actualHeight - 40) / 18.1
                      : (widget.actualHeight -
                              MediaQuery.of(context).padding.bottom) /
                          17.9 *
                          1),
              Container(
                //addedbysofi
                width: GetPlatform.isAndroid
                    ? (widget.actualHeight - 40) / 2
                    : (widget.actualHeight -
                            MediaQuery.of(context).padding.bottom) /
                        17.9 *
                        8.5,
                height: GetPlatform.isAndroid
                    ? (widget.actualHeight - 40) / 5.6
                    : (widget.actualHeight -
                            MediaQuery.of(context).padding.bottom) /
                        17.9 *
                        3.20,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(15))),
                child: Padding(
                  padding: const EdgeInsets.only(left: 35.0, right: 10),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: (() async {
                          setState(() {
                            widget.storeChecked[index] =
                                !widget.storeChecked[index];
                          });
                          if (widget.storeChecked[index] == true) {
                            if (optionsController.optionsKey.value == GUEST) {
                              configureController.letMeShopGuest(
                                  configureController
                                      .shopDetails[index].typeId!,
                                  languageConroller.languagenum.toString());
                            } else {
                              configureController.letMeShop(
                                  configureController
                                      .shopDetails[index].typeId!,
                                  languageConroller.languagenum.toString());
                            }
                          }
                        }),
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
                              child:
                               widget.storeChecked[index] 
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
                        width: MediaQuery.of(context).size.width * .03,
                      ),
                      Container(
                        width: GetPlatform.isAndroid
                            ? (widget.actualHeight - 40) / 7
                            : (widget.actualHeight -
                                    MediaQuery.of(context).padding.bottom) /
                                17.9 *
                                2.3,
                        height: GetPlatform.isAndroid
                            ? (widget.actualHeight - 40) / 6.8
                            : (widget.actualHeight -
                                    MediaQuery.of(context).padding.bottom) /
                                17.9 *
                                2.3,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15))),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Center(
                            child: Text(
                              configureController.shopDetails[index].typeName!,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, top: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: GetPlatform.isAndroid
                                  ? (widget.actualHeight - 40) / 4.5
                                  : (widget.actualHeight -
                                          MediaQuery.of(context)
                                              .padding
                                              .bottom) /
                                      17.9 *
                                      4,
                              height: GetPlatform.isAndroid
                                  ? (widget.actualHeight - 40) / 20
                                  : (widget.actualHeight -
                                          MediaQuery.of(context)
                                              .padding
                                              .bottom) /
                                      17.9 *
                                      0.8,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  configureController
                                      .shopDetails[index].displayName!,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                            Container(
                              width: GetPlatform.isAndroid
                                  ? (widget.actualHeight - 40) / 4.5
                                  : (widget.actualHeight -
                                          MediaQuery.of(context)
                                              .padding
                                              .bottom) /
                                      17.9 *
                                      4,
                              height: GetPlatform.isAndroid
                                  ? (widget.actualHeight - 40) / 20
                                  : (widget.actualHeight -
                                          MediaQuery.of(context)
                                              .padding
                                              .bottom) /
                                      17.9 *
                                      0.8,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  languageConroller
                                          .languageResponse.value.terms ??
                                      '',
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
