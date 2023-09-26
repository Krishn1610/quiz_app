import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
    this.answerText,
    this.onTap, {
    super.key,
  });

  final String answerText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        HapticFeedback.lightImpact();
        onTap();
      },
      style: ElevatedButton.styleFrom(
        splashFactory: NoSplash.splashFactory,
        backgroundColor: const Color.fromARGB(255, 33, 1, 95),
        foregroundColor: const Color.fromARGB(255, 33, 1, 95),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(70)),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 70),
        enableFeedback: true,
      ),
      child: Text(
        answerText,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
