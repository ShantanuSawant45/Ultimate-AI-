import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';
import 'package:oops_project/Authethication_screens/LoginPage.dart';
import 'package:oops_project/Authethication_screens/SignupPage.dart';

class AskAuth extends StatefulWidget {
  const AskAuth({super.key});

  @override
  State<AskAuth> createState() => _AskAuthState();
}

class _AskAuthState extends State<AskAuth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Column(
        children: [
          Lottie.asset('assets/animations/login.json'),
          AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                'Ultimate Ai....',
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
                speed: const Duration(milliseconds: 500),
              ),
            ],
            totalRepeatCount: 4,
            pause: const Duration(milliseconds: 500),
            displayFullTextOnTap: true,
            stopPauseOnTap: true,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Welcome to Ultimate AI! Experience the future with our AI chatbot, text-to-image generator, and language translator—all in one place.',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),),
          ),
          SizedBox(height: 50,),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Loginpage()));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // Background color
              textStyle: TextStyle(
                fontSize: 18, // Optional: Customize text size
                fontWeight: FontWeight.bold, // Optional: Customize font weight
              ),
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12), // Optional: Padding
            ),
            child: SizedBox(
              height: 30,
                width: 200,
                child: Center(
                  child: Text('Login',style: TextStyle(color: Colors.white,fontSize: 23),),
                )
            ),
          ),
          SizedBox(height: 40,),
          ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupPage()));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          textStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        ),
        child: SizedBox(
            height: 30,
            width: 200,
            child: Center(
              child: Text('Signup',style: TextStyle(color: Colors.white,fontSize: 23),),
            )
        ),
      ),
        ],
      ),
    );
  }
}
