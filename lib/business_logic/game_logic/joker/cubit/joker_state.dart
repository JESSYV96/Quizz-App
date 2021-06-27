part of 'joker_cubit.dart';

@immutable
abstract class JokerState {}

class JokerInitial extends JokerState {
  final int nbJoker;

  JokerInitial({required this.nbJoker});
}
