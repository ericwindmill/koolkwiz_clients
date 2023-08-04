import 'package:flutter/material.dart';
import 'package:koolkwiz/marketplace/marketplace.dart';
import 'package:koolkwiz/model/quiz.dart';

import 'widgets/quiz_widgets.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({
    super.key,
    required this.quiz,
  });

  final Quiz quiz;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Marketplace.appBackground,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text('Player: TODO'), Text('Score: 00')],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          QuestionAndAnswersWidget(question: quiz.currentQuestion),
          QuizTimerWidget(),
          MarketButton(
            onPressed: () {
              print('Submit!');
            },
            text: "Submit",
          ),
          SizedBox(height: Marketplace.spacing3.toDouble())
          // if (answered) QuestionResultsWidget(),
        ],
      ),
    );
  }
}
