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
        //required super.pet_id,
        required super.source});
  factory PetsModel.fromJson(Map<String, dynamic> json)=>
      PetsModel(type:json['type'],
          gender:json['gender'],
          size:json['size'],
          age:json['age'],
          photos:json['photos'],
          good_with_children:json['good_with_children'],
          //pet_id:json['pet_id'],
          source:json['source']);


}