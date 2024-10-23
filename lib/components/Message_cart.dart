import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import '../models/Message.dart';

class MessageCard extends StatelessWidget {
  final Message mess;

  const MessageCard({super.key, required this.mess});

  @override
  Widget build(BuildContext context) {
    // Initialize mq (media query) locally
    final mq = MediaQuery.of(context).size;
    const r = Radius.circular(15);

    return mess.msgType == MessageType.bot
    // Bot Message
        ? Row(
      children: [
        const SizedBox(width: 6),
        CircleAvatar(
          radius: 18,
          backgroundColor: Colors.white,
          child: Image.asset('assets/images/applogo.png', width: 24),
        ),
        Container(
          constraints: BoxConstraints(maxWidth: mq.width * .6),
          margin: EdgeInsets.only(
              bottom: mq.height * .02, left: mq.width * .02),
          padding: EdgeInsets.symmetric(
              vertical: mq.height * .01, horizontal: mq.width * .02),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: const BorderRadius.only(
              topLeft: r,
              topRight: r,
              bottomRight: r,
            ),
          ),
          child: mess.msg.isEmpty
              ? AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                ' Please wait... ',
                speed: const Duration(milliseconds: 100),
              ),
            ],
            repeatForever: true,
          )
              : Text(
            style: TextStyle(color: Colors.white),
            mess.msg,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    )
    // User Message
        : Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          constraints: BoxConstraints(maxWidth: mq.width * .6),
          margin: EdgeInsets.only(
              bottom: mq.height * .02, right: mq.width * .02),
          padding: EdgeInsets.symmetric(
              vertical: mq.height * .01, horizontal: mq.width * .02),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: const BorderRadius.only(
              topLeft: r,
              topRight: r,
              bottomLeft: r,
            ),
          ),
          child: Text(
            style: TextStyle(color: Colors.white),
            mess.msg,
            textAlign: TextAlign.center,
          ),
        ),
        const CircleAvatar(
          radius: 18,
          backgroundColor: Colors.white,
          child: Icon(Icons.person, color: Colors.blue),
        ),
        const SizedBox(width: 6),
      ],
    );
  }
}
