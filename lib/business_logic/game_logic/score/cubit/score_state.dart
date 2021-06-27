part of 'score_cubit.dart';

@immutable
abstract class ScoreState {}

class ScoreInitial extends ScoreState {
  final int score;
  ScoreInitial({required this.score});
}
