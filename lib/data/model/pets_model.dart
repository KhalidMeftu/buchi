import '../../domain/entity/pets.dart';

class PetsModel extends Pets{
  PetsModel(super.type,
      super.gender,
      super.size,
      super.age,
      super.photos,
      super.good_with_children,
      super.pet_id,
      super.source);
  factory PetsModel.fromJson(Map<String, dynamic> json)=>
      PetsModel(json['type'],
          json['gender'],
          json['size'],
          json['age'],
          json['photos'],
          json['good_with_children'],
          json['pet_id'],
          json['source']);


}