import 'dart:convert';

import 'package:bts_wall/bloc/main/main_state.dart';
import 'package:bts_wall/models/items.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bts_wall/globals.dart' as globals;
import 'package:shared_preferences/shared_preferences.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());

  int currentImageIndex = 0;

  void initApp() async {
    // Loading App
    emit(AppLoading());

    await initFavorites();
    Future.delayed(Duration(milliseconds: 2000), () {
      // Loaded App
      emit(AppLoaded());
    });
  }

  initFavorites() async {
    print('CHECKINNGG FAVVVVVVVVVVV ############');
    SharedPreferences favPrefs = await SharedPreferences.getInstance();
    String favorites = favPrefs.getString('FAVORITES');
    print(favorites);
    if (favorites != null && favorites.toString() != '[]') {
      // Convert
      var jsonStorageFavs = jsonDecode(favorites);
      // Add All Storage favs
      jsonStorageFavs.forEach((fav) => globals.favorites.add(Items.fromJson(fav)));
    }
  }
}
