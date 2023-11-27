// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, library_private_types_in_public_api, sized_box_for_whitespace, must_be_immutable, prefer_const_literals_to_create_immutables, duplicate_ignore
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(border: Border.all()),
        child: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 2, left: 1),
                height: 55,
                width: 55,
                color: Colors.purpleAccent,
                child: IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    openDrawer();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: Container(
          height: 725, width: 350, color: Colors.yellow, child: DrawerWidget()),
    );
  }
}

/*
class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  bool isShopOpen = false;
  void toggleShop() {
    setState(() {
      isShopOpen = !isShopOpen;
    });
  }

  bool isUSettingsOpen = false;
  void toggleUSettings() {
    setState(() {
      isUSettingsOpen = !isUSettingsOpen;
    });
  }

  bool isSupportOpen = false;
  void toggleSupport() {
    setState(() {
      isSupportOpen = !isSupportOpen;
    });
  }

  bool isAddOnsOpen = false;
  void toggleAddOns() {
    setState(() {
      isAddOnsOpen = !isAddOnsOpen;
    });
  }

  bool isCalciOpen = false;
  void toggleCalci() {
    setState(() {
      isCalciOpen = !isCalciOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.grey,
          margin: EdgeInsets.only(top: 32),
          height: 50,
          width: double.infinity,
          child: Center(
              child: Text(
            "MENU",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          )),
        ),
        Container(
          margin: EdgeInsets.only(right: 120),
          // padding: EdgeInsets.only(bottom: 10),
          height: 640,
          decoration: BoxDecoration(border: Border.all()),
          child: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                ListTile(
                  title: Row(
                    children: [
                      SizedBox(
                        width: 35,
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(border: Border.all()),
                      ),
                      SizedBox(
                        height: 10,
                        width: 10,
                      ),
                      Text(
                        'Browse Products',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                /* ListTile(
                  title: Row(
                    children: [
                      SizedBox(
                        width: 35,
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(border: Border.all()),
                      ),
                      SizedBox(
                        height: 10,
                        width: 10,
                      ),
                      Text(
                        'Register',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: GestureDetector(
                    onTap: () {
                      toggleShop();
                    },
                    child: Row(
                      children: [
                        Icon(
                          isShopOpen
                              ? Icons.arrow_drop_up
                              : Icons.arrow_drop_down,
                          size: 35,
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(border: Border.all()),
                        ),
                        SizedBox(
                          height: 10,
                          width: 10,
                        ),
                        Text(
                          'Shop',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
                if (isShopOpen) ...[
                  ListTile(
                    title: Row(
                      children: [
                        SizedBox(
                          width: 85,
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(border: Border.all()),
                        ),
                        SizedBox(
                          height: 10,
                          width: 10,
                        ),
                        Text(
                          'New Order',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        SizedBox(
                          width: 85,
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(border: Border.all()),
                        ),
                        SizedBox(
                          height: 10,
                          width: 10,
                        ),
                        Text(
                          'Pending Order',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        SizedBox(
                          width: 85,
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(border: Border.all()),
                        ),
                        SizedBox(
                          height: 10,
                          width: 10,
                        ),
                        Text(
                          'Old Order',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        SizedBox(
                          width: 85,
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(border: Border.all()),
                        ),
                        SizedBox(
                          height: 10,
                          width: 10,
                        ),
                        Text(
                          'Shopping List',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        SizedBox(
                          width: 85,
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.transparent)),
                        ),
                        SizedBox(
                          height: 10,
                          width: 10,
                        ),
                        Text(
                          'Favourite List',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
                ListTile(
                  title: Row(
                    children: [
                      SizedBox(
                        width: 35,
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(border: Border.all()),
                      ),
                      SizedBox(
                        height: 10,
                        width: 10,
                      ),
                      Text(
                        'Address Book',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Row(
                    children: [
                      SizedBox(
                        width: 35,
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(border: Border.all()),
                      ),
                      SizedBox(
                        height: 10,
                        width: 10,
                      ),
                      Text(
                        'Shop @ Store',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: GestureDetector(
                    onTap: () {
                      toggleUSettings();
                    },
                    child: Row(
                      children: [
                        Icon(
                          isUSettingsOpen
                              ? Icons.arrow_drop_up
                              : Icons.arrow_drop_down,
                          size: 35,
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(border: Border.all()),
                        ),
                        SizedBox(
                          height: 10,
                          width: 10,
                        ),
                        Text(
                          'User Settings',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
                if (isUSettingsOpen) ...[
                  ListTile(
                    title: Row(
                      children: [
                        SizedBox(
                          width: 85,
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(border: Border.all()),
                        ),
                        SizedBox(
                          height: 10,
                          width: 10,
                        ),
                        Text(
                          'User Profile',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        SizedBox(
                          width: 85,
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(border: Border.all()),
                        ),
                        SizedBox(
                          height: 10,
                          width: 10,
                        ),
                        Text(
                          'Change PIN',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        SizedBox(
                          width: 85,
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(border: Border.all()),
                        ),
                        SizedBox(
                          height: 10,
                          width: 10,
                        ),
                        Text(
                          'Sys.Feed Back',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        SizedBox(
                          width: 85,
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.transparent)),
                        ),
                        SizedBox(
                          height: 10,
                          width: 10,
                        ),
                        Text(
                          'Set Language',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
                ListTile(
                  title: GestureDetector(
                    onTap: () {
                      toggleSupport();
                    },
                    child: Row(
                      children: [
                        Icon(
                          isSupportOpen
                              ? Icons.arrow_drop_up
                              : Icons.arrow_drop_down,
                          size: 35,
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(border: Border.all()),
                        ),
                        SizedBox(
                          height: 10,
                          width: 10,
                        ),
                        Text(
                          'Support',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
                if (isSupportOpen) ...[
                  ListTile(
                    title: Row(
                      children: [
                        SizedBox(
                          width: 85,
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(border: Border.all()),
                        ),
                        SizedBox(
                          height: 10,
                          width: 10,
                        ),
                        Text(
                          'Expert View',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        SizedBox(
                          width: 85,
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(border: Border.all()),
                        ),
                        SizedBox(
                          height: 10,
                          width: 10,
                        ),
                        Text(
                          'FAQ',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        SizedBox(
                          width: 85,
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.transparent)),
                        ),
                        SizedBox(
                          height: 10,
                          width: 10,
                        ),
                        Text(
                          'Resources',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
                ListTile(
                  title: Row(
                    children: [
                      SizedBox(
                        width: 35,
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(border: Border.all()),
                      ),
                      SizedBox(
                        height: 10,
                        width: 10,
                      ),
                      Text(
                        'Terms & Conditions',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: GestureDetector(
                    onTap: () {
                      toggleAddOns();
                    },
                    child: Row(
                      children: [
                        Icon(
                          isAddOnsOpen
                              ? Icons.arrow_drop_up
                              : Icons.arrow_drop_down,
                          size: 35,
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(border: Border.all()),
                        ),
                        SizedBox(
                          height: 10,
                          width: 10,
                        ),
                        Text(
                          'Add Ons',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
                if (isAddOnsOpen) ...[
                  ListTile(
                    title: Row(
                      children: [
                        SizedBox(
                          width: 85,
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(border: Border.all()),
                        ),
                        SizedBox(
                          height: 10,
                          width: 10,
                        ),
                        Text(
                          'Subscription',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        SizedBox(
                          width: 85,
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(border: Border.all()),
                        ),
                        SizedBox(
                          height: 10,
                          width: 10,
                        ),
                        Text(
                          'Add Family',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        SizedBox(
                          width: 85,
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(border: Border.all()),
                        ),
                        SizedBox(
                          height: 10,
                          width: 10,
                        ),
                        Text(
                          'Share',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        SizedBox(
                          width: 85,
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(border: Border.all()),
                        ),
                        SizedBox(
                          height: 10,
                          width: 10,
                        ),
                        Text(
                          'Coupons',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: GestureDetector(
                      onTap: () {
                        toggleCalci();
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: 50,
                          ),
                          Icon(
                            isCalciOpen
                                ? Icons.arrow_drop_up
                                : Icons.arrow_drop_down,
                            size: 35,
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    // color: Colors.transparent
                                    )),
                          ),
                          SizedBox(
                            height: 10,
                            width: 10,
                          ),
                          Text(
                            'Calculator',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  if (isCalciOpen) ...[
                    ListTile(
                      title: Row(
                        children: [
                          SizedBox(
                            width: 125,
                          ),
                          Text(
                            'Mathematical',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          SizedBox(
                            width: 125,
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(border: Border.all()),
                          ),
                          SizedBox(
                            height: 10,
                            width: 10,
                          ),
                          Text(
                            'Exchange Converter',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ],
                ListTile(
                  title: Row(
                    children: [
                      SizedBox(
                        width: 35,
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(border: Border.all()),
                      ),
                      SizedBox(
                        height: 10,
                        width: 10,
                      ),
                      Text(
                        'AR Experience',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Row(
                    children: [
                      SizedBox(
                        width: 35,
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(border: Border.all()),
                      ),
                      SizedBox(
                        height: 10,
                        width: 10,
                      ),
                      Text(
                        'Market Place',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Row(
                    children: [
                      SizedBox(
                        width: 35,
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(border: Border.all()),
                      ),
                      SizedBox(
                        height: 10,
                        width: 10,
                      ),
                      Text(
                        'Log In',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
             */
              ],
            ),
          ),
        ),
      ],
    );
  }
}
*/
/*
class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  // ... your existing code ...

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.grey,
          margin: EdgeInsets.only(top: 32),
          height: 50,
          width: double.infinity,
          child: Center(
            child: Text(
              "MENU",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 120),
          height: 640,
          // decoration: BoxDecoration(
          //   border: Border.all(),
          // ),
          child: Stack(
            children: [
              // Custom ClipPath to create the fold
              // ClipPath(
              //   clipper: FoldClipper(),
              //   child: Container(
              //     color: Colors
              //         .white, // You can set the background color of the fold
              //     height: 100, // Adjust this height to control the fold size
              //   ),
              // ),
              // Drawer content
              ClipPath(
                clipper: TriangleClipper(),
                child: Drawer(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: <Widget>[
                      // Your list items here...
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  double radius = 45, tw = 20, th = 1; //tw & th = triangle width & height
// double radius = 30, tw = 20, th = 1;
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, th + radius);
    path.arcToPoint(Offset(size.width - radius, th), clockwise: false);
    // path.lineTo(radius + 10 + tw, th);
    // path.lineTo(radius + 10 + tw/2, 0);      //in these lines, the 10 is to have a space of 10 between the top-left corner curve and the triangle
    // path.lineTo(radius + 10, th);
    path.lineTo(radius, th);
    path.arcToPoint(Offset(0, 1), clockwise: false);
    return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => true;
}
*/

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.grey,
          margin: EdgeInsets.only(top: 32),
          height: 50,
          width: double.infinity,
          child: Center(
            child: Text(
              "MENU",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 120),
          height: 640,
          child: Stack(
            children: [
              ClipPath(
                clipper: TriangleClipper(),
                child: Container(
                  color: Colors.blue, // Color of the triangle
                  height: 600, // Height of the triangle
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  height: 50,
                  width: 50,
                  child: CustomPaint(
                    painter: TrianglePainter(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

}

class TriangleClipper extends CustomClipper<Path> {
  double radius = 45, tw = 20, th = 1; //tw & th = triangle width & height
// double radius = 30, tw = 20, th = 1;
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, th + radius);
    path.arcToPoint(Offset(size.width - radius, th), clockwise: false);
    // path.lineTo(radius + 10 + tw, th);
    // path.lineTo(radius + 10 + tw/2, 0);      //in these lines, the 10 is to have a space of 10 between the top-left corner curve and the triangle
    // path.lineTo(radius + 10, th);
    path.lineTo(radius, th);
    path.arcToPoint(Offset(0, 1), clockwise: false);
    return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => true;
}

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey // Color of the triangle
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, size.height); // Start at the bottom-left corner
    path.lineTo(size.width,
        size.height); // Draw a horizontal line to the bottom-right corner
    path.lineTo(0, 0); // Draw a diagonal line to the top-left corner

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

// Custom Clipper for the fold effect
class FoldClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width - 100, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}


// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors
/*
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: FoldedContainer(),
        ),
      ),
    );
  }
}

class FoldedContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(border: Border.all()
          // Background color of the container
          ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              width: 40, // Adjust the fold's width as needed
              height: 40, // Adjust the fold's height as needed
              decoration: BoxDecoration(color: Colors.white
                  // Background color of the fold
                  ),
              child: CustomPaint(
                painter: TrianglePainter(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey
      //  const Color.fromARGB(255, 243, 33, 117) // Color of the triangle
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, size.height); // Start at the bottom-left corner
    path.lineTo(size.width,
        size.height); // Draw a horizontal line to the bottom-right corner
    path.lineTo(0, 0); // Draw a diagonal line to the top-left corner

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
*/
/*
//right angle triangle
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Triangle Example'),
      ),
      body: Center(
        child: CustomPaint(
          size: Size(100, 100),
          painter: TrianglePainter(),
        ),
      ),
    ),
  ));
}

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = getTrianglePath(size.width, size.height);
    final paint = Paint()
      ..color = Color.fromARGB(255, 5, 243, 45)
      ..style = PaintingStyle.fill;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

Path getTrianglePath(double x, double y) {
  return Path()
    ..moveTo(50, y)
    ..lineTo(50, y - x)
    ..lineTo(x, y)
    ..lineTo(50, y);
}
*/
/*

//working
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: FoldedContainer(),
        ),
      ),
    );
  }
}

class FoldedContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        // Background color of the container with a border
        color: Colors.blue,
        border: Border.all(
          color: Colors.black, // Color of the border
          width: 2.0, // Border width
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              width: 40, // Adjust the fold's width as needed
              height: 40, // Adjust the fold's height as needed
              decoration: BoxDecoration(
                color: Colors.white, // Background color of the fold
              ),
              child: CustomPaint(
                painter: TrianglePainter(),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right:
                0, // Adjust the left position to center the inverted triangle
            child: Container(
              width: 40, // Adjust the inverted fold's width as needed
              height: 40, // Adjust the inverted fold's height as needed
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2),
                // color: Colors.black, // Background color of the inverted fold
              ),
              child: CustomPaint(
                painter: InvertedTrianglePainter(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey // Color of the triangle
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, size.height); // Start at the bottom-left corner
    path.lineTo(size.width,
        size.height); // Draw a horizontal line to the bottom-right corner
    path.lineTo(0, 0); // Draw a diagonal line to the top-left corner

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class InvertedTrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.transparent
      //  const Color.fromARGB(
      //     255, 151, 30, 30) // Color of the inverted triangle
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, 0); // Start at the top-left corner
    path.lineTo(
        size.width, 0); // Draw a horizontal line to the top-right corner
    path.lineTo(size.width,
        size.height); // Draw a vertical line to the bottom-right corner

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

*/
/*
//working
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: FoldedContainer(),
        ),
      ),
    );
  }
}

class FoldedContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.blue,
        // Background color of the container with a border
        // color: Colors.blue,
        border: Border.all(
          color: Colors.black, // Color of the border
          width: .1, // Border width
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              width: 40, // Adjust the fold's width as needed
              height: 40, // Adjust the fold's height as needed
              decoration: BoxDecoration(
                color: Color.fromARGB(
                    255, 121, 177, 9), // Background color of the fold
              ),
              child: CustomPaint(
                painter: TrianglePainter(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey // Color of the triangle
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, size.height); // Start at the bottom-left corner
    path.lineTo(size.width,
        size.height); // Draw a horizontal line to the bottom-right corner
    path.lineTo(0, 0); // Draw a diagonal line to the top-left corner

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
*/