import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzy/component/option.dart';
import 'package:quizzy/constants.dart';
import 'package:quizzy/controllers/question_controller.dart';
import 'package:quizzy/models/questions.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    super.key,
    required this.question,
  });
  final Question question;

  @override
  Widget build(BuildContext context) {
    QuestionControler _controler = Get.put(QuestionControler());
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: EdgeInsets.all(kDefaultPadding),
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(
            question.question,
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: kBlackColor),
          ),
          SizedBox(
            height: 12,
          ),
          ...List.generate(
            question.options.length,
            (index) => Option(
              text: question.options[index],
              index: index,
              press: () => _controler.checkAns(question, index),
            ),
          ),
        ],
      ),
    );
  }
}
