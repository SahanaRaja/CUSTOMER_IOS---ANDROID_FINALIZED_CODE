import 'package:customer_assist/core/app_colors.dart';
import 'package:customer_assist/core/app_constants.dart';
import 'package:customer_assist/home/data/configure/models/delivery_time_model/slot_datum.dart';
import 'package:customer_assist/home/presentation/controllers/configure_controller.dart';
import 'package:customer_assist/home/presentation/controllers/header_controller.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/controllers/options_controller.dart';
import 'package:customer_assist/home/presentation/controllers/view_controller.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/sub_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/platform/platform.dart';
import 'package:get/instance_manager.dart';
import 'package:intl/intl.dart';

class DeliveryTimePage extends StatefulWidget {
  final double actualHeight;
  const DeliveryTimePage({Key? key, required this.actualHeight})
      : super(key: key);

  @override
  State<DeliveryTimePage> createState() => _DeliveryTimePageState();
}

class _DeliveryTimePageState extends State<DeliveryTimePage> {
  ConfigureController configureController = Get.find();
  LanguageController languageController = Get.find();
  OptionsController optionsController = Get.find(); 
  ViewController viewController = Get.find();
  HeaderController headerController = Get.find();
  TextEditingController deliveryTime = TextEditingController();
  int deliveryDataIndex = 0;
  List<List<bool>>? selectchecked;
  @override
  void initState() {
    selectchecked =
        List.generate(5, (index) => List.generate(5, (index) => false));
    // configureController.normalDelivery.
// Date Container condition to be check to change color to Orange
    for (int i = 0; i < 5; i++) {
      if (configureController.normalDelivery[0].deliveryData!.isNotEmpty) {
        if (configureController
                .normalDelivery[0].deliveryData![0].slotData![i].displayColor
                .toString() ==
            'RED') {}
      }
    }
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
      child: SizedBox(
        height: GetPlatform.isAndroid
            ? (widget.actualHeight - 40) /  17.9 *
                17 //addedbysofiya
            : (widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                17.9 *
                19,
        child: Column(
          children: [
             Container(
    
              // margin: const EdgeInsets.only(right: 2),
             height: MediaQuery.of(context).size.height * 0.043,
              width: MediaQuery.of(context).size.width * 0.99,
              color: AppColors.subHeaderContainer,
              child: Row(
                children: [
                  Container(
                   height: MediaQuery.of(context).size.height * 0.043,
                   width: 50,
                   child: optionsController.timerNew,
                  ),
                  //  getSixedController3(context, 2,
                  //     controller:deliveryTime),
                
                  Container(
                    height: MediaQuery.of(context).size.height * 0.043,
                   width: 60,
                   child: Center(
                    child: Text(
                    "0.00",
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),))
                  ),
                  SizedBox(width: 50,),
                  SubHeader(),
                ],
              )),
            SizedBox(
              height: GetPlatform.isAndroid
                  ? (widget.actualHeight - 40) / 20 //addedbysofiya
                  : (widget.actualHeight -
                          MediaQuery.of(context).padding.bottom) /
                      17.9 *
                      1.2,
            ),
            SizedBox(
              height: GetPlatform.isAndroid
                  ? (widget.actualHeight - 40) / 10
                  : (widget.actualHeight -
                          MediaQuery.of(context).padding.bottom) /
                      17.9 *
                      1.8,
              child: Padding(
                padding: GetPlatform.isAndroid
                ? const EdgeInsets.only(
                    left: 50.0, right: 20, top: 10, bottom: 10)
               : const EdgeInsets.only(
                    left: 50.0, right: 50, top: 10, bottom: 10),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: configureController
                        .normalDelivery[0].deliveryData!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 2),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              deliveryDataIndex = index;
                            });
                          },
                          child: Container(
                            width: (widget.actualHeight -
                                    MediaQuery.of(context).padding.bottom) /
                                17.9 *
                                1.6,
                            decoration: BoxDecoration(
                              color: configureController
                                          .normalDelivery[0]
                                          .deliveryData![index]
                                          .deliveryDateColor! ==
                                      'green'
                                  ? const Color.fromARGB(255, 82, 232, 89)
                                  : Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(
                                    4.0,
                                    4.0,
                                  ),
                                  blurRadius: 1.0,
                                  spreadRadius: 2.0,
                                ),
                              ],
                              border: Border.all(
                                color: Colors.black,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 18.0),
                              child: Center(
                                  // child: Text(configureController.normalDelivery[0]
                                  //     .deliveryData![index].deliveryDate!)
                                  child: Column(
                                children: [
                                  dateWidget(
                                      configureController.normalDelivery[0]
                                          .deliveryData![index].deliveryDate!,
                                      'E'),
                                  dateWidget(
                                      configureController.normalDelivery[0]
                                          .deliveryData![index].deliveryDate!,
                                      'MMM d'),
                                ],
                              )),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
           const SizedBox(height:25),
            SizedBox(
              height: GetPlatform.isAndroid
                  ? (widget.actualHeight - 40) / 17.9 *
                      5.4 //addedbysofiya
                  : (widget.actualHeight -
                          MediaQuery.of(context).padding.bottom) /
                      17.9 *
                      5.5,
              child: Padding(
                  padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: configureController.normalDelivery[0]
                          .deliveryData![deliveryDataIndex].slotData!.length,
                      itemBuilder: (context, data) {
                        return SizedBox(
                           height:
                                         MediaQuery.of(context).size.height * 0.056,
                            // height: GetPlatform.isAndroid
                            //     ? (widget.actualHeight - 40) / 18.1
                            //     : (widget.actualHeight -
                            //             MediaQuery.of(context).padding.bottom) /
                            //         17.9 *
                            //         1,
                            child: deliveryTimeView(
                                configureController
                                    .normalDelivery[0]
                                    .deliveryData![deliveryDataIndex]
                                    .slotData![data],
                                deliveryDataIndex,
                                data));
                      })),
            ),
            SizedBox(
              height: GetPlatform.isAndroid
                  ? (widget.actualHeight - 40) / 17.9 *
                      1.5
                  : (widget.actualHeight -
                          MediaQuery.of(context).padding.bottom) /
                      17.9 *
                      1.5,
            ),
            Container(
              height: GetPlatform.isAndroid
                  ? (widget.actualHeight - 40) / 15 //addedbysofiya
                  : (widget.actualHeight -
                          MediaQuery.of(context).padding.bottom) /
                      17.9 *
                      1.6,
              width: GetPlatform.isAndroid
                  ? (widget.actualHeight - 40) / 3.5 //addedbysofiya
                  : (widget.actualHeight -
                          MediaQuery.of(context).padding.bottom) /
                      17.9 *
                      6,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(
                      4.0,
                      4.0,
                    ),
                    blurRadius: 1.0,
                    spreadRadius: 2.0,
                  ),
                ],
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'You can cancel your order 3 hour prior to delivery time',
                    // configureController
                    //     .normalDelivery[0].screenMessage!.footerMessage1!,
                    style: TextStyle(fontSize: 20, color: Colors.grey[600]),
                  ),
                ),
              ),
            ),
            SizedBox(
            //added by sahana
            height:GetPlatform.isAndroid
               ? ((widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                        17.9) *
                    3.2
              :((widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                        17.9) *
                    2.4
          ),
            Container(
            decoration: const BoxDecoration(
                border: Border(
              top: BorderSide(
                color: Colors.black,
                width: 0.5,
              ),
              // bottom: BorderSide(
              //   color: Colors.black,
              //   width: 0.5,
              // ),
            )),
            height:
                 MediaQuery.of(context).size.height * 0.050,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () async {
                     viewController.setView(REVIEWPAYMENT);
                    headerController.subHeaderLabel('Review Payments');
                   
                     //added by saha
                   // headerController.setTimeChange();
                    // headerController.subHeaderLabel( configureController
                    // .subheaderResponse.value);
                   
                       // headerController.subThirdHeaderLabel('Overall');
                  },
                  child: Container(
                      decoration: const BoxDecoration(
                         ),
                      child: Container(
                      padding: EdgeInsets.only(top: 10),
                    height: 60,
                    width: 50,
                  decoration: const BoxDecoration(
                  ),
                  child: RotatedBox(
    
                        quarterTurns: DateTime.june,
                    child: optionsController.backNew))),
                ),
                 SizedBox(width: 370,),
                InkWell(
                  //added by sahana
                  onTap: () async {
                     viewController.setView(REVIEWORDER);
                    headerController.subHeaderLabel('Review Order');
                    //  configureController
                    //                                               .fetchDetails(
                    //                                                   languageController
                    //                                                       .languagenum
                    //                                                       .toString());
                    
                  },
                  child: Container(
                      decoration: const BoxDecoration(
                         ),
                      child: Container(
                      padding: EdgeInsets.only(top: 10),
                    height: 60,
                    width: 50,
                  decoration: const BoxDecoration(
                  ),
                  child: RotatedBox(
    
                        quarterTurns: DateTime.april,
                    child: optionsController.backNew))),
                ),
              ],
            ),
          )
          ],
        ),
      ),
    );
  }

  Row deliveryTimeView(SlotDatum slotDatum, int data, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              selectchecked![data][index] = !selectchecked![data][index];
            });
            if (selectchecked![data][index] == true) {
              configureController.updateDeliveryTime(slotDatum.deliverySlot!,
                  languageController.languagenum.toString());
            }
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
                child: selectchecked![data][index] == true
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
            width:
                (widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                    17.9 *
                    3,
            child: textWidget(slotDatum.deliverySlot!)),
        textWidget("₹ ${slotDatum.deliveryCharge!}"),
        InkWell(
          onTap: () {},
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                color: slotDatum.displayColor!.toUpperCase() == 'GREEN'
                    ? const Color.fromARGB(255, 82, 232, 89)
                    : Colors.red,
                border: Border.all(),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(4, 4))
                ]),
          ),
        ),
      ],
    );
  }
  getSixedController3(BuildContext context, int index, {TextEditingController? controller}) {
    return Container(
      //padding: EdgeInsets.only(bottom: 6),
      height: MediaQuery.of(context).size.height * 0.043,
                  width: 130,
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

  SizedBox textWidget(String textvalue) {
    return SizedBox(
      child: Text(
        textvalue,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }

  Widget dateWidget(var data, String format) {
    return Text(
      DateFormat(format).format(DateFormat("dd/MM/yyyy").parse(data)),
      style: const TextStyle(color: Colors.black, fontSize: 16),
    );
  }
}
