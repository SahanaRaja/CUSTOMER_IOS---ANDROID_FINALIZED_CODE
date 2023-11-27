
import 'package:customer_assist/core/app_colors.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/ar_view.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/sub_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JewellaryScreen extends StatefulWidget {
  double actualHeight;
  JewellaryScreen({Key? key, required this.actualHeight}) : super(key: key);
  @override
  State<JewellaryScreen> createState() => _JewellaryScreenState();
}

class _JewellaryScreenState extends State<JewellaryScreen> {
  @override
  void initState() {
    // Permission.camera.request();
    asyncker();

    super.initState();
  }

  asyncker() async {
    //await getData();
  }

  @override
  Widget build(BuildContext context) {
    var myData = [1, 2, 3, 4, 5];
    myData.insert(0, -1);
    myData.add(-1);
    return Stack(
      children: [
        Column(
          children: [
            Container(
        
              // margin: const EdgeInsets.only(right: 2),
             height: MediaQuery.of(context).size.height * 0.043,
              width: MediaQuery.of(context).size.width * 0.99,
              color: AppColors.subHeaderContainer,
              child: const Center(child: SubHeader())),
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(10),
                 height: GetPlatform.isAndroid
                  ? (widget.actualHeight) * 0.75
                  : (widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                      17.9 *
                      12,
                // height: 
                // 505,
                 width: 475,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: Colors.black,
                    width: 1.5,
                  ),
                  // borderRadius: BorderRadius.all(Radius.circular(22)),
                ),
                 child: const ARHomeScreen(),
              ),
            ),
            SizedBox(
              height: 25,
              width: 100,
              child: Image.asset('assets/images/arrow_down.png'),
            ),
            // SizedBox(
            //   height: 152,
            //   width: double.infinity,
            SizedBox(
              height: 135,
              width: double.infinity,
              // child: InkWell(
              // onTap: () {
              //   const ARHomeScreen();
              //   print("++++++++ARHOMESCREEN");
              // },
              // child: GetX<ShopController>(
              //     init: ShopController(),
              //     initState: (_) {},
              //     builder: (controller) {
              // return
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: myData.length,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0 || index == myData.length - 1) {
                    return Container(
                      height: 150,
                      width: 150,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                         // width: 1.5,
                          //scolor: Colors.black,
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(23)),
                      ),
                    );
                  }
                  final myItem = myData[index];

                  return Row(
                    children: [
                      Container(
                        height: 150,
                        width: 150,
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(Radius.circular(23)),
                          // border: Border.all(
                          //     color: const Color.fromARGB(255, 0, 0, 0), width: 1.5),
                        ),
                        child: FittedBox(
                          fit: BoxFit.fill,
                           child: Image.asset('assets/images/img$myItem.png'),
                        ),
                      ),
                    ],
                  );
                },
              ),

              /* child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 
                // controller
                //     .resitem[0]
                //     .category![controller.catagoryIndex.value]
                //     .subcategory!
                //     .length,
               7,
                itemBuilder: (BuildContext context, itemindex) {
                  return Expanded(
                    child: Container(
                      height: 150,
                      width: 150,
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      // child: Image.network(controller
                      //     .resitem[
                      //         shopController.supercatagoryIndex.value]
                      //     .category![controller.catagoryIndex.value]
                      //     .subcategory![subcatagoryIndex]
                      //     .resSubcategory![itemindex]
                      //     .imageUrl!),
                    ),
                  );
                },
              ),
            */ // );})),
            )
          ],
        ),
      ],
    );
  }

  //   child: ListView.builder(
  //     scrollDirection: Axis.horizontal,
  //     itemCount: myData.length,
  //     itemBuilder: (BuildContext context, int index) {
  //       if (index == 0 || index == myData.length - 1) {
  //         return Container(
  //           height: 150,
  //           width: 150,
  //           margin: EdgeInsets.symmetric(horizontal: 5),
  //           decoration: BoxDecoration(
  //             color: Colors.white,
  //             border: Border.all(
  //               width: 1.5,
  //               color: Colors.black,
  //             ),
  //             borderRadius: BorderRadius.all(Radius.circular(23)),
  //           ),
  //         );
  //       }
  //       final myItem = myData[index];

  //       return Expanded(
  //         child: Container(
  //           height: 150,
  //           width: 150,
  //           margin: EdgeInsets.symmetric(horizontal: 5),
  //           decoration: BoxDecoration(
  //             color: Colors.white,
  //             borderRadius: BorderRadius.all(Radius.circular(23)),
  //           ),
  //           child: FittedBox(
  //             fit: BoxFit.fill,
  //             child: Image.asset('assets/images/img${myItem}.png'),
  //           ),
  //         ),
  //       );
  //     },
  //   ),
  /*           )
          ],
        ),
      ],
    );
  }
*/
//   getData() async {
//     var jsonRequestBody =
//         '{"SHOP_ID":"82","CUSTOMER_ID":"544","TYPE":"A","ITEM_TYPE":"A"}';
//     print(jsonRequestBody);

//     Map<String, String> headers = {
//       "Content-type": "application/json",
//       "TokenNo": 'cce618086bfccd93b47dd9d4cf06f52778515b5d'
//     };

//     final response = await http.post(
//       Uri.parse(
//           'https://www.retailecoss.com/retailecos/api/downloadshopproductsrestaruant'),
//       headers: headers,
//       body: jsonRequestBody,
//     );
//     var jsonData = jsonDecode(response.body);
//     print(jsonData);
//     // var fetch = (jsonData['status']['ITEMS'] as List<dynamic>)
//     //         .map((d) => .fromJson(d))
//     //         .toList();
//     List<dynamic> items = jsonData['status']['ITEMS'];

// // .map((d) => cataloguefetch.fromJson(d))
// //             .toList();
//     for (var item in items) {
//       dynamic imageUrl = item['IMAGE_URL'];
//       dynamic url = item['URL'];
//       print('Image URL: $imageUrl');
//       print('URL: $url');
//     }
//   }

/*
  getData() async {
    var jsonRequestBody =
        '{"SHOP_ID":"82","CUSTOMER_ID":"544","TYPE":"A","ITEM_TYPE":"A"}';
    print(jsonRequestBody);

    Map<String, String> headers = {
      "Content-type": "application/json",
      "TokenNo": 'cce618086bfccd93b47dd9d4cf06f52778515b5d'
    };

    final response = await http.post(
      Uri.parse(
          'https://www.retailecoss.com/retailecos/api/downloadshopproductsrestaruant'),
      headers: headers,
      body: jsonRequestBody,
    );
    items.forEach((item) {
 
  String imageUrl = item['IMAGE_URL'];
  String url = item['URL'];

  
  print('Image URL: $imageUrl');
  print('URL: $url');
});

    // var jsonData = jsonDecode(response.body);
    // shopController.listfetch.value =
    // (jsonData['status']['ITEMS'] as List<dynamic>)
    //     .map((d) => Fetch.fromJson(d))
    //     .toList();
  }
*/
}
/*
class Fetch {
  String? imageurl;
  String? url;

  Fetch({
    this.imageurl,
    this.url,
  });

  factory Fetch.fromJson(Map<String, dynamic> json) {
    return Fetch(
      imageurl: json['IMAGE_URL'],
      url: json['URL'],
    );
  }
}
*/
