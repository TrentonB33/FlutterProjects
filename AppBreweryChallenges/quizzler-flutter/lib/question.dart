class Question {
  String questionText;
  bool questionAnswer;

  Question(this.questionText, this.questionAnswer);

//  Question({String q, bool a}) {
//    questionText = q;
//    questionAnswer = a;
//  }

  bool isCorrect(bool userInput) {
    return userInput == this.questionAnswer;
  }
}
