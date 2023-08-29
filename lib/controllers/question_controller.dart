import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzy/models/questions.dart';
import 'package:quizzy/screens/score_screen.dart';

// use get package for our state management
class QuestionControler extends GetxController
    with GetSingleTickerProviderStateMixin {
  // lets animated our progress bar
  late AnimationController _animationController;
  late Animation _animation;
  //so that we can access our animation outside
  Animation get animation => this._animation;

  late PageController _pageController;
  PageController get pagecontroller => this._pageController;

  List<Question> _questions = sample_data
      .map((question) => Question(
            id: question['id'],
            question: question['question'],
            options: question['options'],
            answer: question['answer_index'],
          ))
      .toList();

  List<Question> get questions => this._questions;

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  var _correctAnswer;
  int get correctAnswer => this._correctAnswer;

  var _selectedAns;
  int get selectedAnswer => this._selectedAns;

  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  var _numOfCorrectAns = 0;
  int get numOfCOrrectAns => this._numOfCorrectAns;

  var _totalScore = 0;
  int get totalScore => this._totalScore;

  @override
  void onInit() {
    // our animation duration is 60s
    // so our plan is to fill the progress bar within 60s
    _animationController =
        AnimationController(duration: Duration(seconds: 60), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        // update like setstate
        update();
      });
    //start our animation
    _animationController.forward().whenComplete(nextQuestion);
    _pageController = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    _animationController.dispose();
    _pageController.dispose();
    super.onClose();
  }

  void checkAns(Question question, int selectedIndex) {
    // because onc user press any option then it'll run
    _isAnswered = true;
    _correctAnswer = question.answer;
    _selectedAns = selectedIndex;

    if (_correctAnswer == _selectedAns) {
      _numOfCorrectAns++;
      _totalScore += 10;
    }
// it will stop the counter
    _animationController.stop();
    update();

// once user select an answer after 3s if will go to next qn
    Future.delayed(Duration(seconds: 1), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: Duration(
            milliseconds: 250,
          ),
          curve: Curves.ease);

      // Reset the counter
      _animationController.reset();

      //then start it again
      // once time is finish, go to the next question
      _animationController.forward().whenComplete(nextQuestion);
    } else {
      Get.to(ScoreScreen());
    }
  }

  void updateQuestionNumber(int index) {
    _questionNumber.value = index + 1;
  }
}
