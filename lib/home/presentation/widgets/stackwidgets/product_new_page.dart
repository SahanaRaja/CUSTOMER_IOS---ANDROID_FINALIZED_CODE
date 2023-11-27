// ignore_for_file: unrelated_type_equality_checks


import 'package:customer_assist/core/app_colors.dart';
import 'package:customer_assist/core/app_constants.dart';
import 'package:customer_assist/home/data/shopcoupon/models/shopping_products_model/subcategory.dart';
import 'package:customer_assist/home/presentation/controllers/add_cart_review_controller.dart';
import 'package:customer_assist/home/presentation/controllers/configure_controller.dart';
import 'package:customer_assist/home/presentation/controllers/header_controller.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/controllers/options_controller.dart';
import 'package:customer_assist/home/presentation/controllers/shop_controller.dart';
import 'package:customer_assist/home/presentation/controllers/view_controller.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/first_row_widget.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/sub_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:customer_assist/home/data/shopcoupon/models/shopping_products_model/item.dart';

class ProductNew extends StatefulWidget {
  double actualHeight;
  ProductNew({Key? key, required this.actualHeight}) : super(key: key);

  @override
  State<ProductNew> createState() => _ProductNewState();
}

class _ProductNewState extends State<ProductNew> {
  ConfigureController configureController = Get.find();
  ViewController viewController = Get.find();
  AddCartReviewController addCartReviewController = Get.find();

  OptionsController optionsController = Get.find();
  ShopController shopController = Get.find();
  HeaderController headerController = Get.put(HeaderController());
  LanguageController languageController =  Get.find();
  int item = 0;
  int currentItemIndex = 0;
  //int currentItemIndex = 0;
  Item? categoryName;
  Item? value;
  Subcategory? subcatagoryValue;
  final List<ScrollController> _controller =
      List.generate(200, (index) => ScrollController());

  var selectedIndex = -1;
  Color containerColor = Colors.white;
  List<bool> categoryList = [];
  int listindex = 0;
  bool click = true;
  // changed by bhava
  var browseMethod = 0;
  @override
  void initState() {
    print('------>${shopController.catagory}');
    // asyncker();
    super.initState();
  }

  // asyncker() async {
  //   await getdata();
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
      Padding(
         padding: GetPlatform.isAndroid
         ?const EdgeInsets.only(top: 5)
         :const EdgeInsets.only(),
        child: Column(
          children: [
            Container(
      
              // margin: const EdgeInsets.only(right: 2),
             height: MediaQuery.of(context).size.height * 0.043,
              width: MediaQuery.of(context).size.width * 0.99,
              color: AppColors.subHeaderContainer,
              child: const Center(child: SubHeader())),
            // FirstRowWidget(actualHeight: widget.actualHeight, header: 'Main Category', arrow: false),
           // const SizedBox(height:5),
            Container(
                padding: const EdgeInsets.only(right: 3),
                height: GetPlatform.isAndroid
                    ? (widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                        17.9 *
                        14.9
                    //) * 0.75
                    : (widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                        17.9 *
                        15.5,
                width: 475,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  color: Colors.white
                ),
                child: RawScrollbar(
                    thumbVisibility: true,
                    thickness: 15,
                    thumbColor: const Color.fromARGB(255, 68, 144, 243),
                    trackVisibility: true,
                    trackRadius: const Radius.circular(85),
                    trackColor: const Color.fromARGB(255, 146, 146, 146),
                    radius: const Radius.circular(85),
                    child: ListView.builder(
                        shrinkWrap: true,
                        //addedbysofiya
                        itemCount: optionsController.outlet == '57' 
                        // ||
                        //         optionsController.outlet == '202'
                            ? shopController.resitem[0].category!.length 
                           : shopController.resitem.length,
                            
                            
                        itemBuilder: (context, index) {
                          print(listindex);
                          print(index);
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      listindex = index + 1;
                                      print(listindex);
                                    });
                                    // By changing the colour, you can identify which one has been chosen.
                                    viewController.setlistindex(index + 1); 
                                   if(optionsController.outlet == '63' ){
                                    shopController.setsupercatagoryIndex(index);
                                    optionsController.setSetState();
                                    viewController.setView(PRODUCTSUBCATEGORY);
                                    configureController.subheaderResponse.value = shopController
                                            .resitem[index].supercategoryName!.toString();
                                            headerController.setSubHeaderLabel(configureController.subheaderResponse.value);

                                   }else{
                                    shopController.setCatagoryIndex(index);
                                    optionsController.setSetState();
                                    viewController.setView(PRODUCTSUBCATEGORY);
                                    configureController.subheaderResponse.value = shopController
                                            .resitem[0].category![index].categoryName!.toString();
                                            headerController.setSubHeaderLabel(configureController.subheaderResponse.value);
                                    

                                   }
                                    
                                    // ||
                                    //         optionsController.outlet == '202'
                                      
      
                                   
                                    
                                    
                                       
                                   
                                  },
                                  //added by saha
                                  child: SizedBox(
                                      height: GetPlatform.isAndroid
                                          ? MediaQuery.of(context).size.height * 0.050
                                          : MediaQuery.of(context).size.height *
                                              0.056,
                                   
                                   // margin: EdgeInsets.only(left: 20, top: 20),
                                   child: Container(
                                   //added by saha
                                    margin: GetPlatform.isAndroid
                                   ? const EdgeInsets.only(left: 20 ,top: 5,bottom: 10)
                                   : const EdgeInsets.only(left: 20 ,top: 10,bottom: 15),
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                        color: (index == viewController.listindex - 1)
                                            ? const Color.fromARGB(255, 247, 213, 111)
                                            : Colors.white,
                                        border: Border.all(),
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.grey,
                                              spreadRadius: 1,
                                              blurRadius: 1,
                                              offset: Offset(4, 4))
                                        ]),
                                  ),
                                  )
                                ),
                                const SizedBox(width: 35),
                                Container(
                                  //added by saha
                                  padding: GetPlatform.isAndroid
                                  ? const EdgeInsets.only(top: 15)
                                  :  const EdgeInsets.only(top: 15),
                                  //padding: EdgeInsets.only(top: 25),
                                  height: GetPlatform.isAndroid
                                 ? 50
                                 : 50,
                                  //color: Colors.amber,
      
                                  child: Text(
                                    //addedbysofiya
                                    optionsController.outlet == '63' 
                                    // ||
                                    //         optionsController.outlet == '202'
                                        ? shopController
                                            .resitem[index].supercategoryName!
                                            .toString()
                                        
                                        :shopController
                                            .resitem[0].category![index].categoryName! ,
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                )
                              ]),
                            ],
                          );
                        }))),
          ],
        ),
      )
    ]);
  }

  // changed by bhava
  // getdata() {
  //   if (configureController.browsePicker[browseMethod].id == 1) {
  //     viewController.setView('PRODUCTNEWPAGE');
  //   } else if (configureController.browsePicker[browseMethod].id == 2) {
  //     viewController.setView('SELECTCATAGORYPAGE');
  //   } else {
  //     Container();
  //   }
  // }
}
