import 'package:uuid/uuid.dart';

final Uuid _uuid = Uuid();

class Question {
  final String id;
  final String title;
  final List<String> choices;
  final String goodChoice;
  final int points;

  Question({
    String? id,
    required this.title,
    required this.choices,
    required this.goodChoice,
    this.points = 1,
  }) : id = id ?? _uuid.v4();

  Question.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'] as String?,
          title: json['title'] as String,
          choices: List<String>.from(json['choices'] as List),
          goodChoice: json['goodChoice'] as String,
          points: (json['points'] as num?)?.toInt() ?? 1,
        );

  bool isCorrect(String choice) {
    return choice.trim() == goodChoice;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'choices': choices,
      'goodChoice': goodChoice,
      'points': points,
    };
  }
}

class Answer {
  final String id;
  final String questionId;
  final String answerChoice;

  Answer({
    String? id,
    required this.questionId,
    required this.answerChoice,
  }) : id = id ?? _uuid.v4();

  Answer.forQuestion(Question question, String answerChoice, {String? id})
      : this(
          id: id,
          questionId: question.id,
          answerChoice: answerChoice,
        );

  Answer.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'] as String?,
          questionId: json['questionId'] as String,
          answerChoice: json['answerChoice'] as String,
        );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'questionId': questionId,
      'answerChoice': answerChoice,
    };
  }
}

class PlayerSubmission {
  final String id;
  final String playerName;
  final List<Answer> answers;

  PlayerSubmission({
    String? id,
    required this.playerName,
    required List<Answer> answers,
  })  : id = id ?? _uuid.v4(),
        answers = answers;

  PlayerSubmission.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'] as String?,
          playerName: json['playerName'] as String,
          answers: (json['answers'] as List? ?? const [])
              .map(
                (item) =>
                    Answer.fromJson(Map<String, dynamic>.from(item as Map)),
              )
              .toList(),
        );

  Answer? getAnswerById(String answerId) {
    for (final answer in answers) {
      if (answer.id == answerId) {
        return answer;
      }
    }
    return null;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'playerName': playerName,
      'answers': answers.map((answer) => answer.toJson()).toList(),
    };
  }
}

class PlayerResult {
  final Quiz quiz;
  final PlayerSubmission submission;

  PlayerResult({
    required this.quiz,
    required this.submission,
  });

  String get playerName => submission.playerName;

  List<Answer> get answers => submission.answers;

  Answer? getAnswerById(String answerId) {
    return submission.getAnswerById(answerId);
  }

  int get attemptedQuestions => answers.length;

  int get correctAnswers {
    int count = 0;
    for (var answer in answers) {
      var question = quiz.getQuestionById(answer.questionId);
      if (question != null && question.isCorrect(answer.answerChoice)) {
        count++;
      }
    }
    return count;
  }

  int get incorrectAnswers => quiz.totalQuestions - correctAnswers;

  int get totalPoints {
    var total = 0;
    for (final answer in answers) {
      final question = quiz.getQuestionById(answer.questionId);
      if (question != null && question.isCorrect(answer.answerChoice)) {
        total += question.points;
      }
    }
    return total;
  }

  int get percentage {
    if (quiz.totalQuestions == 0) {
      return 0;
    }
    return ((correctAnswers / quiz.totalQuestions) * 100).toInt();
  }
}

class Quiz {
  final String id;
  final List<Question> questions;
  final List<PlayerSubmission> _submissions;

  Quiz({
    String? id,
    required List<Question> questions,
    List<PlayerSubmission>? submissions,
  })  : id = id ?? _uuid.v4(),
        questions = questions,
        _submissions = submissions ?? <PlayerSubmission>[];

  Quiz.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'] as String?,
          questions: (json['questions'] as List? ?? const [])
              .map(
                (item) =>
                    Question.fromJson(Map<String, dynamic>.from(item as Map)),
              )
              .toList(),
          submissions: (json['submissions'] as List? ?? const [])
              .map(
                (item) => PlayerSubmission.fromJson(
                  Map<String, dynamic>.from(item as Map),
                ),
              )
              .toList(),
        );

  int get totalQuestions => questions.length;

  int get maximumPoints {
    var total = 0;
    for (final question in questions) {
      total += question.points;
    }
    return total;
  }

  List<PlayerSubmission> get playerSubmissions =>
      List.unmodifiable(_submissions);

  void addSubmission(PlayerSubmission submission) {
    _submissions.add(submission);
  }

  Question? getQuestionById(String questionId) {
    for (final question in questions) {
      if (question.id == questionId) {
        return question;
      }
    }
    return null;
  }

  PlayerSubmission? getSubmissionById(String submissionId) {
    for (final submission in _submissions) {
      if (submission.id == submissionId) {
        return submission;
      }
    }
    return null;
  }

  Answer? getAnswerById(String answerId) {
    for (final submission in _submissions) {
      final answer = submission.getAnswerById(answerId);
      if (answer != null) {
        return answer;
      }
    }
    return null;
  }

  PlayerResult gradePlayer({
    required String playerName,
    required List<Answer> answers,
    bool storeSubmission = false,
  }) {
    final cleanedAnswers = _filterAnswers(answers);
    final submission = PlayerSubmission(
      playerName: playerName,
      answers: cleanedAnswers,
    );

    if (storeSubmission) {
      addSubmission(submission);
    }

    return PlayerResult(quiz: this, submission: submission);
  }

  PlayerResult gradeSubmission(
    PlayerSubmission submission, {
    bool storeSubmission = false,
  }) {
    final cleanedAnswers = _filterAnswers(submission.answers);
    final normalized = PlayerSubmission(
      id: submission.id,
      playerName: submission.playerName,
      answers: cleanedAnswers,
    );

    if (storeSubmission) {
      addSubmission(normalized);
    }

    return PlayerResult(quiz: this, submission: normalized);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'questions': questions.map((question) => question.toJson()).toList(),
      'submissions':
          _submissions.map((submission) => submission.toJson()).toList(),
    };
  }

  List<Answer> _filterAnswers(List<Answer> answers) {
    final filtered = <Answer>[];
    for (final answer in answers) {
      var found = false;
      for (final question in questions) {
        if (question.id == answer.questionId) {
          found = true;
          break;
        }
      }
      if (found) {
        filtered.add(answer);
      }
    }
    return filtered;
  }
}
