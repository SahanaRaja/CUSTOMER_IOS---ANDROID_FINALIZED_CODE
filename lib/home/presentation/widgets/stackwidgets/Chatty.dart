
import 'package:customer_assist/home/presentation/controllers/chatty_controller.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/app_constants.dart';
import '../../../data/configure/datasources/configure_data_remote_data_source.dart';

import '../../controllers/keyboard_controller.dart';
import '../../controllers/language_controller.dart';
import '../keyboard/alpha_capital_letters.dart';
import '../keyboard/alpha_small_letters.dart';
import '../keyboard/numeral_special_char.dart';

class askChatty extends StatefulWidget {
  final TextEditingController messageController;
  const askChatty({
    Key? key,
    required double actualHeight,
    required this.messageController,
  }) : super(key: key);

  @override
  _askChattyState createState() => _askChattyState();
}

class _askChattyState extends State<askChatty> {
  final FocusNode _focus = FocusNode();
  final List<Message> _messages = [];
  final ScrollController _scrollController = ScrollController();
  var keyboardController = Get.put(KeyboardController());
  var languageController = Get.put(LanguageController());
  double actualHeight = 0;
  int replyIndex = 0;

  var chattyController = Get.put(ChattyController());

  void sendMessage() {
    String messageText = widget.messageController.text.trim();
    if (messageText.isNotEmpty) {
      setState(() {
        _messages.add(Message(text: messageText, isMe: true));
        widget.messageController.clear();
      });

      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(seconds: 1),
          // milliseconds: 300
          curve: Curves.easeOut,
        );
      });
      _receiveMessage(messageText);
    }
  }


  void _receiveMessage(String senderMessage) {
    print(chattyController.CHattyResponse.length);
    List<String> orderedReplies = [
      'Hi, Good Evening! May I please know your name?',
      'Hi, I am Chatty. May I please know your mobile number and mail ID so that I can communicate with you in the future?',
      'Thank you very much. How may I assist you today?',
      'Have a nice day - Good Bye!',
    ];

    String replyText = orderedReplies[replyIndex];

    replyIndex = (replyIndex + 1) % orderedReplies.length;

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _messages.add(Message(text: replyText, isMe: false));
      });

      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(seconds: 1),
          // milliseconds: 300
          curve: Curves.easeOut,
        );
      });
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    actualHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: 375,
              color: const Color.fromARGB(255, 210, 209, 209),
              padding: const EdgeInsets.all(5.0),
              child: ListView.builder(
                controller: _scrollController,
                itemCount: _messages.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Container(
                      height: 123,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 210, 209, 209),
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 15),
                            height: 100,
                            width: 100,
                            decoration: const BoxDecoration(),
                            child: optionsController.chatty,
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 45),
                            height: 100,
                            width: 300,
                            decoration: const BoxDecoration(),
                            child: const Center(
                              child: Text(
                                'Hi, I am Chatty™ - Artificial Intelligence(AI) Powered Robot at your Service',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 73, 72, 72),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    final messageIndex = index - 1;
                    return MessageWidget(message: _messages[messageIndex]);
                  }
                },
              ),
            ),
            Container(
              color: const Color.fromARGB(255, 210, 209, 209),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      color: Colors.yellowAccent,
                      margin: const EdgeInsets.all(
                        1.5,
                      ),
                      child: DottedBorder(
                        radius: const Radius.circular(8),
                        borderType: BorderType.RRect,
                        dashPattern: const [6, 6],
                        strokeWidth: 1,
                        strokeCap: StrokeCap.square,
                        color: Colors.black,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: TextFormField(
                            textAlignVertical: TextAlignVertical.center,
                            keyboardType: TextInputType.multiline,
                            onTap: () {
                              // sendMessage();
                              keyboardController.setKeypad(CAPITALKEYBOARD);
                              keyboardController
                                  .controllerSetup(widget.messageController);
                              // keyboardController.setmanagerController(widget.mainController);
                              keyboardController.setMaximiumLength('100');
                              keyboardController.symbolTrue(true);

                              keyboardController.focusSetup(
                                  _focus, widget.messageController);
                            },
                            maxLines: 2,
                            readOnly: true,
                            showCursor: true,
                            controller: widget.messageController,
                            decoration: InputDecoration(
                              hintText: 'Tap here & Type your message...',
                              suffixIcon: IconButton(
                                icon: const Icon(
                                  Icons.send,
                                  size: 30,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  // chattyController.CHattyResponse.value
                                  //     .map((item) => Center(
                                  //         child: Text(
                                  //             item.QUESTION_NAME1.toString())))
                                  //     .toList();
                                  // print("*()*&*()(*&*(()))");
                                  sendMessage();
                                },
                              ),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                            ),
                            style: const TextStyle(fontSize: 22),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        GetX<KeyboardController>(
          init: KeyboardController(),
          initState: (_) {},
          builder: (controller) {
            return Positioned(
                bottom: 0,
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/images/keypad_patchs/keypad_base.png'),
                        fit: BoxFit.fill),
                  ),
                  child: keyboardWidget(context, controller),
                ));
          },
        ),
      ],
    );
  }

  keyboardWidget(BuildContext context, KeyboardController controller) {
    if (controller.changekeypad.value == SYMBOLSKEYBOARD) {
      return NumeralSpecialChar(
        actualHeight: actualHeight,
        context: context,
        onValueChanged: (String) {},
        size: const Size(100, 200),
      );
    } else if (controller.changekeypad.value == CAPITALKEYBOARD) {
      return AlphaCapitalLetters(
        actualHeight: actualHeight,
        context: context,
        onValueChanged: (String) {},
        size: const Size(100, 200),
      );
    } else if (controller.changekeypad.value == SMALLKEYBOARD) {
      return AlphaSmallLetters(
        actualHeight: actualHeight,
        context: context,
        onValueChanged: (String) {},
        size: const Size(100, 200),
      );
    } else {
      Container();
    }
  }
}

class Message {
  final String text;
  final bool isMe;

  Message({required this.text, required this.isMe});
}

class MessageWidget extends StatelessWidget {
  final Message message;

  const MessageWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: message.isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.all(4),
        // 4.4
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(2.5),
              child: Align(
                alignment:
                    message.isMe ? Alignment.bottomRight : Alignment.bottomLeft,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: message.isMe
                        ? const Color.fromARGB(255, 185, 247, 186)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    message.text,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
