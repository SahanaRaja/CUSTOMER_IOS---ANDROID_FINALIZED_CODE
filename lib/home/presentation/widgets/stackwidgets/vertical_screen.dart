

import 'package:customer_assist/core/app_colors.dart';
import 'package:customer_assist/core/app_constants.dart';
import 'package:customer_assist/core/helpers/SharedPreference/prefs.dart';
import 'package:customer_assist/home/data/configure/datasources/configure_data_remote_data_source.dart';
import 'package:customer_assist/home/presentation/controllers/fetch_country_controller.dart';
import 'package:customer_assist/home/presentation/controllers/guest_fetchCountry_controller.dart';
import 'package:customer_assist/home/presentation/controllers/header_controller.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/controllers/options_controller.dart';
import 'package:customer_assist/home/presentation/controllers/owner_data_controller.dart';
import 'package:customer_assist/home/presentation/controllers/shop_controller.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/sub_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/platform/platform.dart';

class RetailVertical extends StatefulWidget {
  const RetailVertical({super.key});

  @override
  State<RetailVertical> createState() => _RetailVerticalState();
}

class _RetailVerticalState extends State<RetailVertical> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void openDrawer() {
    print("DRAWER OPENED...!");
    scaffoldKey.currentState?.openDrawer();
  }

  double actualHeight = 0;
  var optionsController = Get.put(OptionsController());
  var guestCountryController = Get.put(GuestFetchCountryController());
  var fetchCountryController = Get.put(FetchCountryController());
  var languageController = Get.put(LanguageController());
  var addressController = Get.put(AddressController());
  var shopController = Get.put(ShopController());
  HeaderController headerController = Get.find();
  //var guestCountry = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: GetPlatform.isAndroid
    ?  const EdgeInsets.only(top: 5)
    : const EdgeInsets.only(),
      child: Column(
        children: [
          Container(
    
              // margin: const EdgeInsets.only(right: 2),
              height: MediaQuery.of(context).size.height * 0.043,
              width: MediaQuery.of(context).size.width * 0.99,
              color: AppColors.subHeaderContainer,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                     viewController.setView(COUNTRY);
                     headerController.setSubHeaderLabel('Select Your Country');
                     
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      child: RotatedBox(
                      
                          quarterTurns: DateTime.june,
                      child: optionsController.backNew),
                      ),
                  ),
                 const SizedBox(width: 90,),
                  SubHeader(),
                ],
              )),
          GetX<AddressController>(
              init: (addressController),
              initState: (_) {},
              builder: (_) {
                return SizedBox(
                    height: 810,
                    width: double.infinity,
                    //color: const Color.fromARGB(255, 210, 207, 207),
                    child: GridView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount:
                           optionsController.directAccess.length,
                            // guestCountryController
                            //     .guestfetchcountryResponse.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 25,
                          crossAxisSpacing: 20,
                          childAspectRatio: MediaQuery.of(context).size.width /
                              (MediaQuery.of(context).size.height / 2.9),
                        ),
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              addressController.retailResponse[index].status! ==
                                      '1'
                                  ? Container(
                                      height: 50,
                                      width: 50,
                                      margin:const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              colorFilter:  ColorFilter.mode(
                                                const  Color.fromARGB(
                                                          255, 251, 251, 251)
                                                      .withOpacity(0.2),
                                                  BlendMode.dstATop),
                                              image: NetworkImage(
                                                 addressController.retailResponse[index].verticalPath ?? ''),
                                              fit: BoxFit.fill)))
                                  : InkWell(
                                      onTap: () {
                                         print(addressController.retailResponse[
                                                                        optionsController
                                                                            .vertical]
                                                                    .id);
                                                                     addressController
                                                                      .updateVertical(
                                                                          //addedbysofiya mar 16
                                                                          addressController
                                                                              .retailResponse[
                                                                                  index]
                                                                              .base64Imageid!,
                                                                          languageController
                                                                              .languagenum
                                                                              .toString());
                                                                              if(addressController.retailResponse[index].base64Imageid == 83){
                                                                                 optionsController
                                              .changeVerticalRestaurent1('63', 0);
                                                                              }else if(addressController.retailResponse[index].base64Imageid == 27){
                                                                                 optionsController
                                              .changeVerticalRestaurent1('57', 0);
                                                                              }
                                                                              else if(addressController.retailResponse[index].base64Imageid == 29){
                                                                                 optionsController
                                              .changeVerticalRestaurent1('60', 0);
                                              }
                                                 shopController
                                                      .downloadRestaurantProduct(
                                                          languageController
                                                              .languagenum
                                                              .toString());
              
                                        
                                      },
                                      child: Container(
                                          height: 50,
                                          width: 50,
                                          margin: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  //colorFilter: new ColorFilter.mode(Color.fromARGB(255, 251, 251, 251).withOpacity(0.2), BlendMode.dstATop),
                                                  image: NetworkImage(
                                                      addressController.retailResponse[index].verticalPath ?? ''),
                                                  fit: BoxFit.fill))),
                                   ),
                             
                              addressController.retailResponse[index].status! ==
                                      '1'
                              ? Container(
                                  height: 35,
                                  width: 110,
                                  child: Center(
                                      child: Text(
                                   addressController.retailResponse[index].val ?? '',
                                    style: TextStyle(fontSize: 19,color: const Color.fromARGB(255, 146, 145, 141),overflow: TextOverflow.ellipsis),
                                  )
                                  ))
                                  : Container(
                                  height: 35,
                                  width: 110,
                                  child: Center(
                                      child: Text(
                                   addressController.retailResponse[index].val ?? '',
                                    style: TextStyle(fontSize: 19,overflow: TextOverflow.ellipsis),
                                  )
                                  ))
                            ],
                          );
                        }));
              })
        ],
      ),
    );
  }

  SizedBox iconSize(controller, int index) {
    return SizedBox(
      width: 50,
      height: 50,
      child: controller,
    );
  }
}
