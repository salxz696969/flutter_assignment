import 'dart:convert';
import 'dart:io';

import '../domain/quiz.dart';

class QuizRepository {
  final String filePath;

  QuizRepository(this.filePath);

  Quiz readQuiz() {
    final file = File(filePath);
    if (!file.existsSync()) {
      throw StateError('Quiz file not found: $filePath');
    }

    final contents = file.readAsStringSync();
    if (contents.trim().isEmpty) {
      throw StateError('Quiz file is empty');
    }

    final data = jsonDecode(contents) as Map<String, dynamic>;
    return Quiz.fromJson(data);
  }

  void writeQuiz(Quiz quiz) {
    final file = File(filePath);
    final payload = jsonEncode(quiz.toJson());
    file.writeAsStringSync('$payload\n');
  }
}
