part of 'game_questions_cubit.dart';

@immutable
abstract class GameQuestionsState {}

class GameQuestionsStart extends GameQuestionsState {
  GameQuestionsStart();
}

class GameQuestions extends GameQuestionsState {
  final List<Question> questions;
  GameQuestions({required this.questions});
}
