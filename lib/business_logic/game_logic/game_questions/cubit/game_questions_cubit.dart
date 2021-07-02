import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quizz_app/models/Question.dart';
import 'package:quizz_app/repositories/question_repository.dart';

part 'game_questions_state.dart';

class GameQuestionsCubit extends Cubit<GameQuestionsState> {
  final _questionRepository = QuestionRepository();
  List<Question> gameQuestions = [];

  GameQuestionsCubit() : super(GameQuestionsStart());

  void getStartedQuestionsForGame() async {
    final questions = await _questionRepository.getAllQuestions();
    gameQuestions = questions.map((question) => question).toList()..shuffle();
    emit(GameQuestions(questions: gameQuestions));
  }

  /*
   * Remove question from gameQuestionslist 
   * when the user answered this
  */
  void answerToQuestion({required String questionId}) {
    print("you answered to the question");
    gameQuestions.removeWhere((question) => question.id == questionId);
    print(gameQuestions);
    emit(GameQuestions(questions: gameQuestions));
  }
}
