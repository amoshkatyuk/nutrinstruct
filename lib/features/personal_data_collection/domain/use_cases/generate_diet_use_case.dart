import 'package:nutrinstruct/core/data/models/model_response/ai_response.dart';
import 'package:nutrinstruct/core/data/models/person/person.dart';
import 'package:nutrinstruct/core/use_cases/base_use_case.dart';
import 'package:nutrinstruct/core/utils/prompt_builders/prompt_builder.dart';
import 'package:nutrinstruct/core/utils/services/ai_service.dart';

class GenerateDietUseCase extends BaseUseCase<AiResponse, Person> {
  final PromptBuilder _promptBuilder;
  final AiService _aiService;

  GenerateDietUseCase({
    required PromptBuilder promptBuilder,
    required AiService aiService,
  }) : _promptBuilder = promptBuilder,
       _aiService = aiService;

  @override
  Future<AiResponse> implement(Person param) async {
    final prompt = _promptBuilder.buildPrompt(param);
    final result = await _aiService.sendMessage(prompt);
    return result;
  }
}
