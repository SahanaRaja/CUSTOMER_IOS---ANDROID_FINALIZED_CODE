
import 'package:customer_assist/home/presentation/controllers/configure_controller.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class StoreDetailsWidget extends StatefulWidget {
  final double actualHeight;
  const StoreDetailsWidget({Key? key, required this.actualHeight})
      : super(key: key);

  @override
  State<StoreDetailsWidget> createState() => _StoreDetailsWidgetState();
}

class _StoreDetailsWidgetState extends State<StoreDetailsWidget> {
  ConfigureController configureController = Get.find();
  LanguageController languageController = Get.find();
  int indexValue = 0;
  List<bool> shopChecked = [];
  @override
  void initState() {
    shopChecked = List.generate(
        configureController.letmeShopDetails.length, (index) => false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return Column(
        children: [
          SizedBox(
            //color: Colors.red,
            //child: SizedBox(
              height: GetPlatform.isAndroid
                  ? (widget.actualHeight - 40) / 3.9
                  //  18.1
                  : (widget.actualHeight -
                          MediaQuery.of(context).padding.bottom) /
                      17.9 *
                      4,
              // width: GetPlatform.isAndroid
              //     ? (widget.actualHeight - 40) /17.9 * 9
              //     //  18.1
              //     : (widget.actualHeight -
              //             MediaQuery.of(context).padding.bottom) /
              //         17.9 *
              //         9,
              child: PageView.builder(
                onPageChanged: ((value) {
                  setState(() {
                    indexValue = value;
                    print(indexValue);
                    print(configureController
                        .letmeShopDetails[indexValue].longitude!);
                    print(configureController
                        .letmeShopDetails[indexValue].latitude!);
                  });
                }),
                scrollDirection: Axis.horizontal,
                itemCount: configureController.letmeShopDetails.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      // SizedBox(
                      //   height: 5,
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 0),
                       child: 
                        Row(
                           //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              // changed by bhava
                              margin: const EdgeInsets.only(bottom: 15), //ponviveka
                              width: GetPlatform.isAndroid
                                  ? (widget.actualHeight - 40) / 17.9 * 3.4
                                  : (widget.actualHeight -
                                          MediaQuery.of(context)
                                              .padding
                                              .bottom) /
                                      17.9 *
                                      3.2, //ponviveka
                              height: GetPlatform.isAndroid
                                  ? (widget.actualHeight - 40) / 17.9 * 3.3
                                  // 18.1
                                  : (widget.actualHeight -
                                          MediaQuery.of(context)
                                              .padding
                                              .bottom) /
                                      17.9 *
                                      2.8, //ponviveka
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                ),
                              ),
                              child: Image.network(
                                configureController
                                    .letmeShopDetails[index].imageUrl!,
                                fit: BoxFit.fill, //ponviveka
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.04,
                            ),
                            // Padding(
                            //   padding: GetPlatform.isAndroid
                            //   ?  const EdgeInsets.only( top: 15)
                            //   : const EdgeInsets.only(left: 5, top: 15),
                              //child: 
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                     //color:Color.fromARGB(255, 145, 200, 27),
                                     margin:GetPlatform.isAndroid
                                    ? const EdgeInsets.only(right: 50,top: 20)
                                    : const EdgeInsets.only(right: 200,top: 20),
                                    width: GetPlatform.isAndroid
                                        ? (widget.actualHeight - 40) / 1.5
                                        //  18.1
                                        : (widget.actualHeight -
                                                MediaQuery.of(context)
                                                    .padding
                                                    .bottom) /
                                            17.9 *
                                            3.85,
                                    height: GetPlatform.isAndroid
                                        ? (widget.actualHeight - 40) / 17.9 * 0.56
                                        //  18.1
                                        : (widget.actualHeight -
                                                MediaQuery.of(context)
                                                    .padding
                                                    .bottom) /
                                            17.9 *
                                            0.56,
                                     //child: Center(
                                    child: Text(
                                      configureController
                                          .letmeShopDetails[index].shopName!,
                                      textAlign: TextAlign.start, //ponviveka
                                    ),
                                     //),
                                  ),
                                   SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                                  Container(
                                    // color: Colors.yellow,
                                    margin: const EdgeInsets.only(right: 200), //ponviveka
                                    width: GetPlatform.isAndroid
                                        ? (widget.actualHeight - 40) / 2
                                        // 18.1
                                        : (widget.actualHeight -
                                                MediaQuery.of(context)
                                                    .padding
                                                    .bottom) /
                                            17.9 *
                                            4.00, //ponviveka
                                    height: GetPlatform.isAndroid
                                        ? (widget.actualHeight - 40) /  17.9 * 0.56
                                        // 18.1
                                        : (widget.actualHeight -
                                                MediaQuery.of(context)
                                                    .padding
                                                    .bottom) /
                                            17.9 *
                                            0.56,
                                    // child: Center(
                                    //child: FittedBox(
                                    //fit: BoxFit.fill,
                                    child: Row(
                                      // mainAxisAlignment:
                                      //     MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${configureController.letmeShopDetails[index].address1!} ,',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500),
                                          textAlign: TextAlign.left,
                                        ),
                                        SizedBox(
                                          // changed by bhava
                                          // color: Colors.amber,
                                          width: GetPlatform.isAndroid
                                              ? (widget.actualHeight - 40) / 4.3
                                              // 18.1
                                              : (widget.actualHeight -
                                                      MediaQuery.of(context)
                                                          .padding
                                                          .bottom) /
                                                  17.9, //ponviveka
                                          child: Text(
                                            configureController
                                                .letmeShopDetails[index]
                                                .address2!,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            textAlign: TextAlign.start,
                                            maxLines: 1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // ),
                                  // ),
                                 SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                                  Container(
                                     margin: const EdgeInsets.only(right: 200),
                                    width: GetPlatform.isAndroid
                                        ? (widget.actualHeight - 40) / 2
                                        // 18.1
                                        : (widget.actualHeight -
                                                MediaQuery.of(context)
                                                    .padding
                                                    .bottom) /
                                            17.9 *
                                            3.85,
                                    height: GetPlatform.isAndroid
                                        ? (widget.actualHeight - 40) / 17.9 * 0.56
                                        : (widget.actualHeight -
                                                MediaQuery.of(context)
                                                    .padding
                                                    .bottom) /
                                            17.9 *
                                            0.56,
                                    // child: Center(
                                    // child: FittedBox(
                                    // fit: BoxFit.fill,
                                    child: Row(
                                      // mainAxisAlignment:
                                      //     MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${configureController.letmeShopDetails[index].city!} ,',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500),
                                          textAlign: TextAlign.start,
                                        ),
                                        Text(
                                          configureController
                                              .letmeShopDetails[index]
                                              .province!,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    // ),
                                    // ),
                                  ),
                                 SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                                  Container(
                                     margin: const EdgeInsets.only(right: 200),
                                    //color: Colors.blue,
                                    width: GetPlatform.isAndroid
                                        ? (widget.actualHeight - 40) / 2
                                        //  18.1
                                        : (widget.actualHeight -
                                                MediaQuery.of(context)
                                                    .padding
                                                    .bottom) /
                                            17.9 *
                                            3.85,
                                    height: GetPlatform.isAndroid
                                        ? (widget.actualHeight - 40) / 17.9 * 0.56
                                        // 18.1
                                        : (widget.actualHeight -
                                                MediaQuery.of(context)
                                                    .padding
                                                    .bottom) /
                                            17.9 *
                                            0.56,
                                    // child: Center(
                                    child: Row(
                                      // mainAxisAlignment:
                                      //     MainAxisAlignment.spaceEvenly,
                                      children: [
                                        const Text(
                                          'Open:',
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 13),
                                        ),
                                        Text(
                                          configureController
                                              .letmeShopDetails[index]
                                              .shopOpenTime!,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 13),
                                        ),
                                        const Text(
                                          'Closes:',
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 13),
                                        ),
                                        Text(
                                            configureController
                                                .letmeShopDetails[index]
                                                .shopCloseTime!,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 13))
                                      ],
                                    ),
                                    // ),
                                  ),
                                  // const SizedBox(
                                  //   height: 5,
                                  // ),
                                   SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                                  Container(
                                    margin: const EdgeInsets.only(right: 200),
                                    // padding:
                                    //     EdgeInsets.only(bottom: 10), //ponviveka
                                    width: GetPlatform.isAndroid
                                        ? (widget.actualHeight - 40) / 2
                                        // 18.1
                                        : (widget.actualHeight -
                                                MediaQuery.of(context)
                                                    .padding
                                                    .bottom) /
                                            17.9 *
                                            3.85,
                                    height: GetPlatform.isAndroid
                                        ? (widget.actualHeight - 40) /  17.9 * 0.56
                                        : (widget.actualHeight -
                                                MediaQuery.of(context)
                                                    .padding
                                                    .bottom) /
                                            17.9 *
                                            0.56,
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Phone: ',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          Text(
                                            configureController
                                                .letmeShopDetails[index]
                                                .mobileNumber!,
                                            style: const TextStyle(
                                                color: Color.fromARGB(
                                                    255, 12, 60, 234),
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            //)
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
           // ),
          ),
          SizedBox(

            height: GetPlatform.isAndroid
           ?  MediaQuery.of(context).size.height * 0.03
           :  MediaQuery.of(context).size.height * 0.03
            // 90.9 * .09,
          ),
          Container(
              width: GetPlatform.isAndroid
                  ? (widget.actualHeight - 40) / 17.9 * 8.90
                  // 18.1
                  : (widget.actualHeight -
                          MediaQuery.of(context).padding.bottom) /
                      17.9 *
                      8.70,
              height: GetPlatform.isAndroid
                  ? (widget.actualHeight - 40) / 17.9 * 4.90
                  // 18.1
                  : (widget.actualHeight -
                          MediaQuery.of(context).padding.bottom) /
                      17.9 *
                      4.90,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 185, 237, 248),
                borderRadius: BorderRadius.circular(20),
              ),
              child: SizedBox(
                  height: GetPlatform.isAndroid
                      ? (widget.actualHeight - 40) / 18.1
                      : (widget.actualHeight -
                              MediaQuery.of(context).padding.bottom) /
                          17.9 *
                          3.4,
                  child: PageView.builder(
                      onPageChanged: ((value) {
                        setState(() {
                          indexValue = value;
                          print(indexValue);
                          print(configureController
                              .letmeShopDetails[indexValue].longitude!);
                          print(configureController
                              .letmeShopDetails[indexValue].latitude!);
                        });
                      }),
                      scrollDirection: Axis.horizontal,
                      itemCount: configureController.letmeShopDetails.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          padding: const EdgeInsets.only(left: 0, top: 20),
                          child: Column(
                            children: [
                              Row(
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    height: GetPlatform.isAndroid
                                          ? (widget.actualHeight - 40) / 17.9 * 0.55
                                          : (widget.actualHeight -
                                                  MediaQuery.of(context).padding.bottom) /
                                              17.9 *
                                              0.55,
                                     width: GetPlatform.isAndroid
                                          ? (widget.actualHeight - 40) / 17.9 * 4.7
                                          : (widget.actualHeight -
                                                  MediaQuery.of(context).padding.bottom) /
                                              17.9 *
                                              4.7,
                                    // color: Colors.red,
                                    // padding: const EdgeInsets.only(
                                    //     // right: 40,
                                    //     left: 100),
                                    child: const Text(
                                      'Distance to shop',
                                      textAlign: TextAlign.end,
                                      style: TextStyle(fontSize: 17),
                                    ),
                                  ),
                                   SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.1,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 4,
                                    height:
                                        MediaQuery.of(context).size.width / 18,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: const Color.fromARGB(
                                              255, 9, 8, 8),
                                        )),
                                    padding:
                                        const EdgeInsets.only(top: 5, left: 1),
                                    child: Text(
                                      configureController
                                          .letmeShopDetails[index].distance!,
                                      textAlign: TextAlign.left,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height /
                                    90.9 *
                                    1.5,
                              ),
                              Row(
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                     height: GetPlatform.isAndroid
                                          ? (widget.actualHeight - 40) / 17.9 * 0.55
                                          : (widget.actualHeight -
                                                  MediaQuery.of(context).padding.bottom) /
                                              17.9 *
                                              0.55,
                                     width: GetPlatform.isAndroid
                                          ? (widget.actualHeight - 40) / 17.9 * 4.7
                                          : (widget.actualHeight -
                                                  MediaQuery.of(context).padding.bottom) /
                                              17.9 *
                                              4.7,
                                    // padding: const EdgeInsets.only(
                                    //     right: 40, left: 40),
                                    child: const Text(
                                      'Max. product availability',
                                      textAlign: TextAlign.end,
                                      style: TextStyle(fontSize: 17),
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.1,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 4,
                                    height:
                                        MediaQuery.of(context).size.width / 18,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: const Color.fromARGB(
                                              255, 9, 8, 8),
                                        )),
                                    padding:
                                        const EdgeInsets.only(top: 5, left: 1),
                                    child: Text(
                                      configureController
                                              .letmeShopDetails[index]
                                              .productavailability
                                              .toString() ??
                                          '',
                                      textAlign: TextAlign.left,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height /
                                    90.9 *
                                    1.5,
                              ),
                              Row(
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                     height: GetPlatform.isAndroid
                                          ? (widget.actualHeight - 40) / 17.9 * 0.55
                                          : (widget.actualHeight -
                                                  MediaQuery.of(context).padding.bottom) /
                                              17.9 *
                                              0.55,
                                     width: GetPlatform.isAndroid
                                          ? (widget.actualHeight - 40) / 17.9 * 4.7
                                          : (widget.actualHeight -
                                                  MediaQuery.of(context).padding.bottom) /
                                              17.9 *
                                              4.7,
                                    // padding: const EdgeInsets.only(
                                    //     // right: 40,
                                    //     left: 80),
                                    child: const Text(
                                      'Lowest overall cost',
                                      textAlign: TextAlign.end,
                                      style: TextStyle(fontSize: 17),
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.1,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 4,
                                    height:
                                        MediaQuery.of(context).size.width / 18,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: const Color.fromARGB(
                                              255, 9, 8, 8),
                                        )),
                                    padding:
                                        const EdgeInsets.only(top: 5, left: 1),
                                    child: Text(
                                      configureController
                                              .letmeShopDetails[index]
                                              .lowestprice
                                              .toString() ??
                                          '',
                                      textAlign: TextAlign.left,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height /
                                    90.9 *
                                    1.5,
                              ),
                              Row(
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                     height: GetPlatform.isAndroid
                                          ? (widget.actualHeight - 40) / 17.9 * 0.55
                                          : (widget.actualHeight -
                                                  MediaQuery.of(context).padding.bottom) /
                                              17.9 *
                                              0.55,
                                     width: GetPlatform.isAndroid
                                          ? (widget.actualHeight - 40) / 17.9 * 4.7
                                          : (widget.actualHeight -
                                                  MediaQuery.of(context).padding.bottom) /
                                              17.9 *
                                              4.7,
                                    // padding: const EdgeInsets.only(
                                    //     // right: 40,
                                    //     left: 26),
                                    child: const Text(
                                      'Best Quality as per ratings',
                                      textAlign: TextAlign.end,
                                      style: TextStyle(fontSize: 17),
                                    ),
                                  ),
                                   SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.1,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 4,
                                    height:
                                        MediaQuery.of(context).size.width / 18,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: const Color.fromARGB(
                                              255, 9, 8, 8),
                                        )),
                                    padding:
                                        const EdgeInsets.only(top: 5, left: 1),
                                    child: Text(
                                      configureController
                                          .letmeShopDetails[index].rating!
                                          .toString(),
                                      textAlign: TextAlign.left,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height /
                                    90.9 *
                                    1.5,
                              ),
                              Row(
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                     height: GetPlatform.isAndroid
                                          ? (widget.actualHeight - 40) / 17.9 * 0.55
                                          : (widget.actualHeight -
                                                  MediaQuery.of(context).padding.bottom) /
                                              17.9 *
                                              0.55,
                                     width: GetPlatform.isAndroid
                                          ? (widget.actualHeight - 40) / 17.9 * 4.7
                                          : (widget.actualHeight -
                                                  MediaQuery.of(context).padding.bottom) /
                                              17.9 *
                                              4.7,
                                    // padding: const EdgeInsets.only(
                                    //     // right: 40,
                                    //     left: 115),
                                    child: const Text(
                                      'Delivery Speed',
                                      textAlign: TextAlign.end,
                                      style: TextStyle(fontSize: 17),
                                    ),
                                  ),
                                   SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.1,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 4,
                                    height:
                                        MediaQuery.of(context).size.width / 18,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: const Color.fromARGB(
                                              255, 9, 8, 8),
                                        )),
                                    padding:
                                        const EdgeInsets.only(top: 5, left: 1),
                                    child: Text(
                                      configureController
                                              .letmeShopDetails[index]
                                              .deliveryspeed ??
                                          '',
                                      textAlign: TextAlign.left,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      }))),
          SizedBox(
              height: GetPlatform.isAndroid
                  ? (widget.actualHeight - 40) / 15
                  // 18.1
                  : (widget.actualHeight -
                          MediaQuery.of(context).padding.bottom) /
                      11 //ponviveka

              // height: 45,
              ),
          SizedBox(
            height: 55,
            width: 350,
            //color: Colors.red,
            child: PageView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 50, bottom: 15),
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          // color: Colors.yellow,
                          border: Border.all(
                            color: const Color.fromARGB(255, 9, 8, 8),
                          ),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset: Offset(4, 4))
                          ]),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            shopChecked[index] = !shopChecked[index];
                            configureController.updateShop(
                                configureController
                                    .letmeShopDetails[index].shopId!,
                                languageController.languagenum.toString());
                            print('object---->');
                          });
                        },
                        child: Container(
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
                            child: Center(
                              child: shopChecked[index] == true
                                  ? const Icon(
                                      Icons.done,
                                      color: Colors.green,
                                      size: 25,
                                    )
                                  : const Icon(
                                      Icons.done,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                            )),
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Container(
                      height: 45, //ponviveka
                      width: 225,
                      margin: const EdgeInsets.only(bottom: 15), //ponviveka
                      padding: const EdgeInsets.only(
                          top: 10, left: 2, right: 2, bottom: 2),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: const Color.fromARGB(255, 121, 119, 119),
                          )),
                      // child: const FittedBox(
                      // fit: BoxFit.fill,
                      child: const Text(
                        "Catalogue of items",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                            color: Colors.grey),
                      ),
                      // ),
                    ),
                  ],
                );
              },
            ),
          )
        ],

        // ),
      );
    });
  }
}
