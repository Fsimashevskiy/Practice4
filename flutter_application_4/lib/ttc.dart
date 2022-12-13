import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
part 'tts.dart';

class ttc extends Cubit<tts> {
  ttc() : super(ChangeThemeInitial());
  void EventHandler(Brightness brightness) {
    if (brightness == Brightness.dark) {
      emit(ThemeState(Brightness.light));
      return;
    }
    emit(ThemeState(Brightness.dark));
  }
}
