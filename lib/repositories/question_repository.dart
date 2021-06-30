import 'package:amplify_flutter/amplify.dart';
import 'package:quizz_app/models/Question.dart';

class QuestionRepository {
  Future<List<Question>> getAllQuestions() async {
    try {
      List<Question> questions =
          await Amplify.DataStore.query(Question.classType);
      return questions;
    } catch (e) {
      print("Could not query DataStore: $e");
    }
    return [];
  }

  Future<void> createQuestion(
      String title, bool answer, String difficulty, String theme) async {
    final item = Question(
        title: "Paris est la capitale de la France ?",
        theme: "Culture génerale",
        answer: true,
        difficulty: "Facile");
    await Amplify.DataStore.save(item);
  }
  
  Future<void> deleteQuestion(Question question) async {
    await Amplify.DataStore.delete(question);
  }
}
