import 'dart:convert';

import 'package:bts_wall/models/items.dart';
import 'package:flutter/material.dart';
import 'package:bts_wall/globals.dart' as globals;
import 'package:shared_preferences/shared_preferences.dart';

class TopButtons extends StatefulWidget {
  final Items imageItem;
  final Function updateFavPage;
  TopButtons(this.imageItem, this.updateFavPage);
  @override
  _TopButtonsState createState() => _TopButtonsState();
}

class _TopButtonsState extends State<TopButtons> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 30,
      right: 10,
      left: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Back Button
          buttonWidget(Icons.arrow_back, () => Navigator.pop(context)),

          // Add Favorites Button
          buttonWidget(Icons.favorite, _addOrRemoveFav,
              color: globals.favorites.contains(widget.imageItem)
                  ? Colors.red
                  : Colors.white),
        ],
      ),
    );
  }

  Widget buttonWidget(IconData icon, onTap, {Color color}) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(
        icon,
        size: 32,
      ),
      color: color ?? Colors.white,
    );
  }

  _addOrRemoveFav() async {
    print('IN FAV');
    if (globals.favorites.contains(widget.imageItem)) {
      globals.favorites.remove(widget.imageItem);
      // Update Fav Page Images If From Fav Page
      if (widget.updateFavPage != null) widget.updateFavPage();
    } else {
      globals.favorites.add(widget.imageItem);
      // Update Fav Page Images If From Fav Page
      if (widget.updateFavPage != null) widget.updateFavPage();
    }

    // Set Storage
    SharedPreferences favPrefs = await SharedPreferences.getInstance();
    String favorites = jsonEncode(globals.favorites);
    await favPrefs.setString('FAVORITES', favorites);
    setState(() => null);
  }
}
