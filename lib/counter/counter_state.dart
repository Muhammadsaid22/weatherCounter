part of 'counter_cubit.dart';

@immutable
abstract class CounterState {}

class CounterInitial extends CounterState {}
int counter = 0;
var locationMessage = 'Press the icon to get location !';
bool darkMode = false;
class CounterDown extends CounterState{}
class Color extends CounterState{}
class LocationTake extends CounterState{}
class Up extends CounterState{}
