part of 'ttc.dart';

@immutable
abstract class tts {}

class ChangeThemeInitial extends tts {}
class ThemeState extends tts {
  final Brightness brightness;
  ThemeState(this.brightness);
}
