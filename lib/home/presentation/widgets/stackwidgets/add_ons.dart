import 'package:customer_assist/core/app_constants.dart';
import 'package:customer_assist/home/presentation/controllers/add_cart_review_controller.dart';
import 'package:customer_assist/home/presentation/controllers/header_controller.dart';
import 'package:customer_assist/home/presentation/controllers/options_controller.dart';
import 'package:customer_assist/home/presentation/controllers/order_controller.dart';
import 'package:customer_assist/home/presentation/controllers/shop_controller.dart';
import 'package:customer_assist/home/presentation/controllers/view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/configure_controller.dart';

class AddOns extends StatefulWidget {
  final double actualHeight;
  const AddOns({Key? key, required this.actualHeight}) : super(key: key);
  @override
  State<AddOns> createState() => _AddOnsState();
}

class _AddOnsState extends State<AddOns> {
  ShopController shopController = Get.find();
  OptionsController optionsController = Get.find();
  ViewController viewController = Get.find();
  OrderController orderController = Get.find();
  AddCartReviewController addCartReviewController = Get.find();
  HeaderController headerController =Get.find();
  ConfigureController configureController = Get.find();
  var checklist ;
  var ListofController = <dynamic>[];
  @override
  void initState() {
    
    checklist = List.generate(
        shopController.addOns.value.length, (index) => false);

    print(checklist);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
             Center(
              child: Container(
                margin:const EdgeInsets.only(top:50),
                height: 600,
                width: 400,
                //color: Colors.white,
                decoration: BoxDecoration(
                  color:const Color.fromARGB(255, 250, 249, 249),
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10)
                  ),
                 
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
              
                        Container(
                          height: 55,
                          width: 380,
                           margin:const EdgeInsets.only(left:10,top:10),
                           decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 168, 167, 167),
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(5)
                      
                      ),
                      child:Row(
                        
                        children: [
                     const SizedBox(
                        height: 40,
                            width: 330,
                        child: Center(
                          child:  Text(
                              "ADD-ONS",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                                ),
                        ),
                      ),
                          
                            InkWell(
                              onTap: () {
                                viewController.setView(SELECTCATAGORYPAGE);
                                
                              },
                              child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: const Color.fromARGB(255, 246, 243, 243)),
                              ),
                              child: optionsController.delete,
                            ),
                            )
                            ]
                            
                      ),
                      
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin:const EdgeInsets.only(left:4,top:10),
                          height: 50,
                          width: 50,
                           decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 240, 226, 132),
                      border: Border.all(),)
                      
                        ),
                        Container(
                           margin:const EdgeInsets.only(top:10),
                          height: 50,
                           width: 260,
                           alignment: Alignment.centerLeft,
                           decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 240, 226, 132),
                      border: Border.all(),),
                      padding:const EdgeInsets.only(left: 5),
                      child:const Text('Item Name',
                       style: TextStyle(fontSize: 20),
                      ),
                        ),
                         Container(
                           margin:const EdgeInsets.only(top:10),
                          height: 50,
                           width: 80,
                            alignment: Alignment.centerLeft,
                           decoration: BoxDecoration(
                      color: const  Color.fromARGB(255, 240, 226, 132),
                      border: Border.all(),),
                        padding:const EdgeInsets.only(left: 20),
                      child:const Text('Price',
                       style: TextStyle(fontSize: 20),
                      ),
                        )
                      ],
                    ),
                    Container(
                      height: 400,
                        width: 390,
                      decoration: BoxDecoration(
                     
                      border: Border.all(),),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount:
                         shopController.addOns.value.length,
                        itemBuilder: (BuildContext context, int index){
                          print(shopController.addOns.length);
                          return Column(
                            children: [
                              Row(
                                children: [
                        Container(
                        
                          height: 50,
                          width: 50,
                           padding: const EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                            top: 10,
                                            bottom: 10),
                      //      decoration: BoxDecoration(
                     
                      // border: Border.all(width: 1,color:const Color.fromARGB(255, 146, 145, 145)),
                      
                     // ),
                       child: InkWell(
                        onTap: () {
                             print('------->${shopController.selectedList}');
                                        print('>>>>>>>>>${checklist[index]}');
                                        setState(() {
                                          if (checklist[index] == true) {
                                            shopController.selectedList
                                                .remove(index);
                                            checklist[index] = false;
                                          } else {
                                            shopController.selectedList
                                                .add(index);
                                            checklist[index] = true;
                                          }
                                        });
                                      
                        },
                         child: Container(
                                              // height: 3,
                                              // width: 30,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                    color: Colors.blueAccent),
                                              ),
                                              child: Icon(
                                          Icons.done,
                                          color: checklist[index] == true
                                              ? Colors.green
                                              : const Color.fromARGB(
                                                  255, 255, 255, 255),
                                          size: 25,
                                        ),
                                            ),
                       ),
                        ),
                        Container(
                          
                          height: 50,
                           width: 258,
                       alignment: Alignment.centerLeft,
                                      padding: const EdgeInsets.only(left: 5),
                           //decoration: BoxDecoration(
                      
                      //border: Border.all(width: 1,color:const Color.fromARGB(255, 146, 145, 145))
                      //),
                      child: Text(shopController.addOns.value[index].aDDONNAME!),
                        ),
                         Container(
                         
                          height: 50,
                           width: 80,
                         alignment: Alignment.centerRight,
                         padding: const EdgeInsets.only(right: 10),
                      //      decoration: BoxDecoration(
                      
                      // border: Border.all(width: 1,color:const Color.fromARGB(255, 146, 145, 145)),
                      // ), 
                      child: Text(
                        
                        shopController.addOns.value[index].aDDONPRICE!.toStringAsFixed(2)),
                        )
                      ],

                              )
                            ],
                          );
                        }
                        )
                    ),
                  const  SizedBox(
                      height: 10
                    ),
                 
                   InkWell(
                    onTap: ()async {
                      
                      
                    for (var temp in shopController.selectedList) {
                      
                    await addCartReviewController
                          .addToCartAddons(shopController.addOns[temp],
                          shopController
                                      .resitem[shopController
                                          .supercatagoryIndex.value]
                                      .category![shopController.catagoryIndex.value]
                                      .subcategory![shopController.subcatagoryIndex.value]
                                      .resSubcategory![shopController.itemIndex.value] 
                                      // ListofController[shopController.catagoryIndex
                                      // .value]
                       );
                    }
           
                       await addCartReviewController.getReviewCartItems(false);
                  headerController.subHeaderLabel(
                      configureController.subheaderResponse.value);
                      viewController.setView(REVIEWPAGE);
         
                    },
                  child:Container(
                      height: 50,
                             width: 100,
                             decoration: BoxDecoration(
                              color:const Color.fromARGB(255, 229, 227, 227),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(),),
                        child:const Center(
                          child: Text('DONE',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                     ),
                   )
                  ],
                )
                
               
                  )
                  )
                  ]);
  }
}