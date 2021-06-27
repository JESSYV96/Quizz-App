part of 'level_cubit.dart';

final List<String> levels = ['Facile', 'Moyen', 'Difficile'];

@immutable
abstract class LevelState {}

class ChangeLevelState extends LevelState {
  final String level;
  ChangeLevelState({required this.level});
}
