import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'life_state.dart';

class LifeCubit extends Cubit<LifeState> {
  LifeCubit() : super(LifeInitial(lifeNumber: 3));
}
