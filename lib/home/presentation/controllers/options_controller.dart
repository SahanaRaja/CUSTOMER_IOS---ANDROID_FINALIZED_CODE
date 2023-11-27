import 'dart:convert';
import 'dart:typed_data';

import 'package:customer_assist/home/presentation/controllers/view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/helpers/SharedPreference/prefs.dart';
import '../../../database/database.dart';

class OptionsController extends GetxController {
  var optionsKey = ''.obs;
  var mainOptions = [].obs;
  var useroption = [].obs;
  var managerOptions = [].obs;
  var guestOption = [].obs;
  var directAccess = [].obs;

  var countryDirectAccess = [].obs;
  var guestDirectAccess = [].obs;
  var clientDirectAccess = [].obs;
  var supportDirectAccess = [].obs;
  var browseOption = [].obs;
  var shoppingList = [].obs;
  var settinglist = [].obs;
  var shopatStore = [].obs;
  var newOrderList = [].obs;
  var reviewList = [].obs;
  var calclist = [].obs;
  var shoppingListChange = [].obs;
  var blankOptions = [].obs;
  var userSetting = [].obs;
  var screenconfig = '';
  var productconfig = '';
  var registerlist = [].obs;
  var wishList = [].obs;
  var supportlist = [].obs;
  var currentlist = [].obs;
  var browseoption = [].obs;
  var addressBook = [].obs;
  var reviewpage = [].obs;
  var arexperience = [].obs;
  var bottomicons = [].obs;
  var bottomicons2 = [].obs;
  var paymodeicons = [].obs;
  var vertical = 0;

  final _optionsView = ''.obs;
  String get optionsView => _optionsView.value;

  final _subOptionsView = ''.obs;
  String get subOptionsView => _subOptionsView.value;
  final _subOptionIndex = 10.obs;
  int get subOptionIndex => _subOptionIndex.value;
  final _optionIndex = 10.obs;
  int get optionIndex => _optionIndex.value;
  var isShow = false.obs;
  var isShadow = false.obs;
  var setState = false.obs;
  Image? edit;

  Image? timer;
  Image? cart;
  Image? refreshIcon;
  Image? downarrow;
  Image? uparrow;
  Image? home;
  Image? increase;
  Image? decrease;
  Image? weighItem;
  Image? filterIcon;
  Image? arrowBackactivenew;
  Image? delete;
  Image? reorder;
  Image? backnew;
  Image? send;
  Image? addons;
  // Image? arexp;
  Image? browse;
  Image? calculate;
  Image? catalog;
  Image? client;
  Image? cursettings;
  Image? fromehome;
  Image? guest;
  Image? login;
  Image? logout;
  Image? manage;
  Image? marketplace;
  Image? retailvertical;
  Image? review;
  Image? shop;
  Image? flag;
  Image? newdropdown;
  Image? newdropup;

  // added by bhava
  Image? icarrowredright;
  Image? icarrowredleft;
  Image? icarrowgreenright;
  Image? icarrowgreenleft;
// Addedbysofiya
  Image? addressbookHome;
  Image? addressbookWork;
  Image? addressbookEdit;
  Image? addressbookDelete;
  Image? registeraccess;
  Image? countryaccess;
  Image? expertaccess;
  Image? blankaccess;
  Image? changepassaccess;
  Image? chattyaccess;
  Image? summaryaccess;
  Image? supportaccess;
  Image? resourcessaccess;
  Image? tcaccess;
  Image? settingsaccess;
  Image? faqaccess;
  Image? addressbook;
  Image? shopatstore;
  Image? communicate;
  Image? sfhome;
  Image? satstore;
  Image? homedelivery;
  Image? pickupshop;
  Image? arrowfrwd;
  Image? chatty;
  Image? browsenew;
  Image? arrow;
  Image? logOut;

  Image? support;
  Image? addon;
  Image? subscription;
  Image? share;
  Image? coupons;
  Image? calculator;
  Image? logIn;
  Image? exptvw;
  Image? faq;
  Image? resrcs;
  Image? tandc;
  Image? family;
  Image? arexp;
  Image? mrktplce;
  Image? usrsetings;
  Image? profile;
  Image? password;
  Image? feedback;
  Image? language;
  Image? register;
  Image? addbook;
  Image? addbookdelete;
  Image? shops;
  Image? backtriangle;
  Image? backNew;
  Image? timerNew;
  Image? oldorder;
  Image? neworder;
  Image? pendingorder;
  Image? shoppinglist;
  Image? wishlist;
  Image? reviewcart;
  Image? save;
  Image? plus;
  Image? minus;
  Image? weighscale;
  Image? arrowup;
  Image? arrowdown;


