import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzy/component/body.dart';
import 'package:quizzy/controllers/question_controller.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionControler _controller = Get.put(QuestionControler());

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          MaterialButton(
            onPressed: _controller.nextQuestion,
            child: Text('Skip'),
          ),
        ],
      ),
      body: Body(),
    );
  }
}
