import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quizz_app/models/Question.dart';
import 'package:quizz_app/repositories/question_repository.dart';

part 'game_questions_state.dart';

class GameQuestionsCubit extends Cubit<GameQuestionsState> {
  final _questionRepository = QuestionRepository();

  GameQuestionsCubit() : super(GameQuestionsInitial());

  void getQuestionsForGame() async {
    final questions = await _questionRepository.getAllQuestions();
    final List<Question> gameQuestions =
        questions.map((question) => question).toList();
    emit(GameQuestionsStart(
        questions: gameQuestions
          ..shuffle()
          ..toString()));
  }
}
