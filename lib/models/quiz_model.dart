class QuizModel {
  final String questionText;
  final String variant1;
  final String variant2;
  final String variant3;
  final String variant4;
  final String trueAnswer;

  QuizModel({
    required this.questionText,
    required this.trueAnswer,
    required this.variant1,
    required this.variant2,
    required this.variant3,
    required this.variant4,
  });

  factory QuizModel.fromJson(Map<String, dynamic> json) {
    return QuizModel(
      questionText: json["question_text"] as String? ?? "",
      trueAnswer: json["true_answer"] as String? ?? "",
      variant1: json["variant_1"] as String? ?? "",
      variant2: json["variant_2"] as String? ?? "",
      variant3: json["variant_3"] as String? ?? "",
      variant4: json["variant_4"] as String? ?? "",
    );
  }
}
