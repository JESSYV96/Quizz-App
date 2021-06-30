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
                margin: EdgeInsets.only(top: 15),
                child: ListView.separated(
                    itemCount: questions.length,
                    separatorBuilder: (context, index) {
                      return Divider(
                        height: 20,
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
                          height: 60,
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          decoration: new BoxDecoration(
                            color: Color(0xFF05071B),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    questions[index].title,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    'Réponse : ${(questions[index].answer ? 'Vrai' : 'Faux')}',
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.sports, color: Colors.white),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 4),
                                  ),
                                  Icon(Icons.directions_off_outlined,
                                      color: Colors.white),
                                ],
                              )
                            ],
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
