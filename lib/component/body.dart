import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzy/component/progress_bar.dart';
import 'package:quizzy/component/question_card.dart';
import 'package:quizzy/constants.dart';
import 'package:quizzy/controllers/question_controller.dart';
import 'package:websafe_svg/websafe_svg.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    QuestionControler _questionController = Get.put(QuestionControler());
    return Stack(
      children: [
        WebsafeSvg.asset('assets/icons/bg.svg', fit: BoxFit.fill),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: ProgressBar(),
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Obx(
                    () => Text.rich(
                      TextSpan(
                        text:
                            "Question ${_questionController.questionNumber.value}",
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            ?.copyWith(color: kSecondaryColor),
                        children: [
                          TextSpan(
                            text: "/${_questionController.questions.length}",
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(color: kSecondaryColor),
                          )
                        ],
                      ),
                    ),
                  )),
              Divider(
                thickness: 1.5,
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: PageView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _questionController.pagecontroller,
                  onPageChanged: _questionController.updateQuestionNumber,
                  itemCount: _questionController.questions.length,
                  itemBuilder: (context, index) => Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: QuestionCard(
                      question: _questionController.questions[index],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
