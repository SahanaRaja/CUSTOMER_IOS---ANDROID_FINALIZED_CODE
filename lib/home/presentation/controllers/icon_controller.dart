import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../database/database.dart';

class EyeController extends GetxController {
  // var icon = getBase64ImageClose().obs;
  late Image eyeclose;
  late Image eyeopen;
  late Image flag;
  late Image users;

  @override
  void onInit() {
    getBase64ImageClose();
    getBase64ImageOpen();
    getBase64ImageFlag();
    super.onInit();
  }

  getImagenBase64(String imageBase64) {
    const Base64Codec base64 = Base64Codec();
    Uint8List bytes = base64.decode(imageBase64);
    return Image.memory(
      bytes,
      height: 10,
      width: 20,
    );
  }

  getBase64ImageClose() {
    getImage('80').then((value) {
      eyeclose = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return eyeclose;
    });
  }

  getBase64ImageOpen() {
    getImage('79').then((value) {
      eyeopen = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return eyeopen;
    });
  }

  getBase64ImageFlag() {
    getImage('90').then((value) {
      flag = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return flag;
    });
    getImage('220').then((value) {
      users = getImagenBase64(value["BM_BASE64_IMAGE_STRING"]);
      return users;
    });
  }
}
