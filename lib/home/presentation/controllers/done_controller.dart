// ignore_for_file: unrelated_type_equality_checks, invalid_use_of_protected_member

import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:customer_assist/core/app_constants.dart';
import 'package:customer_assist/home/presentation/controllers/guest_fetchCountry_controller.dart';
import 'package:customer_assist/home/presentation/controllers/header_controller.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/controllers/loading_controller.dart';
import 'package:customer_assist/home/presentation/controllers/menu_controller.dart';
import 'package:customer_assist/home/presentation/controllers/options_controller.dart';
import 'package:customer_assist/home/presentation/controllers/order_controller.dart';
import 'package:customer_assist/home/presentation/controllers/owner_data_controller.dart';
import 'package:customer_assist/home/presentation/controllers/payment_review_controller.dart';
import 'package:customer_assist/home/presentation/controllers/profile_controller.dart';
import 'package:customer_assist/home/presentation/controllers/reset_controller.dart';
import 'package:customer_assist/home/presentation/controllers/shop_controller.dart';
import 'package:customer_assist/home/presentation/controllers/view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/helpers/SharedPreference/prefs.dart';
import 'configure_controller.dart';
import 'first_time_user_controller.dart';
import 'keyboard_controller.dart';
import 'login_controller.dart';

class DoneController extends GetxController {
  ViewController viewController = Get.find();
  KeyboardController keyboardController = Get.find();
  LoginController loginController = Get.find();
  ResetController resetController = Get.find();
  FirstTimeUserController firstTimeUserController = Get.find();
  HeaderController headerController = Get.find();
  OptionsController optionsController = Get.find();
  MenuOptionController menuController = Get.find();
  OptionsController optionController = Get.find();
  PaymentReviewController reviewController = Get.find();
  LoadingController loadingController = Get.put(LoadingController());
  final TextEditingController stateController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController postalCode = TextEditingController();
  //OrderController orderController = Get.find();
  var shopController = Get.put(ShopController());
  var orderController = Get.put(OrderController());
  var guestfetchcountryController = Get.put(GuestFetchCountryController());

  var profileController = Get.put(ProfileController());
  var languageController = Get.put(LanguageController());
  var configureController = Get.put(ConfigureController());

  var browseMethod = 0;

  String hashedPassword = '';
  String hashedPassword1 = '';
  String hashedPassword2 = '';
  var otp = '';
  var zipcode = '';
  var superEmail = '';
  var operatorEmail = '';
  var delEmail = '';
  var audit = '';

