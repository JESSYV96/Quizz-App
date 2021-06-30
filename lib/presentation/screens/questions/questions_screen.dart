import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/business_logic/question/cubit/question_cubit.dart';
import 'package:quizz_app/presentation/layouts/default_layout.dart';

import '../loading_screen.dart';

class QuestionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appBar: AppBar(
        title: Text("Questions"),
        backgroundColor: Colors.transparent,
      ),
      screen: BlocBuilder<QuestionCubit, QuestionState>(
        builder: (context, state) {
          if (state is QuestionSuccess) {
            final questions = state.questions;
            if (questions.isNotEmpty) {
              return Container(
                child: ListView.separated(
                    itemCount: questions.length,
                    separatorBuilder: (context, index) {
                      return Divider(
                        height: 50,
                        color: Colors.white,
                      );
                    },
                    itemBuilder: (context, int index) {
                      return GestureDetector(
                        onLongPress: () {
                          return context
                              .read<QuestionCubit>()
                              .removeQuestion(questions[index]);
                        },
                        child: Container(
                          child: Container(
                            child: Text(
                                '${questions[index].id.substring(0, 8)} ${questions[index].title}'),
                          ),
                        ),
                      );
                    }),
              );
            } else {
              return Center(
                child: Text('Ajoutez de nouvelles questions'),
              );
            }
          }
          return LoadingScreen();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/questions/add');
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xFF8000FF),
      ),
    );
  }
}
