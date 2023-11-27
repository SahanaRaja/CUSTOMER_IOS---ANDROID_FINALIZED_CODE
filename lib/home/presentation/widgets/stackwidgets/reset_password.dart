import 'package:customer_assist/core/app_colors.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/app_constants.dart';
import '../../../../core/app_style.dart';
import '../../controllers/header_controller.dart';
import '../../controllers/icon_controller.dart';
import '../../controllers/keyboard_controller.dart';
import '../../controllers/view_controller.dart';

class ResetPasswordTab extends StatefulWidget {
  final double actualHeight;
  final TextEditingController newPass;
  final TextEditingController resetPass;
  const ResetPasswordTab(
      {Key? key,
      required this.actualHeight,
      required this.newPass,
      required this.resetPass})
      : super(key: key);

  @override
  _ResetPasswordTabState createState() => _ResetPasswordTabState();
}

class _ResetPasswordTabState extends State<ResetPasswordTab> {
  ViewController viewController = Get.find();
  KeyboardController keyboardController = Get.find();
  HeaderController headerController = Get.find();
  bool _obscureText = true;
  bool _obscureText1 = true;

  final FocusNode _focus = FocusNode();
  bool _isFocused = false;
  final FocusNode _focus1 = FocusNode();
  bool _isFocused1 = false;
  final FocusNode _focus2 = FocusNode();
  bool _isFocused2 = false;
  final _formkey = GlobalKey<FormState>();

  double actualHeight = 0;
  EyeController eyeController = Get.find();
  var languageController = Get.put(LanguageController());
   Color _containerColor = Colors.red;

  
  void updateContainerColor(String newText) {
    int textLength = newText.length;

    if (textLength <= 3) {
      setState(() {
        _containerColor = Colors.red;
      });
    } else if (textLength <= 6) {
      setState(() {
        _containerColor = Colors.orange;
      });
    } else if (textLength <= 8) {
      setState(() {
        _containerColor = Colors.green;
      });
    } else {
      setState(() {
        _containerColor = Colors.green;
      });
    }
  }
  
 String _password = '';
  double _strength = 0;

  RegExp numReg = RegExp(r".*[0-9].*");
  RegExp letterReg = RegExp(r".*[A-Za-z].*");

  //String _displayText = 'Please enter a password';

  void _checkPassword(String value) {
    _password = value.trim();

    if (_password.isEmpty) {
      setState(() {
        _strength = 0;
        //_displayText = 'Please enter you password';
      });
    } else if (_password.length < 6) {
      setState(() {
        _strength = 1 / 4;
       // _displayText = 'Your password is too short';
      });
    } else if (_password.length < 8) {
      setState(() {
        _strength = 2 / 4;
        //_displayText = 'Your password is acceptable but not strong';
      });
    } else {
      if (!letterReg.hasMatch(_password) || !numReg.hasMatch(_password)) {
        setState(() {
          // Password length >= 8
          // But doesn't contain both letter and digit characters
          _strength = 3 / 4;
          //_displayText = 'Your password is strong';
        });
      } else {
        // Password length >= 8
        // Password contains both letter and digit characters
        setState(() {
          _strength = 1;
         // _displayText = 'Your password is great';
        });
      }
    }
  }


