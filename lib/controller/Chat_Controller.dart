import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:oops_project/models/Message.dart';
import '../APIs/Apis.dart';

class Chat_controller extends GetxController {
  final textc = TextEditingController();
  final List = <Message>[].obs;
  final scrollc = ScrollController();

  Future<void> Ask_Question() async {
    if (textc.text.trim().isNotEmpty) {
      // Add user's message
      List.add(Message(msg: textc.text, msgType: MessageType.user));
      _scrollToBottom();


      final reply = await APIs.generateContent(textc.text);


      List.add(Message(msg: reply, msgType: MessageType.bot));


      textc.clear();
      _scrollToBottom();
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollc.hasClients) {
        scrollc.animateTo(
          scrollc.position.maxScrollExtent,
          duration: Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      }
    });
  }
}
