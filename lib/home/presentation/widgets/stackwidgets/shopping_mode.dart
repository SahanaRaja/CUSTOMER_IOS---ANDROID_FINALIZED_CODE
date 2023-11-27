import 'package:customer_assist/core/helpers/SharedPreference/prefs.dart';
import 'package:customer_assist/home/presentation/controllers/configure_controller.dart';
import 'package:customer_assist/home/presentation/controllers/header_controller.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/controllers/options_controller.dart';
import 'package:customer_assist/home/presentation/controllers/owner_data_controller.dart';
import 'package:customer_assist/home/presentation/controllers/view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShoppingMode extends StatefulWidget {
  double actualHeight;
  ShoppingMode({Key? key, required this.actualHeight}) : super(key: key);

  @override
  State<ShoppingMode> createState() => _ShoppingModeState();
}

class _ShoppingModeState extends State<ShoppingMode> {
  OptionsController optionsController = Get.find();
  ViewController viewController = Get.find();
  HeaderController headerController = Get.find();
  LanguageController languageController = Get.find();
  AddressController addressController = Get.find();
  ConfigureController configureController = Get.find();

  
  int selectedContainerIndex = -1;

  void _selectContainer(int index) {
    setState(() {
      selectedContainerIndex = index;
    });
  }

  Color _getContainerColor(int index) {
    return selectedContainerIndex == index ? Colors.yellowAccent : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.056,
        ),
        Container(
          alignment: Alignment.centerLeft,
          width: 290,
          height: MediaQuery.of(context).size.height * 0.056,
          child: const Text(
            'Shopping Mode',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.056,
        ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () async {
                setState(() async {
                  _selectContainer(0);

                  optionsController.setShoppingMode('0');
                  Prefs.setShoppingMode('0');
                  Prefs.setDeliveryType('H');
                  optionsController.getShopFromHomeList(addressController
                      .retailResponse[optionsController.vertical].base64Imageid!
                      .toString());

                  configureController.shoppingMode(
                      '36', '36', languageController.languagenum.toString());

                  print('SHOP FROM HOME-->');
                });
              },
              child: Container(
                //added by saha
                margin: GetPlatform.isAndroid
                    ? const EdgeInsets.only(left: 20, top: 5, bottom: 10)
                    : const EdgeInsets.only(left: 30, top: 10, bottom: 15),
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                    color: _getContainerColor(0),
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
           const SizedBox(width: 30),
            Container(
              alignment: Alignment.centerLeft,
              //width: 150,
              height: MediaQuery.of(context).size.height * 0.056,
              child:const Text(
                'Shop From Home',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
           const SizedBox(width: 30),
            SizedBox(
              height: 55,
              width: 60,
              child: optionsController.sfhome,
            )
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.056,
        ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () async {
                setState(() async {
                  _selectContainer(1);

                  optionsController.setShoppingMode('1');
                  Prefs.setShoppingMode('1');
                  Prefs.setDeliveryType('S');
                  optionsController.getShopatStore(addressController
                      .retailResponse[optionsController.vertical].base64Imageid!
                      .toString());
                  configureController.shoppingMode(
                      '37', '37', languageController.languagenum.toString());

                  print('SHOP FROM STORE-->');
                });
              },
              child: Container(
                //added by saha
                margin: GetPlatform.isAndroid
                    ?const EdgeInsets.only(left: 20, top: 5, bottom: 10)
                    :const EdgeInsets.only(left: 30, top: 10, bottom: 15),
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                    color: _getContainerColor(1),
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
           const SizedBox(width: 30),
            Container(
              alignment: Alignment.centerLeft,
              //width: 150,
              height: MediaQuery.of(context).size.height * 0.056,
              child:const Text(
                'Shop At Store',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
           const SizedBox(width: 70),
            SizedBox(
              // margin: EdgeInsets.only(bottom: 5),
              height: 55,
              width: 60,
              child: optionsController.satstore,
            )
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.22,
        ),
        Container(
          width: 290,
          height: MediaQuery.of(context).size.height * 0.056,
          alignment: Alignment.centerLeft,
          child:const Text(
            '(The ICON Toggles)',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

 
}
