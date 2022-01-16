import 'package:json_annotation/json_annotation.dart';
part 'media.g.dart';

@JsonSerializable()
class Media {
  Media({
    this.mediaType,
    this.images,
  });

  @JsonKey(name: 'media_type')
  String mediaType;

  Images images;

  // FUNCTIONS
  factory Media.fromJson(Map<String, dynamic> json) =>
      _$MediaFromJson(json);
  Map<String, dynamic> toJson() => _$MediaToJson(this);

  // Custom Functions
}

@JsonSerializable()
class Images {
  Images({
    this.yuzElliX,
    this.dortYuzX,
    this.altiyuzX,
    this.bin200x,
    this.originals,
  });

  @JsonKey(name: '150x150')
  ImageData yuzElliX;

  @JsonKey(name: '400x300')
  ImageData dortYuzX;

  @JsonKey(name: '600x')
  ImageData altiyuzX;

  @JsonKey(name: '1200x')
  ImageData bin200x;

  ImageData originals;

  // FUNCTIONS
  factory Images.fromJson(Map<String, dynamic> json) =>
      _$ImagesFromJson(json);
  Map<String, dynamic> toJson() => _$ImagesToJson(this);

  // Custom Functions
}

@JsonSerializable()
class ImageData {
  ImageData({
    this.width,
    this.height,
    this.url,
  });

  int width;
  int height;
  String url;

  // FUNCTIONS
  factory ImageData.fromJson(Map<String, dynamic> json) =>
      _$ImageDataFromJson(json);
  Map<String, dynamic> toJson() => _$ImageDataToJson(this);

  // Custom Functions
}
