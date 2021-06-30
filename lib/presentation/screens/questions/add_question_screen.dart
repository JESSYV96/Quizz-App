import 'package:direct_select/direct_select.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/business_logic/question/cubit/question_cubit.dart';
import 'package:quizz_app/presentation/layouts/default_layout.dart';
import 'package:quizz_app/widgets/buttons/main_button.dart';

class AddQuestionScreen extends StatefulWidget {
  AddQuestionScreen({Key? key}) : super(key: key);

  @override
  _AddQuestionScreenState createState() => _AddQuestionScreenState();
}

class _AddQuestionScreenState extends State<AddQuestionScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appBar: AppBar(
        title: Text('Nouvelle question'),
        backgroundColor: Colors.transparent,
      ),
      screen: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              children: [
                _titleField(),
              ],
            ),
          ),
          BlocBuilder<QuestionCubit, QuestionState>(
            builder: (questionContext, state) {
              return _submitButton(questionContext);
            },
          ),
        ],
      ),
    );
  }

  Widget _titleField() {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        focusColor: Color(0xFFDE00FF),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFDE00FF),
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFDE00FF),
          ),
        ),
        hintText: 'La France a gagné l\'Euro 2021 ?',
        labelStyle: TextStyle(
          color: Color(0xFFDE00FF),
        ),
        labelText: 'Intitulé',
      ),
    );
  }

  Widget _answerField() {
    final answers = [
      true,
      false,
    ];

    int? answerChoose = 0;

    List<Widget> _answersItems() {
      return answers
          .map((val) => Container(
                child: Text(val ? 'Vrai' : 'Faux'),
              ))
          .toList();
    }

    return DirectSelect(
      items: _answersItems(),
      selectedIndex: answerChoose,
      onSelectedItemChanged: (index) {
        setState(() {
          answerChoose = index;
          print("answer : $answerChoose");
        });
      },
      itemExtent: 40,
      child: Container(child: Text('Reponse')),
    );
  }

  Widget _submitButton(BuildContext context) {
    return MainButton(
      text: 'Ajouter la question',
      action: () {
        context.read<QuestionCubit>().addQuestion();
        Navigator.pushReplacementNamed(context, '/questions');
      },
    );
  }
}
