import 'package:bts_wall/models/items.dart';
import 'package:flutter/foundation.dart';

abstract class MainState {
  const MainState();
}

class MainInitial extends MainState {}

class AppLoading extends MainState {}

class AppLoaded extends MainState {}
