import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

import '../controller/Chat_Controller.dart';
import '../controller/Image_controller.dart';

class ImagegeneratorScreen extends StatefulWidget {
  const ImagegeneratorScreen({super.key});

  @override
  State<ImagegeneratorScreen> createState() => _ImagegeneratorScreenState();
}

class _ImagegeneratorScreenState extends State<ImagegeneratorScreen> {
  final _c = ImageController();
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
     appBar:  AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black54,
        title: Text(
          'Ai Image Generator',
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            SizedBox(height: 20,),
            TextFormField(
              minLines: 2,
              maxLines: null,
              style: TextStyle(color: Colors.white),
              controller: _c.textc, // Attach controller
              onTapOutside: (e) => FocusScope.of(context).unfocus(),
              decoration: InputDecoration(
                fillColor: Colors.black,
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[30]),
                hintText: 'Write a Prompt to generate a Image . . . . .',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 50,),
            Container(
              height: 300,
                width: 300,
                child: Obx(()=>_aiImage()),
            ),
            SizedBox(height: 50,),
            ElevatedButton(
              onPressed: () {
                _c.Genrerate_Image();
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
                    child: Text('Generate',style: TextStyle(color: Colors.white,fontSize: 23),),
                  )
              ),
            )
          ],
        ),
      ),

    );
  }
  Widget _aiImage() => ClipRRect(
    borderRadius: const BorderRadius.all(Radius.circular(10)),
    child: switch (_c.status.value) {
      Status.none =>
          Lottie.asset('assets/animations/text_to_image.json', height: 300),
      Status.completed => CachedNetworkImage(
        imageUrl: _c.url,
        placeholder: (context, url) => Lottie.asset('assets/animations/loading_animations.json', height: 300),
        errorWidget: (context, url, error) => const SizedBox(),
      ),
      Status.loading => Lottie.asset('assets/animations/loading_animations.json', height: 300),
    },
  );

}


