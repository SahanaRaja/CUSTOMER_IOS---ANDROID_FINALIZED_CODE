import 'package:customer_assist/home/presentation/controllers/guest_fetchCountry_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/app_constants.dart';
import '../../controllers/header_controller.dart';
import '../../controllers/view_controller.dart';

class FooterView extends StatefulWidget {
  const FooterView({Key? key}) : super(key: key);

  @override
  _FooterViewState createState() => _FooterViewState();
}

class _FooterViewState extends State<FooterView> {
  final HeaderController headerController = Get.find();
  final ViewController viewController = Get.find();
  var GuestCountryController = Get.put(GuestFetchCountryController());
  int index = 0;
  var timing = ''.obs;

  

  @override
  void initState() {
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetX<HeaderController>(
      init: HeaderController(),
      initState: (_) {},
      builder: (hController) {
        return InkWell(
          onTap: () {
            // hController.headerToggle('CCD','saha');
           hController.headerToggle(CLIENT, viewController.viewKey.value);
          },
          child: FittedBox(
            fit: BoxFit.cover,
            child: Text(
            
              
             hController.headerLabel.value,
             // timing.value,
              style: const TextStyle(
                  fontSize: 19, color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        );
      },
    );
  }
  
}
