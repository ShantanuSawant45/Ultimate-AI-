import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oops_project/APIs/Apis.dart';

enum Status{none,loading,completed}

class ImageController extends GetxController{
  final textc = TextEditingController();

  final status =Status.none.obs;
  String url='';


  Future<void> Genrerate_Image() async {
    OpenAI.apiKey = 'sk-Z7uHxac4HsaTeNY8XjcLnPYBvPJUkUx26XymPE9k5kDrxXpv';

    if(textc.text.trim().isNotEmpty){
      status.value=Status.loading;

      OpenAIImageModel image = await OpenAI.instance.image.create(
        prompt: textc.text,
        n: 1,
        size: OpenAIImageSize.size1024,
        responseFormat: OpenAIImageResponseFormat.url,
      );
      url=image.data[0].url!;

      textc.text='';
      status.value=Status.completed;
    }

  }
}

