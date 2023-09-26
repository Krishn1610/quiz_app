import "package:flutter/material.dart";

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData
              .map((data) => Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: data["user_answer"] == data["correct_answer"]
                                ? const Color.fromARGB(226, 174, 234, 240)
                                : const Color.fromARGB(255, 236, 117, 212),
                          ),
                          alignment: Alignment.center,
                          // padding: const EdgeInsets.all(10),
                          width: 30,
                          height: 30,
                          margin: const EdgeInsets.only(right: 20),
                          child: Text(
                            ((data["question_index"] as int) + 1).toString(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data["question"] as String,
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 237, 223, 252),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              Text(data["user_answer"] as String,
                                  style: const TextStyle(
                                    color: Color.fromARGB(159, 237, 223, 252),
                                    fontSize: 16,
                                  )),
                              const SizedBox(
                                height: 7,
                              ),
                              Text(data["correct_answer"] as String,
                                  style: const TextStyle(
                                    color: Color.fromARGB(226, 174, 234, 240),
                                    fontSize: 16,
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}

// accessing index in a map like JavaScript
// summaryData.asMap().entries
//           .map((data) => Row(
//                 children: [
//                   Text(((data.value["question_index"] as int) + 1).toString()),
//                   Text((data.key + 1).toString()),
//                   Column()
//                 ],
//               ))
//           .toList()