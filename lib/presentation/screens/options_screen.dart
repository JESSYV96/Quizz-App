import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:quizz_app/business_logic/game_logic/level/cubit/level_cubit.dart';
import 'package:quizz_app/business_logic/options_logic/vibration/cubit/vibration_cubit.dart';
import 'package:quizz_app/widgets/buttons/common_button.dart';
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
          Row(
            children: [
              Expanded(
                child: CommonButton(
                  text: 'Son',
                  color: Color(0xFF05071B),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
              ),
              Expanded(
                child: BlocBuilder<VibrationCubit, bool>(
                  builder: (context, state) {
                    final bool _isVibrate =
                        context.read<VibrationCubit>().isVibrate;
                    return CommonButton(
                      action: () async {
                        if (_isVibrate == await Vibrate.canVibrate) {
                          Vibrate.vibrate();
                        }
                        context.read<VibrationCubit>().setVribration();
                      },
                      text: (_isVibrate ? 'Silencieux' : 'Vibration'),
                      color: Color(0xFF05071B),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
