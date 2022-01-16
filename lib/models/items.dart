import 'package:bts_wall/models/media.dart';
import 'package:json_annotation/json_annotation.dart';
part 'items.g.dart';

@JsonSerializable()
class Items {
  Items({
    this.media,
    this.title,
    this.createdAt,
    this.link,
    this.description,
    this.id,
  });

  Media media;

  String title;
  @JsonKey(name: 'created_at')
  String createdAt;
  String link;
  String description;
  String id;

  // FUNCTIONS
  factory Items.fromJson(Map<String, dynamic> json) =>
      _$ItemsFromJson(json);
  Map<String, dynamic> toJson() => _$ItemsToJson(this);

  // Custom Functions
}