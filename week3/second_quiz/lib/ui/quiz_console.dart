import 'dart:io';

import '../domain/quiz.dart';

class QuizConsole {
  final Quiz quiz;

  QuizConsole({required this.quiz});

  void startQuiz() {
    print('--- Quiz ---');

    final results = <PlayerResult>[];

    stdout.write('Enter the number of players: ');
    final playerCount = int.tryParse(stdin.readLineSync() ?? '') ?? 1;

    for (var playerIndex = 0; playerIndex < playerCount; playerIndex++) {
      stdout.write('Player ${playerIndex + 1} name: ');
      final name = stdin.readLineSync() ?? '';

      final answers = <Answer>[];

      for (final question in quiz.questions) {
        print('Question: ${question.title} - (${question.points} pts)');
        print(question.choices);
        stdout.write('Answer: ');
        final reply = stdin.readLineSync() ?? '';

        answers.add(Answer.forQuestion(question, reply));
      }

      final playerResult = quiz.gradePlayer(
        playerName: name,
        answers: answers,
        storeSubmission: true,
      );
      results.add(playerResult);

      print('$name, your score in percentage: ${playerResult.percentage}%');
      print('$name, your score in points: ${playerResult.totalPoints}\n');
    }

    results.sort((a, b) => b.totalPoints.compareTo(a.totalPoints));
    print('Final scores:');
    for (var i = 0; i < results.length; i++) {
      final r = results[i];
      print('Player ${r.playerName}\t ${r.totalPoints}');
    }
    print('\n--- Quiz Finished ---');
  }
}
