import "package:flutter/material.dart";
import "package:quiz_app/data/questions.dart";
import "package:quiz_app/questions_summary.dart";

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.chosenAnswers, this.onRestart, {super.key});

  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        "question_index": i,
        "question": questions[i].text,
        "correct_answer": questions[i].answers[0],
        "user_answer": chosenAnswers[i]
      });
    }

    return summary;
  }

  final void Function() onRestart;

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    // filter array with where method
    final numCorrectQuestions = summaryData.where(
      (data) {
        return data["user_answer"] == data["correct_answer"];
      },
    ).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!",
              style: const TextStyle(
                  color: Color.fromARGB(204, 237, 223, 252),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData: summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  splashFactory: NoSplash.splashFactory,
                ),
                icon: const Icon(Icons.refresh),
                onPressed: onRestart,
                label: const Text("Restart Quiz!"))
          ],
        ),
      ),
    );
  }
}
