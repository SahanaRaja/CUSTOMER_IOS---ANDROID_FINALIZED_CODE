import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/header_controller.dart';

class SubHeader extends StatefulWidget {
  const SubHeader({Key? key}) : super(key: key);

  @override
  _SubHeaderState createState() => _SubHeaderState();
}

class _SubHeaderState extends State<SubHeader> {
  final HeaderController headerController = Get.find();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetX<HeaderController>(
      init: HeaderController(),
      initState: (_) {},
      builder: (controller) {
        return Text(
          controller.subHeaderLabel.value,
          style: const TextStyle(
              fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),
        );
      },
    );
  }
}
