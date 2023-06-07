import 'dart:convert';

import 'package:http/http.dart' as http;

import 'secrets.dart';

class OpenAIService {
  Future<String> isArtPromtAPI(String prompt) async {
    try {
      final res = await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $openAIAPIKey',
        },
        body: jsonEncode({
          "model": "gpt-3.5-turbo",
          "messages": [
            {
              'role': 'user',
              'content':
                  'Does this message want to generate an AI picture, image, art of anything similar? $prompt . Simply answer with a yes or no.',
            }
          ]
        }),
      );
      print(res.body);
      if (res.statusCode == 200) {
        print('yay');
      }
      return 'AI';
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> chatGPTAPI(String prompt) async {
    return 'CHATGPT';
  }

  Future<String> dallEAPI(String prompt) async {
    return 'DALL-E';
  }
}
