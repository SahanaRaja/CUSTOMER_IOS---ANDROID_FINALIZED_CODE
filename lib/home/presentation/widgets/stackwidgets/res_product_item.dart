
import 'package:customer_assist/core/app_colors.dart';
import 'package:customer_assist/core/app_constants.dart';
import 'package:customer_assist/home/data/shopcoupon/models/shopping_products_model/subcategory.dart';
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

class ProductItemRespage extends StatefulWidget {
  double actualHeight;

  ProductItemRespage({Key? key, required this.actualHeight}) : super(key: key);

  @override
  State<ProductItemRespage> createState() => _ProductItemRespageState();
}

class _ProductItemRespageState extends State<ProductItemRespage> {
  ShopController shopController = Get.find();
  ViewController viewController = Get.find();
  OptionsController optionsController = Get.find();
  HeaderController headerController = Get.put(HeaderController());
  ConfigureController configureController = Get.put(ConfigureController());
  LanguageController languageController = Get.find();
  List<bool> categoryList = [];
  Subcategory? subcatagoryValue;

  @override
  void initState() {
    optionsController.screenconfig = '';
    optionsController.productconfig = '';

    //  subcatagoryValue = shopController
    //       .catagory[shopController.subcatagoryPageIndex.value].subcategory![0];
    // categoryList =

    //     List.generate(shopController.subcategory.value.length, (index) => false);
    // print('------>'+ shopController.subcategory.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    

    return Stack(
      children: 
        [
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
              child: Row(
               
                children: [
                  InkWell(
                    onTap: () {
                     viewController.setView(PRODUCTSUBCATEGORY);
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      child: RotatedBox(
                      
                          quarterTurns: DateTime.june,
                      child: optionsController.backNew),
                      ),
                  ),
                    SizedBox(width: 100,),
                  Container(
                    width: 250,
                    child: SubHeader()),
                ],
              )
              ),
             
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
                        15.4,
                width: 475,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  color: Colors.white
                ),
                child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                         height: GetPlatform.isAndroid
                                        ? MediaQuery.of(context).size.height * 0.050
                                        : MediaQuery.of(context).size.height *
                                            0.0595,
                        //margin: EdgeInsets.only(left: 10, top: 10),
                        child: Container(
                           margin: GetPlatform.isAndroid
                                 ? const EdgeInsets.only(left: 10 ,top: 5,bottom:10)
                                 : const EdgeInsets.only(left: 10 ,top: 10,bottom:15),
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 247, 213, 111),
                            border: Border.all(),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: Offset(4, 4))
                            ]),
                      ),),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: Text(
                            
                                // : optionsController.screenconfig == 'SUBCATEGORY'
                                //     ? optionsController.productconfig ==
                                //             'productconfig'
                                         shopController
                                            .resitem[shopController
                                                .supercatagoryIndex.value]
                                            .category![
                                                shopController.catagoryIndex.value]
                                            .subcategory![shopController
                                                .subcatagoryIndex.value]
                                            .subcategoryName!,
                                        //  shopController
                                        //     .resitem[shopController
                                        //         .supercatagoryIndex.value]
                                        //     .category![
                                        //         shopController.catagoryIndex.value]
                                        //     .categoryName!,
                                    // : shopController
                                    //     .resitem[
                                    //         shopController.supercatagoryIndex.value]
                                    //     .supercategoryName!,
                            style: const TextStyle(fontSize: 20),
                          ))
                    ],
                  ),
                  //const SizedBox(height: 2),
                  //added by saha
                   SizedBox(
                
                    height:  GetPlatform.isAndroid
                    ? 5
                    : 6),
                  SizedBox(
                     height: GetPlatform.isAndroid
                    ? (widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                  17.9 *
                  13.5
                    : (widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                  17.9 *
                  13.5,
                      //height: MediaQuery.of(context).size.height * 0.6,
                      
                      child: ListView.builder(
                          shrinkWrap: true,
                          //addedbysofiya
                          itemCount: 
                          // optionsController.outlet == '63' 
                         
                                  
                            
                               shopController
                                          .resitem[shopController
                                              .supercatagoryIndex.value]
                                          .category![
                                              shopController.catagoryIndex.value]
                                          .subcategory![shopController.subcatagoryIndex.value]
                                          .resSubcategory!.length,
                             
                              
                                 
                          itemBuilder: (context, index) {
                            return Column(
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(children: [
                                  InkWell(
                                    onTap: () {
                                      
                            shopController.setItemIndex(index);
                           // optionsController.optionIndexSetter(4);
                            optionsController.setSetState();
                            viewController.setView(PRODUCT);
                             configureController.subheaderResponse.value = shopController
                                              .resitem[shopController
                                                          .supercatagoryIndex.value]
                                              .category![shopController
                                                  .catagoryIndex.value]
                                              .subcategory![shopController
                                                  .subcatagoryIndex.value]
                                              .resSubcategory![index].productName
                                              .toString();
                                              headerController.setSubHeaderLabel(configureController.subheaderResponse.value);
                          
                                    },
                                    //added by sahana
                                    child: SizedBox(
                                      height: GetPlatform.isAndroid
                                        ? MediaQuery.of(context).size.height * 0.050
                                        : MediaQuery.of(context).size.height *
                                            0.0580,
                                    
                                    child: Container(
                                      //added by sahana
                                       margin: GetPlatform.isAndroid
                                 ?const EdgeInsets.only(left: 30 ,bottom:15)
                                 :const EdgeInsets.only(left: 30 ,bottom:20,top:5),
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(255, 250, 247, 247),
                                          border: Border.all(),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.grey,
                                                spreadRadius: 1,
                                                blurRadius: 1,
                                                offset: Offset(4, 4))
                                          ]),
                                    ),)
                                  ),
                                  const SizedBox(width: 20),
                                  Container(
                                    //added by saha
                                    padding: const EdgeInsets.only(top: 10),
                                    //  padding: EdgeInsets.only(top: 25)
                                    height: 50,
                                    width: MediaQuery.of(context).size.width * 0.8,
                                    // child:FittedBox(
                                    //   fit: BoxFit.contain,
                                    child: Text(
                                      
                                           shopController
                                                      .resitem[shopController
                                                          .supercatagoryIndex.value]
                                                      .category![shopController
                                                          .catagoryIndex.value]
                                                      .subcategory![shopController
                                                          .subcatagoryIndex.value]
                                                      .resSubcategory![index]
                                                      .productName!.toString(),
                                          
                                          
                                      style: const TextStyle(fontSize: 20, overflow: TextOverflow.ellipsis),
                                    ),
                                  )
                                ]),
                              ],
                            );
                          }))
                ],
                                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
