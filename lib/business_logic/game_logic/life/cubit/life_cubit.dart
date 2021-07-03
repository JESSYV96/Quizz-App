import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'life_state.dart';

class LifeCubit extends Cubit<LifeState> {
  int lifeNumber;
  LifeCubit({required this.lifeNumber})
      : super(LifeInitial(lifeNumber: lifeNumber));

  void setLife() {
    if (lifeNumber > 0) {
     lifeNumber = lifeNumber - 1;
    }
  }
}
