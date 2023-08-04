import 'model/player.dart';

import 'model/quiz.dart';

class AppState {
  Quiz currentQuiz;
  Player player;

  AppState({required this.player, required this.currentQuiz});

  // void submitAnswer(Question question, String selectedAnswer) {
  //   final int newResultForAnswerSelection =
  //       question.results[selectedAnswer]! + 1;
  //   final newResults =
  //       question.results[selectedAnswer] = newResultForAnswerSelection;
  //   FirebaseFirestore.instance.doc('Questions/${question.id}').update({
  //     'results': newResults,
  //   });
  // }
}
