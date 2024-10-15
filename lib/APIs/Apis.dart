import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class APIs {
  static const String _apiKey = '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'; // Replace with your actual API key

  static Future<void> getAnswer(String question) async {
    try {
      final response = await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer $_apiKey',
        },
        body: jsonEncode({
          "model": "gpt-3.5-turbo", // Use a correct model name
          "messages": [
            {
              "role": "user",
              "content": question,
            },
          ],
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print(data);
      } else {
        print('Error: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      print('Exception caught: $e');
    }
  }
}
