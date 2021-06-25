import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'life_state.dart';

class LifeCubit extends Cubit<LifeState> {
  final int lifeNumber;
  LifeCubit({required this.lifeNumber}) : super(LifeInitial(lifeNumber: lifeNumber));
}