  int index = 0;
  onDone() async {
    optionsController.customscroll.value = 'true';

    print("done${viewController.viewKey.value}");
    print(keyboardController.user.value.text);
    profileController.setProfileHeight(true);
    // // Prefs.verticalId.then((vertical) async => {
    // if (keyboardController.user.value.text != '' &&
    //     keyboardController.pass.value.text != '') {

    if (viewController.viewKey.value == CLIENTLOGIN) {
      if (keyboardController.user.value != '' &&
          keyboardController.pass.value.text != '') {
        loginController.login(
            keyboardController.user.value.text,
            keyboardController.pass.value.text,
            languageController.languagenum.toString());
        var pref = await SharedPreferences.getInstance();

        String mailid = keyboardController.user.value.text;
        await pref.setString("mail", mailid);

        String? storedmailCode = pref.getString("mail");
        print("Stored mail Code: $storedmailCode");
      } else {
        viewController.setErrorMessage(
            //languageController.languageResponse.value.password ??
            'Please Enter Password to proceed Furthur');
        viewController.setView(ERROR);
      }
    } else if (viewController.viewKey.value == ClIENTCHANGEPASSWORD) {
      //added by gowshika
      otp = '';
      for (var element in keyboardController.otpControllers.value) {
        otp = otp + element.text;
      }
      resetController.sentOTPVerify(
          keyboardController.createuser.value.text,
          otp,
          await Prefs.verticalId,
          'cp',
          '0',
          languageController.languagenum.toString());
    } else if (viewController.viewKey.value == CLIENTOTPVERIFIED) {
      if (keyboardController.resetpass.value.text != '' &&
          keyboardController.newpass.value.text != '') {
        hashedPassword = generateMd5(keyboardController.pass.value.text);
        hashedPassword1 = generateMd5(keyboardController.newpass.value.text);

        resetController.sendOTPPasswordUpdate(
            await Prefs.superUserEmailId,
            otp,
            await Prefs.verticalId,
            'cp',
            keyboardController.pass.value.text,
            keyboardController.newpass.value.text,
            viewController.useroption.value,
            '0',
            languageController.languagenum.toString());
        // }

        keyboardController.resetpass.value.text = '';
        keyboardController.newpass.value.text = '';
      }
    } else if (viewController.viewKey.value == FIRSTTIME) {
      print('inside');
      if (keyboardController.currentController.value != '' &&
          GetUtils.isEmail(keyboardController.currentController.value.text)) {
        print('inside1');
        viewController.setView(NEWUSEROTPSENT);
        headerController.setSubHeaderLabel(
            languageController.languageResponse.value.confirmMailId ?? '');
        firstTimeUserController.sentOTPUser(
            keyboardController.currentController.value.text,
            viewController.useroption.value,
            languageController.languagenum.toString());
      } else {
        viewController.setErrorMessage(
            languageController.languageResponse.value.enterMailToProceed ?? '');
        viewController.setView(ERROR);
      }
    } else if (viewController.viewKey.value == NEWUSEROTPSENT) {
      if (keyboardController.otpControllers.value != '') otp = '';
      {
        for (var element in keyboardController.otpControllers.value) {
          otp = otp + element.text;
        }
        firstTimeUserController.sentOTPUserVerify(
            keyboardController.createuser.value.text,
            otp,
            viewController.useroption.value,
            languageController.languagenum.toString());
        optionsController.optionIndexSetter(3);

        headerController.setSubHeaderLabel(
            languageController.languageResponse.value.createPassword ?? '');
        keyboardController.otpControllers.value.clear();
        // optionController.optionIndexSetter(3);
        //     optionsController.setSetState();
      }
    } else if (viewController.viewKey.value == NEWUSEROTPVERIFIED) {
      print("jkcdh");
      print(viewController.useroption.value);
      //if (viewController.useroption.value == CLIENT) {
      print("cbdjh");
      // hashedPassword = generateMd5(keyboardController.createpass.value.text);
      if (keyboardController.createuser.value.text != '') {
        // hashedPassword = generateMd5(keyboardController.createpass.value.text);
        firstTimeUserController.addUser(
            keyboardController.createuser.value.text,
            keyboardController.createuser.value.text,
            keyboardController.createpass.value.text,
            MANAGER,
            0,
            languageController.languagenum.toString());
        keyboardController.resetpass.value.clear();
        keyboardController.newpass.value.clear();
        keyboardController.createuser.value.clear();
        keyboardController.createpass.value.clear();
      } else {
        viewController.setErrorMessage(
            languageController.languageResponse.value.enterMailToProceed ?? '');
        viewController.setView(ERROR);
      }

      //}
    } else if (viewController.viewKey.value == FORGETPASSWORD) {
      if (keyboardController.otpControllers.value != '') otp = '';
      {
        for (var element in keyboardController.otpControllers.value) {
          otp = otp + element.text;
        }
        resetController.sentOTPVerify(
            keyboardController.createuser.value.text,
            otp,
            await Prefs.verticalId,
            'fp',
            '0',
            languageController.languagenum.toString());
        keyboardController.otpControllers.value.clear();
        keyboardController.resetpass.value.clear();
        keyboardController.newpass.value.clear();
      }
      //keyboardController.otpControllers.value.clear();
    } else if (viewController.viewKey.value == CLIENTFPOTPVERIFIED) {
      if (keyboardController.resetpass.value.text != '' &&
          keyboardController.newpass.value.text != '') {
        hashedPassword = generateMd5(keyboardController.resetpass.value.text);
        hashedPassword1 = generateMd5(keyboardController.newpass.value.text);
        resetController.fpUpdate(
            keyboardController.createuser.value.text,
            otp,
            keyboardController.newpass.value.text,
            // await Prefs.verticalId,
            'fp',
            '0',
            languageController.languagenum.toString());
        keyboardController.resetpass.value.clear();
        keyboardController.newpass.value.clear();
      } else {
        viewController.setErrorMessage(
            //languageController.languageResponse.value.enterMailToProceed ??
            'Please Enter Password to proceed Furthur ');
        viewController.setView(ERROR);
      }
    } else if (viewController.viewKey.value == MOBILENUMBER) {
      //added by saha
      if (keyboardController.currentController.value != '' &&
          GetUtils.isPhoneNumber(
              keyboardController.currentController.value.text)) {
        print("**********************************************");
        print(keyboardController.currentController.value.text);
        print("**********************************************");
        var pref = await SharedPreferences.getInstance();

        String mobileno = keyboardController.currentController.value.text;
        await pref.setString("mobile", mobileno);

        String? storedmobileCode = pref.getString("mobile");
        print("Stored mobile Code: $storedmobileCode");
        loginController.mobileLogin(
            keyboardController.currentController.value.text,
            languageController.languagenum.toString());
      } else {
        viewController.setErrorMessage(
            //languageController.languageResponse.value.enterMailToProceed ??
            'Please Enter Mobile Number to Proceed Furthur');
        viewController.setView(ERROR);
      }
    } else if (viewController.viewKey.value == MOBILEOTP) {
      if (keyboardController.otpControllers.value != '') {
        otp = '';
        // headerController.headerLabel('Guest Registration');
        for (var element in keyboardController.otpControllers.value) {
          otp = otp + element.text;
        }

        loginController.mobileOTP(
            await Prefs.mobile, otp, languageController.languagenum.toString());
        // if (otp == '123456') {
        //   viewController.setView(SPLASH);
        //   headerController.subHeaderLabel(CREDITS);
        // } else {
        //   viewController.setView(ERROR);
        //   viewController.setErrorMessage('Invalid OTP');
        // }
        keyboardController.otpControllers.value.clear();
        guestfetchcountryController
            .fetchzipcode(keyboardController.currentController.value.text);
      }
    }
    /*  else if (viewController.viewKey.value == OWNERDETAILS) {
      Prefs.setUserCity(
        GuestCountryController.zipcodeResponse.value.status!.cITY.toString(),
      );

      Prefs.setUserState(
        GuestCountryController.zipcodeResponse.value.status!.pROVIENCE
            .toString(),
      );
      addressController.updateAddress(
          await Prefs.mobile,
          firstName.text,
          lastNAme.text,
          area.text,
          mobile.text,
          add1.text,
          add2.text,
          '1',
          'y',
          GuestCountryController.zipcodeResponse.value.status!.aRea.toString(),
          postalCode.text,
          GuestCountryController.zipcodeResponse.value.status!.pROVIENCE
              .toString(),
          GuestCountryController.zipcodeResponse.value.status!.cITY.toString(),
          country.text,
          languageController.languagenum.toString());

      print('' + locality.text);
      
      print('onTap');
    }

*/

    //   else if (viewController.viewKey.value == OWNERDETAILS ||
    //   viewController.viewKey.value == ADDADDRESS ||
    //  viewController.viewKey.value == EDITADDRESS ) {
    //       if(keyboardController.controllersetupforguest == "zipcode"
    //         ){

    //           guestfetchcountryController.fetchzipcode(
    //             keyboardController.currentController.value.text
    //           );

    //       }

    //  }
    // else if (viewController.viewKey.value == CLIENTPROFILE) {
    //   if (keyboardController.controllersetupforguest == "zipcode") {
    //     guestfetchcountryController
    //         .fetchzipcode(keyboardController.currentController.value.text);
    //   }
    // } 
    else if (viewController.viewKey.value == SEARCHITEM) {
      if (keyboardController.controllersetupforguest == "Search") {
        shopController.downloadProductItem(
            keyboardController.currentController.value.text);

        // viewController.setView(SEARCHITEM);
        optionsController.optionIndexSetter(1);
        print(
            'searchcontroller.text----->${keyboardController.currentController.value.text}');
        print('-------->');
      }

      // headerController
      //     .subHeaderLabel(languageController.languageResponse.value.shopName);
    } else if (viewController.viewKey.value == 'Shopselectioncond') {
      if (keyboardController.controllersetupforguest == 'billcount') {
        keyboardController.listofguestmobile.value =
            keyboardController.currentController.value.text;
      } else if (keyboardController.controllersetupforguest == 'mobilenum') {
        optionsController.setSetState();
         viewController.setView(PRODUCTNEWPAGE);
                              viewController.setUserOption(GUEST);
                              headerController
                                  .setSubHeaderLabel('Main Category');
                                  keyboardController.setKeypad('');
        // headerController.setSubHeaderLabel(
        //     languageController.languageResponse.value.shop ?? '');
        // keyboardController.setEdit(false);
        // optionsController.getShopList();
        // optionsController.setOptionList(SHOP);
        // viewController.setUserOption(SHOP);
        // viewController.setView('');
        // optionsController.hideShadow();
        // keyboardController.setKeypad("");
        // optionsController.optionIndexSetter(-1);
        // optionsController.setSetState();
      }
    } else if (viewController.viewKey.value == SHOPATSTOREWEIGH) {
      viewController.setView(FREEFLOWSHOPPING);
      optionController.optionIndexSetter(2);
      optionController.setSetState();
    } else if (viewController.viewKey.value == PAYBYCASH) {
      //if(keyboardController.controllersetupforguest == "Search"){
      reviewController.setCashPaid(
          int.parse(keyboardController.currentController.value.text));
      print(keyboardController.currentController.value.text);
      //}
    } else if (viewController.viewKey.value == REVIEWSTORE) {
      if (keyboardController.controllersetupforguest == 'Storecomment') {
        print('??????????????????');
        print(keyboardController.currentController.value.text);
        var reviewid = await Prefs.reviewid;
        orderController.updatestoreReview(
            // orderController.fetchProductReviewResponse.value[index].reviewRemarks!,
            '4',
            keyboardController.currentController.value.text,
            reviewid.toString(),
            '5',
            //orderController.fetchProductReviewResponse.value[index].rating!.toString(),
            languageController.languagenum.toString());
      } else if (keyboardController.controllersetupforguest ==
          'productcomment') {
        var reviewid = await Prefs.reviewid;
        orderController.updateProductReview(
            '4',
            keyboardController.currentController.value.text,
            reviewid.toString(),
            '3',
            '1002',
            languageController.languagenum.toString());
      }
    } else if (viewController.viewKey.value == SHARE) {
      if (keyboardController.mobile.value != '' &&
          keyboardController.friendmobile.value.text != '') {
        print(
            "{{{{{{{{{{{}}}}}}}}}}}${keyboardController.friendname.value.text}");
        orderController.updateShare(
            await Prefs.mobile, keyboardController.friendmobile.value.text);
        //keyboardController.mobile.value.clear();
        keyboardController.friendmobile.value.clear();
        keyboardController.friendname.value.clear();
      }
    }
    /*  // changed by bhava
    else if (viewController.viewKey.value == BROWSEMETHODPICKER) {
      if (configureController.browsePicker[browseMethod].id == 1) {
        viewController.setView(PRODUCTNEWPAGE);
      } else if (configureController.browsePicker[browseMethod].id == 2) {
        viewController.setView(SELECTCATAGORYPAGE);
      }
    } */
  }

  String generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }

  bool validateStructure(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  //Adding the Prefix to the Country Code [001]//
  addCountryCode(number) {
    if (number < 10) {
      print("less than 100");
      return number = '00$number';
    } else if (number >= 10) {
      return number = '0$number';
    }
    // return (number < '100' ? '00' : '') + number;
  }
}
