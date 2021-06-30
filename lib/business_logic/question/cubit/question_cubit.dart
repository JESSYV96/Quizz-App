import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quizz_app/models/Question.dart';
import 'package:quizz_app/repositories/question_repository.dart';

part 'question_state.dart';

class QuestionCubit extends Cubit<QuestionState> {
  final _questionRepository = QuestionRepository();
  QuestionCubit() : super(QuestionLoading());

  void getQuestions() async {
    if (state is QuestionSuccess == false) {
      emit(QuestionLoading());
    }
    final questionsList = await _questionRepository.getAllQuestions();

    emit(QuestionSuccess(questions: questionsList));
  }

  void addQuestion() async {
    await _questionRepository.createQuestion("", true, "difficulty", "theme");
  }

  void removeQuestion(Question question) async {
    await _questionRepository.deleteQuestion(question);
  }
}
