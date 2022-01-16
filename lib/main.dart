import 'package:bts_wall/bloc/main/main_state.dart';
import 'package:bts_wall/pages/home.dart';
import 'package:bts_wall/pages/splash.dart';
import 'package:bts_wall/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/main/main_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();

  // I can call funct with this // MyApp.of(context).changeTheme(),
  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  ThemeData _themee = MyTheme.darkTheme;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MainCubit()..initApp(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Bts Wallpapers',
          theme: _themee,
          // themeMode: _themeMode,
          home: BlocBuilder<MainCubit, MainState>(builder: (context, state) {
            if (state is AppLoading)
              return SplashPage();
            else
              return HomePage();
          })),
    );
  }

  // Change App Theme
  void changeTheme() {
    setState(() {
      _themee = MyTheme.lightTheme;
    });
  }
}
