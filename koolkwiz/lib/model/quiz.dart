import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:koolkwiz/model/question.dart';

class Quiz {
  Quiz({
    required this.id,
    this.questions = const [],
    this.leaderboard = const {},
    this.length = 10,
  });

  final String id;
  final List<Question> questions;
  final int length;
  final Map<String, int> leaderboard;
  int currentQuestionIdx = 0;

  Question get currentQuestion => questions[currentQuestionIdx];

  List<Question> addQuestions(List<Question> question) {
    questions.addAll(questions);
    return questions;
  }

  Question nextQuestion() {
    currentQuestionIdx++;
    return currentQuestion;
  }

  Question previousQuestion() {
    currentQuestionIdx--;
    return currentQuestion;
  }

  // The logic for this shouldn't be in one long method. But, it might help
  // us approach a refactoring example holistically.
  // TODO: split logic depending on the refactoring examples for the talk
  void initQuiz() async {
    final questions = [];
    FirebaseFirestore.instance
        .collection('Questions')
        // Get ALL the questions
        .get()
        .then((QuerySnapshot<Map<String, dynamic>> value) {
      for (var doc in value.docs) {
        final data = doc.data();
        final questionType = data['type'];
        if (questionType == 'TextQuestion') {
          final question = TextQuestion(
            id: doc.id,
            questionBody: data['questionBody'],
            category: doc['category'],
            possibleAnswers: {
              'A': doc['possibleAnswers']['A'],
              'B': doc['possibleAnswers']['B'],
              'C': doc['possibleAnswers']['C'],
              'D': doc['possibleAnswers']['D'],
            },
            correctAnswer: data['correctAnswer'],
            results: {
              'A': doc['results']['A'],
              'B': doc['results']['B'],
              'C': doc['results']['C'],
              'D': doc['results']['D'],
            },
          );
          questions.add(question);
        } else if (questionType == 'ImageQuestion') {
          final question = ImageQuestion(
            id: doc.id,
            imageUrl: data['imageUrl'],
            category: doc['category'],
            possibleAnswers: {
              'A': doc['possibleAnswers']['A'],
              'B': doc['possibleAnswers']['B'],
              'C': doc['possibleAnswers']['C'],
              'D': doc['possibleAnswers']['D'],
            },
            correctAnswer: data['correctAnswer'],
            results: {
              'A': doc['results']['A'],
              'B': doc['results']['B'],
              'C': doc['results']['C'],
              'D': doc['results']['D'],
            },
          );
          questions.add(question);
        }
      }
    });

    // Filter the questions to get random questions
    questions.shuffle();
    final questionsForQuizLength =
        questions.take(length).toList().cast<Question>();
    addQuestions(questionsForQuizLength);

    // TODO: Remove everything below in this method if this isn't necessary.
    // This logic is based on the idea that we'll have "quiz sessions", which
    // may not be necessary
    final questionIds = questions.map((question) => question.id);

    FirebaseFirestore.instance.doc('quizzes/$id').update({
      'length': length,
      'questions': questionIds,
      'currentQuestionIdx': currentQuestionIdx,
      'leaderboard': {},
    });
  }
}
