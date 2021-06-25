import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'score_state.dart';

class ScoreCubit extends Cubit<ScoreState> {
  final int score;
  ScoreCubit({required this.score}) : super(ScoreInitial(score: score));
}
