// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Media _$MediaFromJson(Map<String, dynamic> json) {
  return Media(
    mediaType: json['media_type'] as String,
    images: json['images'] == null
        ? null
        : Images.fromJson(json['images'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MediaToJson(Media instance) => <String, dynamic>{
      'media_type': instance.mediaType,
      'images': instance.images,
    };

Images _$ImagesFromJson(Map<String, dynamic> json) {
  return Images(
    yuzElliX: json['150x150'] == null
        ? null
        : ImageData.fromJson(json['150x150'] as Map<String, dynamic>),
    dortYuzX: json['400x300'] == null
        ? null
        : ImageData.fromJson(json['400x300'] as Map<String, dynamic>),
    altiyuzX: json['600x'] == null
        ? null
        : ImageData.fromJson(json['600x'] as Map<String, dynamic>),
    bin200x: json['1200x'] == null
        ? null
        : ImageData.fromJson(json['1200x'] as Map<String, dynamic>),
    originals: json['originals'] == null
        ? null
        : ImageData.fromJson(json['originals'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ImagesToJson(Images instance) => <String, dynamic>{
      '150x150': instance.yuzElliX,
      '400x300': instance.dortYuzX,
      '600x': instance.altiyuzX,
      '1200x': instance.bin200x,
      'originals': instance.originals,
    };

ImageData _$ImageDataFromJson(Map<String, dynamic> json) {
  return ImageData(
    width: json['width'] as int,
    height: json['height'] as int,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$ImageDataToJson(ImageData instance) => <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
      'url': instance.url,
    };
