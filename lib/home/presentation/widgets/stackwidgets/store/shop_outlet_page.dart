import 'package:customer_assist/home/presentation/controllers/shop_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShopOutletPage extends StatefulWidget {
  final double actualHeight;

  const ShopOutletPage({Key? key, required this.actualHeight})
      : super(key: key);

  @override
  State<ShopOutletPage> createState() => _ShopOutletPageState();
}

class _ShopOutletPageState extends State<ShopOutletPage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: GetPlatform.isAndroid
          ? (widget.actualHeight - 40) / 18.1
          : (widget.actualHeight - MediaQuery.of(context).padding.bottom) /
              17.9 *
              14,
      child: GetX<ShopController>(
          init: ShopController(),
          initState: (_) {},
          builder: (shopController) {
            return ListView.builder(
              itemCount: shopController.shoppingOutletResponse.value.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: GetPlatform.isAndroid
                          ? (widget.actualHeight - 40) / 18.1
                          : (widget.actualHeight -
                                  MediaQuery.of(context).padding.bottom) /
                              17.9 *
                              8.5,
                      height: GetPlatform.isAndroid
                          ? (widget.actualHeight - 40) / 18.1
                          : (widget.actualHeight -
                                  MediaQuery.of(context).padding.bottom) /
                              17.9 *
                              3.2,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                          color: Colors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15))),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 32.0, right: 10),
                        child: Row(
                          children: [
                            Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.grey,
                                          spreadRadius: 1,
                                          blurRadius: 1,
                                          offset: Offset(4, 4))
                                    ]),
                                child: const Center(
                                  child: Icon(
                                    Icons.done,
                                    color: Colors.green,
                                    size: 25,
                                  ),
                                )),
                            const SizedBox(
                              width: 15,
                            ),
                            Container(
                              width: GetPlatform.isAndroid
                                  ? (widget.actualHeight - 40) / 18.1
                                  : (widget.actualHeight -
                                          MediaQuery.of(context)
                                              .padding
                                              .bottom) /
                                      17.9 *
                                      2.5,
                              height: GetPlatform.isAndroid
                                  ? (widget.actualHeight - 40) / 18.1
                                  : (widget.actualHeight -
                                          MediaQuery.of(context)
                                              .padding
                                              .bottom) /
                                      17.9 *
                                      2.5,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                  image: DecorationImage(
                                    image: NetworkImage(shopController
                                        .shoppingOutletResponse
                                        .value[index]
                                        .imageUrl!),
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15))),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 15.0, top: 20),
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.space,
                                children: [
                                  Container(
                                    width: GetPlatform.isAndroid
                                        ? (widget.actualHeight - 40) / 18.1
                                        : (widget.actualHeight -
                                                MediaQuery.of(context)
                                                    .padding
                                                    .bottom) /
                                            17.9 *
                                            3.85,
                                    height: GetPlatform.isAndroid
                                        ? (widget.actualHeight - 40) / 18.1
                                        : (widget.actualHeight -
                                                MediaQuery.of(context)
                                                    .padding
                                                    .bottom) /
                                            17.9 *
                                            0.76,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                      ),
                                    ),
                                    child: Center(
                                        child: Text(shopController
                                            .shoppingOutletResponse
                                            .value[index]
                                            .shopName!)),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    width: GetPlatform.isAndroid
                                        ? (widget.actualHeight - 40) / 18.1
                                        : (widget.actualHeight -
                                                MediaQuery.of(context)
                                                    .padding
                                                    .bottom) /
                                            17.9 *
                                            3.85,
                                    height: GetPlatform.isAndroid
                                        ? (widget.actualHeight - 40) / 18.1
                                        : (widget.actualHeight -
                                                MediaQuery.of(context)
                                                    .padding
                                                    .bottom) /
                                            17.9 *
                                            0.76,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                      ),
                                    ),
                                    child: Center(
                                        child: Text(shopController
                                            .shoppingOutletResponse
                                            .value[index]
                                            .items!
                                            .length
                                            .toString())),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    width: GetPlatform.isAndroid
                                        ? (widget.actualHeight - 40) / 18.1
                                        : (widget.actualHeight -
                                                MediaQuery.of(context)
                                                    .padding
                                                    .bottom) /
                                            17.9 *
                                            3.85,
                                    height: GetPlatform.isAndroid
                                        ? (widget.actualHeight - 40) / 18.1
                                        : (widget.actualHeight -
                                                MediaQuery.of(context)
                                                    .padding
                                                    .bottom) /
                                            17.9 *
                                            0.76,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                      ),
                                    ),
                                    child: Center(
                                        child: Text(shopController
                                            .shoppingOutletResponse
                                            .value[index]
                                            .cost!
                                            .toString())),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 9)
                  ],
                );
              },
            );
          }),
    );
  }
}
