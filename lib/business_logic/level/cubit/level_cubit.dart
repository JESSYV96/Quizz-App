import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'level_state.dart';

class LevelCubit extends Cubit<LevelState> {
  LevelCubit() : super(ChangeLevelState(level: levels[0]));
  int index = 0;
  dynamic changeGameLevel() {
    emit(ChangeLevelState(level: levels[((index += 1) % levels.length)]));
  }
}
