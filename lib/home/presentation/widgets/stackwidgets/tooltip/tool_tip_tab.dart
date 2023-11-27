// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/app_constants.dart';
import '../../../controllers/keyboard_controller.dart';
// import 'package:google_fonts/google_fonts.dart';

class MyTooltip extends StatefulWidget {
  final Widget child;
  final String message;
  final Function(String) onValueChanged;

  const MyTooltip(
      {required this.message,
      required this.child,
      required this.onValueChanged});

  @override
  State<MyTooltip> createState() => _MyTooltipState();
}

class _MyTooltipState extends State<MyTooltip> {
  KeyboardController keyboardController = Get.find();

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<State<Tooltip>>();
    return Tooltip(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/key_tooltip.png'),
            fit: BoxFit.fill),
      ),
      preferBelow: false,
      height: 60,
      verticalOffset: 25,
      textStyle: const TextStyle(
          color: Colors.black, fontSize: 25, fontWeight: FontWeight.w600),
      key: key,
      message: widget.message,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => _onTap(key),
        child: widget.child,
      ),
    );
  }

  void _onTap(GlobalKey key) {
    final dynamic tooltip = key.currentState;
    tooltip?.ensureTooltipVisible();
    Future.delayed(const Duration(milliseconds: 400), () {
      tooltip?.deactivate();
    });
    if (keyboardController.capslock.value == false &&
        keyboardController.changekeypad.value != SYMBOLSKEYBOARD) {
      keyboardController.setKeypad(SMALLKEYBOARD);
    }
    keyboardController.keyboardOperation(widget.message);

    widget.onValueChanged(widget.message);
    // tooltip?.ensureTooltipHide();
  }
}
