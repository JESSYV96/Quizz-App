part of 'game_questions_cubit.dart';

@immutable
abstract class GameQuestionsState {}

class GameQuestionsInitial extends GameQuestionsState {}

class GameQuestionsStart extends GameQuestionsState {
  List<Question> questions;
  GameQuestionsStart({required this.questions});
}