  String outlet = '';
  late Image users;
  late Image menuBack;
  var isActiveOption = false.obs;
  ViewController viewController = Get.find();
  var shoppingMode = ''.obs;
  var customscroll = 'true'.obs;
  var isvisible = 'true'.obs;

  initImage() {
    getMainOptions();
    //guestImageList();
    getClientOptions();
    getUserIcons();
    getMenuBackIcons();
    getBlankOptions();
    getBase64ImageFlag();
    getCountryAccess();
    getGuestAccess();
    getClientAccess();
    getSupportAccess();
    directAccessIcon();
  }

  showImages() {
    isShow.value = true;
  }

  hideImages() {
    isShow.value = false;
  }

  showShadow() {
    isShadow.value = true;
  }

  hideShadow() {
    isShadow.value = false;
  }

  setSetState() {
    setState.value = true;
    setState.value = false;
  }

  Image getImagenBase64(String imageBase64) {
    const Base64Codec base64 = Base64Codec();
    Uint8List bytes = base64.decode(imageBase64);
    // print('@%&@');
    // log(_imageBase64.toString());
    return Image.memory(
      bytes,
      height: 25,
      width: 25,
    );
  }

  getBase64ImageFlag() {
    getImage('78').then((value) {
      edit = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return edit;
    });
    getImage('1').then((value) {
      flag = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return flag;
    });
    getImage('75').then((value) {
      arrowfrwd = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return arrowfrwd;
    });

    getImage('66').then((value) {
      timer = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return timer;
    });
    getImage('3').then((value) {
      cart = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return cart;
    });
    getImage('70').then((value) {
      downarrow = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return downarrow;
    });
    getImage('71').then((value) {
      uparrow = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return uparrow;
    });
    getImage('336').then((value) {
      home = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return home;
    });
    getImage('174').then((value) {
      increase = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return increase;
    });
    getImage('175').then((value) {
      decrease = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return decrease;
    });
    getImage('171').then((value) {
      weighItem = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return weighItem;
    });
    getImage('8').then((value) {
      refreshIcon = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return refreshIcon;
    });
    getImage('304').then((value) {
      filterIcon = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return filterIcon;
    });
    getImage('317').then((value) {
      arrowBackactivenew = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return arrowBackactivenew;
    });
    getImage('317').then((value) {
      arrowBackactivenew = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return arrowBackactivenew;
    });

    // added by bhava
    getImage('331').then((value) {
      icarrowredright = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return icarrowredright;
    });
    getImage('332').then((value) {
      icarrowredleft = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return icarrowredleft;
    });
    getImage('333').then((value) {
      icarrowgreenright = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return icarrowgreenright;
    });
    getImage('334').then((value) {
      icarrowgreenleft = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return icarrowgreenleft;
    });
    getImage('94').then((value) {
      addressbookHome = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return addressbookHome;
    });
    getImage('99').then((value) {
      addressbookWork = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return addressbookWork;
    });
    getImage('329').then((value) {
      addressbookEdit = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return addressbookEdit;
    });
    getImage('330').then((value) {
      addressbookDelete = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return addressbookDelete;
    });
    getImage('335').then((value) {
      backnew = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return backnew;
    });
    getImage('342').then((value) {
      blankaccess = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return blankaccess;
    });
    getImage('339').then((value) {
      chattyaccess = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return chattyaccess;
    });
    getImage('345').then((value) {
      changepassaccess = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return changepassaccess;
    });
    getImage('346').then((value) {
      countryaccess = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return countryaccess;
    });
    getImage('350').then((value) {
      expertaccess = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return expertaccess;
    });
    getImage('354').then((value) {
      summaryaccess = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return summaryaccess;
    });
    getImage('359').then((value) {
      registeraccess = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return registeraccess;
    });
    getImage('360').then((value) {
      resourcessaccess = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return resourcessaccess;
    });
    getImage('362').then((value) {
      supportaccess = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return supportaccess;
    });
    getImage('363').then((value) {
      tcaccess = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return tcaccess;
    });
    getImage('364').then((value) {
      settingsaccess = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return settingsaccess;
    });
    getImage('365').then((value) {
      faqaccess = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return faqaccess;
    });

    getImage('415').then((value) {
      send = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return send;
    });
    getImage('426').then((value) {
      arexp = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return arexp;
    });
    getImage('425').then((value) {
      addons = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return addons;
    });
    getImage('427').then((value) {
      browse = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return browse;
    });
    getImage('428').then((value) {
      calculate = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return calculate;
    });
    getImage('429').then((value) {
      catalog = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return catalog;
    });
    getImage('431').then((value) {
      client = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return client;
    });
    getImage('432').then((value) {
      cursettings = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return cursettings;
    });
    getImage('433').then((value) {
      fromehome = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return fromehome;
    });
    getImage('433').then((value) {
      fromehome = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return fromehome;
    });
    getImage('434').then((value) {
      guest = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return guest;
    });
    getImage('435').then((value) {
      login = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return login;
    });
    getImage('436').then((value) {
      logout = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return logout;
    });
    getImage('437').then((value) {
      manage = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return manage;
    });
    getImage('441').then((value) {
      marketplace = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return marketplace;
    });
    getImage('438').then((value) {
      retailvertical = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return retailvertical;
    });
    getImage('439').then((value) {
      review = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return review;
    });
    getImage('440').then((value) {
      shop = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return shop;
    });
    getImage('442').then((value) {
      addressbook = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return addressbook;
    });
    // getImage('443').then((value) {
    //   shopatstore = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
    //   return shopatstore;
    // });
    getImage('444').then((value) {
      communicate = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return communicate;
    });
    getImage('36').then((value) {
      sfhome = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return sfhome;
    });
    getImage('37').then((value) {
      satstore = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return satstore;
    });
    getImage('38').then((value) {
      homedelivery = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return homedelivery;
    });
    getImage('39').then((value) {
      pickupshop = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return pickupshop;
    });
    getImage('367').then((value) {
      chatty = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return chatty;
    });
    // NEW CA
    getImage('47').then((value) {
      support = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return support;
    });
    getImage('19').then((value) {
      addon = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return addon;
    });
    getImage('67').then((value) {
      subscription = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return subscription;
    });
    getImage('43').then((value) {
      share = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return share;
    });
    getImage('26').then((value) {
      coupons = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return coupons;
    });
    getImage('23').then((value) {
      calculator = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return calculator;
    });
    getImage('33').then((value) {
      logIn = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return logIn;
    });

    getImage('72').then((value) {
      exptvw = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return exptvw;
    });
    getImage('71').then((value) {
      faq = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return faq;
    });
    getImage('73').then((value) {
      resrcs = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return resrcs;
    });
    getImage('68').then((value) {
      tandc = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return tandc;
    });
    getImage('30').then((value) {
      family = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return family;
    });
    getImage('21').then((value) {
      arexp = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return arexp;
    });

    getImage('36').then((value) {
      mrktplce = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return mrktplce;
    });
    getImage('48').then((value) {
      usrsetings = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return usrsetings;
    });
    getImage('91').then((value) {
      profile = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return profile;
    });
    getImage('88').then((value) {
      password = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return password;
    });
    getImage('90').then((value) {
      feedback = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return feedback;
    });
    getImage('89').then((value) {
      language = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return language;
    });
    getImage('41').then((value) {
      register = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return register;
    });
    getImage('20').then((value) {
      addbook = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return addbook;
    });

    getImage('85').then((value) {
      addbookdelete = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return addbookdelete;
    });
    getImage('22').then((value) {
      browsenew = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return browsenew;
    });
    getImage('84').then((value) {
      arrow = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return arrow;
    });
    getImage('44').then((value) {
      shops = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return shops;
    });
    getImage('216').then((value) {
      delete = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return delete;
    });
    getImage('318').then((value) {
      reorder = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return reorder;
    });
    getImage('45').then((value) {
      shopatstore = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return shopatstore;
    });
    getImage('86').then((value) {
      backtriangle = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return backtriangle;
    });
    getImage('75').then((value) {
      backNew = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return backNew;
    });
    getImage('42').then((value) {
      timerNew = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return timerNew;
    });

    getImage('37').then((value) {
      neworder = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return neworder;
    });
    getImage('40').then((value) {
      pendingorder = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return pendingorder;
    });
    getImage('38').then((value) {
      oldorder = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return oldorder;
    });
    getImage('46').then((value) {
      shoppinglist = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return shoppinglist;
    });
    getImage('31').then((value) {
      wishlist = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return wishlist;
    });
    getImage('83').then((value) {
      reviewcart = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return reviewcart;
    });
    getImage('104').then((value) {
      save = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return save;
    });
    getImage('87').then((value) {
      plus = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return plus;
    });
    getImage('95').then((value) {
      minus = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return minus;
    });
    getImage('103').then((value) {
      weighscale = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return weighscale;
    });
    getImage('34').then((value) {
      logOut = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return logOut;
    });
    getImage('106').then((value) {
      arrowdown = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return arrowdown;
    });
    getImage('107').then((value) {
      arrowup = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return arrowup;
    });
    
  }

