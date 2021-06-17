import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/business_logic/level/cubit/level_cubit.dart';
import 'package:quizz_app/widgets/common_button.dart';
import '../layouts/default_layout.dart';

class OptionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appBar: AppBar(
        title: Text('Options'),
        backgroundColor: Colors.transparent,
      ),
      screen: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<LevelCubit, LevelState>(
            builder: (context, state) {
              if (state is ChangeLevelState) {
                return CommonButton(
                  text: state is ChangeLevelState
                      ? 'Niveau : ${state.level}'
                      : '',
                  color: Color(0xFF05071B),
                  action: () {
                    context.read<LevelCubit>().changeGameLevel();
                  },
                );
              }
              return Container();
            },
          ),
          SizedBox(height: 50),
          CommonButton(
            text: 'Thème : Divers',
            color: Color(0xFF05071B),
          ),
          SizedBox(height: 50),
          CommonButton(
            text: 'Son et vibration',
            color: Color(0xFF05071B),
          ),
        ],
      ),
    );
  }
}
