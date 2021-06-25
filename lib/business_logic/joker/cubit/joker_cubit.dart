import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'joker_state.dart';

class JokerCubit extends Cubit<JokerState> {
  final int nbJoker;

  JokerCubit({required this.nbJoker}) : super(JokerInitial(nbJoker: nbJoker));
}
