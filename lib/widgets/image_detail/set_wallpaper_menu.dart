import 'package:bts_wall/widgets/mainwidgets.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wallpaper_manager/wallpaper_manager.dart';

class SetWallpaperMenu extends StatefulWidget {
  final String cropImageFilePath;
  SetWallpaperMenu(this.cropImageFilePath);
  @override
  _SetWallpaperMenuState createState() => _SetWallpaperMenuState();
}

class _SetWallpaperMenuState extends State<SetWallpaperMenu> {
  @override
  Widget build(BuildContext context) {
    // Chooser Menu
    return Container(
      margin: EdgeInsets.all(15),
      height: 280,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Theme.of(context).backgroundColor,
            ),
            // height: 150,
            child: Column(
              children: [
                // Title
                _setWallpaperButtons('Set Wallpaper', null, null),
                Divider(
                  color: Colors.black,
                  height: 2,
                ),
                // For Set Just Home Screen
                _setWallpaperButtons('Home Screen', Icons.home,
                    () => _setWallpaper(widget.cropImageFilePath, 1)),
                Divider(
                  color: Colors.black,
                  height: 2,
                ),
                // For Set Just Lock Screen
                _setWallpaperButtons('Lock Screen', Icons.lock,
                    () => _setWallpaper(widget.cropImageFilePath, 2)),
                Divider(
                  color: Colors.black,
                  height: 2,
                ),
                // For Set Both
                _setWallpaperButtons('Home & Lock Screen', Icons.phone,
                    () => _setWallpaper(widget.cropImageFilePath, 3)),
              ],
            ),
          ),
        ],
      ),
    );
  }

    _setWallpaperButtons(String text, IconData icon, onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.all(15),
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon != null ? Icon(icon) : SizedBox.shrink(),
              SizedBox(
                width: 5,
              ),
              MainWidgets.text(text)
            ],
          )),
    );
  }

  // Set wallpaper FUnc
  _setWallpaper(String cropImageFilePath, int wallpaperLocation) async {
    // WallpaperLocation if 1 = HomeScreen, 2 = Lock Screen. 3 = Both
    // Hide Menu
    Navigator.pop(context);
    // Set Wallpaper
    final String result = await WallpaperManager.setWallpaperFromFile(
        cropImageFilePath, wallpaperLocation);
    print('RESULT');
    print(result);
    Fluttertoast.showToast(
        msg: result,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
