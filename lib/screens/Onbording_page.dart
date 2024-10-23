import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:oops_project/Authethication_screens/Ask_auth.dart';
import 'package:oops_project/models/onboard.dart';
import 'package:oops_project/screens/Home_page.dart';

class OnbordingPage extends StatefulWidget {
  const OnbordingPage({super.key});

  @override
  State<OnbordingPage> createState() => _OnbordingPageState();
}

class _OnbordingPageState extends State<OnbordingPage> {
  @override
  Widget build(BuildContext context) {
    final c=PageController();
    final List<Onboard> onboardItems = [
      Onboard(
        title: 'Ask Me Anything',
        subtitle:
        'Discover our AI-powered chatbox with real-time responses, smart conversations, and seamless user interaction on the onboarding screen.',
        lottie: 'chatbox2',
      ),
      Onboard(
        title: 'Text To Image',
        subtitle:
        'Explore our AI-powered text-to-image feature with a seamless onboarding experience, guiding you from text prompts to stunning visuals.',
        lottie: 'text_to_image',
      ),
      Onboard(
        title: 'Language Translator',
        subtitle:
        'Effortlessly translate the languages in real-time with our intuitive onboarding experience, bridging communication across cultures.',
        lottie: 'lang_translate',
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.black54,
      body:PageView.builder(
        controller: c,
        itemCount: onboardItems.length,
          itemBuilder: (ctx,ind){
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset('assets/animations/${onboardItems[ind].lottie}.json', width: 400),
            const SizedBox(height: 30),
            Text('${onboardItems[ind].title}'
              ,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25,color: Colors.white),
            ),
            const SizedBox(height: 10),
            Text('${onboardItems[ind].subtitle}'
              ,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 17,color: Colors.white70),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            Wrap(
              spacing: 8,
              children: List.generate(
                onboardItems.length,
                    (i) => Container(
                  width: i==ind?35:20,
                  height: 15,
                  decoration: BoxDecoration(
                    color: i==ind?Colors.blue:Colors.grey,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 100),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                elevation: 5,
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(vertical: 16),
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                if(ind == onboardItems.length - 1 ){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AskAuth()));
                }
                else{
                  c.nextPage(duration: Duration(seconds: 1), curve: Curves.easeInCirc);
                }
              },
              child: SizedBox(
                width: 250,
                child: Center(
                  child: Text(
                    ind == onboardItems.length - 1 ? 'DONE' : 'NEXT',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  )

                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}



