import 'dart:io';
import 'package:bts_wall/models/items.dart';
import 'package:bts_wall/pages/image_detail.dart';
import 'package:bts_wall/tools/utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

///
/// This Class have general widgets use in multi places in the app
///
class MainWidgets {
  ///
  /// Return Standard Page Widget for all the app
  ///

  ///
  /// Standart button
  ///
  static Widget standartButton(
    String text, {
    @required Function onTap,
    IconData icon,
    Color color,
    double width = 150,
  }) {
    return Card(
      color: color ?? Colors.pinkAccent.shade100,
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 55,
          width: width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Icon
              icon == null
                  ? SizedBox.shrink()
                  : Icon(
                      icon,
                    ),
              SizedBox(width: icon == null ? 0 : 10),
              // Text
              Text(
                text,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // main Text
  static Widget text(String text, {double size, Color color, TextAlign align}) {
    return Text(
      text,
      textAlign: align,
      style: TextStyle(color: color ?? color, fontSize: size ?? null),
    );
  }

  ///
  /// Snack Bar
  ///
  static Widget snackBar(
    String message, {
    Color backgroundColor,
    Color color,
    int duration = 2000,
    bool center = false,
    bool success = false,
  }) {
    if (success) {
      backgroundColor = backgroundColor ?? Colors.green;
    } else {
      backgroundColor = backgroundColor ?? Colors.red[400];
    }
    color = color ?? Colors.white;

    return SnackBar(
      content: Text(
        message,
        textAlign: center ? TextAlign.center : TextAlign.start,
        style: TextStyle(color: color),
      ),
      behavior: SnackBarBehavior.floating,
      duration: Duration(milliseconds: duration),
      backgroundColor: backgroundColor,
    );
  }

  ///
  /// Image
  ///
  static Widget image(
    String url, {
    BoxFit fit = BoxFit.fill, // containdi
    double width = 50,
    double height = 200,
    bool forceAsset = false,
  }) {
    if (MyUtils.isNullOrEmpty(url)) {
      return noImage(
        fit: fit,
        width: width,
        height: height,
      );
    }
    if (forceAsset) {
      return Image.asset(
        url,
        fit: fit,
        width: width,
        height: height,
      );
    } else {
      return CachedNetworkImage(
        imageUrl: url,
        // placeholder: (context, url) => BoraqWidgets.loadingBar(),
        placeholder: (context, url) => noImage(
          fit: fit,
          width: width,
          height: height,
        ),
        // errorWidget: (context, url, error) => Icon(Icons.error),
        errorWidget: (BuildContext context, String string, obj) => noImage(
          fit: fit,
          width: width,
          height: height,
        ),
        fit: fit,
      );
    }
  }

  ///
  /// No Image Widget
  ///
  static Widget noImage({
    BoxFit fit = BoxFit.contain,
    double width,
    double height,
  }) {
    return Container(
        // alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey), shape: BoxShape.circle),
        width: width,
        height: height,
        child: Icon(
          // Icons.image,
          Icons.wallpaper,
          color: Colors.grey,
          size: height * 0.8,
        ));
  }

  ///
  /// Main StaggeredGridView Image Builder
  ///
  static Widget buildMainStaggeredImageList(List<Items> state) {
    return StaggeredGridView.countBuilder(
      padding: EdgeInsets.symmetric(vertical: 5),
      crossAxisCount: 2,
      itemCount: state.length,
      itemBuilder: (BuildContext context, int index) => InkWell(
        // onTap: () => MyApp.of(context).changeTheme(),
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ImageDetailPage(state, index))),
        child: MainWidgets.image(
          state[index].media.images.altiyuzX.url,
        ),
      ),
      // Fit
      staggeredTileBuilder: (index) => StaggeredTile.fit(1),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

