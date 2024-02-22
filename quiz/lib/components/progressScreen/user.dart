class Myuser {
  final String score;
  final String total_questions;

  const Myuser({
    required this.score,
    required this.total_questions,
  });

  factory Myuser.fromMap(Map<dynamic, dynamic> map) {
    return Myuser(
      score: map['score'] ?? '',
      total_questions: map['total_questions'] ?? '',
    );
  }
}
