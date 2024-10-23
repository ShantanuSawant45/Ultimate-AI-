import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class APIs {
  // Replace with your Google API key
  static const String _apiKey = 'AIzaSyBzeCdf1xQqgpaYFmd7U_0fBPzd7nymJFY';

  static Future<String> generateContent(String prompt) async {
    try {
      final response = await http.post(
        Uri.parse(
            'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key=$_apiKey'),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
        body: jsonEncode({
          "contents": [
            {
              "parts": [
                {"text": prompt}
              ]
            }
          ],
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print(data['candidates'][0]['content']['parts'][0]['text']);
        return data['candidates'][0]['content']['parts'][0]['text'];

      } else {
        print('Error: ${response.statusCode} - ${response.body}');
        return 'something went wronge';
      }
    } catch (e) {
      print('Exception caught: $e');
      return 'something went wronge';
    }
  }
}
