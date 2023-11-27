
import 'package:customer_assist/home/presentation/controllers/guest_fetchCountry_controller.dart';
import 'package:customer_assist/home/presentation/controllers/header_controller.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/controllers/options_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/app_colors.dart';
import '../../../features/data_download/download_assets/presentation/controllers/assets_download_controller.dart';
import '../controllers/owner_data_controller.dart';

class StaticPageTab extends StatefulWidget {
  const StaticPageTab({
    Key? key,
  }) : super(key: key);

  @override
  _StaticPageTabState createState() => _StaticPageTabState();
}

class _StaticPageTabState extends State<StaticPageTab> {
  
  double actualHeight = 0;
  var languageController = Get.put(LanguageController());
   var headerController = Get.put(HeaderController());
    var GuestCountryController = Get.put(GuestFetchCountryController());
    var optionsController = Get.put(OptionsController());
    var addressController = Get.put(AddressController());
   
  @override
  void initState() {
     languageController.languagefetch();
     //fetchData();
      // GuestCountryController.guestFetchCountryLogin();
     Get.put(AssetsDownloadController());
    // addressController.fetchVertical(languageController.languagenum.toString());
    //Prefs.firstTimeSplash.then((value) => {firstTime = value});
    // getBase64Image1();
    optionsController.getUserIcons();
    optionsController.getMenuBackIcons();

    super.initState();
  }

  @override
  void didChangeDependencies() {
    actualHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return layoutWithoutHomeButton(context);
  }

