part of 'score_cubit.dart';

@immutable
abstract class ScoreState {}

class ScoreStart extends ScoreState {
  ScoreStart();
}

class Score extends ScoreState {
  final int score;
 
  Score({required this.score});
}
