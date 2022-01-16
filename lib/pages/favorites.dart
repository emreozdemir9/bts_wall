import 'package:bts_wall/bloc/main/main_cubit.dart';
import 'package:bts_wall/bloc/main/main_state.dart';
import 'package:bts_wall/widgets/mainwidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bts_wall/globals.dart' as globals;

class FavoritesPage extends StatefulWidget {
  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Favorites'),
        ),
        body: _build());
  }

  Widget _build() {
    return BlocProvider(
      create: (_) => MainCubit(),
      child: BlocBuilder<MainCubit, MainState>(builder: (context, state) {
        // Get Image List
        return MainWidgets.buildMainStaggeredImageList(globals.favorites);
      }),
    );
  }

  updateFavPage() => setState(() => null);
}
