import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:image_cropper/image_cropper.dart';
import 'dart:async';
import 'dart:io';

// void main() => runApp(new MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'ImageCropper',
//       theme: ThemeData.light().copyWith(primaryColor: Colors.deepOrange),
//       home: MyHomePage(
//         title: 'ImageCropper',
//       ),
//     );
//   }
// }

class ImageCropPage extends StatefulWidget {
  final String imageUrl;
  final Function showSetWallpaperMenu;

  ImageCropPage({this.imageUrl, this.showSetWallpaperMenu});

  @override
  _ImageCropPageState createState() => _ImageCropPageState();
}

class _ImageCropPageState extends State<ImageCropPage> {
  File imageFile;
  bool isAsyncCall = false;

  @override
  void initState() {
    _initFileFromUrl();
    super.initState();
  }

  // Init cach image from Url
  _initFileFromUrl() async {
    setState(() => isAsyncCall = true);
    // Cache Image Url
    var file = await DefaultCacheManager().getSingleFile(widget.imageUrl);
    print(file.path);
    imageFile = File(file.path);
    setState(() => isAsyncCall = false);
  }

  @override
  Widget build(BuildContext context) {
    if (isAsyncCall)
      return Container(child: Center(child: CircularProgressIndicator()));
    return FutureBuilder<Widget>(
        future: _cropImage(),
        builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
          if (snapshot.hasData)
            return snapshot.data;
          else // Return Back
            Future.microtask(() => Navigator.pop(context));
          // Loading Bar
          return Container(child: Center(child: CircularProgressIndicator()));
        });
  }

  // Crop Image
  Future<Null> _cropImage() async {
    File croppedFile = await ImageCropper.cropImage(
        sourcePath: imageFile.path,
        aspectRatio: CropAspectRatio(
            ratioX: MediaQuery.of(context).size.width,
            ratioY: MediaQuery.of(context).size.height),
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            showCropGrid: false,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: true),
        iosUiSettings: IOSUiSettings(
          title: 'Cropper',
        ));
    if (croppedFile != null) {
      // Show Set wallpaper menu and go back
      widget.showSetWallpaperMenu(croppedFile.path);
    }
  }
}