  layoutWithoutHomeButton(BuildContext context) {
    
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
            bottom: false,
            child: Column(
              children: [
                SizedBox(
                  height: GetPlatform.isAndroid
                      ? actualHeight - 40
                      : actualHeight - MediaQuery.of(context).padding.bottom,
                  child: Column(
                    children: [
                      // SizedBox(
                        
                      //   height: GetPlatform.isAndroid
                      //       ? (actualHeight / 16.5)* 1 - 13
                      //       : (actualHeight / 16.5) * 1 - 14,
                      //   width: double.infinity,
                      //   child: Column(
                      //     children: [
                      //       Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //         children: [
                      //           Container(
                      //               margin: const EdgeInsets.only(left: 1),
                      //               height: GetPlatform.isAndroid
                      //               ? MediaQuery.of(context).size.height *
                      //                   0.043
                      //               : MediaQuery.of(context).size.height *
                      //                   0.043,
                      //               width:  GetPlatform.isAndroid
                      //               ? MediaQuery.of(context).size.width *
                      //                   0.16
                      //             :  MediaQuery.of(context).size.width *
                      //                   0.16,
                      //               decoration: const BoxDecoration(),
                      //               child: Container(
                      //                 child: InkWell(
                      //                     child: SizedBox(
                      //                   height:GetPlatform.isAndroid
                      //                   ? MediaQuery.of(context).size.height *
                      //                           0.043
                      //                     :  MediaQuery.of(context).size.height *
                      //                           0.043,
                      //                   width:  GetPlatform.isAndroid
                      //               ? MediaQuery.of(context).size.width *
                      //                   0.10
                      //             :  MediaQuery.of(context).size.width *
                      //                   0.10,
                      //                 )),
                      //               )),
                      //           const SizedBox(
                      //             width: 0,
                      //           ),
                      //           Container(
                      //             margin: const EdgeInsets.only(right: 2),
                      //              height:GetPlatform.isAndroid
                      //                   ? MediaQuery.of(context).size.height *
                      //                           0.043
                      //                     :  MediaQuery.of(context).size.height *
                      //                           0.043,
                      //                   width:  GetPlatform.isAndroid
                      //               ? MediaQuery.of(context).size.width *
                      //                   0.5925
                      //             :  MediaQuery.of(context).size.width *
                      //                   0.5925,
                      //             // 
                      //             color: AppColors.headerContainer,
                                  
                      //             child: Center(
                                    
                      //                 child: FittedBox(
                      //                   child: GetX<HeaderController>(
                      //                           init: HeaderController(),
                      //                           initState: (_) {},
                      //                           builder: (_) {
                      //                             return Text(
                      //                               headerController
                      //                                   .headerLabel.value,
                      //                                   style: const TextStyle(
                      //                       fontSize: 19,
                      //                       color: Colors.white,
                      //                       fontWeight: FontWeight.bold),
                                                                          
                      //                             );
                      //                           },
                      //                         ),
                      //                 )),
                      //           ),
                      //           Container(
                      //               margin: const EdgeInsets.only(left: 5),
                      //               height: MediaQuery.of(context).size.height *
                      //                   0.043,
                      //               width: MediaQuery.of(context).size.width *
                      //                   0.16,
                      //               decoration: const BoxDecoration(),
                      //               child: Container(
                      //                 child: InkWell(
                      //                     child: SizedBox(
                      //                   height:
                      //                       MediaQuery.of(context).size.height *
                      //                           0.043,
                      //                   width:
                      //                       MediaQuery.of(context).size.width *
                      //                           0.16,
                      //                 )),
                      //               )),
                      //         ],
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // const SizedBox(
                      //  height: 5,
                     // ),
                      // SizedBox(
                       
                      //   height: GetPlatform.isAndroid
                      //       ? (actualHeight / 19.8)
                      //       : (actualHeight / 16.5) * 1 - 14,
                      //   width: double.infinity,
                      //   child: Column(
                      //     children: [
                      //       Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //         children: [
                      //           Container(
                      //               margin: const EdgeInsets.only(left: 1),
                      //               height: MediaQuery.of(context).size.height *
                      //                   0.043,
                      //               width: MediaQuery.of(context).size.width *
                      //                   0.16,
                      //               decoration: const BoxDecoration(
                                     
                      //               ),
                      //               child: Container(
                      //                 child: InkWell(
                      //                     child: SizedBox(
                      //                   height:
                      //                       MediaQuery.of(context).size.height *
                      //                           0.043,
                      //                   width:
                      //                       MediaQuery.of(context).size.width *
                      //                           0.10,
                      //                 )),
                      //               )),
                      //           const SizedBox(
                      //             width: 0,
                      //           ),
                      //           Container(
                      //             margin: const EdgeInsets.only(right: 2),
                      //             height: MediaQuery.of(context).size.height *
                      //                 0.043,
                      //             width: MediaQuery.of(context).size.width *
                      //                 0.5925,
                      //             color: AppColors.subHeaderContainer,
                      //             child: const Center(
                      //                 child: Text(
                      //               // languageController.languageResponse.value
                      //               //         .clientRegistration ??
                      //                   // '',
                      //                   'CUSTOMER APP',
                      //               style: TextStyle(
                      //                   fontSize: 23,
                      //                   // color:AppColors.headerContainer,
                      //                   color:Color.fromARGB(255, 79, 75, 75),
                      //                   fontWeight: FontWeight.bold),
                      //             )),
                      //           ),
                      //           Container(
                      //               margin: const EdgeInsets.only(left: 5),
                      //               height: MediaQuery.of(context).size.height *
                      //                   0.043,
                      //               width: MediaQuery.of(context).size.width *
                      //                   0.16,
                      //               decoration: const BoxDecoration(
                                     
                      //               ),
                      //               child: Container(
                      //                 child: InkWell(
                      //                     child: SizedBox(
                      //                   height:
                      //                       MediaQuery.of(context).size.height *
                      //                           0.043,
                      //                   width:
                      //                       MediaQuery.of(context).size.width *
                      //                           0.16,
                      //                 )),
                      //               )),
                      //         ],
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      //  SizedBox(
                      //     height: MediaQuery.of(context).size.height * 0.007),
                      Container(
                        height: 1,
                        width: double.infinity,
                        color: Colors.black,
                      ),
                     const Expanded(
                        child: Stack(
                          children: [
                            Column(
                             
                            
                              // List.generate(
                              //   12,
                              //   (index) => Container(
                              //     decoration: BoxDecoration(
                              //       border: Border(
                              //         bottom: BorderSide(
                              //           color: Colors.grey[400]!,
                              //           width: 0.5,
                              //         ),
                              //       ),
                              //     ),
                              //     height: 
                              //     GetPlatform.isAndroid
                              //         ? MediaQuery.of(context).size.height * 0.0595
                              //         : MediaQuery.of(context).size.height *
                              //             0.0595,
                              //   ),
                              // ),
                            ),
                               Padding(
                                padding: EdgeInsets.only(top:370,bottom:50),
                                child: Column(
                                  children:  [
                                    Center(
                                      child: SizedBox(
                                        height: 130,
                                        width:430,
                                      child: Image(
                                          fit: BoxFit.fill,
                                          image:
                                              AssetImage('assets/images/resonance.png'),
                                        ),
                                      ),
                                    ),
                                    // Center(
                                    //   child: Image(
                                    //     fit: BoxFit.fitWidth,
                                    //     image: AssetImage(
                                    //         'assets/images/retailEcoss.png'),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                          ],
                          
                        ),
                      ),

                      // Container(
                      //   height: 1,
                      //   width: double.infinity,
                      //   color: Colors.black,
                      // ),
                    //   Container(
                    //     padding: const EdgeInsets.only(top: 5, left: 5,bottom: 5),
                    //     child: StatefulBuilder(builder: (context, setState) {
                    //       return Container(
                    //         child: SizedBox(
                    //           height: 70,
                    //            width: MediaQuery.of(context).size.width,
                            
                    //           child: ListView.separated(
                    //             shrinkWrap: true,
                    //             scrollDirection: Axis.horizontal,
                    //             itemCount: 6,
                    //             itemBuilder: (context, index) {
                    //               return GestureDetector(
                    //                   onTap: () {},
                    //                   child: Container(
                    //                     width: 70,
                    //                       // padding: const EdgeInsets.only(
                    //                       //     top: 7, bottom: 7),
                    //                       // width: MediaQuery.of(context)
                    //                       //         .size
                    //                       //         .width *
                    //                       //     0.134,
                    //                       // height: MediaQuery.of(context)
                    //                       //         .size
                    //                       //         .height *
                    //                       //     0.062,
                    //                       decoration: BoxDecoration(
                    //                         borderRadius:
                    //                             BorderRadius.circular(10),
                    //                         border: Border.all(
                    //                             color: Colors.black, width: 1),
                    //                       )
                    //                       )
                    //                       );
                    //             },
                    //             separatorBuilder:
                    //                 (BuildContext context, int index) {
                    //               return const SizedBox(
                    //                 width: 10,
                    //               );
                    //             },
                    //           ),
                    //         ),
                    //       );
                    //     }),
                    //   ),
                     ],
                  ),
                ),
                Container(
                  width: double.infinity,
                color: const Color.fromRGBO(214, 214, 214, 1),
                  child: Column(
                    children: [
                      const SizedBox(height: 5),
                      Container(
                        // height: MediaQuery.of(context).size.height * 0.037,
                         height: GetPlatform.isAndroid
                      ? MediaQuery.of(context).size.height * 0.030
                      : MediaQuery.of(context).size.height * 0.030,
                          padding: GetPlatform.isAndroid
                      ? const EdgeInsets.only(top: 3)
                      : const EdgeInsets.only(),
                        width: double.infinity,
                        // padding: GetPlatform.isAndroid
                        //     ? EdgeInsets.fromLTRB(0, 8, 0, 0)
                        //     : EdgeInsets.fromLTRB(0, 6,0, 0),
                        alignment: Alignment.topCenter,
                        color: Colors.grey[350],
                        child: const FittedBox(
                          fit: BoxFit.fill,
                          child: Text(
                            '© - Copyright - Retail Resonance Pvt., Ltd. - All Rights Reserved',
                            style: TextStyle(
                              fontSize: 15,
                              color: Color.fromRGBO(94, 94, 94, 1),
                              fontFamily: 'OpenSans',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
 
}
