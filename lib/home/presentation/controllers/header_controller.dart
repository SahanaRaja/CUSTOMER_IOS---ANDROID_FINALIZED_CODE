import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/app_constants.dart';

class HeaderController extends GetxController {
  var headerLabel = ''.obs;
  var headertime = ''.obs;
  var togglelabel = ''.obs;
  var subHeaderLabel = ''.obs;
  var subThirdHeaderLabel = ''.obs;
  var labelChange = false.obs;
  var timeChange = false.obs;
  var toggleList = ['headerLabel', 'appName', 'time'].obs;
 // var toggleList = ['headerLabel'].obs;
  var i = 0.obs;
  // Image? edit;
  // Image? save;

  @override
  void onInit() {
    periodicTime();
    periodicTime2();
    // getBase64ImageFlag();

    super.onInit();
  }

  periodicTime() {
    final String formattedDateTime =
        DateFormat('EEE,MMMM,dd,yyyy/HH:mm:ss').format(DateTime.now()).toString();
        //'EEE dd-MM-yyyy hh:mm:ss'
    headerLabel.value = formattedDateTime;

    Timer.periodic(const Duration(seconds: 1),(Timer t) {
      if (labelChange.value) {
        t.cancel();
      } else {
        _getTime();
      }  
    });
  }

  periodicTime2()async {

  Timer.periodic(const Duration(seconds: 1),(Timer t) {
      if (labelChange.value) {
        t.cancel();
      } else {
        _getTime2();
      }  
    });
  }
//  timezone(){
//   var selectedTime = Prefs.guestcountry;
//   headertime.value = selectedTime.toString();

//  }

  setHeaderLabel(String headerLabel) {
    this.headerLabel.value = headerLabel;
    labelChange.value = true;
    timeChange.value = true;
  }

  setSubHeaderLabel(String subHeaderLabel) {
    this.subHeaderLabel.value = subHeaderLabel;
  }

   setThirdHeaderLabel(String subThirdHeaderLabel) {
    this.subThirdHeaderLabel.value = subThirdHeaderLabel;
  }

  setlableChange() {
    labelChange.value = false;
    subHeaderLabel.value = '';
    periodicTime();
  }

  setTimeChange() {
    timeChange.value = false;
    subHeaderLabel.value = '';
    periodicTime2();
  }
  //  headerToggle(String label, String homeView) {
   
  //   setTimeChange();
  // }
  
  headerToggle(String label, String homeView) {
    if (i.value == 0 && homeView != '') {
      headerLabel.value = label;
      labelChange.value = true;
    } else if (i.value == 1) {
      headerLabel.value = APPNAME;
      labelChange.value = true;
    } else if (i.value == 2) {
      setTimeChange();
    }
    if (i.value < 2) {
      i.value++;
    } else {
      i.value = 0;
    }
  }

  void _getTime() {
    final String formattedDateTime =
        DateFormat('EEE,MMMM,dd,yyyy/HH:mm:ss').format(DateTime.now()).toString();
       
    headerLabel.value = formattedDateTime;
    

    
  } 
  void _getTime2()async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
    int storedValue = prefs.getInt('hOUR') ?? 0;
    int storedMins = prefs.getInt('mINS') ?? 0;
    String storedfunctions = prefs.getString('fUNCTION') ?? '';

    if(storedfunctions == '-'){
      final String formattedDateTime =
        DateFormat('EEE,MMMM,dd,yyyy/HH:mm:ss').format(DateTime.now().toUtc().subtract(Duration(hours: storedValue, minutes: storedMins))).toString();
        headertime.value = formattedDateTime;
        //print('subTime'+formattedDateTime);
    }else{
      final String formattedDateTime =
        DateFormat('EEE,MMMM,dd,yyyy/HH:mm:ss').format(DateTime.now().toUtc().add(Duration(hours: storedValue, minutes: storedMins))).toString();
        headertime.value = formattedDateTime;
        //print('addTime'+formattedDateTime);
       
    }
 } 

  

  getImagenBase64(value) {
    const Base64Codec base64 = Base64Codec();
    Uint8List bytes = base64.decode(value);
    return Image.memory(
      bytes,
      height: 10,
      width: 20,
    );
  }
}
