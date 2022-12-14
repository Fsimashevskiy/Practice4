import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'historycondition.dart';

class historycubit extends Cubit<historycondition> {
  historycubit() : super(AddHistoryInitial());

  void eventhandler(List<Text> history, int counter, Brightness brightness) {
    String theme = brightness == Brightness.dark ? " Dark" : " Light";
    var date = DateTime.now();
    var result =
        "${date.month}/${date.day} ${date.hour}:${date.minute}:${date.second}";
    String text = result + " " + counter.toString() + "" + theme;
    history.insert(0, Text(text, style: TextStyle(fontSize: 50)));
    emit(History(history));
  }
}
