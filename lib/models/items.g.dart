// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Items _$ItemsFromJson(Map<String, dynamic> json) {
  return Items(
    media: json['media'] == null
        ? null
        : Media.fromJson(json['media'] as Map<String, dynamic>),
    title: json['title'] as String,
    createdAt: json['created_at'] as String,
    link: json['link'] as String,
    description: json['description'] as String,
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      'media': instance.media,
      'title': instance.title,
      'created_at': instance.createdAt,
      'link': instance.link,
      'description': instance.description,
      'id': instance.id,
    };
