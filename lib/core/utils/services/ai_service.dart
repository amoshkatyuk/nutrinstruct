import 'package:genkit/genkit.dart';
import 'package:genkit_google_genai/genkit_google_genai.dart';
import 'package:nutrinstruct/core/utils/extensions/model_response_parser.dart';

import '../../data/models/model_response/ai_response.dart';

abstract class AiService {
  Future<AiResponse> sendMessage(String prompt);
}

class AiServiceImpl extends AiService {
  final Genkit ai;

  AiServiceImpl(this.ai);

  @override
  Future<AiResponse> sendMessage(String prompt) async {
    final result = await ai.generate(
      model: googleAI.gemini('gemini-2.5-flash'),
      prompt: prompt,
    );

    final aiResponse = result.text.toModelResponse();
    return aiResponse;
  }
}
