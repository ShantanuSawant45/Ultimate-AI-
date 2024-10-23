import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX
import 'package:oops_project/components/Message_cart.dart';
import 'package:oops_project/controller/Chat_Controller.dart';
import '../models/Message.dart';



class ChatboxScreen extends StatefulWidget {
  const ChatboxScreen({super.key});

  @override
  State<ChatboxScreen> createState() => _ChatboxScreenState();
}

class _ChatboxScreenState extends State<ChatboxScreen> {
  // Use Get.put to initialize the controller
  final Chat_controller _c = Get.put(Chat_controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black54,
        title: Text(
          'Chat With Ai ChatBox',
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      body: Column(
        children:[
          Expanded(
            child: Obx(
                () => ListView(
                  controller: _c.scrollc,
              children: _c.List.map((e) => MessageCard(mess: e)).toList(),
                    )
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 14),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: _c.textc, // Attach controller
                    onTapOutside: (e) => FocusScope.of(context).unfocus(),
                    decoration: InputDecoration(
                      fillColor: Colors.black,
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey),
                      hintText: 'Ask Me Anything...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.black54,
                  child: IconButton(
                    icon: Icon(Icons.rocket_launch_outlined, color: Colors.white),
                    onPressed: () {
                      _c.Ask_Question(); // Use the updated method name
                    },
                  ),
                ),
              ],
            ),
          ),
        ]
      ),
      );
  }
}
