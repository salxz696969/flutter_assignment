import 'dart:io';

class Question {
  String title;
  List<String> choices;
  String goodChoice;

  Question(this.title, this.choices, this.goodChoice);
}

class Answer {
  String answerChoice;
  bool isGoodAnswer;

  Answer(this.answerChoice, this.isGoodAnswer);
}

class Quiz {
  List<Question> questions = [];
  int score = 0;

  void addAnswer(Answer answer) {
    if (answer.isGoodAnswer) {
      score++;
    }
  }

  int getScore() {
    return score;
  }
}

void main() {
  Quiz quiz = Quiz();

  Question q1 = Question("What is 1+1?", ["1", "76", "33", "2", "3", "4"], "2");
  Question q2 = Question("What is 2 + 2?", ["3", "4", "5", "6"], "4");
  Question q3 = Question("Which is the correct answer, 3+4?", [
    "2",
    "12",
    "7",
    "93",
  ], "7");

  quiz.questions.add(q1);
  quiz.questions.add(q2);
  quiz.questions.add(q3);

  print("Answer the question bellow");

  for (var question in quiz.questions) {
    print("\n${question.title}");
    for (int i = 0; i < question.choices.length; i++) {
      print("${i + 1}. ${question.choices[i]}");
    }

    stdout.write("Enter your choice (1-${question.choices.length}): ");
    String? input = stdin.readLineSync();
    int? choiceIndex = int.tryParse(input ?? "");

    String userAnswer = "";
    if (choiceIndex != null &&
        choiceIndex > 0 &&
        choiceIndex <= question.choices.length) {
      userAnswer = question.choices[choiceIndex - 1];
    }

    bool isCorrect = userAnswer == question.goodChoice;
    Answer ans = Answer(userAnswer, isCorrect);
    quiz.addAnswer(ans);

    if (isCorrect) {
      print("Correct");
    } else {
      print("Wrong. The correct answer was: ${question.goodChoice}");
    }
  }

  print("Your score: ${quiz.getScore()} out of ${quiz.questions.length}");
}
