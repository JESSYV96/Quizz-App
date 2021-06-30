part of 'question_cubit.dart';

@immutable
abstract class QuestionState {}

class QuestionLoading extends QuestionState {}

class QuestionSuccess extends QuestionState {
  final List<Question> questions;

  QuestionSuccess({required this.questions});
}

class QuestionFailure extends QuestionState {}
