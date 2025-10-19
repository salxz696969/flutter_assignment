import 'package:my_first_project/domain/quiz.dart';
import 'package:test/test.dart';

void main() {
  late Question q1;
  late Question q2;
  late Quiz quiz;

  setUp(() {
    q1 = Question(
      title: '2 + 2',
      choices: ['1', '2', '4'],
      goodChoice: '4',
      points: 5,
    );
    q2 = Question(
      title: '2 + 3',
      choices: ['1', '2', '5'],
      goodChoice: '5',
      points: 5,
    );
    quiz = Quiz(questions: [q1, q2]);
  });

  group('gradePlayer', () {
    test('gives 100% when all answers are correct', () {
      final answers = [
        Answer.forQuestion(q1, '4'),
        Answer.forQuestion(q2, '5'),
      ];

      final result = quiz.gradePlayer(playerName: 'Alice', answers: answers);

      expect(result.percentage, equals(100));
      expect(result.totalPoints, equals(quiz.maximumPoints));
      expect(result.correctAnswers, equals(2));
      expect(result.incorrectAnswers, equals(0));
    });

    test('drops to 50% when one answer is wrong', () {
      final answers = [
        Answer.forQuestion(q1, '4'),
        Answer.forQuestion(q2, '2'),
      ];

      final result = quiz.gradePlayer(playerName: 'Bob', answers: answers);

      expect(result.percentage, equals(50));
      expect(result.totalPoints, equals(q1.points));
      expect(result.correctAnswers, equals(1));
      expect(result.incorrectAnswers, equals(1));
    });

    test('ignores answers that point to unknown questions', () {
      final outsider = Question(
        title: 'Outside question',
        choices: ['A', 'B'],
        goodChoice: 'A',
        points: 2,
      );
      final answers = [
        Answer.forQuestion(q1, '4'),
        Answer.forQuestion(outsider, 'A'),
      ];

      final result = quiz.gradePlayer(playerName: 'Cara', answers: answers);

      expect(result.percentage, equals(50));
      expect(result.correctAnswers, equals(1));
      expect(result.attemptedQuestions, equals(1));
    });

    test('stores submissions when asked', () {
      final answers = [Answer.forQuestion(q1, '4')];

      final result = quiz.gradePlayer(
        playerName: 'Eve',
        answers: answers,
        storeSubmission: true,
      );

      expect(result.correctAnswers, equals(1));
      expect(quiz.playerSubmissions.length, equals(1));

      final stored = quiz.playerSubmissions.first;
      final storedAnswer = stored.answers.first;

      expect(quiz.getSubmissionById(stored.id)?.playerName, equals('Eve'));
      expect(quiz.getAnswerById(storedAnswer.id)?.answerChoice, equals('4'));
    });
  });

  group('id lookup', () {
    test('returns questions by id', () {
      final found = quiz.getQuestionById(q1.id);
      expect(found?.title, equals('2 + 2'));
    });

    test('serializes and deserializes the quiz', () {
      final answers = [
        Answer.forQuestion(q1, '4'),
      ];
      quiz.gradePlayer(
        playerName: 'Logan',
        answers: answers,
        storeSubmission: true,
      );

      final copy = Quiz.fromJson(quiz.toJson());

      expect(copy.questions.length, equals(2));
      expect(copy.playerSubmissions.length, equals(1));
      final clonedQuestion = copy.getQuestionById(q1.id);
      expect(clonedQuestion?.title, equals(q1.title));
    });
  });
}