  @override
  void didChangeDependencies() {
    actualHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    final strength = getPasswordStrength(_password);
    var color = getColorFromStrength(strength);


    _focus.addListener(() {
      keyboardController.setKeypad(CAPITALKEYBOARD);
      keyboardController.controllerSetup(widget.resetPass);
      keyboardController.symbolTrue(true);

      if (_focus.hasFocus) {
        setState(() {
          _isFocused = true;
          _isFocused1 = false;
          _isFocused2 = false;
        });
      }
    });
    _focus1.addListener(() {
      keyboardController.setKeypad(CAPITALKEYBOARD);
      keyboardController.controllerSetup(widget.newPass);
      _checkPassword(widget.resetPass.text);
      keyboardController.symbolTrue(true);
      if (_focus1.hasFocus) {
        setState(() {
          _isFocused = false;
          _isFocused1 = true;
          _isFocused2 = false;
        });
      }
    });
    _focus2.addListener(() {
      if (_focus2.hasFocus) {
        setState(() {
          _isFocused = false;
          _isFocused1 = false;
          _isFocused2 = true;
        });
      }
    });

    return Padding(
      padding: GetPlatform.isAndroid
         ?const EdgeInsets.only(top: 5)
         :const EdgeInsets.only(),
      child: Column(
        children: [
           Container(
            height: MediaQuery.of(context).size.height * 0.043,
              width: MediaQuery.of(context).size.width * 0.99,
              color: AppColors.subHeaderContainer,
            child: Center(
                child: Text(
              "Set up a Password",
              // languageController.languageResponse.value.users ?? '',
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  SizedBox(
                    height: GetPlatform.isAndroid
                    ? widget.actualHeight / 8.4
                   : widget.actualHeight / 8,
                  ),
                  Container(
                    //padding: EdgeInsets.only(top:5.0),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.black,
                          // width: 0.5,
                        ),
                      ),
                    ),
                    height:
                        (widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                            17.9,
                    child: TextField(
                      //maxLength: 10,
                      //inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r".*[A-Za-z].*"))],
                      readOnly: true,
                      showCursor: true,
                      focusNode: _focus,
                      obscureText: _obscureText,
                      style: normalTextStyle,
                      controller: widget.resetPass,
                       onChanged: (value) {
                       _checkPassword(value);
                       // updateContainerColor(widget.resetPass.text);
                            //(value);
                        },
                       
                      
                      onTap: () {
    
                        //_checkPassword(widget.resetPass.text);
                       
                       
                       // _checkPassword(widget.resetPass.text);
                        //validateStructure(widget.resetPass.text);
                        keyboardController.setKeypad(CAPITALKEYBOARD);
                        keyboardController.controllerSetup(widget.resetPass);
                        keyboardController.setMaximiumLength('50');
                        keyboardController.symbolTrue(true);
            
                        keyboardController.focusSetup(_focus, widget.resetPass);
                     
                        // keyboardController.focusSetup(_focus, widget.resetPass);
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                       // errorStyle: TextStyle(color: Colors.orange),
                       // color: validPassword ? Colors.green : Colors.red,
                        filled: _isFocused,
                        fillColor: textFieldColor,
                        hintText: languageController.languageResponse.value.password,
                        counterText: "",
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          child: _obscureText
                              ? eyeController.eyeclose
                              : eyeController.eyeopen,
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: widget.actualHeight / 60,
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        
                       
                         Container( 
                          height: 15,
                          width: 350,
                         color: color,
                        
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            viewController.setView(CHECKPASSWORD);
                          },
                          child: Container(
                            height: widget.actualHeight / 35,
                            width: 25,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/info.png'),
                                  fit: BoxFit.fill),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.black,
                            // width: 0.5,
                          ),
                        ),
                      ),
                      height: (widget.actualHeight -
                              MediaQuery.of(context).padding.bottom) /
                          17.9,
                      child: TextFormField(
                        maxLength: 10,
                        focusNode: _focus1,
                        readOnly: true,
                        controller: widget.newPass,
                        obscureText: _obscureText1,
                        style: normalTextStyle,
                        showCursor: true,
                        // onChanged: (value) {
                        //   validateStructure(widget.resetPass.text);
                       // },
                        onTap: () {
                          //validateStructure(widget.resetPass.text);
                             _checkPassword(widget.resetPass.text);
                          keyboardController.setKeypad(CAPITALKEYBOARD);
                          keyboardController.setPassController(
                              widget.newPass, widget.resetPass,);
                          keyboardController.focusSetup(_focus, widget.newPass);
                          keyboardController.setcreatePassController(widget.newPass);
                          keyboardController.symbolTrue(true);
                          // keyboardController.focusSetup(_focus1, widget.newPass);
                          keyboardController.controllerSetup(widget.newPass);
                          keyboardController.setMaximiumLength('50');
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          filled: _isFocused1,
                          fillColor: textFieldColor,
                          hintText:
                              languageController.languageResponse.value.repeatPassword,
                          counterText: "",
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscureText1 = !_obscureText1;
                              });
                            },
                            child: _obscureText1
                                ? eyeController.eyeclose
                                : eyeController.eyeopen,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: widget.actualHeight / 30,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

    
  }

  bool validPassword = false;
  bool validateStructure(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    validPassword = regExp.hasMatch(value);
    setState(() {});
    return regExp.hasMatch(value);
  }


}

enum PasswordStrength {
  Weak,
  Medium,
  Strong,
}

PasswordStrength getPasswordStrength(String password) {
  // Password strength logic based on your criteria
  if (password.length < 6) {
    return PasswordStrength.Weak;
  } else if (password.length < 10) {
    return PasswordStrength.Medium;
  } else {
    return PasswordStrength.Strong;
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
//   ViewController viewController = Get.find();
//   KeyboardController keyboardController = Get.find();
//   var languageController = Get.put(LanguageController());
//   bool _obscureText = true;
//   bool _obscureText1 = true;

//   final FocusNode _focus = FocusNode();
//   bool _isFocused = false;
//   final FocusNode _focus1 = FocusNode();
//   bool _isFocused1 = false;
//   final FocusNode _focus2 = FocusNode();
//   bool _isFocused2 = false;

//   double actualHeight = 0;
//   EyeController eyeController = Get.find();

//   @override
//   void initState() {
//     super.initState();
//     // viewController.setView(MANAGEROTPSENT);
//   }

//   @override
//   void didChangeDependencies() {
//     actualHeight = MediaQuery.of(context).size.height -
//         MediaQuery.of(context).padding.top -
//         MediaQuery.of(context).padding.bottom;
//     super.didChangeDependencies();
//   }

//   @override
//   Widget build(BuildContext context) {
//     _focus.addListener(() {
//       keyboardController.setKeypad(CAPITALKEYBOARD);
//       keyboardController.controllerSetup(widget.resetPass);
//       keyboardController.symbolTrue(true);

//       if (_focus.hasFocus) {
//         setState(() {
//           _isFocused = true;
//           _isFocused1 = false;
//           _isFocused2 = false;
//         });
//       }
//     });
//     _focus1.addListener(() {
//       keyboardController.setKeypad(CAPITALKEYBOARD);
//       keyboardController.controllerSetup(widget.newPass);
//       keyboardController.symbolTrue(true);
//       if (_focus1.hasFocus) {
//         setState(() {
//           _isFocused = false;
//           _isFocused1 = true;
//           _isFocused2 = false;
//         });
//       }
//     });
//     _focus2.addListener(() {
//       if (_focus2.hasFocus) {
//         setState(() {
//           _isFocused = false;
//           _isFocused1 = false;
//           _isFocused2 = true;
//         });
//       }
//     });
//     // _focus.addListener(() {
//     //   if (_focus.hasFocus) {
//     //     keyboardController.setKeypad(CAPITALKEYBOARD);
//     //     keyboardController.setMaximiumLength('50');
//     //     setState(() {
//     //       _isFocused = true;
//     //       _isFocused1 = false;
//     //     });
//     //   }
//     // });
//     // _focus1.addListener(() {
//     //   keyboardController.setKeypad(CAPITALKEYBOARD);
//     //   keyboardController.setMaximiumLength('50');
//     //   if (_focus1.hasFocus) {
//     //     setState(() {
//     //       _isFocused = false;
//     //       _isFocused1 = true;
//     //     });
//     //   }
//     // });

//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 40.0),
//       child: Column(
//         children: [
//           SizedBox(
//              height: GetPlatform.isAndroid
//               ? widget.actualHeight / 8.4
//              : widget.actualHeight / 8,
//           ),
//           Container(
//             decoration: const BoxDecoration(
//               border: Border(
//                 bottom: BorderSide(
//                   color: Colors.black,
//                   // width: 0.5,
//                 ),
//               ),
//             ),
//             height:
//                 (widget.actualHeight - MediaQuery.of(context).padding.bottom) /
//                     17.9,
//             child: TextFormField(
//               maxLength: 10,
//               readOnly: true,
//               showCursor: true,
//               focusNode: _focus,
//               obscureText: _obscureText,
//               controller: widget.resetPass,
//               style: normalTextStyle,
//               onChanged: (value) => validateStructure(value),
//               onTap: () {
//                 keyboardController.setKeypad(CAPITALKEYBOARD);
//                 keyboardController.controllerSetup(widget.resetPass);
//                 keyboardController.focusSetup(_focus, widget.resetPass);
//                 keyboardController.setMaximiumLength('50');
//                 keyboardController.symbolTrue(true);
//               },
//               decoration: InputDecoration(
//                 border: InputBorder.none,
//                 filled: _isFocused,
//                 fillColor: textFieldColor,
//                 hintText: languageController.languageResponse.value.newPassword,
//                 counterText: "",
//                 suffixIcon: GestureDetector(
//                   onTap: () {
//                     // keyboardController.controllerSetup(widget.newPass);
//                     setState(() {
//                       _obscureText = !_obscureText;
//                     });
//                   },
//                   child: _obscureText
//                       ? eyeController.eyeclose
//                       : eyeController.eyeopen,
//                 ),
//               ),
//             ),
//           ),
//           // SizedBox(
//           //   height: widget.actualHeight / 40,
//           // ),
//           Padding(
//             padding: const EdgeInsets.only(top: 27.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   height: 12,
//                   width: 350,
//                   color: validPassword ? Colors.green : Colors.red,
//                 ),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     viewController.setView(CHECKPASSWORD);
//                   },
//                   child: Container(
//                     height: widget.actualHeight / 35,
//                     width: 25,
//                     decoration: const BoxDecoration(
//                       image: DecorationImage(
//                           image: AssetImage('assets/images/info.png'),
//                           fit: BoxFit.fill),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//           // SizedBox(
//           //   height: widget.actualHeight / 70,
//           // ),
//           Padding(
//             padding: const EdgeInsets.only(top: 8.0),
//             child: Container(
//               decoration: const BoxDecoration(
//                 border: Border(
//                   bottom: BorderSide(
//                     color: Colors.black,
//                     // width: 0.5,
//                   ),
//                 ),
//               ),
//               height: (widget.actualHeight -
//                       MediaQuery.of(context).padding.bottom) /
//                   17.9,
//               child: TextFormField(
//                 maxLength: 10,
//                 focusNode: _focus1,
//                 readOnly: true,
//                 showCursor: true,
//                 controller: widget.newPass,
//                 obscureText: _obscureText1,
//                  onChanged: (value) {
//                   validateStructure(widget.resetPass.text);
//                 },
//                 onTap: () {
//                  validateStructure(widget.resetPass.text);
//                  // validateStructure(widget.resetPass.text);
                  
//                   keyboardController.setKeypad(CAPITALKEYBOARD);
//                   keyboardController.controllerSetup(widget.newPass);
//                   keyboardController.setMaximiumLength('50');
//                   keyboardController.focusSetup(_focus, widget.newPass);
//                   keyboardController.symbolTrue(true);
//                   keyboardController.setcreatePassController(widget.newPass);

//                   keyboardController.setPassController(
//                       widget.newPass, widget.resetPass,);
//                 },
//                 style: normalTextStyle,
//                 decoration: InputDecoration(
//                   border: InputBorder.none,
//                   filled: _isFocused1,
//                   fillColor: textFieldColor,
//                   hintText:
//                       languageController.languageResponse.value.repeatPassword,
//                   counterText: "",
//                   suffixIcon: GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         _obscureText1 = !_obscureText1;
//                       });
//                     },
//                     child: _obscureText1
//                         ? eyeController.eyeclose
//                         : eyeController.eyeopen,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: widget.actualHeight / 30,
//           ),
//         ],
//       ),
//     );
//   }

//   bool validPassword = false;
//   bool validateStructure(String value) {
//     String pattern =
//         r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
//     RegExp regExp = RegExp(pattern);
//     validPassword = regExp.hasMatch(value);
//     setState(() {});
//     return regExp.hasMatch(value);
//   }
// }

// enum PasswordStrength {
//   Weak,
//   Medium,
//   Strong,
// }

// PasswordStrength getPasswordStrength(String password) {
//   // Password strength logic based on your criteria
//   if (password.length < 6) {
//     return PasswordStrength.Weak;
//   } else if (password.length < 10) {
//     return PasswordStrength.Medium;
//   } else {
//     return PasswordStrength.Strong;
//   }
// }

// Color getColorFromStrength(PasswordStrength strength) {
//   switch (strength) {
//     case PasswordStrength.Weak:
//       return Colors.red;
//     case PasswordStrength.Medium:
//       return Colors.orange;
//     case PasswordStrength.Strong:
//       return Colors.green;
//     default:
//       return Colors.grey;
//   }
// }
