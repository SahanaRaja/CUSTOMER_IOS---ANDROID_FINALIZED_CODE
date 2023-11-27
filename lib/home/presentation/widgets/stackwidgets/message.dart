//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessagePage extends StatefulWidget {
  double actualHeight;
  MessagePage({Key? key, required this.actualHeight}) : super(key: key);

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          margin: GetPlatform.isAndroid
          ? const EdgeInsets.only(top: 50, left: 20)
          : const EdgeInsets.only(top: 50, left: 20),
          height: GetPlatform.isAndroid
              ? (widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                  17.9 *
                  1
              : (widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                  17.9 *
                  1,
          width: GetPlatform.isAndroid
              ? (widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                  17.9 *
                  8
              : (widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                  17.9 *
                  8,
          //color: Colors.redAccent,
          child: Row(
            children: [
              Container(
                
                height: 35,
                width: 35,
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
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.04,
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 5,
                ),
                child: const Text(
                  'MESSAGES',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 5,
                ),
                child: const Text(
                  '025',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin:  GetPlatform.isAndroid
         ? const EdgeInsets.only(top: 50, left: 20)
         : const EdgeInsets.only(top: 55, left: 20),
          height: GetPlatform.isAndroid
              ? (widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                  17.9 *
                  1
              : (widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                  17.9 *
                  1,
          width: GetPlatform.isAndroid
              ? (widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                  17.9 *
                  8
              : (widget.actualHeight - MediaQuery.of(context).padding.bottom) /
                  17.9 *
                  8,
          child: Row(
            children: [
              Container(
                height: 35,
                width: 35,
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
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.04,
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 5,
                ),
                child: const Text(
                  'MESSAGES SENT',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 5,
                ),
                child: const Text(
                  '012',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
