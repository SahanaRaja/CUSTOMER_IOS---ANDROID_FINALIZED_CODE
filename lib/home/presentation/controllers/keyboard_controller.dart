// ignore_for_file: non_constant_identifier_names

import 'package:customer_assist/core/app_constants.dart';
import 'package:customer_assist/home/presentation/controllers/view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../widgets/stackwidgets/set_password_tab.dart';

class KeyboardController extends GetxController {
  ViewController viewController = Get.find();
  Map<String, dynamic> jsonValues = {};

  var pickerValue = ''.obs;
  var frameImage = 'frame_1'.obs;
  var heightProfile = true.obs;
  var editProfile = false.obs;
  var addProfile = false.obs;

  var changekeypad = ''.obs;
  var specialKeypad = ''.obs;
  var capslock = false.obs;
  var currentController = TextEditingController().obs;
  var user = TextEditingController().obs;
  var createuser = TextEditingController().obs;
  var createpass = TextEditingController().obs;
  var newpass = TextEditingController().obs;
  var postalController = TextEditingController().obs;
  var oldpass = TextEditingController().obs;
  var pass = TextEditingController().obs;
  var resetpass = TextEditingController().obs;
  var comments = TextEditingController().obs;
  var mobile = TextEditingController().obs;
  var friendmobile = TextEditingController().obs;
  var friendname = TextEditingController().obs;
  var main = ''.obs;
  var sub = ''.obs;
  var brand = TextEditingController().obs;
  var itemName = TextEditingController().obs;
  var barcode = ''.obs;
  var vom = ''.obs;
  var price = TextEditingController().obs;
  var qty = 0.obs;
  var batch_no = ''.obs;
  var manufacturer = ''.obs;
  var maxlength = 0.obs;
  var focusNode = FocusNode().obs;
  var otpControllers = List.generate(6, (index) => TextEditingController()).obs;
  final validCharacters = RegExp(r'^[0-9]');
  // RegExp(r'^[0-9]');
  //RegExp(r".*[A-Za-z].*[0-9].*");
  var listofguestmobile = ''.obs;
  var guastcontrollers =
      List.generate(10, (index) => TextEditingController()).obs;
  List<dynamic> moblistcontrls = [];
  var controllersetupforguest = '';
  var moblistcontrlsindex = 0;
  var guastcontrollerchange = '';
  final TextEditingController _controller = TextEditingController();
  PasswordStrength _passwordStrength = PasswordStrength.Weak;
   Color _containerColor = Colors.grey;
   void updateContainerColor(String newText) {
    int textLength = newText.length;

    if (textLength <= 3) {
     // setState(() {
        _containerColor = Colors.red;
     // });
    } else if (textLength <= 6) {
      //setState(() {
        _containerColor = Colors.orange;
     // });
    } else if (textLength <= 8) {
     // setState(() {
        _containerColor = Colors.green;
     // });
    } else {
      //setState(() {
        _containerColor = Colors.green;
      //});
    }
  }
  

  void setinitialstage(int val) {
    j = val;
  }

  int j = -1;

  int i = -1;
  final _symbols = true.obs;
  bool get symbols => _symbols.value;

  void setmobileboxcountindex(index) {
    j = index;
  }

  void setKeypad(String changekeypad) {
    this.changekeypad.value = changekeypad;
  }

  void setPicker(String value) {
    pickerValue.value = value;
  }

  void setframe(String value) {
    frameImage.value = value;
  }

  void setHeight(bool heightProfile) {
    this.heightProfile.value = heightProfile;
  }

  void setEdit(bool editProfile) {
    this.editProfile.value = editProfile;
  }

  void setAdd(bool addProfile) {
    this.addProfile.value = addProfile;
  }

  void setCapslock(bool capslock) {
    this.capslock.value = capslock;
  }

  void controllerSetup(TextEditingController controller) {
    currentController.value = controller;
  }

  void focusSetup(FocusNode focusNode, TextEditingController controller) {
    currentController.value = controller;
    this.focusNode.value = focusNode;
  }

  symbolTrue(bool validateSymbol) {
    _symbols.value = validateSymbol;
  }

  setBarCode(String barcode1) {
    barcode.value = barcode1;
  }

  setBatchno(String batch1) {
    batch_no.value = batch1;
  }

  setmain(String main1) {
    main.value = main1;
  }

  setsub(String sub1) {
    sub.value = sub1;
  }

  setbrand(TextEditingController brand1) {
    brand.value = brand1;
  }

  setitemName(TextEditingController itemName1) {
    itemName.value = itemName1;
  }

  setManufacturer(String manufacturer1) {
    manufacturer.value = manufacturer1;
  }

  setvom(String vom1) {
    vom.value = vom1;
  }

  setprice(TextEditingController price1) {
    price.value = price1;
  }

  setqty(String qty1) {
    qty.value = int.parse(qty1);
  }

