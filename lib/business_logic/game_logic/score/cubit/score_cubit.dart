import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'score_state.dart';

class ScoreCubit extends Cubit<ScoreState> {
  int score;
  ScoreCubit({required this.score}) : super(ScoreStart());

  void setScore() {
    score = score += 10;
    emit(Score(score: score));
  }
}
