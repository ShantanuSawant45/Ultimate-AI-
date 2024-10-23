import 'package:flutter/material.dart';
import 'package:oops_project/components/Custum_Card.dart';
import 'package:oops_project/screens/ChatBox_Screen.dart';
import 'package:oops_project/screens/Language_translate_screen.dart';
import 'ImageGenerator_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void navigateToChatbox() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ChatboxScreen()));
  }

  void navigateToTextToImage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ImagegeneratorScreen()));
  }

  void navigateToLanguageTranslator() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => LanguageTranslateScreen()));
  }

  @override
  Widget build(BuildContext context) {

    // APIs.generateContent('how are you');
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