  void setOtpControllers(List<TextEditingController> otpControllers) {
    this.otpControllers.value = otpControllers;
  }

  void setLoginController(
      TextEditingController user, TextEditingController pass) {
    this.user.value = user;
    this.pass.value = pass;
  }
  void setShareController(
      TextEditingController mobile, TextEditingController friendmobile,TextEditingController friendname) {
    this.mobile.value = mobile;
    this.friendmobile.value = friendmobile;
    this.friendname.value = friendname;
  }
 void setpasschangeController(
       TextEditingController pass) {
 
    this.pass.value = pass;
  }
  void setcreateUserController(TextEditingController user) {
    createuser.value = user;
  }

  void setcreatePassController(TextEditingController user) {
    createpass.value = user;
  }

  void setPassController(
      TextEditingController user, TextEditingController pass) {
    newpass.value = user;
    resetpass.value = pass;
  }
  // void setPassChangeController(
  //     TextEditingController user, TextEditingController pass,TextEditingController opass) {
  //   oldpass.value = opass;
  //   newpass.value = user;
  //   resetpass.value = pass;
  // }

  void setguestmobControllerindex(otpControllers) {
    moblistcontrlsindex = otpControllers;
  }

  void setguastcountandnummber(String changecntrl) {
    guastcontrollerchange = changecntrl;
  }

  void setMaximiumLength(String maxlength) {
    this.maxlength.value = int.parse(maxlength);
  }

  void setguestmobControllers(List<TextEditingController> otpControllers) {
    moblistcontrls.add(otpControllers);
  }

  void setguestControllers(List<TextEditingController> otpControllers) {
    guastcontrollers.value = otpControllers;
  }

