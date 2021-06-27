import 'package:bloc/bloc.dart';

class VibrationCubit extends Cubit<bool> {
  bool isVibrate;
  VibrationCubit({required this.isVibrate}) : super(isVibrate);

  dynamic setVribration() {
    emit(isVibrate = !isVibrate);
  }
}
