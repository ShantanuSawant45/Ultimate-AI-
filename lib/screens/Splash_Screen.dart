import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:oops_project/screens/Onbording_page.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
   void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 6),(){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>OnbordingPage()));
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Center(
          child:Container(
            child: Lottie.asset('assets/animations/loading_animations.json',width: 300),
          )
      ),
    );
  }
}