  void keyboardOperation(String letter) async {
    var cursorPos = currentController.value.selection.base.offset;

    if (letter == 'DEL') {
      print(" inside DEL block");
      specialKeypad.value = letter;
      _onBackspacePressed();
    } else if (letter == 'SPACE') {
      print(" inside SPACE block");
      int newPosition = cursorPos + 1;
      currentController.value.text =
          '${currentController.value.text.substring(0, cursorPos)} ${currentController.value.text
                  .substring(cursorPos, currentController.value.text.length)}';
      currentController.value.selection = TextSelection(
        baseOffset: newPosition,
        extentOffset: newPosition,
      );
    } else if (letter == 'ENTER') {
      print(" inside ENTER block");
      specialKeypad.value = letter;
    } else if (letter == 'CLR') {
      print(" inside CLR block");
      specialKeypad.value = letter;
    } else if (letter == 'NEXT') {
      print(" inside NEXT block");
      specialKeypad.value = letter;
      focusNode.value.nextFocus();
      // focusNode == SYMBOLSKEYBOARD;
      // symbolTrue  false
      //   ?setKeypad(SYMBOLSKEYBOARD);
      

    } else if (letter == 'delete') {
      print(" inside delete block");
      if (viewController.viewKey.value == ClIENTCHANGEPASSWORD ||
          viewController.viewKey.value == FORGETPASSWORD ||
          viewController.viewKey.value == MOBILEOTP ||

          //currentController.value.text = currentController.value.text
             // .replaceRange(cursorPos - 1, cursorPos, '');

          viewController.viewKey.value == NEWUSEROTPSENT ||
          viewController.viewKey.value == 'Shopselectioncond') {
        print('hi');
        if (viewController.viewKey.value != 'Shopselectioncond') {
          if (i >= 0 || currentController.value.text.isNotEmpty) {
            otpControllers[i].text = '';
            i--;
            focusNode.value.previousFocus();
          }

        }

        if (viewController.viewKey.value == 'Shopselectioncond') {

          if (currentController.value.text.isNotEmpty) {
            String result = currentController.value.text
                .substring(0, currentController.value.text.length - 1);
            currentController.value.setText(result);
          }

          // if (guastcontrollerchange == 'guestcount') {
          //   if (j >= 2) {
          //     j = -1;
          //     focusNode.value.previousFocus();
          //   }
          //   if (j < 2) {
          //     j++;
          //     print(guastcontrollers);
          //     print(letter);
          //     guastcontrollers[j].text = '';
          //     focusNode.value.previousFocus();
          //   }
          // }
          // if (guastcontrollerchange == 'guestmobilenumber') {
          //   if (j >= 10) {
          //     j = 0;
          //     focusNode.value.previousFocus();
          //   }
          //   if (j < 10) {
          //     j++;
          //     print(moblistcontrls);
          //     print(letter);
          //     print(moblistcontrlsindex);
          //     moblistcontrls[moblistcontrlsindex][j].text = '';
          //     focusNode.value.previousFocus();
          //   }
          // }

        }
      } else {
        print("  delete else part ");
        if (currentController.value.text.isNotEmpty) {
          print("  delete else part  isnotempty");
          if (currentController.value.selection.start >= 0) {
            print("  delete else part isnotempty start >=0");
            int newPosition = currentController.value.selection.start - 1;
            currentController.value.text =
                currentController.value.text.replaceRange(
              currentController.value.selection.start,
              currentController.value.selection.end,
              '',
            );

            currentController.value.text = currentController.value.text
                .replaceRange(cursorPos - 1, cursorPos, '');

            currentController.value.selection = TextSelection(
              baseOffset: newPosition,
              extentOffset: newPosition,
            );
          } else {
            print("  delete else  again else part  isnotempty");
            currentController.value.text += letter;
          }
        }
      }
    } else {
      if (viewController.viewKey.value == ClIENTCHANGEPASSWORD ||
          viewController.viewKey.value == FORGETPASSWORD ||
          viewController.viewKey.value == MOBILEOTP ||

          viewController.viewKey.value == NEWUSEROTPSENT ||
          viewController.viewKey.value == 'Shopselectioncond') {
        if (viewController.viewKey.value != 'Shopselectioncond') {
          if (i < 5) {
            i++;
            otpControllers[i].text = letter;
            focusNode.value.nextFocus();
          }
        }
        if (viewController.viewKey.value == 'Shopselectioncond') {
          // if (guastcontrollerchange == 'guestcount') {
          //   if (j >= 2) {
          //     j = -1;
          //     focusNode.value.previousFocus();
          //   }
          //   if (j < 2) {
          //     j++;
          //     print(guastcontrollers);
          //     print(letter);
          //     guastcontrollers[j - 1].text = letter;
          //     focusNode.value.nextFocus();
          //   }
          // }
          // if (guastcontrollerchange == 'guestmobilenumber') {
          //   if (j >= 10) {
          //     j = -1;
          //     focusNode.value.previousFocus();
          //   }
          //   if (j < 10) {
          //     j++;
          //     print(moblistcontrls);
          //     print(letter);
          //     print(moblistcontrlsindex);
          //     print(j);
          //     moblistcontrls[moblistcontrlsindex][j - 1].text = letter;
          //     focusNode.value.nextFocus();
          //   }
          // }
          if (currentController.value.text.length < 10) {
            currentController.value
                .setText(currentController.value.text + letter);
          }
        }
      } else {
        if (currentController.value.text.length != maxlength.value) {
          //execute when the symbolTrue is false//
          if (!_symbols.value) {
            if (changekeypad.value == SYMBOLSKEYBOARD) {
              if (validCharacters.hasMatch(letter)) {
                bindingValues(letter, cursorPos);
              } else {
                print('Printing an Symbols');
              }
            }
          } else {
            print(letter);
            //execute when the symbolTrue is true//
            bindingValues(letter, cursorPos);
            //onKeyPressed(letter);
            //updateContainerColor(letter);
          }
        } else {
          // if (currentController.value.text.length != maxlength.value) {
          currentController.value.text += letter;
          //onKeyPressed(letter);
          //updateContainerColor(letter);
          // }
        }
      }
    }
  }
  

  Future<void> bindingValues(String letter, int cursorPos) async {
    if (currentController.value.selection.start >= 0) {
      int newPosition = currentController.value.selection.start + letter.length;
      currentController.value.text = currentController.value.text.replaceRange(
        currentController.value.selection.start,
        currentController.value.selection.end,
        letter,
      );
      currentController.value.selection = TextSelection(
        baseOffset: newPosition,
        extentOffset: newPosition,
      );
      updateContainerColor(letter);
    } else {
      currentController.value.text += letter;
      updateContainerColor(letter);
    }
  }

  void onKeyPressed(String value) {
    final text = _controller.text;
    final newText = text + value;
    _controller.text = newText;
    _controller.selection = TextSelection.fromPosition(TextPosition(offset: newText.length));
    updateContainerColor(newText);
  }

  void _onBackspacePressed() {
    final text = _controller.text;
    if (text.isNotEmpty) {
      final newText = text.substring(0, text.length - 1);
      _controller.text = newText;
      _controller.selection = TextSelection.fromPosition(TextPosition(offset: newText.length));
      _updatePasswordStrength(newText);
    }
  }

  void _updatePasswordStrength(String password) {
    if (password.length >= 8) {
      //setState(() {
        _passwordStrength = PasswordStrength.Strong;
     // });
    } else if (password.length >= 6) {
      //setState(() {
        _passwordStrength = PasswordStrength.Medium;
      //});
    } else {
      //setState(() {
        _passwordStrength = PasswordStrength.Weak;
      //});
    }
  }
  Color getColorFromStrength(PasswordStrength strength) {
  switch (strength) {
    case PasswordStrength.Weak:
      return Colors.red;
    case PasswordStrength.Medium:
      return Colors.orange;
    case PasswordStrength.Strong:
      return Colors.green;
    default:
      return Colors.grey;
  }
}
}
