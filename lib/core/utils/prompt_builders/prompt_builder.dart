import 'package:nutrinstruct/core/data/models/person/person.dart';

abstract class PromptBuilder {
  String buildPrompt(Person person);
}

class PromptBuilderImpl extends PromptBuilder {
  @override
  String buildPrompt(Person person) {
    return '''
    You are a nutrition calculation API.

Your task is to calculate a user's daily diet plan based on input data.

Return ONLY valid JSON. Do not include explanations, comments, or text outside JSON.

JSON format must strictly match this schema:

{
  "calories": number,
  "proteins": number,
  "fats": number,
  "carbonhydrates": number,
  "waterLiters": number,
  "meals": [
    {
      "name": string,
      "calories": number,
      "foods": [
        {
          "name": string,
          "weightGrams": number,
          "calories": number
        }
      ]
    }
  ]
}

Rules:
- All numbers must be rounded to integers (except water_liters, 1 decimal allowed)
- meals must contain exactly 3-5 items
- each meal must contain 2-4 foods
- names must be short (1-2 words)
- food names must be simple (1-3 words)
- weight_grams must be integers
- sum of food calories in a meal must approximately equal meal calories (±10%)
- do not omit any fields
- do not add extra fields
- language: Russian

If input data is incomplete, make reasonable assumptions.

User data:
age: ${person.age}
gender: ${person.gender}
height: ${person.parameters!.height}
weight: ${person.parameters!.weight}
activity: ${person.activityLevel}
purpose: ${person.purpose}
    ''';
  }
}
