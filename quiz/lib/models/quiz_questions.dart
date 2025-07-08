class QuizQuestion{

  const QuizQuestion(this.text,this.answers);

  final String text;
  final List<String> answers;

  List <String> getShuffledAnswers(){
    //we have to make a copy of the answers list and shuffle it
    final shuffledList=List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}