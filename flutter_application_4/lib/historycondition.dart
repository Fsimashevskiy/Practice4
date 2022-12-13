part of 'historycubit.dart';

@immutable
abstract class historycondition {}

class AddHistoryInitial extends historycondition {}

class History extends historycondition {
  final List<Text> history;

  History(this.history);
}
