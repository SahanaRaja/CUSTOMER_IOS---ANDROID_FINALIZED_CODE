import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

import '../../../../../core/helpers/SharedPreference/prefs.dart';
import '../../../../../home/presentation/controllers/options_controller.dart';
import '../../../../../home/presentation/pages/home_page.dart';
import '../controllers/assets_download_controller.dart';

class DownloadScreen extends StatefulWidget {
  const DownloadScreen({Key? key}) : super(key: key);

  @override
  _DownloadScreenState createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {
  var languageController = Get.put(LanguageController());
  @override
  void initState() {
    Get.put(AssetsDownloadController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<AssetsDownloadController>(
        init: AssetsDownloadController(),
        initState: (_) {},
        builder: (controller) {
          if (controller.loading.value) {
            return const Center(child: CircularProgressIndicator());
          } else if (controller.error.value != '') {
            return Center(
              child: Column(
                children: [
                  Text(controller.error.value),
                  const Text('RESTART APP'),
                ],
              ),
            );
          } else {
            Prefs.setDownloadedAssets(true);
            Get.put(OptionsController());
            SchedulerBinding.instance.addPostFrameCallback((_) {
              Get.off(() => const HomePage());
            });

            return const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
              ],
            );
          }
        },
      ),
    );
  }
}
