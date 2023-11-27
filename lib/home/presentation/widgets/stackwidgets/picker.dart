import 'package:customer_assist/core/app_colors.dart';
import 'package:customer_assist/core/app_constants.dart';
import 'package:customer_assist/core/helpers/SharedPreference/prefs.dart';
import 'package:customer_assist/home/presentation/controllers/configure_controller.dart';
import 'package:customer_assist/home/presentation/controllers/fetch_country_controller.dart';
import 'package:customer_assist/home/presentation/controllers/guest_fetchCountry_controller.dart';
import 'package:customer_assist/home/presentation/controllers/header_controller.dart';
import 'package:customer_assist/home/presentation/controllers/keyboard_controller.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/controllers/options_controller.dart';
import 'package:customer_assist/home/presentation/controllers/owner_data_controller.dart';
import 'package:customer_assist/home/presentation/controllers/pos_master_selection_controller.dart';
import 'package:customer_assist/home/presentation/controllers/shop_controller.dart';
import 'package:customer_assist/home/presentation/controllers/view_controller.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/sub_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/size_config.dart';

class PickerMethod extends StatefulWidget {
   double actualHeight;
  PickerMethod({Key? key, required this.actualHeight}) : super(key: key);

  @override
  State<PickerMethod> createState() => _PickerMethodState();
}

class _PickerMethodState extends State<PickerMethod> {
  KeyboardController keyboardController = Get.find();
  PosMasterSelectionController posMasterSelectionController =Get.find();
  FetchCountryController fetchCountryController = Get.find();
  //GuestFetchCountryController guestCountryController =  Get.find();
  LanguageController languageController = Get.find();
  OptionsController optionsController = Get.find();
  var guestCountryController = Get.put(GuestFetchCountryController());
  ViewController viewController = Get.find();
  AddressController addressController = Get.find();
  HeaderController headerController =Get.find();
  ShopController shopController = Get.find();
  ConfigureController configureController = Get.find();
  var name =0;
  double actualHeight = 0;
  int guestCountry = 0;
   var category = 0;
  var subcategory = 0;
  
  final int _selectedItemIndex1 = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
        
