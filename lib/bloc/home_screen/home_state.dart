import 'package:bts_wall/models/items.dart';
import 'package:flutter/foundation.dart';

abstract class HomeState {
  const HomeState();
}

class HomeInitial extends HomeState {}

class ImageLoading extends HomeState {
  const ImageLoading();
}

class ImageLoaded extends HomeState {
  final List<Items> images;
  const ImageLoaded(this.images);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ImageLoaded && listEquals(o.images, images);
  }

  @override
  int get hashCode => images.hashCode;
}
