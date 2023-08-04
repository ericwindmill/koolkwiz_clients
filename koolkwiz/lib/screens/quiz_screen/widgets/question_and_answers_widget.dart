import 'package:flutter/material.dart';
import 'package:koolkwiz/marketplace/marketplace.dart';
import 'package:koolkwiz/model/question.dart';

class QuestionAndAnswersWidget extends StatelessWidget {
  const QuestionAndAnswersWidget({super.key, required this.question});

  final Question question;

  Widget questionView() {
    if (question is TextQuestion) {
      return TextQuestionView(
          question: (question as TextQuestion).questionBody);
    }
    return ImageQuestionView(imageUrl: (question as ImageQuestion).imageUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: Marketplace.spacing4.toDouble(),
      ),
      child: Column(
        children: [
          SizedBox(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Marketplace.spacing2.toDouble(),
              ),
              child: questionView(),
            ),
          ),
          AnswerOptions(
            answerOptions: {
              'A': 'Phoebe',
              'B': 'Carrot',
              'C': 'Moira',
            },
            onOptionSelected: (String optionKey) {
              print('I selected $optionKey');
            },
          ),
        ],
      ),
    );
  }
}

class TextQuestionView extends StatelessWidget {
  const TextQuestionView({
    super.key,
    required this.question,
  });

  final String question;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Marketplace.spacing4.toDouble()),
      decoration: BoxDecoration(
        color: Marketplace.cardBackground,
        border: Border.all(width: Marketplace.lineWidth),
        borderRadius: BorderRadius.all(
          Radius.circular(
            Marketplace.cornerRadius,
          ),
        ),
      ),
      child: Center(
        child: Text('Question: $question'),
      ),
    );
  }
}

class ImageQuestionView extends StatelessWidget {
  const ImageQuestionView({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Marketplace.spacing4.toDouble()),
      decoration: BoxDecoration(
        color: Marketplace.cardBackground,
        border: Border.all(width: Marketplace.lineWidth),
        borderRadius: BorderRadius.all(
          Radius.circular(
            Marketplace.cornerRadius,
          ),
        ),
      ),
      child: Center(
        child: Column(
          children: [
            Image.asset(imageUrl),
            Text('Who is this?'),
          ],
        ),
      ),
    );
  }
}

typedef SelectionMadeCallback = void Function(String);

class AnswerOptions extends StatelessWidget {
  const AnswerOptions({
    super.key,
    required this.answerOptions,
    required this.onOptionSelected,
  });

  final Map<String, String> answerOptions;
  final SelectionMadeCallback onOptionSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Marketplace.spacing2.toDouble()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (var option in answerOptions.entries)
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: Marketplace.spacing7.toDouble()),
              child: GestureDetector(
                onTap: () => onOptionSelected(option.key),
                child: Container(
                  padding: EdgeInsets.all(Marketplace.spacing6.toDouble()),
                  decoration: BoxDecoration(
                    color: Marketplace.cardBackground,
                    border: Border.all(width: Marketplace.lineWidth),
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        Marketplace.cornerRadius,
                      ),
                    ),
                  ),
                  child: Text(
                    '${option.key}: ${option.value}',
                    maxLines: 1,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
