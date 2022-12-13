import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
part 'eventhandlercondition.dart';

class EventHandlerCubit extends Cubit<EventHandlerCondition> {
  EventHandlerCubit() : super(EventHandlerInit());
  int CounterValue = 0;

  void EventHandler(Brightness brightness, bool changer) {
    int num = 1;
    if (brightness == Brightness.dark) num = 2;
    if (changer) {
      CounterValue -= num;
    } else {
      CounterValue += num;
    }
    emit(Event(CounterValue));
  }
}