  setShoppingMode(String index) {
    shoppingMode.value = index;
    Prefs.setShoppingMode(index);
  }

  void getMainOptions() {
    isActiveOption.value = false;
    mainOptions.clear();
    getGroupImages([
      '300',
      '405',
      '183',
      '259',
      '259',
      '259',
    ]).then((value) {
      for (var element in value) {
        var image = getImagenBase64(element['BM_BASE64_IMAGE_STRING'].trim());
        mainOptions.add(image);
      }
    });
  }

  void getUserOptions() {
    isActiveOption.value = false;
    useroption.clear();
    getGroupImages([
      '305',
      '264',
      '259',
      '259',
      '259',
      '259',
    ]).then((value) {
      for (var element in value) {
        var image = getImagenBase64(element['BM_BASE64_IMAGE_STRING'].trim());
        useroption.add(image);
      }
    });
  }

  void directAccessIcon() {
    isActiveOption.value = true;
    directAccess.clear();
    //  Prefs.superUserLoggedIn.then((value) {
    //   if (value) {
    getGroupImages([
      '49',
      '59',
      '50',
      '52',
      '53',
      '51',
      '54',
      '55',
      '56',
      '57',
      '58',
      '60',
      '61',
      '62',
      '63',
      '69',
      '65',
      '70'
    ]).then((value) {
      for (var element in value) {
        var image = getImagenBase64(element['BM_BASE64_IMAGE_STRING'].trim());
        directAccess.add(image);
      }
    });
  }
  //   }else{
  //        getGroupImages([
  //   '312',
  //   '305',
  //   '308',
  //   '312',
  //   '264',
  //   '6',
  //   '310',
  //   '51',
  //   '202',
  //   '37',
  //   '311',
  //   '49',
  //   '180',
  //   '302',
  //   '181',
  //   '309',
  //   '301',
  //   '306'
  // ]).then((value) {
  //   for (var element in value) {
  //     var image = getImagenBase64(element['BM_BASE64_IMAGE_STRING'].trim());
  //     directAccess.add(image);
  //   }
  // });

