part of 'life_cubit.dart';

@immutable
abstract class LifeState {}

class LifeInitial extends LifeState {
  final int lifeNumber;
  LifeInitial({required this.lifeNumber});
}
