class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question(
      {required this.id,
      required this.question,
      required this.answer,
      required this.options});
}

const List sample_data = [
  {
    "id": 1,
    "question":
        "Flutter is an open-source UI software development kit created by ________",
    "options": ['Apple', 'Microsoft', 'Google', 'Meta'],
    "answer_index": 2,
  },
  {
    "id": 2,
    "question": "When google release Flutter.",
    "options": ['Jun 2017', 'Jun 2017', 'May 2017', 'May 2018'],
    "answer_index": 2,
  },
  {
    "id": 3,
    "question": "A memory location that holds a single letter or number.",
    "options": ['Double', 'Int', 'Word', 'Char'],
    "answer_index": 3,
  },
  {
    "id": 4,
    "question": "Which widget is considered the root of a Flutter app",
    "options": ['MaterialApp', 'Scaffold', 'MainWidget', 'RootWidget'],
    "answer_index": 0,
  },
  {
    "id": 5,
    "question": "Flutter is based on which programming language",
    "options": ['Java', 'Dart', 'Python', 'JavaScript'],
    "answer_index": 1,
  },
  {
    "id": 6,
    "question": "What Keyword is used for defining a constant in Dart?",
    "options": ['var', 'final', 'static', 'const'],
    "answer_index": 3,
  },
  {
    "id": 7,
    "question": "What is Dart primarily used for in Flutter",
    "options": [
      'UI Design',
      'Backend Development',
      'Database Management',
      'None of the above'
    ],
    "answer_index": 0,
  },
  {
    "id": 8,
    "question":
        "Which widget is used to create a scrollable list of widgets in Flutter",
    "options": ['Column', 'GridView', 'ListView', 'Inkwell'],
    "answer_index": 2,
  },
];