  // });

  // }
  void directAccessIconLogout() {
    isActiveOption.value = true;
    directAccess.clear();
    //  Prefs.superUserLoggedIn.then((value) {
    //   if (value) {
    getGroupImages([
      '312',
      '305',
      '308',
      '312',
      '264',
      '65',
      '310',
      '51',
      '202',
      '37',
      '311',
      '49',
      '180',
      '302',
      '181',
      '309',
      '301',
      '306'
    ]).then((value) {
      for (var element in value) {
        var image = getImagenBase64(element['BM_BASE64_IMAGE_STRING'].trim());
        directAccess.add(image);
      }
    });
  }

  void guestImageList(String icons) {
    isActiveOption.value = true;
    guestOption.clear();
    getGroupImages(['305', icons, '300', '299', '41', '298']).then((value) {
      for (var element in value) {
        var image = getImagenBase64(element['BM_BASE64_IMAGE_STRING'].trim());
        guestOption.add(image);
      }
    });
  }

  void guestImageCountryList(String icons) {
    isActiveOption.value = true;
    guestOption.clear();
    getGroupImages(['305', icons, icons, '299', '41', '298']).then((value) {
      for (var element in value) {
        var image = getImagenBase64(element['BM_BASE64_IMAGE_STRING'].trim());
        guestOption.add(image);
      }
    });
  }

