// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:customer_assist/core/app_constants.dart';
import 'package:customer_assist/home/presentation/controllers/header_controller.dart';
import 'package:customer_assist/home/presentation/controllers/options_controller.dart';
import 'package:customer_assist/home/presentation/controllers/owner_data_controller.dart';
import 'package:customer_assist/home/presentation/controllers/view_controller.dart';
import 'package:customer_assist/home/presentation/pages/home_page.dart';
import 'package:customer_assist/home/presentation/pages/icon_access_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomScreen extends StatefulWidget {
  const WelcomScreen({super.key});

  @override
  State<WelcomScreen> createState() => _WelcomScreenState();
}

double actualHeight = 0;

class _WelcomScreenState extends State<WelcomScreen> {
  var optionsController = Get.put(OptionsController());
  var viewController = Get.put(ViewController());
  var headerController = Get.put(HeaderController());
  var addressController = Get.put(AddressController());

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
  @override
  layoutWithoutHomeButton (BuildContext context) {
    return 
   Scaffold (
       resizeToAvoidBottomInset: true,
        body: SafeArea(
         bottom: false,
        child: Column(
          children: [
            Container(
              height: 935,
              padding: EdgeInsets.only(top: 300),
              child: Column(
                children: [
                  Text(
                    'Welcome to',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 15),
                    child: Text(
                      'Retail Resonance - Customer Application, a one stop solution for all your retail needs.  Order products sitting at the comfort of your home or purchase from the shop physically and self checkout without standing in the long queue at the till.',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 15, top: 15),
                    child: Text(
                      'In selected Retail Verticals, have immersive Augmented Reality experience of products before you buy',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 15, top: 15),
                    child: Text(
                      'Have the benefit of Artificial Intelligence assist you in your purchases and getting the best products at the best prices ',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 100,
                    // color: const Color.fromARGB(255, 116, 114, 114),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                             Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
                          },
                          child: Container(
                            height: 50,
                            width: 140,
                            //color: Color.fromARGB(255, 192, 191, 190),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 210, 208, 208),
                                border: Border.all(
                                    color: Color.fromARGB(255, 17, 138, 236),
                                    width: 2),
                                borderRadius: BorderRadius.circular(25)),
                            child: Center(
                                child: Text(
                              'CLOSE',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.center,
                            )),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                           // Navigator.of(context).pushNamedAndRemoveUntil('myMainPage', (r) => r == null);
                           // Navigator.push(context, HomePage());
                             Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
       );
                          //   viewController.setView(COUNTRY);
                          //   optionsController.setOptionList('');
                          //  optionsController.getBottomsIcons();
                          //   optionsController.setSetState();
                          //   optionsController.showImages();
                          //   optionsController.showShadow();
                          //   optionsController.setState();
                          //   headerController
                          //       .setSubHeaderLabel('Select Your Country');
                          },
                          child: Container(
                            height: 50,
                            width: 140,
                            //color: Color.fromARGB(255, 192, 191, 190),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 210, 208, 208),
                                border: Border.all(
                                    color: Color.fromARGB(255, 17, 138, 236),
                                    width: 2),
                                borderRadius: BorderRadius.circular(25)),
                            child: Center(
                                child: Text(
                              'SKIP',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.center,
                            )),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
