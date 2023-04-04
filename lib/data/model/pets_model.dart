import 'dart:convert';
import '../../domain/entity/pets.dart';

class PetsModel extends Pets{
  PetsModel(
      {
        required super.type,
        required super.gender,
        required super.size,
        required super.age,
        required super.photos,
        required super.good_with_children,
        required super.source});

  factory PetsModel.fromJson(Map<String, dynamic> json)=>
      PetsModel(type:json['type'],
          gender:json['gender'],
          size:json['size'],
          age:json['age'],
          photos:List<Photo>.from(json['photos'].map((x) => Photo.fromJson(x))),
          good_with_children:json['good_with_children'],
          source:json['source']);


          Map<String, dynamic> toJson() => {
            "type": type,
            "gender": gender,
            "size": size,
            "age": age,
            "photos": List<dynamic>.from(photos.map((x) => x.toJson())),
            "good_with_children": good_with_children,
            "source": source,
          };



}


class Photo {
  Photo({
    this.url,
  });

  String? url;

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
    url: json["url"]??'',
  );

  Map<String, dynamic> toJson() => {
    "url": url??'',
  };
}