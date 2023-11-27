import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreCreditsPage extends StatefulWidget {
  final double actualHeight;
  const StoreCreditsPage({Key? key, required this.actualHeight})
      : super(key: key);

  @override
  State<StoreCreditsPage> createState() => _StoreCreditsPageState();
}

class _StoreCreditsPageState extends State<StoreCreditsPage> {
  var languageController = Get.put(LanguageController());
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(
                height: GetPlatform.isAndroid
                    ? (widget.actualHeight - 40) / 18.1
                    : (widget.actualHeight -
                            MediaQuery.of(context).padding.bottom) /
                        17.9 *
                        1,
                child: Center(
                  child: Text(
                    languageController.languageResponse.value.approvedAmount ??
                        '',
                    style: const TextStyle(
                      fontSize: 21,
                      color: Color.fromARGB(255, 12, 36, 255),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const Text(
                "1,000.00",
                style: TextStyle(
                  color: Color.fromARGB(255, 10, 162, 15),
                  fontSize: 21,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(
                height: GetPlatform.isAndroid
                    ? (widget.actualHeight - 40) / 18.1
                    : (widget.actualHeight -
                            MediaQuery.of(context).padding.bottom) /
                        17.9 *
                        1,
                child: Center(
                  child: Text(
                    languageController
                            .languageResponse.value.creditPeriodInDays ??
                        '',
                    style: const TextStyle(
                      fontSize: 21,
                      color: Color.fromARGB(255, 12, 36, 255),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const Text(
                "30",
                style: TextStyle(
                  color: Color.fromARGB(255, 12, 36, 255),
                  fontSize: 21,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Center(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: GetPlatform.isAndroid
                      ? (widget.actualHeight - 40) / 18.1
                      : (widget.actualHeight -
                              MediaQuery.of(context).padding.bottom) /
                          17.9 *
                          1,
                  child: Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            border: Border(
                          right: BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                        )),
                        // child: const Text('    '),
                        height: GetPlatform.isAndroid
                            ? ((widget.actualHeight - 40) / 17.9) * 1.8
                            : ((widget.actualHeight -
                                    MediaQuery.of(context).padding.bottom) /
                                17.9),
                        width: GetPlatform.isAndroid
                            ? ((widget.actualHeight - 40) / 17.9) * 1.8
                            : ((widget.actualHeight -
                                        MediaQuery.of(context).padding.bottom) /
                                    17.9) *
                                2.5,

                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          languageController.languageResponse.value.usedOn ??
                              '',
                          style: const TextStyle(
                              color: Color.fromARGB(255, 12, 36, 255),
                              fontSize: 16),
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            // color: Colors.yellow[300],
                            border: Border(
                          right: BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                        )),
                        height: GetPlatform.isAndroid
                            ? ((widget.actualHeight - 40) / 17.9) * 1.8
                            : ((widget.actualHeight -
                                    MediaQuery.of(context).padding.bottom) /
                                17.9),
                        width: GetPlatform.isAndroid
                            ? ((widget.actualHeight - 40) / 17.9) * 1.8
                            : ((widget.actualHeight -
                                        MediaQuery.of(context).padding.bottom) /
                                    17.9) *
                                2.2,
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          languageController.languageResponse.value.dueOn ?? '',
                          style: const TextStyle(
                              color: Color.fromARGB(255, 12, 36, 255),
                              fontSize: 16),
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            // color: Colors.yellow[300],
                            border: Border(
                          right: BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                        )),
                        height: GetPlatform.isAndroid
                            ? ((widget.actualHeight - 40) / 17.9) * 1.8
                            : ((widget.actualHeight -
                                    MediaQuery.of(context).padding.bottom) /
                                17.9),
                        width: GetPlatform.isAndroid
                            ? ((widget.actualHeight - 40) / 17.9) * 1.8
                            : ((widget.actualHeight -
                                        MediaQuery.of(context).padding.bottom) /
                                    17.9) *
                                2.2,
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          languageController.languageResponse.value.bill ?? '',
                          style: const TextStyle(
                              color: Color.fromARGB(255, 12, 36, 255),
                              fontSize: 16),
                        ),
                      ),
                      Container(
                        height: GetPlatform.isAndroid
                            ? ((widget.actualHeight - 40) / 17.9) * 1.8
                            : ((widget.actualHeight -
                                    MediaQuery.of(context).padding.bottom) /
                                17.9),
                        width: GetPlatform.isAndroid
                            ? ((widget.actualHeight - 40) / 17.9) * 1.8
                            : ((widget.actualHeight -
                                        MediaQuery.of(context).padding.bottom) /
                                    17.9) *
                                2,
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          languageController.languageResponse.value.bal ?? '',
                          style: const TextStyle(
                              color: Color.fromARGB(255, 12, 36, 255),
                              fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: GetPlatform.isAndroid
                ? ((widget.actualHeight - 40) / 17.9) * 1.8
                : ((widget.actualHeight -
                            MediaQuery.of(context).padding.bottom) /
                        17.9) *
                    4,
            child: Stack(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (buildContext, data) {
                      return Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey[400]!,
                              width: 0.5,
                            ),
                            top: BorderSide(
                              color: Colors.grey[400]!,
                              width: 1,
                            ),
                          ),
                        ),
                        height: (widget.actualHeight -
                                MediaQuery.of(context).padding.bottom) /
                            17.9,
                        child: Row(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                  border: Border(
                                right: BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                ),
                              )),
                              height: GetPlatform.isAndroid
                                  ? ((widget.actualHeight - 40) / 17.9) * 1.8
                                  : ((widget.actualHeight -
                                          MediaQuery.of(context)
                                              .padding
                                              .bottom) /
                                      17.9),
                              width: GetPlatform.isAndroid
                                  ? ((widget.actualHeight - 40) / 17.9) * 1.8
                                  : ((widget.actualHeight -
                                              MediaQuery.of(context)
                                                  .padding
                                                  .bottom) /
                                          17.9) *
                                      2.5,
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.only(left: 10),
                              child: const Text(""),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                  border: Border(
                                right: BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                ),
                              )),
                              height: GetPlatform.isAndroid
                                  ? ((widget.actualHeight - 40) / 17.9) * 1.8
                                  : ((widget.actualHeight -
                                          MediaQuery.of(context)
                                              .padding
                                              .bottom) /
                                      17.9),
                              width: GetPlatform.isAndroid
                                  ? ((widget.actualHeight - 40) / 17.9) * 1.8
                                  : ((widget.actualHeight -
                                              MediaQuery.of(context)
                                                  .padding
                                                  .bottom) /
                                          17.9) *
                                      2.2,
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.only(left: 10),
                              child: const Text(""),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                  border: Border(
                                right: BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                ),
                              )),
                              height: GetPlatform.isAndroid
                                  ? ((widget.actualHeight - 40) / 17.9) * 1.8
                                  : ((widget.actualHeight -
                                          MediaQuery.of(context)
                                              .padding
                                              .bottom) /
                                      17.9),
                              width: GetPlatform.isAndroid
                                  ? ((widget.actualHeight - 40) / 17.9) * 1.8
                                  : ((widget.actualHeight -
                                              MediaQuery.of(context)
                                                  .padding
                                                  .bottom) /
                                          17.9) *
                                      2.2,
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.only(left: 10),
                              child: const Text(""),
                            ),
                            Container(
                              height: GetPlatform.isAndroid
                                  ? ((widget.actualHeight - 40) / 17.9) * 1.8
                                  : ((widget.actualHeight -
                                          MediaQuery.of(context)
                                              .padding
                                              .bottom) /
                                      17.9),
                              width: GetPlatform.isAndroid
                                  ? ((widget.actualHeight - 40) / 17.9) * 1.8
                                  : ((widget.actualHeight -
                                          MediaQuery.of(context)
                                              .padding
                                              .bottom) /
                                      17.9),
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.only(right: 10),
                              child: const Text(""),
                            ),
                          ],
                        ),
                      );
                    }),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(
                height: GetPlatform.isAndroid
                    ? (widget.actualHeight - 40) / 18.1
                    : (widget.actualHeight -
                            MediaQuery.of(context).padding.bottom) /
                        17.9 *
                        1,
                child: SizedBox(
                  child: Center(
                    child: Text(
                      languageController
                              .languageResponse.value.amountPayableIn ??
                          '',
                      style: const TextStyle(
                        fontSize: 21,
                        color: Color.fromARGB(255, 12, 36, 255),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              const Text(
                "100.00",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 21,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
