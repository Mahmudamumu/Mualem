class QuizQuestion {
  final String questionText;
  final List<String> options;
  final int correctAnswerIndex;
  final String soundPath;

  QuizQuestion({
    required this.questionText,
    required this.options,
    required this.correctAnswerIndex,
    required this.soundPath,
  });
}
