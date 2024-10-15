import 'package:flutter/material.dart';
import 'package:oops_project/APIs/Apis.dart';
import 'package:oops_project/components/Custum_Card.dart';
import 'package:oops_project/screens/ChatBox_Screen.dart';
import 'package:oops_project/screens/Language_translate_screen.dart';
import 'package:oops_project/screens/Text_to_Image_screen.dart'; // Ensure the path is correct

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Example navigation methods for onpress actions
  void navigateToChatbox() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ChatboxScreen()));
  }

  void navigateToTextToImage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => TextToImageScreen()));
  }

  void navigateToLanguageTranslator() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => LanguageTranslateScreen()));
  }

  @override
  Widget build(BuildContext context) {

    APIs.getAnswer('hi');
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        leading: const Icon(Icons.menu, color: Colors.white),
        elevation: 5,
        backgroundColor: Colors.black54,
        title: const Text(
          'ULTIMATE AI . . . .',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          const SizedBox(height: 20),
          CustomCard(
            lottie: 'chatbox2',
            title: 'AI ChatBox',
            onpress: navigateToChatbox,
          ),
          const SizedBox(height: 20),
          CustomCard(
            lottie: 'text_to_image',
            title: 'Text To Image',
            onpress: navigateToTextToImage,
          ),
          const SizedBox(height: 20),
          CustomCard(
            lottie: 'lang_translate',
            title: 'Language Translator',
            onpress: navigateToLanguageTranslator, 
          ),
        ],
      ),
    );
  }
}
