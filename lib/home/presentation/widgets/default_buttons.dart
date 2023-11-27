import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../core/app_constants.dart';
import '../controllers/keyboard_controller.dart';
import 'stackwidgets/set_password_tab.dart';
import 'stackwidgets/tooltip/tool_tip_tab.dart';

bool capslock = false;


class DefaultButtons {
  KeyboardController keyboardController = Get.find();
  final TextEditingController _controller = TextEditingController();
  final PasswordStrength _passwordStrength = PasswordStrength.Weak;
  Color _containerColor = Colors.grey;

  
  void updateContainerColor(String newText) {
    int textLength = newText.length;

    if (textLength <= 3) {
      // setState(() {
        _containerColor = Colors.red;
      //});
    } else if (textLength <= 6) {
      //setState(() {
        _containerColor = Colors.orange;
      //});
    } else if (textLength <= 8) {
      //setState(() {
        _containerColor = Colors.green;
     // });
    } else {
      //setState(() {
        _containerColor = Colors.green;
      //});
    }
  }
   
  
  Widget getSmallButton(
      {String? content, Function(String)? onValueChanged, required Size size}) {
    return GestureDetector(
      onTap: () {
        //_onKeyPressed(content!);
        // getSoundFeedback();

        // if (onValueChanged != null) {
        //   onValueChanged(content!);
        // }
      },
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          image: DecorationImage(
              image: AssetImage('assets/images/keypad_patchs/key_aplha.png'),
              fit: BoxFit.fill),
        ),
        padding: const EdgeInsets.all(5),
        height: 50,
        width: 11.w,
        // width: size.height * 0.5,
        child: Center(
            child: Text(
          content!,
          style: const TextStyle(fontSize: 25, color: Colors.white),
        )),
      ),
    );
  }

  // getSoundFeedback() {
  //   Prefs.sound.then((value) {
  //     if (value == true) {
  //       return SystemSound.play(SystemSoundType.click);
  //     }
  //   });
  // }

  Widget getMediumButton(
      {String? content,
      Function(String)? onValueChanged,
      required Size size,
      BuildContext? context}) {
    return GestureDetector(
      onTap: () {
        if (content == '123') {
          keyboardController.setKeypad(SYMBOLSKEYBOARD);
        } else if (content == 'ABC') {
          keyboardController.setKeypad(CAPITALKEYBOARD);
        } else {
          keyboardController.keyboardOperation(content!);
        }

        // getSoundFeedback();
        // if (content == "ABC" || content == "a-A") {
        //   capslock = false;
        //   bLAB.add(KeyBoardEvent(type: "capital"));
        // } else if (content == "A-a") {
        //   capslock = false;
        //   bLAB.add(KeyBoardEvent(type: "small"));
        // } else if (content == "123") {
        //   bLAB.add(KeyBoardEvent(type: "number"));
        // }
      },
      onDoubleTap: () {
        // getSoundFeedback();

        // if (content == "A-a") {
        //   capslock = true;
        // }
        // setState(() {});
      },
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          image: DecorationImage(
              image: AssetImage('assets/images/keypad_patchs/key_abc.png'),
              fit: BoxFit.fill),
        ),
        padding: const EdgeInsets.all(5),
        height: 50,
        // width: 11.w,
        width: 90,
        child: Center(
            child: Text(
          content!,
          style: const TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),
        )),
      ),
    );
  }

  Widget getLargeButton(
      {String? content, Function(String)? onValueChanged, required Size size}) {
    return GestureDetector(
      onTap: () {
        keyboardController.keyboardOperation(content!);

        // getSoundFeedback();

        // if (onValueChanged != null) {
        //   onValueChanged(content!);
        // }
      },
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          image: DecorationImage(
              image: AssetImage('assets/images/keypad_patchs/key_space.png'),
              fit: BoxFit.fill),
        ),
        padding: const EdgeInsets.all(5),
        height: 50,
        // width: 11.w,
        width: size.height * 0.9,
        child: Center(
            child: Text(
          content!,
          style: const TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),
        )),
      ),
    );
  }
  

  Widget getGridChild(String number, Function(String) onValueChanged, Size size,
  
      {bool? isCapital}) {
         
    return GestureDetector(
      onTap: () {
        
        print(number);
        if (keyboardController.capslock.value == false &&
            keyboardController.changekeypad.value != SYMBOLSKEYBOARD) {
          keyboardController.setKeypad(SMALLKEYBOARD);
        }
        keyboardController.keyboardOperation(number);
        onValueChanged(number);
        updateContainerColor(number);

       
        
      },
      child: MyTooltip(
        message: number,
        onValueChanged: onValueChanged,
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            image: DecorationImage(
                image: AssetImage('assets/images/keypad_patchs/key_aplha.png'),
                fit: BoxFit.fill),
          ),
          padding: const EdgeInsets.all(5),
          // margin: EdgeInsets.all(1),
          height: 50,
          width: 45,
          child: Center(
            child: Text(
              number,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }

  AssetImage getCapslockImage(String? content) {
    if (content == "A-a") {
      if (capslock == true) {
        return const AssetImage('assets/images/keyboardicons/keyboardon.png');
      } else {
        return const AssetImage('assets/images/keyboardicons/keyboardoff.png');
      }
    } else {
      return const AssetImage('assets/images/keyboardicons/key1.png');
    }
  }

  
}