              // margin: const EdgeInsets.only(right: 2),
              height: MediaQuery.of(context).size.height * 0.043,
              width: MediaQuery.of(context).size.width * 0.99,
              color: const Color.fromARGB(255, 210, 207, 207),
              child: const Center(child: SubHeader())),
            Container(
              //color: Color.fromARGB(255, 241, 240, 234),
             // height: 395,
              height: GetPlatform.isAndroid
                          ? ((widget.actualHeight - 40) / 17.9) * 0.99
                          : ((widget.actualHeight -
                                  MediaQuery.of(context).padding.bottom) /
                              17.9) * 8.9,

                             //child: (keyboardController.pickerValue.value == 'Vertical')
                             
                              // ? 
            ),
            Container(
              // height: MediaQuery.of(context).size.height * 0.276,
              //height: MediaQuery.of(context).size.height * 0.2695,
              //  0.275,
              // 285,

              // decoration:
              //     BoxDecoration(border: Border.all(color: Colors.black)),
              child: GetX<KeyboardController>(
                              init: KeyboardController(),
                              initState: (_) {},
                              builder: (controller) {
                                  if (controller.pickerValue.value != '' &&
                                    controller.pickerValue.value !=
                                        'FIRSTLOAD') {
                                  return Positioned(
                                    bottom:  0,
                                    child: Container(
                                      decoration:  BoxDecoration(
                                        border: Border.all(width: 0.1 ),
                                        image:const DecorationImage(
                                            image: AssetImage(
                                                'assets/images/keypad_patchs/keypad_base.png'),
                                            fit: BoxFit.fill),
                                      ),
                                      width: MediaQuery.of(context).size.width,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 3.0),
                                            child: Container(
                                              height: 50,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              decoration:  BoxDecoration(
                                                border: Border.all(width: 2),
                                                  image:const DecorationImage(
                                                      fit: BoxFit.fill,
                                                      image: AssetImage(
                                                          'assets/images/keypad_patchs/keypad_header.png'))),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      keyboardController
                                                          .setKeypad('');
                                                      keyboardController
                                                          .setPicker('');
                                                    },
                                                    child: Text(
                                                      'CANCEL',
                                                      style:
                                                          GoogleFonts.openSans(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 25,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () async {
                                                      if (keyboardController
                                                                    .pickerValue
                                                                    .value ==
                                                                "Jewellary") {
                                                                  viewController.setView(PICKER);
                                                              keyboardController
                                                                  .setPicker(
                                                                      'Jewellarysubcategory');
                                                                      headerController.setSubHeaderLabel(configureController.subheaderResponse.value);
                                                            } else if (keyboardController
                                                                    .pickerValue
                                                                    .value ==
                                                                "Jewellarysubcategory") {
                                                                   viewController.setView(PICKER);
                                                              keyboardController
                                                                  .setPicker(
                                                                      'Jewellaryitem');
                                                                       headerController.setSubHeaderLabel(configureController.subheaderResponse.value);
                                                            } else if (keyboardController
                                                                    .pickerValue
                                                                    .value ==
                                                                "Jewellaryitem") {
                                                              keyboardController
                                                                  .setPicker(
                                                                      '');
                                                                      headerController.setSubHeaderLabel(configureController.subheaderResponse.value);
                                                              viewController
                                                                  .setView(
                                                                      JEWELLARY);
                                                            }
                                                               
                                                              
                                                    },
                                                    child: Text(
                                                      'DONE',
                                                      style:
                                                          GoogleFonts.openSans(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 25,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          StatefulBuilder(
                                              builder: (context, setState) {
                                            return pickerMethod(
                                                setState, controller);
                                          })
                                        ],
                                      ),
                                    ),
                                  );
                                } else {
                                  return Container();
                               }
                              },
                            ),
            ),
          ],
        ),
          

      ],
    );
  }
  pickerMethod(StateSetter setState, KeyboardController controller) {
    if (controller.pickerValue.value == "Jewellary") {
      return GetX<ShopController>(
        init: ShopController(),
        initState: (_) {},
        builder: (_) {
          return SizedBox(
            height: getProportionateScreenHeight(235),
            width: MediaQuery.of(context).size.width,
            child: CupertinoPicker(
              magnification: 1.2,
              backgroundColor: AppColors.subHeaderContainer,
              itemExtent: 50,
              onSelectedItemChanged: (index) {
                setState(() {
                  category = index;
                  shopController.setCatagoryIndex(index);
                  configureController.subheaderResponse.value = shopController
                                            .resitem[0].category![index].categoryName!.toString();

                }); 

                print("Selected Iem: ");
              },
              selectionOverlay: Container(
                decoration: BoxDecoration(
                  color: Colors.yellowAccent.withOpacity(0.6),
                  border: Border.all(
                    color:
                        const Color.fromARGB(255, 18, 17, 17).withOpacity(0.5),
                    width: 2.0,
                  ),
                ),
              ),
              children: shopController.resitem[0].category!
                  .map((item) => Center(
                      child: Text(item.categoryName!,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ))))
                  .toList(),
            ),
          );
        },
      );
    } else if (controller.pickerValue.value == "Jewellarysubcategory") {
      //var index = 0;
      return GetX<ShopController>(
        init: ShopController(),
        initState: (_) {},
        builder: (_) {
          return SizedBox(
            height: getProportionateScreenHeight(235),
            width: MediaQuery.of(context).size.width,
            child: CupertinoPicker(
              magnification: 1.2,
              backgroundColor: AppColors.subHeaderContainer,
              itemExtent: 50,
              onSelectedItemChanged: (index) {
                setState(() {
                  //subcategory = index;
                  shopController.setSubCatagoryPageIndex(index);
                  configureController.subheaderResponse.value = shopController
                                              .resitem[0]
                                              .category![shopController
                                                  .catagoryIndex.value]
                                              .subcategory![index]
                                              .subcategoryName
                                              .toString();
                });

                print("Selected Iem: ");
              },
              selectionOverlay: Container(
                // width: 100,

                decoration: BoxDecoration(
                  color: Colors.yellowAccent.withOpacity(0.6),
                  border: Border.all(
                    color:
                        const Color.fromARGB(255, 18, 17, 17).withOpacity(0.5),
                    width: 2.0,
                  ),
                ),
              ),
              //height of each item
              //looping: true,
              children: shopController.resitem[0]
                  .category![shopController.catagoryIndex.value].subcategory!
                  .map((item) => Center(
                      child: Text(item.subcategoryName!,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ))))
                  .toList(),
            ),
          );
        },
      );
    } else if (controller.pickerValue.value == "Jewellaryitem") {
      //var index = 0;
      return GetX<ShopController>(
        init: ShopController(),
        initState: (_) {},
        builder: (_) {
          return SizedBox(
            height: getProportionateScreenHeight(235),
            width: MediaQuery.of(context).size.width,
            child: CupertinoPicker(
              magnification: 1.2,
              backgroundColor: AppColors.subHeaderContainer,
              itemExtent: 50,
              onSelectedItemChanged: (index) {
                setState(() {
                  subcategory = index;
                  // shopController.itemIndex(index);
                 configureController.subheaderResponse.value = shopController
                                              .resitem[0]
                                              .category![shopController
                                                  .catagoryIndex.value]
                                              .subcategory![shopController
                                                  .subcatagoryIndex.value]
                                              .resSubcategory![index].productName
                                              .toString();
                });

                print("Selected Iem: ");
              },
              selectionOverlay: Container(
                // width: 100,

                decoration: BoxDecoration(
                  color: Colors.yellowAccent.withOpacity(0.6),
                  border: Border.all(
                    color:
                        const Color.fromARGB(255, 18, 17, 17).withOpacity(0.5),
                    width: 2.0,
                  ),
                ),
              ),
              //height of each item
              //looping: true,
              children: shopController
                  .resitem[0]
                  .category![shopController.catagoryIndex.value]
                  .subcategory![shopController.subcatagoryIndex.value]
                  .resSubcategory!
                  .map((item) => Center(
                      child: Text(item.productName!,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              overflow: TextOverflow.ellipsis))))
                  .toList(),
            ),
          );
        },
      );
    }
   
  }
}
