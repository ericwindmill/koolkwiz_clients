import 'package:cloud_firestore/cloud_firestore.dart';

void populateFirestoreQuestions() async {
  try {
    await Future.wait(questions.map(
        (doc) => FirebaseFirestore.instance.collection('questions').add(doc)));
  } catch (e) {
    print(e);
  }
}

final questions = [
  {
    'type': 'textQuestion',
    'category': 'Cats',
    'questionBody': 'Who is the oldest amongst my cats?',
    'correctAnswer': 'A',
    'possibleAnswers': {
      'A': 'Phoebe',
      'B': 'Carrot',
      'C': 'Moira',
      'D': 'None of the above',
    },
  },
  {
    'type': 'textQuestion',
    'category': 'Cats',
    'questionBody': 'Who is the cutest amongst my cats?',
    'correctAnswer': 'A',
    'possibleAnswers': {
      'A': 'Phoebe',
      'B': 'Carrot',
      'C': 'Moira',
      'D': 'None of the above',
    },
  },
  {
    'type': 'imageQuestion',
    'category': 'Cats',
    'imagePath': 'assets/cats/phoebe_01_cropped.png',
    'correctAnswer': 'A',
    'possibleAnswers': {
      'A': 'Phoebe',
      'B': 'Carrot',
      'C': 'Moira',
      'D': 'None of the above',
    },
  },
  {
    'type': 'textQuestion',
    'category': 'Cats',
    'questionBody': 'Who is the oldest amongst my cats?',
    'correctAnswer': 'A',
    'possibleAnswers': {
      'A': 'Phoebe',
      'B': 'Carrot',
      'C': 'Moira',
      'D': 'None of the above',
    },
  },
  {
    'type': 'textQuestion',
    'category': 'Cats',
    'questionBody': 'Who is the cutest amongst my cats?',
    'correctAnswer': 'A',
    'possibleAnswers': {
      'A': 'Phoebe',
      'B': 'Carrot',
      'C': 'Moira',
      'D': 'None of the above',
    },
  },
  {
    'type': 'imageQuestion',
    'category': 'Cats',
    'imagePath': 'assets/cats/phoebe_01_cropped.png',
    'correctAnswer': 'A',
    'possibleAnswers': {
      'A': 'Phoebe',
      'B': 'Carrot',
      'C': 'Moira',
      'D': 'None of the above',
    },
  },
  {
    'type': 'textQuestion',
    'category': 'Cats',
    'questionBody': 'Who is the oldest amongst my cats?',
    'correctAnswer': 'A',
    'possibleAnswers': {
      'A': 'Phoebe',
      'B': 'Carrot',
      'C': 'Moira',
      'D': 'None of the above',
    },
  },
  {
    'type': 'textQuestion',
    'category': 'Cats',
    'questionBody': 'Who is the cutest amongst my cats?',
    'correctAnswer': 'A',
    'possibleAnswers': {
      'A': 'Phoebe',
      'B': 'Carrot',
      'C': 'Moira',
      'D': 'None of the above',
    },
  },
  {
    'type': 'imageQuestion',
    'category': 'Cats',
    'imagePath': 'assets/cats/phoebe_01_cropped.png',
    'correctAnswer': 'A',
    'possibleAnswers': {
      'A': 'Phoebe',
      'B': 'Carrot',
      'C': 'Moira',
      'D': 'None of the above',
    },
  },
  {
    'type': 'textQuestion',
    'category': 'Cats',
    'questionBody': 'Who is the oldest amongst my cats?',
    'correctAnswer': 'A',
    'possibleAnswers': {
      'A': 'Phoebe',
      'B': 'Carrot',
      'C': 'Moira',
      'D': 'None of the above',
    },
  },
  {
    'type': 'textQuestion',
    'category': 'Cats',
    'questionBody': 'Who is the cutest amongst my cats?',
    'correctAnswer': 'A',
    'possibleAnswers': {
      'A': 'Phoebe',
      'B': 'Carrot',
      'C': 'Moira',
      'D': 'None of the above',
    },
  },
  {
    'type': 'imageQuestion',
    'category': 'Cats',
    'imagePath': 'assets/cats/phoebe_01_cropped.png',
    'correctAnswer': 'A',
    'possibleAnswers': {
      'A': 'Phoebe',
      'B': 'Carrot',
      'C': 'Moira',
      'D': 'None of the above',
    },
  },
];
