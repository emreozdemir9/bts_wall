import 'package:bts_wall/bloc/image_detail/image_detail_cubit.dart';
import 'package:bts_wall/models/items.dart';
import 'package:bts_wall/pages/image_crop.dart';
import 'package:bts_wall/widgets/image_detail/bottom_buttons.dart';
import 'package:bts_wall/widgets/image_detail/set_wallpaper_menu.dart';
import 'package:bts_wall/widgets/image_detail/top_buttons.dart';
import 'package:bts_wall/widgets/mainwidgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageDetailPage extends StatefulWidget {
  final List<Items> items;
  final int index;
  final Function updateFavPage;
  ImageDetailPage(this.items, this.index, {this.updateFavPage});
  @override
  _ImageDetailPageState createState() => _ImageDetailPageState();
}

class _ImageDetailPageState extends State<ImageDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: BlocProvider(
            // Inıt State
            create: (_) =>
                ImageDetailCubit()..getCurrentImageIndex(widget.index),
            child: Material(
              color: Colors.black,
              child: BlocBuilder<ImageDetailCubit, dynamic>(
                builder: (context, state) => Container(
                  child: Stack(
                    children: [
                      // Top Buttons
                      TopButtons(
                          widget.items[context
                              .read<ImageDetailCubit>()
                              .currentImageIndex],
                          widget.updateFavPage),

                      // Carousel Image Slider
                      imageSlider(context),

                      // Bottom Buttons
                      BottomButtons(
                          () => getFullScreenImage(
                                widget
                                    .items[context
                                        .read<ImageDetailCubit>()
                                        .currentImageIndex]
                                    .media
                                    .images
                                    .originals
                                    .url,
                              ),
                          () => _goCropImagePage(context)),
                    ],
                  ),
                ),
              ),
            )));
  }

  Widget imageSlider(BuildContext context) {
    return Center(
      child: CarouselSlider(
        options: CarouselOptions(
            onPageChanged: (index, _) =>
                context.read<ImageDetailCubit>().getCurrentImageIndex(index),
            initialPage: widget.index,
            enableInfiniteScroll: false,
            enlargeCenterPage: true,
            // onScrolled: (index) => print(index),
            aspectRatio: 1),
        items: widget.items.map((i) {
          print(
              'Image Index: ${context.watch<ImageDetailCubit>().currentImageIndex}');
          return Builder(
            builder: (BuildContext context) {
              return Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.amber, width: 2)),
                  child: GestureDetector(
                      onTap: () =>
                          getFullScreenImage(i.media.images.originals.url),
                      child: MainWidgets.image(
                        i.media.images.altiyuzX.url,
                      )));
            },
          );
        }).toList(),
      ),
    );
  }

  // Full Screen Image Widget
  getFullScreenImage(String imgUrl) async {
    return await showDialog(
        context: context,
        barrierColor: Colors.black,
        builder: (BuildContext context) {
          return Center(
            child: Dismissible(
              resizeDuration: Duration(milliseconds: 10),
              direction: DismissDirection.vertical,
              key: Key('key'),
              onDismissed: (_) => Navigator.of(context).pop(),
              child: MainWidgets.image(
                imgUrl,
              ),
            ),
          );
        });
  }

  // Wallpaper Setting Chooser
  setWallpaperMenu(String cropImageFilePath) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return SetWallpaperMenu(cropImageFilePath);
        });
  }

  _goCropImagePage(BuildContext context) async {
    // Get Image Url
    String originalImageUrl = widget
        .items[context.read<ImageDetailCubit>().currentImageIndex]
        .media
        .images
        .altiyuzX
        .url;
    // Go Crop Page
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ImageCropPage(
                  imageUrl: originalImageUrl,
                  showSetWallpaperMenu: setWallpaperMenu,
                )));
  }
}
