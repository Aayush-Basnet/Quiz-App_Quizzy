import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzy/constants.dart';
import 'package:quizzy/controllers/question_controller.dart';
import 'package:websafe_svg/websafe_svg.dart';

class ScoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionControler _qnController = Get.put(QuestionControler());
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          WebsafeSvg.asset("assets/icons/bg.svg", fit: BoxFit.fill),
          Column(
            children: [
              Spacer(
                flex: 2,
              ),
              Text(
                'Score',
                style: Theme.of(context)
                    .textTheme
                    .headline2
                    ?.copyWith(color: kSecondaryColor),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "${_qnController.totalScore}/${_qnController.questions.length * 10}",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(color: kSecondaryColor),
              ),
              Spacer(
                flex: 3,
              ),
            ],
          )
        ],
      ),
    );
  }
}