  getBrowseList() {
    browseOption.clear();
    isActiveOption.value = true;
    getGroupImages([
      outlet == '202' ? '202' : '321',
      // '321',
      '313', '314', '315', '304', '259'
    ]).then((value) {
      for (var element in value) {
        var image = getImagenBase64(element['BM_BASE64_IMAGE_STRING'].trim());
        browseOption.add(image);
      }
    });
  }

  void changeVerticalIcon(String icon) {
    isActiveOption.value = true;
    guestOption.clear();
    getGroupImages(['305', '300', '299', icon, '41', '298']).then((value) {
      for (var element in value) {
        var image = getImagenBase64(element['BM_BASE64_IMAGE_STRING'].trim());
        guestOption.add(image);
      }
    });
  }

  void changeVerticalIcon1(String icon) {
    isActiveOption.value = true;
    mainOptions.clear();
    getGroupImages([
      '401',
      '405',
      icon,
      '259',
      '259',
      '259',
    ]).then((value) {
      for (var element in value) {
        var image = getImagenBase64(element['BM_BASE64_IMAGE_STRING'].trim());
        mainOptions.add(image);
      }
    });
  }

//addedbysofi

  void changeVerticalRestaurent(String icon, int index) {
    outlet = icon;
    getImage(icon).then((value) {
      var verticalItem = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      guestOption[index] = verticalItem;
    });
  }

  void changeVerticalRestaurent1(String icon, int index) {
    outlet = icon;
    getImage(icon).then((value) {
      var verticalItem = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      bottomicons2[index] = verticalItem;
    });
  }

  void changeVerticalRestaurentClient(String icon, int index) {
    outlet = icon;
    getImage(icon).then((value) {
      var verticalItem = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      settinglist[index] = verticalItem;
    });
  }

  void changeCountryIcon(String icon, int index) {
    outlet = icon;
    getImage(icon).then((value) {
      var verticalItem = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      mainOptions[index] = verticalItem;
    });
  }

  void changeVerticalIcons(String icon, int index) {
    outlet = icon;
    getImage(icon).then((value) {
      var verticalItem = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      countryDirectAccess[index] = verticalItem;
    });
  }

  void getClientOptions() {
    isActiveOption.value = true;
    managerOptions.clear();

    Prefs.superUserLoggedIn.then((value) {
      if (value) {
        getGroupImages(['264', '65', '310', '202', '259', '259']).then((value) {
          for (var element in value) {
            var image =
                getImagenBase64(element['BM_BASE64_IMAGE_STRING'].trim());
            managerOptions.add(image);
          }
        });
      } else {
        getGroupImages(['264', '6', '310', '202', '259', '259']).then((value) {
          for (var element in value) {
            var image =
                getImagenBase64(element['BM_BASE64_IMAGE_STRING'].trim());
            managerOptions.add(image);
          }
        });
      }
    });
  }

  void getclientLogout() {
    managerOptions.clear();
    isActiveOption.value = true;
    getGroupImages(['264', '65', '310', '202', '259', '259']).then((value) {
      for (var element in value) {
        var image = getImagenBase64(element['BM_BASE64_IMAGE_STRING'].trim());
        managerOptions.add(image);
      }
    });
  }

  void userSettingList() {
    userSetting.clear();
    isActiveOption.value = true;
    // added by bhava
    getGroupImages(['311', '48', '49', '63', '64', '259']).then((value) {
      for (var element in value) {
        var image = getImagenBase64(element['BM_BASE64_IMAGE_STRING'].trim());
        userSetting.add(image);
      }
    });
  }

  void getShopList() {
    shoppingList.clear();
    isActiveOption.value = true;
    getGroupImages(['202', '81', '52', '53', '54', '55']).then((value) {
      for (var element in value) {
        var image = getImagenBase64(element['BM_BASE64_IMAGE_STRING'].trim());
        shoppingList.add(image);
      }
    });
  }

  void getCurrentlist() {
    currentlist.clear();
    isActiveOption.value = true;
    getGroupImages(['310', '27', '36', '51', '322', '38', '42']).then((value) {
      for (var element in value) {
        var image = getImagenBase64(element['BM_BASE64_IMAGE_STRING'].trim());
        currentlist.add(image);
      }
    });
  }

