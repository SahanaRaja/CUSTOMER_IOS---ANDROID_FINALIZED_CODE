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
import 'package:customer_assist/home/presentation/widgets/stackwidgets/sub_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/platform/platform.dart';

class CountryFlag extends StatefulWidget {
  const CountryFlag({super.key});

  @override
  State<CountryFlag> createState() => _CountryFlagState();
}

class _CountryFlagState extends State<CountryFlag> {
  double actualHeight = 0;
  var optionsController = Get.put(OptionsController());
  var guestCountryController = Get.put(GuestFetchCountryController());
  var fetchCountryController = Get.put(FetchCountryController());
  var languageController = Get.put(LanguageController());
  var addressController = Get.put(AddressController());
  var headerController = Get.put(HeaderController());
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
              child: const Center(child: SubHeader())),
          GetX<GuestFetchCountryController>(
              init: (guestCountryController),
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
                            // optionsController.directAccess.length,
                            guestCountryController
                                .guestfetchcountryResponse.length,
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
                              guestCountryController
                                          .guestfetchcountryResponse[index]
                                          .countryFlagStatus! ==
                                      'N'
                                  ? Container(
                                      height: 50,
                                      width: 50,
                                      margin: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              colorFilter: new ColorFilter.mode(
                                                  Color.fromARGB(
                                                          255, 251, 251, 251)
                                                      .withOpacity(0.2),
                                                  BlendMode.dstATop),
                                              image: NetworkImage(
                                                  guestCountryController
                                                          .guestfetchcountryResponse[
                                                              index]
                                                          .countryFlag ??
                                                      ''),
                                              fit: BoxFit.cover)))
                                  : InkWell(
                                      onTap: () {
                                        print(guestCountryController
                                                .guestfetchcountryResponse[index]
                                                .countryFlagId ??
                                            '');
                                        fetchCountryController.fetchCountryLogin(
                                            guestCountryController
                                                .guestfetchcountryResponse[index]
                                                .COUNTRY_NAME!,
                                            languageController.languagenum
                                                .toString());
    
                                        Prefs.setGuestCountry(
                                            guestCountryController
                                                .guestfetchcountryResponse[index]
                                                .COUNTRY_NAME
                                                .toString());
                                        if (guestCountryController
                                                .guestfetchcountryResponse[index]
                                                .COUNTRY_CODE! ==
                                            '02') {
                                          optionsController
                                              .changeVerticalRestaurent1('7', 1);
                                        }else if(guestCountryController
                                                .guestfetchcountryResponse[index]
                                                .COUNTRY_CODE! ==
                                            '01'){
                                               optionsController
                                              .changeVerticalRestaurent1('3', 1);
    
                                        }else if(guestCountryController
                                                .guestfetchcountryResponse[index]
                                                .COUNTRY_CODE! ==
                                            '20'){
                                               optionsController
                                              .changeVerticalRestaurent1('17', 1);
    
                                        }
    
                                        viewController.setView(RETAILVERTICAL);
                                        headerController.setSubHeaderLabel(
                                            'Select a Retail Vertical');
                                      },
                                      child: Container(
                                          height: 50,
                                          width: 50,
                                          margin: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  //colorFilter: new ColorFilter.mode(Color.fromARGB(255, 251, 251, 251).withOpacity(0.2), BlendMode.dstATop),
                                                  image: NetworkImage(
                                                      guestCountryController
                                                              .guestfetchcountryResponse[
                                                                  index]
                                                              .countryFlag ??
                                                          ''),
                                                  fit: BoxFit.cover))),
                                    ),
                             
                              guestCountryController
                                          .guestfetchcountryResponse[index]
                                          .countryFlagStatus! ==
                                      'N'
                                  ? Container(
                                      height: 20,
                                      width: 110,
                                      child: Center(
                                          child: Text(
                                        guestCountryController
                                                .guestfetchcountryResponse[index]
                                                .COUNTRY_NAME ??
                                            '',
                                        style: TextStyle(
                                            fontSize: 19,
                                            color: const Color.fromARGB(
                                                255, 146, 145, 141),overflow: TextOverflow.ellipsis),
                                      )))
                                  : Container(
                                      height: 20,
                                      width: 110,
                                      child: Center(
                                          child: Text(
                                        guestCountryController
                                                .guestfetchcountryResponse[index]
                                                .COUNTRY_NAME ??
                                            '',
                                        style: TextStyle(
                                          fontSize: 19,overflow: TextOverflow.ellipsis
                                        ),
                                      )))
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
