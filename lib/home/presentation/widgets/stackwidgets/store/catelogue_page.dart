import 'package:customer_assist/home/presentation/controllers/configure_controller.dart';
import 'package:customer_assist/home/presentation/controllers/header_controller.dart';

import 'package:customer_assist/home/presentation/controllers/shop_controller.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/first_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CateloguePage extends StatefulWidget {
  double actualHeight;
  CateloguePage({
    Key? key,
    required this.actualHeight,
  }) : super(key: key);

  @override
  State<CateloguePage> createState() => _CateloguePageState();
}

class _CateloguePageState extends State<CateloguePage> {
  HeaderController headerController = Get.find();
  ConfigureController configureController = Get.find();
  ShopController shopController = Get.find();
  double actualHeight = 0;
  int listindex = 0;
   var divide = '/';
   var checklist;
 var ListofController = <dynamic>[];

   @override
   void initState() {
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
    
      shopController.productdisplay.clear();
    
      checklist = List.generate(
        shopController.productitem.length, (index) => false);

      
   
   
    super.initState();
   }
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
          // color: Colors.red,
          width: MediaQuery.of(context).size.width,
          // height: widget.actualHeight * 0.75,
           height: GetPlatform.isAndroid
                  ? (widget.actualHeight - 40) /17.9 *
                      14.5
                  // 1.37
                  // 18.1
                  : (widget.actualHeight -
                          MediaQuery.of(context).padding.bottom) /
                      17.9 *
                      14.5,
          child: Stack(alignment: Alignment.topCenter, children: [
            Column(children: [
              FirstRowWidget(
                  actualHeight: widget.actualHeight,
                  header: headerController.subThirdHeaderLabel('Items'),
                  arrow: false),
              const SizedBox(
                height: 2,
              ),
              Stack(children: [
                Container(
                    margin: const EdgeInsets.only(left: 2, right: 2),
                    height: GetPlatform.isAndroid
                        ? (widget.actualHeight - 40) / 1.37
                        // 18.1
                        : (widget.actualHeight -
                                MediaQuery.of(context).padding.bottom) /
                            17.9 *
                            13.3,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1), color: Colors.white),
                    child: ListView.builder(
                        itemCount: 
                         shopController.productitem.length,
                       
                        
                        itemBuilder: (BuildContext context, int index) {
                          //print(orderController.whishlistResponse.value.length);
                          return Column(
                              //crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(top: 2, bottom: 2),
                                  height: 170,
                                  width: 465,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                      ),
                                      color: Colors.white,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(25))),
                                  child: Row(
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(8),
                                            margin: const EdgeInsets.only(
                                                left: 5, top: 7),
                                            height: 150,
                                            width: 150,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.black,
                                                ),
                                                color: Colors.white,
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(25))),
                                            child: Image.network(
                                                     shopController
                                                    .productitem[index]
                                                    .imageUrl!
                                                ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.only(top: 9),
                                                height: 55,
                                                width: 150,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                child: Center(
                                                  child: FittedBox(
                                                    fit: BoxFit.fill,
                                                    child: Text(
                                                     shopController
                                                                .productitem[
                                                                    index]
                                                                .categoryname!,
                                                                          
                                                      style:
                                                          const TextStyle(fontSize: 18,overflow: TextOverflow
                                                            .ellipsis,),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Container(
                                                  height: 40,
                                                  width: 130,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  child: Center(child: 
                                                  Text(shopController.productitem[index].subcategoryName!,
                                                  style:
                                                        const TextStyle(fontSize: 18,overflow: TextOverflow
                                                            .ellipsis,),)),
                                                  ),
                                                  
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                  margin:
                                                      const EdgeInsets.only(top: 5),
                                                  height: 40,
                                                  width: 90,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      shopController
                                                              .productitem[
                                                                  index]
                                                              .productCode!,
                                                      style: const TextStyle(
                                                        fontSize: 15,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                     //maxLines: 2,
                                                    ),
                                                  )),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Container(
                                                  margin:
                                                      const EdgeInsets.only(top: 5),
                                                  height: 40,
                                                  width: 190,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      shopController
                                                              .productitem[
                                                                  index]
                                                              .productName! ,
                                                      style: const TextStyle(
                                                        fontSize: 17,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                     // maxLines: 2,
                                                    ),
                                                  )),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                  margin:
                                                      const EdgeInsets.only(top: 5),
                                                  height: 40,
                                                  width: 90,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      shopController
                                                              .productitem[
                                                                  index]
                                                              .uom!,
                                                      style: const TextStyle(
                                                          fontSize: 15,overflow: TextOverflow
                                                            .ellipsis,),
                                                    ),
                                                  )),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Container(
                                                  margin:
                                                      const EdgeInsets.only(top: 5),
                                                  height: 40,
                                                  width: 135,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      shopController
                                                          .productitem[index]
                                                          .productMrp!
                                                          .toString()+ divide + shopController
                                                          .productitem[index]
                                                          .productRate!
                                                          .toString(),
                                                      style: const TextStyle(
                                                        fontSize: 15,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                      maxLines: 2,
                                                    ),
                                                  )),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              InkWell(
                                                onTap: ()async {
                                                  setState(() {

                                              if (checklist[index] == true) {
                                                shopController
                                                    .productdisplay
                                                    .remove(shopController
                                                        .productitem
                                                        [index]);
                                                checklist[index] = false;
                                              } else {
                                                shopController
                                                    .productdisplay
                                                    .add(shopController
                                                        .productitem
                                                        [index]);
                                                checklist[index] = true;
                                                //
                                              }
                                             // viewController.setView(SEARCHITEM);
                                              configureController
                                              .subthirdheaderResponse
                                              .value =
                                          shopController
                                              .productitem[index]
                                              .productName!.toString();
                                              headerController.setThirdHeaderLabel(configureController
                                              .subthirdheaderResponse
                                              .value);
                                              
                                           });
                                                },
                                                child: Container(
                                                  margin:
                                                      const EdgeInsets.only(top: 5),
                                                  height: 35,
                                                  width: 35,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  child: Container(
                                                    color: 
                                                    (checklist[index] == true)
                                                        ? Colors.yellowAccent
                                                        : Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ]);
                        }))
              ])
            ])
          ]))
    ]);
  }
}
