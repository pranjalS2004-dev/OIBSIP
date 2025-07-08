import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/models/quiz_questions.dart';
import 'package:quiz/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.revertToStartScreen,
    required this.questions, // ✅ Receive list of questions
  });

  final void Function() revertToStartScreen;
  final List<String> chosenAnswers;
  final List<QuizQuestion> questions; // ✅ Add this line

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text, // ✅ Use passed questions
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectAnswers = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You Score:\n $numCorrectAnswers / $numTotalQuestions ',
              style: GoogleFonts.ubuntu(
                color: const Color.fromARGB(255, 88, 4, 46),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            QuestionsSummary(summaryData: summaryData),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: revertToStartScreen,
              icon: const Icon(
                Icons.ads_click,
                color: Color.fromARGB(255, 8, 99, 49),
              ),
              label: Text(
                'Restart Quiz',
                style: GoogleFonts.ubuntu(
                  color: Color.fromARGB(255, 14, 6, 82),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                elevation: 5,
              ),
            )
          ],
        ),
      ),
    );
  }
}
