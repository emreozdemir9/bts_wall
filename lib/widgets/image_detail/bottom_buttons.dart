import 'package:bts_wall/widgets/mainwidgets.dart';
import 'package:flutter/material.dart';

class BottomButtons extends StatefulWidget {
  final Function fullScreenImage;
  final Function goCropImagePage;
  BottomButtons(this.fullScreenImage, this.goCropImagePage);
  @override
  _BottomButtonsState createState() => _BottomButtonsState();
}

class _BottomButtonsState extends State<BottomButtons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Positioned(
        bottom: 5,
        left: 0,
        right: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Image Slider Bottom Buttons
            mainButton(Icons.filter, 'Set Wallpaper', widget.goCropImagePage),
            // TODO
            mainButton(Icons.download, 'Save', null),
            mainButton(Icons.launch, 'Full Screen', widget.fullScreenImage),
          ],
        ),
      ),
    );
  }

  Widget mainButton(IconData icon, String text, onTap) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 28,
          ),
          SizedBox(
            height: 10,
          ),
          MainWidgets.text(text, color: Colors.white, size: 12)
        ],
      ),
    );
  }
}