  void getShopFromHomeList(String icons) {
    settinglist.clear();
    isActiveOption.value = true;
    getGroupImages([
      icons,
      '36',
      outlet == '322' ? '322' : '41',
      '38',
      '51',
      '42',
    ]).then((value) {
      for (var element in value) {
        var image = getImagenBase64(element['BM_BASE64_IMAGE_STRING'].trim());
        settinglist.add(image);
      }
    });
  }

  void getShopatStore(String icons) {
    settinglist.clear();
    isActiveOption.value = true;
    getGroupImages([
      //'310',
      icons,
      '37',
      outlet == '322' ? '322' : '41',
      '39',
      '51',

      '42',
    ]).then((value) {
      for (var element in value) {
        var image = getImagenBase64(element['BM_BASE64_IMAGE_STRING'].trim());
        settinglist.add(image);
      }
    });
  }

  void getShopatStoreOptions() {
    shopatStore.clear();
    isActiveOption.value = true;
    getGroupImages(['37', '53', '174', '171', '175', '182']).then((value) {
      for (var element in value) {
        var image = getImagenBase64(element['BM_BASE64_IMAGE_STRING'].trim());
        shopatStore.add(image);
      }
    });
  }

  getNewOrderList() {
    newOrderList.clear();
    isActiveOption.value = true;
    getGroupImages([
      '81',
      '420',
      '412',
      '313',
      '418',
      '259',
    ]).then((value) {
      for (var element in value) {
        var image = getImagenBase64(element['BM_BASE64_IMAGE_STRING'].trim());
        newOrderList.add(image);
      }
    });
  }

  getShoppingListChange() {
    newOrderList.clear();
    isActiveOption.value = true;
    getGroupImages(['202', '53', '313', '314', '315', '1']).then((value) {
      for (var element in value) {
        var image = getImagenBase64(element['BM_BASE64_IMAGE_STRING'].trim());
        newOrderList.add(image);
      }
    });
  }

  getReviewSettings() {
    reviewList.clear();
    isActiveOption.value = true;
    getGroupImages([
      '410',
      '423',
      '50',
      '61',

      '60',
      '302',
      // '181',
      // '309',
      // '301',
      // '306'
    ]).then((value) {
      for (var element in value) {
        var image = getImagenBase64(element['BM_BASE64_IMAGE_STRING'].trim());
        reviewList.add(image);
      }
    });
  }

  getCalculator() {
    calclist.clear();
    isActiveOption.value = true;
    getGroupImages(['302', '307', '303', '259', '259', '259']).then((value) {
      for (var element in value) {
        var image = getImagenBase64(element['BM_BASE64_IMAGE_STRING'].trim());
        calclist.add(image);
      }
    });
  }

  getRegister() {
    registerlist.clear();
    isActiveOption.value = true;
    getGroupImages(['308', '325', '266', '323', '324', '259']).then((value) {
      for (var element in value) {
        var image = getImagenBase64(element['BM_BASE64_IMAGE_STRING'].trim());
        registerlist.add(image);
      }
    });
  }

  getWishlist() {
    wishList.clear();
    isActiveOption.value = true;
    getGroupImages(['55', '313', '314', '315', '316', '259']).then((value) {
      for (var element in value) {
        var image = getImagenBase64(element['BM_BASE64_IMAGE_STRING'].trim());
        wishList.add(image);
      }
    });
  }

  getSupport() {
    supportlist.clear();
    isActiveOption.value = true;
    getGroupImages(['181', '190', '191', '192', '413', '309']).then((value) {
      for (var element in value) {
        var image = getImagenBase64(element['BM_BASE64_IMAGE_STRING'].trim());
        supportlist.add(image);
      }
    });
  }

  getUserIcons() {
    getImage('220').then((value) {
      users = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return users;
    });
  }

  getMenuBackIcons() {
    getImage('1').then((value) {
      menuBack = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return menuBack;
    });
  }

