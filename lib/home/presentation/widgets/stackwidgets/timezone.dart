import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/app_constants.dart';
import '../../controllers/header_controller.dart';
import '../../controllers/view_controller.dart';

class TimerView extends StatefulWidget {
  const TimerView({Key? key}) : super(key: key);

  @override
  _TimerViewState createState() => _TimerViewState();
}

class _TimerViewState extends State<TimerView> {
  final HeaderController headerController = Get.find();
  final ViewController viewController = Get.find();
 

  

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
       
        //print(hController.headertime.value);
        return InkWell(
           onTap: () {
            // hController.headerToggle('CCD','saha');
           hController.headerToggle(CLIENT, viewController.viewKey.value);
          },
          child: FittedBox(
            fit: BoxFit.fill,
            child: Text(
            hController.headertime.value,
            
              style: const TextStyle(
                  fontSize: 19, color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        );
      },
    );
  }
  
}
