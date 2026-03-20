import 'dart:convert';

import 'package:nutrinstruct/core/data/models/model_response/ai_response.dart';

extension ModelResponseParser on String {
  AiResponse toModelResponse() {
    final normalized = _normalizeJson(this);
    final decoded = jsonDecode(normalized) as Map<String, dynamic>;
    _fixCommonIssues(decoded);
    return AiResponse.fromJson(decoded);
  }

  String _normalizeJson(String raw) {
    var cleaned = raw.trim();

    if (cleaned.startsWith('```')) {
      cleaned = cleaned.replaceAll(RegExp(r'```json|```'), '');
    }
    return cleaned.trim();
  }

  void _fixCommonIssues(Map<String, dynamic> json) {
    json['calories'] = _toInt(json['calories']);
    json['proteins'] = _toInt(json['proteins']);
    json['fats'] = _toInt(json['fats']);
    json['carbonhydrates'] = _toInt(json['carbonhydrates']);
  }

  int? _toInt(dynamic value) => (value as num?)?.toInt();
}