  void getBlankOptions() {
    isActiveOption.value = false;
    blankOptions.clear();
    getGroupImages(['259', '259', '259', '259', '259', '259']).then((value) {
      for (var element in value) {
        var image = getImagenBase64(element['BM_BASE64_IMAGE_STRING'].trim());

        blankOptions.add(image);
      }
    });
  }

// Browse icon list
  void getBrowseOptions() {
    isActiveOption.value = false;
    browseoption.clear();
    getGroupImages(['298', '420', '412', '313', '418', '308']).then((value) {
      for (var element in value) {
        var image = getImagenBase64(element['BM_BASE64_IMAGE_STRING'].trim());

        browseoption.add(image);
      }
    });
  }

// Address Book icon list
  void getAddressBook() {
    isActiveOption.value = false;
    addressBook.clear();
    getGroupImages(['51', '223', '216', '77', '211', '259']).then((value) {
      for (var element in value) {
        var image = getImagenBase64(element['BM_BASE64_IMAGE_STRING'].trim());

        addressBook.add(image);
      }
    });
  }

// cart icon list
  void getReviewcart() {
    isActiveOption.value = false;
    reviewpage.clear();
    getGroupImages(['421', '182', '184', '259', '259', '259']).then((value) {
      for (var element in value) {
        var image = getImagenBase64(element['BM_BASE64_IMAGE_STRING'].trim());

        reviewpage.add(image);
      }
    });
  }

//AR icon list
  void getArExperience() {
    isActiveOption.value = false;
    arexperience.clear();
    getGroupImages(['301', '15', '19', '29', '259', '259']).then((value) {
      for (var element in value) {
        var image = getImagenBase64(element['BM_BASE64_IMAGE_STRING'].trim());

        arexperience.add(image);
      }
    });
  }

  //Direct Access Icons
  void getCountryAccess() {
    isActiveOption.value = false;
    countryDirectAccess.clear();
    getGroupImages(['300', '405', '183', '410', '311', '259']).then((value) {
      for (var element in value) {
        var image = getImagenBase64(element['BM_BASE64_IMAGE_STRING'].trim());

        countryDirectAccess.add(image);
      }
    });
  }

  void getGuestAccess() {
    isActiveOption.value = false;
    guestDirectAccess.clear();
    getGroupImages(['305', '298', '308', '259', '259', '259']).then((value) {
      for (var element in value) {
        var image = getImagenBase64(element['BM_BASE64_IMAGE_STRING'].trim());

        guestDirectAccess.add(image);
      }
    });
  }

  void getClientAccess() {
    isActiveOption.value = false;
    clientDirectAccess.clear();
    getGroupImages(['264', '49', '51', '310', '202', '37']).then((value) {
      for (var element in value) {
        var image = getImagenBase64(element['BM_BASE64_IMAGE_STRING'].trim());

        clientDirectAccess.add(image);
      }
    });
  }

  void getSupportAccess() {
    isActiveOption.value = false;
    supportDirectAccess.clear();
    getGroupImages(['181', '309', '367', '301', '306', '259']).then((value) {
      for (var element in value) {
        var image = getImagenBase64(element['BM_BASE64_IMAGE_STRING'].trim());

        supportDirectAccess.add(image);
      }
    });
  }

  void getBottomsIcons() {
    isActiveOption.value = false;
    bottomicons.clear();
    getGroupImages(['76', '82']).then((value) {
      //, '83', '96', '101'
      for (var element in value) {
        var image = getImagenBase64(element['BM_BASE64_IMAGE_STRING'].trim());

        bottomicons.add(image);
      }
    });
  }

  void getBottomsIcons2() {
    isActiveOption.value = false;
    bottomicons2.clear();
    getGroupImages(['96', '101']).then((value) {
      //, '83', '96', '101'
      for (var element in value) {
        var image = getImagenBase64(element['BM_BASE64_IMAGE_STRING'].trim());

        bottomicons2.add(image);
      }
    });
  }

  void getPayModeIcons() {
    isActiveOption.value = false;
    paymodeicons.clear();
    getGroupImages(
            ['25', '97', '29', '26', '35', '32', '28', '27', '102', '100'])
        .then((value) {
      for (var element in value) {
        var image = getImagenBase64(element['BM_BASE64_IMAGE_STRING'].trim());

        paymodeicons.add(image);
      }
    });
  }

  void setOptionList(String key) {
    optionsKey.value = key;
  }

  void optionIndexSetter(index) {
    _optionIndex.value = index;
  }

  void setOptionView(String view) {
    _optionsView.value = view;
  }

  void setSubOptionView(String view) {
    _subOptionsView.value = view;
  }

  void release() {
    _optionIndex.value = 100;
  }
}
