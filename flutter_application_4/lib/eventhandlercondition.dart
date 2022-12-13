part of '../eventhandlercubit.dart';

@immutable
abstract class EventHandlerCondition {}

class EventHandlerInit extends EventHandlerCondition {}

class Event extends EventHandlerCondition {
  int CounterValue;
  Event(this.CounterValue);
}

class EventHandlerMistake extends EventHandlerCondition {
  final String service;
  EventHandlerMistake(this.service);
}
