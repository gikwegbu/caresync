import 'package:google_generative_ai/google_generative_ai.dart';
import '../../../../core/constants/api_keys.dart';
import '../../health_metrics/domain/entities/health_metric.dart';

class GeminiChatService {
  final GenerativeModel _model;

  GeminiChatService()
      : _model = GenerativeModel(
          model: 'gemini-1.5-flash',
          apiKey: ApiKeys.geminiApiKey,
          systemInstruction: Content.system(
            "You are a seasoned professional laboratory scientist and medical doctor with deep expertise in interpreting medical and health data. "
            "The user will share their personal health readings with you. Analyse the data thoroughly, explain what the values mean in clear and simple language, "
            "identify any patterns or concerns, and provide an informative summary. "
            "Always remind the user at the end of every response: 'Please consult a qualified medical professional for a full diagnosis and personalised medical advice. "
            "This chat is for informational purposes only.'",
          ),
        );

  Future<String> sendMessage(String message, List<HealthMetric> metrics) async {
    try {
      final context = _buildContextPrompt(metrics);
      final fullPrompt = '$context\n\nUser Question: $message';

      final content = [Content.text(fullPrompt)];
      final response = await _model.generateContent(content);

      return response.text ?? 'Sorry, I could not generate a response.';
    } catch (e) {
      return 'Error connecting to AI service. Please check your API key and connection.';
    }
  }

  String _buildContextPrompt(List<HealthMetric> metrics) {
    if (metrics.isEmpty) {
      return 'User Context: The user currently has no health readings recorded in the app.';
    }

    final buffer = StringBuffer();
    buffer.writeln(
        'User Context: Here are the user\'s recorded health readings:');

    for (var m in metrics) {
      buffer.writeln(
          '- Date: ${m.recordedAt.toString().split(' ')[0]} | Type: ${m.type} | Value: ${m.value} ${m.unit ?? ''} | Notes: ${m.notes ?? "None"}');
    }

    return buffer.toString();
  }
}
